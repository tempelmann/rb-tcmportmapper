#tag Class
Class CFDictionary
Inherits CFType
Implements CFPropertyList
	#tag Event
		Function ClassID() As CFTypeID
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function Value(key as CFType) As CFType
		  // Note: this function may actually return nil - that's if the key does not exist in the dictionary
		  
		  #if TargetMacOS
		    soft declare function CFDictionaryGetValueIfPresent lib CarbonLib (theDict as Ptr, key as Ptr, ByRef value as Ptr) as Boolean
		    
		    if not me.IsNULL and not (key is nil) then
		      dim theValue as Ptr
		      if CFDictionaryGetValueIfPresent(me.Reference, key.Reference, theValue) then
		        return CFType.NewObject(theValue, false, kCFPropertyListImmutable)
		      end if
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasKey(key as CFType) As Boolean
		  #if TargetMacOS
		    soft declare function CFDictionaryContainsKey lib CarbonLib (theDict as Ptr, key as Ptr) as Boolean
		    
		    if not me.IsNULL and not (key is nil) then
		      return CFDictionaryContainsKey(me.Reference, key.Reference)
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Keys() As CFType()
		  dim theList() as CFType
		  #if TargetMacOS
		    if not me.IsNULL then
		      dim dictCount as Integer = me.Count
		      if dictCount > 0 then
		        soft declare sub CFDictionaryGetKeysAndValues lib CarbonLib (theDict as Ptr, keys as Ptr, values as Ptr)
		        
		        const sizeOfCFTypeRef = 4
		        dim keyList as new MemoryBlock(sizeOfCFTypeRef*dictCount)
		        CFDictionaryGetKeysAndValues me.Reference, keyList, nil
		        
		        dim offset as Integer = 0
		        for i as Integer = 1 to dictCount
		          theList.Append CFType.NewObject(keyList.Ptr(offset), false, kCFPropertyListImmutable)
		          offset = offset + sizeOfCFTypeRef
		        next
		      end if
		    end if
		  #endif
		  // we always returns a non-nil list, even if it's empty!
		  return theList
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(theKeys() as CFType, theValues() as CFType)
		  if UBound(theKeys) <> UBound(theValues) then
		    // this is a programming error on behalf of the caller
		    raise new OutOfBoundsException
		  end if
		  
		  #if targetMacOS
		    dim keyCallbacks as Ptr = me.DefaultCallbacks("kCFTypeDictionaryKeyCallBacks")
		    dim valueCallbacks as Ptr = me.DefaultCallbacks("kCFTypeDictionaryValueCallBacks")
		    
		    soft declare function CFDictionaryCreate lib CarbonLib (allocator as Ptr, keys as Ptr, values as Ptr, numValues as Integer, keyCallBacks as Ptr, valueCallBacks as Ptr) as Ptr
		    
		    if UBound(theKeys) >= 0 then
		      dim keyBlock as new MemoryBlock(4*(1 + UBound(theKeys)))
		      dim valueBlock as new MemoryBlock(4*(1 + UBound(theValues)))
		      dim offset as Integer = 0
		      for i as Integer = 0 to UBound(theKeys)
		        keyBlock.Ptr(offset) = theKeys(i).Reference
		        valueBlock.Ptr(offset) = theValues(i).Reference
		        offset = offset + 4
		      next
		      // create with presets
		      super.Constructor CFDictionaryCreate(nil, keyBlock, valueBlock, 1 + UBound(theKeys), keyCallbacks, valueCallbacks), true
		    else
		      // create empty dictionary
		      super.Constructor CFDictionaryCreate(nil, nil, nil, 0, keyCallbacks, valueCallbacks), true
		    end if
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(theDictionary as CFDictionary)
		  #if TargetMacOS
		    soft declare function CFDictionaryCreateCopy lib CarbonLib (allocator as Ptr, theDict as Ptr) as Ptr
		    
		    if not (theDictionary is nil) then
		      super.Constructor CFDictionaryCreateCopy(nil, me.Reference), true
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DefaultCallbacks(name as String) As Ptr
		  return CFBundle.CarbonFramework.DataPointerNotRetained(name)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ClassID() As CFTypeID
		  #if targetMacOS
		    declare function TypeID lib CarbonLib alias "CFDictionaryGetTypeID" () as UInt32
		    static id as CFTypeID = CFTypeID(TypeID)
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasValue(value as CFType) As Boolean
		  #if TargetMacOS
		    soft declare function CFDictionaryContainsValue lib CarbonLib (theDict as Ptr, value as Ptr) as Boolean
		    
		    if not me.IsNULL and not (value is nil) then
		      return CFDictionaryContainsValue(me.Reference, value.Reference)
		    end if
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			#if TargetMacOS
			soft declare function CFDictionaryGetCount lib CarbonLib (theDict as Ptr) as Integer
			
			if not me.IsNULL then
			return CFDictionaryGetCount(me.Reference)
			end if
			#endif
			End Get
		#tag EndGetter
		Count As Integer
	#tag EndComputedProperty


	#tag Constant, Name = ClassName, Type = String, Dynamic = False, Default = \"CFDictionary", Scope = Private
	#tag EndConstant


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
			Name="Count"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass