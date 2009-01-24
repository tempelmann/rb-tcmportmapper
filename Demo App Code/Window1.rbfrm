#tag Window
Begin Window Window1
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   345
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   158924769
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "TCMPortMapper Demo"
   Visible         =   True
   Width           =   337
   Begin PushButton startBut
      AutoDeactivate  =   True
      Bold            =   ""
      Cancel          =   ""
      Caption         =   "Update"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   150
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   190
      Underline       =   ""
      Visible         =   True
      Width           =   119
      BehaviorIndex   =   0
   End
   Begin StaticText StaticText1
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   160
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   ""
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Untitled"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      Top             =   231
      Underline       =   ""
      Visible         =   True
      Width           =   157
      BehaviorIndex   =   1
   End
   Begin StaticText StaticText2
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   160
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   ""
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Untitled"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      Top             =   281
      Underline       =   ""
      Visible         =   True
      Width           =   157
      BehaviorIndex   =   2
   End
   Begin Timer statusUpdateTimer
      Height          =   32
      Index           =   -2147483648
      Left            =   -52
      LockedInPosition=   False
      Mode            =   1
      Period          =   200
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   -7
      Width           =   32
      BehaviorIndex   =   3
   End
   Begin StaticText StaticText3
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   160
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   ""
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Untitled"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      Top             =   305
      Underline       =   ""
      Visible         =   True
      Width           =   157
      BehaviorIndex   =   4
   End
   Begin StaticText StaticText4
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   160
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   ""
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Untitled"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      Top             =   255
      Underline       =   ""
      Visible         =   True
      Width           =   157
      BehaviorIndex   =   5
   End
   Begin CheckBox runningChk
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "active"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   190
      Underline       =   ""
      Value           =   ""
      Visible         =   True
      Width           =   69
      BehaviorIndex   =   6
   End
   Begin ProgressWheel ProgressWheel1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   126
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   192
      Visible         =   False
      Width           =   16
      BehaviorIndex   =   7
   End
   Begin GroupBox GroupBox1
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Mapping"
      Enabled         =   True
      Height          =   162
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   10
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   8
      Underline       =   ""
      Visible         =   True
      Width           =   307
      BehaviorIndex   =   8
      Begin PopupMenu protocolPop
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         InitialValue    =   "TCP\rUDP\rBoth"
         Italic          =   ""
         Left            =   189
         ListIndex       =   2
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   ""
         LockRight       =   ""
         LockTop         =   ""
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         Top             =   106
         Underline       =   ""
         Visible         =   True
         Width           =   80
         BehaviorIndex   =   9
      End
      Begin StaticText StaticText7
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   ""
         Left            =   90
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   ""
         LockRight       =   ""
         LockTop         =   ""
         Multiline       =   ""
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Protocol:"
         TextAlign       =   2
         TextColor       =   0
         TextFont        =   "System"
         TextSize        =   0
         Top             =   106
         Underline       =   ""
         Visible         =   True
         Width           =   93
         BehaviorIndex   =   10
      End
      Begin EditField externalPortEdit
         AcceptTabs      =   ""
         Alignment       =   0
         AutoDeactivate  =   True
         BackColor       =   16777215
         Bold            =   ""
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   ""
         Left            =   189
         LimitText       =   0
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   ""
         LockRight       =   ""
         LockTop         =   ""
         Mask            =   ""
         Multiline       =   ""
         Password        =   ""
         ReadOnly        =   ""
         Scope           =   0
         ScrollbarHorizontal=   ""
         ScrollbarVertical=   True
         Styled          =   ""
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   12345
         TextColor       =   0
         TextFont        =   "System"
         TextSize        =   0
         Top             =   72
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   80
         BehaviorIndex   =   11
      End
      Begin StaticText StaticText6
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   ""
         Left            =   90
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   ""
         LockRight       =   ""
         LockTop         =   ""
         Multiline       =   ""
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Public port:"
         TextAlign       =   2
         TextColor       =   0
         TextFont        =   "System"
         TextSize        =   0
         Top             =   74
         Underline       =   ""
         Visible         =   True
         Width           =   93
         BehaviorIndex   =   12
      End
      Begin EditField localPortEdit
         AcceptTabs      =   ""
         Alignment       =   0
         AutoDeactivate  =   True
         BackColor       =   16777215
         Bold            =   ""
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   ""
         Left            =   189
         LimitText       =   0
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   ""
         LockRight       =   ""
         LockTop         =   ""
         Mask            =   ""
         Multiline       =   ""
         Password        =   ""
         ReadOnly        =   ""
         Scope           =   0
         ScrollbarHorizontal=   ""
         ScrollbarVertical=   True
         Styled          =   ""
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   12345
         TextColor       =   0
         TextFont        =   "System"
         TextSize        =   0
         Top             =   38
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   80
         BehaviorIndex   =   13
      End
      Begin StaticText StaticText5
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   ""
         Left            =   90
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   ""
         LockRight       =   ""
         LockTop         =   ""
         Multiline       =   ""
         Scope           =   0
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Local port:"
         TextAlign       =   2
         TextColor       =   0
         TextFont        =   "System"
         TextSize        =   0
         Top             =   39
         Underline       =   ""
         Visible         =   True
         Width           =   93
         BehaviorIndex   =   14
      End
      Begin PushButton addMappingBut
         AutoDeactivate  =   True
         Bold            =   ""
         Cancel          =   ""
         Caption         =   "Add"
         Default         =   True
         Enabled         =   False
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   ""
         Left            =   177
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   ""
         LockRight       =   ""
         LockTop         =   ""
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         Top             =   138
         Underline       =   ""
         Visible         =   True
         Width           =   92
         BehaviorIndex   =   15
      End
      Begin PushButton removeMappingsBut
         AutoDeactivate  =   True
         Bold            =   ""
         Cancel          =   ""
         Caption         =   "Remove All"
         Default         =   False
         Enabled         =   False
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   ""
         Left            =   24
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   ""
         LockRight       =   ""
         LockTop         =   ""
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         Top             =   138
         Underline       =   ""
         Visible         =   True
         Width           =   119
         BehaviorIndex   =   16
      End
   End
   Begin StaticText StaticText8
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   10
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   ""
      Scope           =   0
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "external IP address:"
      TextAlign       =   2
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      Top             =   231
      Underline       =   ""
      Visible         =   True
      Width           =   138
      BehaviorIndex   =   17
   End
   Begin StaticText StaticText9
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   10
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   ""
      Scope           =   0
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "local IP address:"
      TextAlign       =   2
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      Top             =   255
      Underline       =   ""
      Visible         =   True
      Width           =   138
      BehaviorIndex   =   18
   End
   Begin StaticText StaticText10
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   10
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   ""
      Scope           =   0
      TabIndex        =   20
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "local name:"
      TextAlign       =   2
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      Top             =   305
      Underline       =   ""
      Visible         =   True
      Width           =   138
      BehaviorIndex   =   19
   End
   Begin StaticText StaticText11
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   10
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   ""
      Scope           =   0
      TabIndex        =   21
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "router name:"
      TextAlign       =   2
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      Top             =   281
      Underline       =   ""
      Visible         =   True
      Width           =   138
      BehaviorIndex   =   20
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  updateStatus
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub updateStatus()
		  addMappingBut.Enabled = Val(localPortEdit.Text) > 0 and Val(externalPortEdit.Text) > 0
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events startBut
	#tag Event
		Sub Action()
		  statusUpdateTimer.Mode = 2
		  me.Enabled = false
		  TCMPortMapper.SharedInstance.Update()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events statusUpdateTimer
	#tag Event
		Sub Action()
		  dim pm as TCMPortMapper = TCMPortMapper.SharedInstance
		  
		  StaticText1.Text = pm.ExternalIPAddress
		  StaticText2.Text = pm.RouterName
		  StaticText3.Text = pm.LocalBonjourHostName
		  StaticText4.Text = pm.LocalIPAddress
		  
		  ProgressWheel1.Visible = pm.IsAtWork
		  runningChk.Value = pm.IsRunning
		  
		  if not pm.IsAtWork then
		    // we're done
		    me.Mode = 0 // stop timer
		    startBut.Enabled = true // enable "Update" button again
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events externalPortEdit
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  updateStatus
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events localPortEdit
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  updateStatus
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events addMappingBut
	#tag Event
		Sub Action()
		  dim protocol, localPort, externalPort as Integer
		  
		  select case protocolPop.Text
		  case "UDP"
		    protocol = TCMPortMapping.UDPonly
		  case "TCP"
		    protocol = TCMPortMapping.TCPonly
		  else
		    protocol = TCMPortMapping.UDPandTCP
		  end
		  
		  externalPort = Val(externalPortEdit.Text)
		  localPort = Val(localPortEdit.Text)
		  
		  dim pm as TCMPortMapper = TCMPortMapper.SharedInstance
		  
		  dim mapping as TCMPortMapping = TCMPortMapping.WithLocalPort (localPort, externalPort, protocol, 0)
		  pm.Add mapping
		  
		  me.Default = false
		  startBut.Default = true
		  startBut.Enabled = true
		  removeMappingsBut.Enabled = true
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events removeMappingsBut
	#tag Event
		Sub Action()
		  TCMPortMapper.SharedInstance.RemoveAllAddedMappings
		  me.Enabled = false
		End Sub
	#tag EndEvent
#tag EndEvents
