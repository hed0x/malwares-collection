' ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
' +               - Windows Scripting Host M.S.F.K Refresh -                     +
' ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
' +                        Written By: CrAzY BaStErD                             +
' ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




' ***********************************************
' * This sets the variable to VBScript language *
' ***********************************************
Dim WSHShell
Set WSHShell = WScript.CreateObject("WScript.Shell")



' ********************************************************************
' * This makes the script execute every time you start your computer *
' ********************************************************************
WSHShell.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\M.S.F.K Refresh", "C:\REGISTRY\VBS MSFKr\MSFK.vbs"



' *****************************************
' * This deletes the current usage status *
' *****************************************
WSHShell.RegDelete "HKCU\Software\VB and VBA Program Settings\Form1\"

WSHShell.RegDelete "HKCU\Software\VB and VBA Program Settings\SerialNumber\"



' ******************************************************************
' * This is the nag shit that shows you how many times you used it *
' ******************************************************************
WSHShell.RegWrite "HKCU\Software\VB and VBA Program Settings\", ""

WSHShell.RegWrite "HKCU\Software\VB and VBA Program Settings\Form1\", ""

WSHShell.RegWrite "HKCU\Software\VB and VBA Program Settings\Form1\CountKMSFECb", 0



' *********************************
' * This resets the expire period *
' *********************************
WSHShell.RegWrite "HKCU\Software\VB and VBA Program Settings\", ""

WSHShell.RegWrite "HKCU\Software\VB and VBA Program Settings\SerialNumber\", ""

WSHShell.RegWrite "HKCU\Software\VB and VBA Program Settings\SerialNumber\CountKMSFECTb", 30



' ***************
' * Information *
' ********************************************************************************
' * This script was made to refresh M.S.F.K. it does not remove the nag screen.  *
' ********************************************************************************

' * COPYRIGHT *
' **********************************************
' * This package is property of CrAzY BaStErD  *
' * contact: user00265@fuckmicrosoft.com       *
' **********************************************

' **********************
' * Terms & Conditions *
' ********************************************************************************
' * You must imdemnify CrAzY BaStErD for any damage caused by the use of this    *
' * VBScript and/or any of it's releases you may have obtained. ROCK ON M.F.'s   * 
' ********************************************************************************

' *******************************
' * Operating Systems Supported *
' ********************************************************************************
' * Has been tested in Windows 95/98/ME not recomended for:                      *
' * Windows 2000/XP or any other OS not listed above. Thankx to Beautiful Jesus  *
' * for the idea he gave me. C.O.R.E. TNKX for your inspiration on this release. * 
' ********************************************************************************

' * Release Verifier Number *
' *******************************************
' * RVN: 839F937C6334F                      *
' * Every file should contain this RVN      *
' * If not do not use, it has been altered  *
' *******************************************

