#tag Class
Protected Class TCMPortMapper
	#tag Method, Flags = &h0
		 Shared Function SharedInstance() As TCMPortMapper
		  Declare Function objc_msgSend Lib CocoaLib Alias "objc_msgSend" (theReceiver as Cocoa.id, theSelector as Cocoa.SEL) as Cocoa.id
		  
		  static gMapper as TCMPortMapper
		  static gDidSearch as Boolean
		  
		  if not gDidSearch then
		    // We need to find and load the TCMPortMapper framework file.
		    
		    gDidSearch = true
		    dim f as FolderItem
		    
		    // A built app should include it inside its Contents/Frameworks folder
		    try
		      f = App.ExecutableFile.Parent.Child("Frameworks").Child(TCMPortMapperLib)
		    catch NilObjectException
		      f = nil
		    end
		    
		    if (f = nil or not f.Exists) and DebugBuild then
		      // For debugging, we also allow it to be next to the app and project file
		      f = GetFolderItem(TCMPortMapperLib)
		    end
		    
		    if (f = nil or not f.Exists) and SearchPublicFrameworks then
		      // Optionally, search the public framework folders
		      dim locs as NSArray = NSSearchPathForDirectoriesInDomains (5, &hFFFF, true) // get locations of "Library" folders
		      for i as Integer = 0 to locs.Count-1
		        dim dir as FolderItem = GetFolderItemFromPOSIXPath (CFString (locs.Value(i)))
		        try
		          f = dir.Child("Frameworks").Child(TCMPortMapperLib)
		        catch NilObjectException
		          f = nil
		        end
		        if f <> nil and f.Exists then
		          // found
		          exit
		        end
		        f = nil
		      next
		    end
		    
		    dim tcm as CFBundle = CFBundle.NewCFBundleFromURL (CFURL(f))
		    if tcm = nil or tcm.IsNULL or not tcm.Load() then
		      break
		      if f = nil then
		        MsgBox "Oops - could not find "+TCMPortMapperLib
		      else
		        MsgBox "Oops - could not load "+f.AbsolutePath
		      end
		      return nil
		    end if
		    
		    dim version as CFType = tcm.InfoDictionaryValue("BuildRevision")
		    if Val(CFString(version)) < 36 then
		      // there's a problem up to v1.2 (r34) of the mapper framework: if the app's name is too long,
		      // the mapping won't be accepted by some routers (e.g. DrayTek Vigor models)
		      dim l as Integer = App.ExecutableFile.Name.LenB
		      if l > 18 then
		        MsgBox "Your app's file name is too long for this version of "+TCMPortMapperLib+". Update to a version past 1.2 or shorten your app name"
		        return nil
		      end
		    end
		    
		    dim ref as Cocoa.id = objc_msgSend (Cocoa.ClassRef("TCMPortMapper"), Cocoa.Selector("sharedInstance"))
		    if ref.value <> 0 then
		      gMapper = new TCMPortMapper (ref)
		    else
		      MsgBox "Oops - invalid lib at "+f.AbsolutePath
		    end
		  end
		  
		  return gMapper
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor(ref as Cocoa.id)
		  me.objRef = ref
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Add(mapping as TCMPortMapping)
		  // Note: You need to call Update() after this to pass the added mappings to the router
		  
		  Declare function objc_msgSend Lib CocoaLib Alias "objc_msgSend" (theReceiver as Cocoa.id, theSelector as Cocoa.SEL, mapping as Cocoa.id) as Integer
		  
		  mMappings.Append mapping // keeps a ref to the TCMPortMapping object, just in case
		  
		  dim res as Integer = objc_msgSend (me.objRef, Cocoa.Selector("addPortMapping:"), mapping.Reference)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Update()
		  // The port mapper lib's "start" method
		  
		  Declare Function objc_msgSend Lib CocoaLib Alias "objc_msgSend" (theReceiver as Cocoa.id, theSelector as Cocoa.SEL) as Cocoa.id
		  
		  mLastExtAddr = ""
		  
		  dim id as Cocoa.id = objc_msgSend (me.objRef, Cocoa.Selector("start"))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExternalIPAddress() As String
		  static sel as Cocoa.SEL = Cocoa.Selector("externalIPAddress")
		  dim s as String = getString (sel)
		  if s <> "" then
		    mLastExtAddr = s
		  end
		  return mLastExtAddr
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RouterName() As String
		  // Note: You need to call Update() and wait for IsAtWork to become false before you can get this information
		  
		  static sel as Cocoa.SEL = Cocoa.Selector("routerName")
		  return getString (sel)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LocalBonjourHostName() As String
		  // Note: You need to call Update() and wait for IsAtWork to become false before you can get this information
		  
		  static sel as Cocoa.SEL = Cocoa.Selector("localBonjourHostName")
		  return getString (sel)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function getString(selector as Cocoa.SEL) As String
		  Declare Function objc_msgSend Lib CocoaLib Alias "objc_msgSend" (theReceiver as Cocoa.id, theSelector as Cocoa.SEL) as Ptr
		  declare function CFRetain lib CarbonLib (cf as Ptr) as CFStringRef
		  
		  dim p as Ptr = objc_msgSend (me.objRef, selector)
		  if p <> nil then
		    return CFRetain (p)
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LocalIPAddress() As String
		  static sel as Cocoa.SEL = Cocoa.Selector("localIPAddress")
		  return getString (sel)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MappingProtocol() As String
		  static sel as Cocoa.SEL = Cocoa.Selector("mappingProtocol")
		  return getString (sel)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RouterIPAddress() As String
		  static sel as Cocoa.SEL = Cocoa.Selector("routerIPAddress")
		  return getString (sel)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RouterHardwareAddress() As String
		  static sel as Cocoa.SEL = Cocoa.Selector("routerHardwareAddress")
		  return getString (sel)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UserID() As String
		  static sel as Cocoa.SEL = Cocoa.Selector("userID")
		  return getString (sel)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub setString(selector as Cocoa.SEL, value as String)
		  Declare sub objc_msgSend Lib CocoaLib Alias "objc_msgSend" (theReceiver as Cocoa.id, theSelector as Cocoa.SEL, str as CFStringRef)
		  objc_msgSend (me.objRef, selector, value)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetUserID(id as String)
		  static sel as Cocoa.SEL = Cocoa.Selector("setUserID:")
		  setString (sel, id)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function getInt(selector as Cocoa.SEL) As Integer
		  Declare Function objc_msgSend Lib CocoaLib Alias "objc_msgSend" (theReceiver as Cocoa.id, theSelector as Cocoa.SEL) as Integer
		  
		  return objc_msgSend (me.objRef, selector)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsAtWork() As Boolean
		  // Returns true after Update() was called, until the mappings
		  // have been successfully activated.
		  
		  static sel as Cocoa.SEL = Cocoa.Selector("isAtWork")
		  return getInt (sel) <> 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsRunning() As Boolean
		  // Returns true after Update() was called and communication
		  // with the Router was established.
		  
		  static sel as Cocoa.SEL = Cocoa.Selector("isRunning")
		  return getInt (sel) <> 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function GetFolderItemFromPOSIXPath(absolutePath as String) As FolderItem
		  // Note: The passed path must be absolute, i.e. start from root with "/"
		  
		  #if TargetMacOS
		    declare function CFURLCopyAbsoluteURL lib CarbonLib (relativeURL as Ptr) as Ptr
		    declare function CFURLCreateWithFileSystemPath lib CarbonLib (allocator as ptr, filePath as CFStringRef, pathStyle as Integer, isDirectory as Boolean) as Ptr
		    declare function CFURLGetString lib CarbonLib (anURL as Ptr) as Ptr
		    declare sub CFRelease lib CarbonLib (cf as Ptr)
		    declare function CFRetain lib CarbonLib (cf as Ptr) as CFStringRef
		    declare sub CFShow lib CarbonLib (obj as Ptr)
		    const kCFURLPOSIXPathStyle = 0
		    
		    dim url as Ptr = CFURLCreateWithFileSystemPath(nil, absolutePath, kCFURLPOSIXPathStyle, true)
		    dim str as CFStringRef = CFRetain (CFURLGetString (url))
		    CFRelease (url)
		    dim f as FolderItem = GetFolderItem (str, FolderItem.PathTypeURL)
		    return f
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveAllAddedMappings()
		  // Note: You need to call Update(), preferrably with waitForCompletion=true,
		  // after this to remove the mappings from the router.
		  
		  Declare sub objc_msgSend Lib CocoaLib Alias "objc_msgSend" (theReceiver as Cocoa.id, theSelector as Cocoa.SEL, mapping as Cocoa.id)
		  
		  while mMappings.Ubound >= 0
		    objc_msgSend (me.objRef, Cocoa.Selector("removePortMapping:"), mMappings.Pop.Reference)
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub Cleanup()
		  // Removes any mappings added earlier.
		  // Should be called when an app quits that used temporary mappings
		  
		  if SharedInstance.IsRunning() then
		    SharedInstance.RemoveAllAddedMappings()
		    SharedInstance.Update ()
		    while SharedInstance.IsAtWork
		      App.DoEvents()
		    wend
		  end if
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		This project is free, open source and is hosted here:
		http://code.google.com/p/rb-tcmportmapper/
		
		It implements a rudimentary API to the open source lib TCMPortMapper,
		available here: http://code.google.com/p/tcmportmapper/
		
		If you need more control, I recommend to get the more complete TCMPortMapper
		MBS plugin from http://www.monkeybreadsoftware.de - that plugin implements
		all features of the TCMPortMapper lib.
		
	#tag EndNote

	#tag Note, Name = How To Use
		Basically, you get a references to the mapper class by calling
		TCMPortMapper.SharedInstance, then call its Add(...) method to add one
		or more mappings, finally call Update(false) to have the mappings set in the
		router. When you app quits, it might want to call Cleanup() to remove all
		these mappings again from the router.
		
		See the code in Window1 for a working example.
		
		Note:
		
		  To include this feature in your own application, you need to copy all contents
		  in the "TCMPortMapper Lib" folder in your app, and also need to have a recent
		  version of "TCMPortMapper.framework" in your project folder (when debugging)
		  or inside the app's package in Contents/Frameworks after building the app.
		
		Important:
		
		  Adding a mapping makes it permanently remembered by the router (gateway)
		  until it gets reset or you call Cleanup().
		
		To check the currently active mappings of your router use the application
		"Port Map" (http://www.macupdate.com/info.php/id/27342). Use the button
		"All UPnP Mappings" to view the mappings. Unfortunately, this only works if
		you're using a UPnP-capable router, but not with NAT-PMP. I hope your router,
		if it only supports NAT-PMP, offers its own way to view the mappings via its
		own configuration tool.
		
	#tag EndNote

	#tag Note, Name = What is TCMPortMapper
		TCMPortMapper is a library that helps configuring a router (gateway) to
		open UDP and TCP ports and forward them to the application's computer,
		saving users from having to enter port forwarding manually in their routers.
		
		TCMPortMapper supports the protocols UPnP or NAT-PMP for this task.
		
		To make this work, a router has to allow this explicitly - usually routers
		do not allow this by default for security reasons.
		
		The program "Port Map" (http://www.codingmonkeys.de/portmap/)
		uses this lib as well. If you have trouble using this RB code, try out Port Map
		to see if it can't succeed either - in that case your might not support UPnP
		or NAT-PMP, or the function is disabled.
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private objRef As Cocoa.id
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMappings() As TCMPortMapping
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastExtAddr As String
	#tag EndProperty


	#tag Constant, Name = TCMPortMapperLib, Type = String, Dynamic = False, Default = \"TCMPortMapper.framework", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SearchPublicFrameworks, Type = Boolean, Dynamic = False, Default = \"false", Scope = Protected
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
