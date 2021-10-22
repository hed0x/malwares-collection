// sqlexec v1.1

function usage()
 {
  WScript.Echo("sqlexec v1.1\n" +
               "\n" +
               "Usage : " + WScript.ScriptName + " ip user pass cmd\n" +
               "\n" +
               "Note : symbol \" has replaced by ``\n");
  WScript.Quit();
 }

if (WScript.Arguments.length < 4)
 usage();

execstr = WScript.Arguments(3);

for (counter = 4;counter < WScript.Arguments.length;counter++)
 execstr += " " + WScript.Arguments(counter);

cn = new ActiveXObject("ADODB.Connection");
cn.Provider = "sqloledb";
cn.Properties("Data Source").Value = WScript.Arguments(0);
cn.Properties("User ID").Value = WScript.Arguments(1);
cn.Properties("Password").Value = WScript.Arguments(2);
cn.Open();

cmd = new ActiveXObject("ADODB.Command");
cmd.ActiveConnection = cn;
cmd.CommandText = "xp_cmdshell '" + execstr.replace(/``/g, "\"")  + "'";
cmd.CommandType = 1;
rs = cmd.Execute();

result = "";

while (!rs.EOF)
 {
  output = new String(rs(0));

  if (output != "null")
   result += output + "\r\n";
  else
   result += "\r\n";

  rs.MoveNext();
 }

WScript.Echo(result);
rs.Close();