   <html>
   <head>
   <title>Mail-Bomber</title>
   </head>
   <body>
   <h1>Mail-Bomber</h1>
   <form action="mailer.php">
   <p>Sender-Name:<br>
   <input name="email_from_name" type="text" size="30" maxlength="30">
   </p>
   <p>Sender-Email:<br>
   <input name="email_from_mail" type="text" size="30" maxlength="40">
   </p>
   <p>Reply-Mail:<br>
   <input name="email_return" type="text" size="30" maxlength="40">
   </p>
   <p>To:<br>
   <input name="email_to" type="text" size="30" maxlength="30">
   </p>
   <p>Subject:<br>
   <input name="email_betreff" type="text" size="30" maxlength="40">
   </p>
   <p>Number of Mails:<br>
   <input name="anzahl" type="text" size="30" maxlength="40">
   </p>
   <p>Text:<br>
   <textarea name="kommentar" cols=50 rows=10 wrap=soft></textarea>
   </p>
   </select>
   <input type="hidden" value="ok" name="send_status"><p>
   <input type="submit" value="Send Mail" name="submit"></p>
   </form>
   </body>
   </html>
