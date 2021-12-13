#!/usr/bin/perl

$HTTPSERVER = "login.tencent.com";
$HTTPPATH = "/login";
$HTTPPORT = 80;
$oicq_s = "u";
$pass_s = "p";
$add_s = "u1=http://bbs.tencent.com/cgi-bin/club_first";

print "ＱＱＴ密码探测器 v0128（新春最终版）代理验证程序 By BigJim（内部使用）\n\n";
print "声明：发布此程序仅出于学习交流 Perl 语言编程技巧目的。\n\n\n";

#####程序输入部分
do
{
	print "请输入你要验证的代理（格式 xx.xx.xx.xx:xx）：";
	$proxy = <STDIN>;
	chomp($proxy);
	$proxy =~ s/ //g;
} until ($proxy =~ /^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}:[0-9]{1,4}$/);
($PROXYIP, $PROXYPORT) = split(/:/, $proxy);

do
{
	print "请输入一个用来验证的ＱＱ号码：";
	$qq = <STDIN>;
	chomp($qq);
} while ($qq =~ /[^0-9]/ or $qq < 10000 or $qq eq "");

do
{
	print "请输入用来验证的ＱＱ密码：";
	$pass = <STDIN>;
	chomp($pass);
} while ($pass eq "");

#####开始判定
print "\n正在检测，请稍候...\n\n";
$result = &search($qq, $pass);
if ($result == 1)
{
	print "结果：恭喜：）你输入的代理服务器可以用来探测！\n";
}
elsif ($result == -1)
{
	print "结果：太可惜了：（你输入的代理服务器可以用来探测，但是目前被 Ban 了！\n";
}
else
{
	print "结果：很不幸：（你输入的代理服务器不可以用来探测！\n";
}
print "\n请按回车键退出。\n";
getc;
exit;

#####代理验证子程序
sub search
{
	my ($number, $password) = @_;
	my ($name, $aliases, $type, $len, @thataddr, $a, $b, $c, $d, $that);

	($name, $aliases, $type, $len, @thataddr) = gethostbyname($PROXYIP);
	($a, $b, $c, $d) = unpack("C4", $thataddr[0]);
	$that = pack('S n C4 x8', 2, $PROXYPORT, $a, $b, $c, $d);

	return 0 unless (socket(S, 2, 1, 0));
	select(S);
	$| = 1;
	select(STDOUT);
	return 0 unless (connect(S, $that));

	my $postdata = "$oicq_s=$number&$pass_s=$password&$add_s";
	my $datalength = length($postdata);
	print S "POST http://$HTTPSERVER:$HTTPPORT$HTTPPATH HTTP/1.1\r\n";
	print S "Content-Type: application/x-www-form-urlencoded\r\n";
	print S "Content-Length: $datalength\r\n\r\n";
	print S $postdata;

	my $status1 = <S>;
	my $status2 = <S>;
	$status2 = <S>;
	close(S);

	if ($status2 =~ /tencent login server/)
	{
		if ($status1 =~ /302/)
		{
			return 1;
		}
		elsif ($status1 =~ /200/)
		{
			return -1;
		}
	}

	return 0;
}