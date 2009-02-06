#tag Class
Protected Class TCMPortMapping
	#tag Method, Flags = &h0
		 Shared Function WithLocalPort(localPort as Integer, desiredExternalPort as Integer, transportProtocol as Integer, userInfo as Integer) As TCMPortMapping
		  Declare Function objc_msgSend Lib CocoaLib (theReceiver as Cocoa.id, theSelector as Cocoa.SEL, privatePort as Integer, desiredExternalPort as Integer, transportProtocol as Integer, userInfo as Integer) as UInt32 // do not return cocoa.id here because that doesn't work on PowerPC due to bug in RB (as of 2008r5.1)
		  
		  dim mappingClass as Cocoa.id = Cocoa.ClassRef("TCMPortMapping")
		  dim ref as Cocoa.id
		  ref.value = objc_msgSend (mappingClass, Cocoa.Selector("portMappingWithLocalPort:desiredExternalPort:transportProtocol:userInfo:"), localPort, desiredExternalPort, transportProtocol, userInfo)
		  
		  if ref.value <> 0 then
		    return new TCMPortMapping (ref)
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor(ref as Cocoa.id)
		  me.objRef = ref
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Reference() As Cocoa.id
		  return me.objRef
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private objRef As Cocoa.id
	#tag EndProperty


	#tag Constant, Name = UDPonly, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TCPonly, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UDPandTCP, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
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
			InitialValue="2147483648"
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
	#tag EndViewBehavior
End Class
#tag EndClass
