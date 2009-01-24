#tag Class
Class CFURL
Inherits CFType
	#tag Event
		Function ClassID() As CFTypeID
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(theURL as String)
		  me.Constructor nil, theURL
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Scheme() As String
		  #if TargetMacOS
		    soft declare function CFURLCopyScheme lib CarbonLib (anURL as Ptr) as Ptr
		    // Caution: If this would return a CFStringRef, we'd have to Retain its value!
		    // Instead, "new CFString()" takes care of that below
		    
		    if not me.IsNULL then
		      return new CFString(CFURLCopyScheme(me.Reference), true)
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NetLocation() As String
		  #if TargetMacOS
		    soft declare function CFURLCopyNetLocation lib CarbonLib (anURL as Ptr) as Ptr
		    // Caution: If this would return a CFStringRef, we'd have to Retain its value!
		    // Instead, "new CFString()" takes care of that below
		    
		    if not me.IsNULL then
		      return new CFString(CFURLCopyNetLocation(me.Reference), true)
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(f as FolderItem)
		  if not (f is nil) then
		    me.Constructor f.URLPath
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(baseURL as CFURL, relativeURL as String)
		  #if targetMacOS
		    soft declare function CFURLCreateWithString lib CarbonLib (allocator as Ptr, URLString as CFStringRef, baseURL as Ptr) as Ptr
		    
		    if baseURL is nil then
		      super.Constructor CFURLCreateWithString(nil, relativeURL, nil), true
		    else
		      super.Constructor CFURLCreateWithString(nil, relativeURL, baseURL.Reference), true
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AbsoluteURL() As CFURL
		  #if TargetMacOS
		    soft declare function CFURLCopyAbsoluteURL lib CarbonLib (relativeURL as Ptr) as Ptr
		    
		    if not me.IsNULL then
		      dim absURL as new CFURL(CFURLCopyAbsoluteURL(me.Reference), true)
		      If not absURL.IsNULL then
		        return absURL
		      end if
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsDecomposable() As Boolean
		  #if TargetMacOS
		    soft declare function CFURLCanBeDecomposed lib CarbonLib (anURL as Ptr) as Boolean
		    
		    if not me.IsNULL then
		      return CFURLCanBeDecomposed(me.Reference)
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Path(resolveAgainstBase as Boolean = true) As String
		  #if TargetMacOS
		    if not me.IsNULL then
		      dim buffer as new MemoryBlock(1024)
		      do
		        soft declare function CFURLGetFileSystemRepresentation lib CarbonLib (url as Ptr, resolveAgainstBase as Boolean, buffer as Ptr, maxBufLen as Integer) as Boolean
		        
		        if CFURLGetFileSystemRepresentation(me.Reference, resolveAgainstBase, buffer, buffer.Size) then
		          return DefineEncoding(buffer.CString(0), Encodings.SystemDefault)
		        else
		          buffer.Size = 2*buffer.Size
		        end if
		      loop until buffer.Size > 65536
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ClassID() As CFTypeID
		  #if targetMacOS
		    declare function TypeID lib CarbonLib alias "CFURLGetTypeID" () as UInt32
		    static id as CFTypeID = CFTypeID(TypeID)
		    return id
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			#if TargetMacOS
			soft declare function CFURLGetBaseURL lib CarbonLib (anURL as Ptr) as Ptr
			
			if not me.IsNULL then
			dim theBaseURL as new CFURL(CFURLGetBaseURL(me.Reference), false)
			if not theBaseURL.IsNULL then
			return theBaseURL
			end if
			end if
			#endif
			End Get
		#tag EndGetter
		BaseURL As CFURL
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			if not me.IsNULL then
			return GetFolderItem(me.StringValue, FolderItem.PathTypeURL)
			end if
			End Get
		#tag EndGetter
		Item As FolderItem
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			// returns only the relative part of a URL!
			
			#if TargetMacOS
			soft declare function CFURLGetString lib CarbonLib (anURL as Ptr) as Ptr
			// Caution: If this would return a CFStringRef, we'd have to Retain its value!
			// Instead, "new CFString()" takes care of that below
			
			if not me.IsNULL then
			return new CFString(CFURLGetString(me.Reference), false)
			end if
			#endif
			End Get
		#tag EndGetter
		RelativeURL As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			// returns the full URL (including the base)
			
			#if true
			return me.AbsoluteURL().RelativeURL
			#else
			// this works, too, but the above one seems more proper
			dim base as CFURL = me.BaseURL
			if not (base is nil) and not base.IsNULL then
			return me.BaseURL.StringValue+me.RelativeURL
			else
			return me.RelativeURL
			end if
			#endif
			End Get
		#tag EndGetter
		StringValue As String
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="CFType"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StringValue"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RelativeURL"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
