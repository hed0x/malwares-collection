"c:\tasm\bin\tasm32" /ml /m3 %1,,;
"c:\tasm\bin\tlink32" /Tpe /aa /c /v %1,%1,,import32.lib,
"c:\tasm\more\pewrsec" %1.exe