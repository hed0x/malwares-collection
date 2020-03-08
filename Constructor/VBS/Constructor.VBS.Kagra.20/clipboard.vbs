   Class cClipBoard
   Private objIE

   Public Property Get Data()
   Data = objIE.Document.ParentWindow.ClipboardData.GetData("Text")
   End Property

   Public Property Let Data ( Value )
   objIE.Document.ParentWindow.ClipboardData.SetData "Text" , Value
   End Property

   Public Sub Clear()
   objIE.Document.ParentWindow.ClipboardData.ClearData()
   End Sub

   Private Sub Class_Initialize
   Set objIE = CreateObject("InternetExplorer.Application")
   objIE.Navigate ("about:blank")
   End Sub

   Private Sub Class_Terminate
   objIE.Quit
   Set objIE = Nothing
   End Sub
   End Class

   Dim ClipBoard
   Set Clipboard = New cClipBoard

   set fso = CreateObject("Scripting.FileSystemObject")
   'msgbox fso.GetParentFolderName(wscript.scriptfullname)
   set dossier = fso.GetFolder(fso.GetParentFolderName(wscript.scriptfullname))
   ligne = ""
   for each file in dossier.Files
   If fso.GetExtensionName(file.Name) = "jpg" then
   ligne = ligne & "<img src=""" & file.Name & """><br>"

   end if

   next

   ClipBoard.Clear
   ClipBoard.Data = ligne
   MsgBox ClipBoard.Data
   'msgbox ligne
