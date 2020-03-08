
   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "mod_petik_vbadocexport"
   Sub AutoOpen()
   FormVbaDocExport.Show
   End Sub


   VERSION 5.00
   Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} FormVbaDocExport
      Caption         =   "VBA Doc Export by PetiK - 20/06/2009"
      ClientHeight    =   975
      ClientLeft      =   45
      ClientTop       =   435
      ClientWidth     =   4455
      OleObjectBlob   =   "Vba-Doc-Export-FormVbaDocExport.frx":0000
      StartUpPosition =   1  'CenterOwner
   End
   Attribute VB_Name = "FormVbaDocExport"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False
   ' VBAExport Word Documents by PetiK - France - 20/06/2009
   ' My very first work since a long time
   ' Why this program ?
   ' This practice tool is used to extract VBA Code of Malwares
   ' Update : All in one file


   Private Sub CommandButton1_Click()
   On Error Resume Next
   Set fso = CreateObject("scripting.filesystemobject")
   Dim compteur As Integer
   repertoire_sauvegarde = Left(ActiveDocument.FullName, Len(ActiveDocument.FullName) - Len(ActiveDocument.Name))


   For i = 1 To ActiveDocument.VBProject.VBE.VBProjects.Count          ' Number of Project
   projet = ActiveDocument.VBProject.VBE.VBProjects(i).FileName        ' FullName of Project

   compteur = 1
   Do While Mid(Right(projet, compteur), 1, 1) <> "\"
   compteur = compteur + 1
   Loop
   projet = Right(projet, compteur - 1)                                ' Name of Project
   projet = Left(projet, Len(projet) - 4)                              ' Name of Project Without Extension
   new_projet = repertoire_sauvegarde & projet & ".doc"




   'MsgBox "Nom du projet : " & projet, , "Projet n° " & i

   If projet = "PDFMCustom" Then                                       ' PDF Printer
   ElseIf projet = "VbaDocExport" Then                                 ' This Project
   ElseIf projet = "No" Then                                           ' Normal(.dot)

   Else

   Set file = fso.CreateTextFile(new_projet, 2)
   file.Close


   For j = 1 To ActiveDocument.VBProject.VBE.VBProjects(i).VBComponents.Count


   'ActiveDocument.VBProject.VBE.VBProjects(i).VBComponents.Count : Number of Components
   'ActiveDocument.VBProject.VBE.VBProjects(i).VBComponents(j).Name : Name of Components

   'nom = "C:\Documents and Settings\PetiK\Bureau\petikvx3b\Collection Code Source\vba\ExportVBA\" & projet & "-" & j & ".txt"

   Select Case ActiveDocument.VBProject.VBE.VBProjects(i).VBComponents(j).Type
   Case 1
   ext_file = ".bas"   'Type : Module
   Case 3
   ext_file = ".frm"   'Type : Form
   Case 100
   ext_file = ".cls"   'Type : Class
   End Select

   nom_composant = ActiveDocument.VBProject.VBE.VBProjects(i).VBComponents(j).Name
   nom = repertoire_sauvegarde & projet & "-" & nom_composant & ext_file

   ActiveDocument.VBProject.VBE.VBProjects(i).VBComponents(j).Export nom
   Set file1 = fso.OpenTextFile(nom, 1, True)
   lire_fichier = file1.ReadAll
   file1.Close
   Set file2 = fso.OpenTextFile(new_projet, 8, True)
   file2.Write lire_fichier
   file2.WriteLine ""
   file2.Close
   fso.DeleteFile (nom)
   Next
   End If

   gestion_erreur:

   Next
   MsgBox "Files' Projects Exported", vbInformation, "VbaDocExport Info"
   End Sub
