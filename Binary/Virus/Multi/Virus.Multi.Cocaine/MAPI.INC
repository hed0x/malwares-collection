   ;this file was leeched from virogen pcmail
   ;the same with all mapi stuff<g>

   MapiMessage struc
          resd               dd ?
          lpszSubject        dd ?
          lpszNoteText       dd ?
          lpszMessageType    dd ?
          lpszDateReceived   dd ?
          lpszConversationID dd ?
          flags              dd ?
          lpOriginator       dd ?
          nRecipCount        dd ?
          lpRecips           dd ?
          nFileCount         dd ?
          lpFiles            dd ?
   MapiMessage ends

   MapiRecipDesc struc
          resd               dd ?
          ulRecipClass       dd ?
          lpszName           dd ?
          lpszAddress        dd ?
          ulEIDSize          dd ?
          lpEntryID          dd ?
   MapiRecipDesc ends

   MapiFileDesc struc
          resd               dd ?
          flFlags            dd ?
          nPosition          dd ?
          lpszPathName       dd ?
          lpszFileName       dd ?
          lpFileType         dd ?
   MapiFileDesc ends
