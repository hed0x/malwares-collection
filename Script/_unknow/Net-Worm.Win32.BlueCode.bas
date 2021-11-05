Dim WebService,vList,item,vFound,vSubDan,Danger,vNewCount,FoundString
Function FindMapper(Str1,Str2)
FindMapper=false
If InStr(Str2,Str1)<>0 Then
FoundString=FoundString & "Found "& Str1 &" !!!" & Chr(13) & Chr(10)
FindMapper=true
End If
End Function
Function DelMapper(WebService)
Danger=Array(".ida",".idq",".printer")
vNewCount=0
vList=WebService.GetEx("ScriptMaps")
For Each item in vList
vFound=false
For Each vSubDan in Danger
If FindMapper(vSubDan,item)=true Then
vFound=true
Exit For
End If
Next
If vFound=false Then
vNewCount=vNewCount + 1
ReDim Preserve vNew(vNewCount)
vNew(vNewCount-1)=item
End if
Next
WebService.PutEx 2,"ScriptMaps",vNew
WebService.SetInfo
End Function
Set WebService=GetObject("IIS://LocalHost/W3SVC")
DelMapper(WebService)
Set WebService=GetObject("IIS://LocalHost/W3SVC/1")
DelMapper(WebService)
Set WebService=GetObject("IIS://LocalHost/W3SVC/1/Root")
DelMapper(WebService)
