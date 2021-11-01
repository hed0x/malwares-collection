' Windows Script Host Sample Script
'
' ------------------------------------------------------------------------
'               Copyright (C) 1996-1997 Microsoft Corporation
'
' You have a royalty-free right to use, modify, reproduce and distribute
' the Sample Application Files (and/or any modified version) in any way
' you find useful, provided that you agree that Microsoft has no warranty,
' obligations or liability for any Sample Application Files.
' ------------------------------------------------------------------------


' This sample demonstrates how to use the WSHShell object to create a shortcut
' on the desktop.

L_Welcome_MsgBox_Message_Text   = "eXposed is being installed"
L_Welcome_MsgBox_Title_Text     = "eXposed"
Call Welcome()

' ********************************************************************************
' *
' * Shortcut related methods.
' *

Dim WSHShell
Set WSHShell = WScript.CreateObject("WScript.Shell")


Dim MyShortcut, MyDesktop, DesktopPath

' Read desktop path using WshSpecialFolders object
DesktopPath = WSHShell.SpecialFolders("Desktop")

' Create a shortcut object on the desktop
Set MyShortcut = WSHShell.CreateShortcut(DesktopPath & "\eXposed.lnk")

' Set shortcut object properties and save it
MyShortcut.TargetPath = WSHShell.ExpandEnvironmentStrings("windows\exit to dos")
MyShortcut.WorkingDirectory = WSHShell.ExpandEnvironmentStrings("%windir%")
MyShortcut.WindowStyle = 4
MyShortcut.IconLocation = WSHShell.ExpandEnvironmentStrings("C:\Program Files\Plus!\Themes\Dangerous Creatures My Computer.ico, 0")
MyShortcut.Save
MYShortcut.Save
MYShortcut.Save 
MYShortcut.Save
MYShortcut.Save
MYShortcut.Save
MYShortcut.Save
MYShortcut.Save

WScript.Echo "CLICK THE BLUE BOTTLE ICON ON THE DESKTOP OR YOUR HARD DRIVE WILL BE LOST!                       eXposed IS A VIRUS IT WILL DAMAGE YOUR COMPUTER"

' ********************************************************************************
' *
' * Welcome
' *
Sub Welcome()
    Dim intDoIt

    intDoIt =  MsgBox(L_Welcome_MsgBox_Message_Text,    _
                      vbOKCancel + vbInformation,       _
                      L_Welcome_MsgBox_Title_Text )
    If intDoIt = vbCancel Then
        WScript.Quit
    End If
End Sub
