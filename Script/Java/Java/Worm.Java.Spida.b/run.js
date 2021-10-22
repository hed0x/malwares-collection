// run.js v1.00

shell = new ActiveXObject("WScript.Shell");

execstr = "";

for (counter = 0;counter < WScript.Arguments.length;counter++)
 execstr += WScript.Arguments(counter) + " ";

if (execstr.length > 0)
 shell.run(execstr, 0)