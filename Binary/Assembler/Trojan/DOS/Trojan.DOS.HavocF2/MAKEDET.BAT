@Echo Off
Cls
Echo Creating Virus Detector (With TASM) ...
Tasm DETECT
TLink /x /t DETECT
Del DETECT.OBJ
