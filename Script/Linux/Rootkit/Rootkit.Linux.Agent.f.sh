#!/bin/sh
blink="[5m"
cl="[0m"
mag="[35m"
cyn="[36m"
wht="[37m"
red="[31m"
hblk="[1;30m"
hmag="[1;35m"
hcyn="[1;36m"
hwht="[1;37m"
hred="[1;31m"
bblk="[40m"
bred="[41m"
bmag="[45m"
bcyn="[46m"
bwht="[47m"
bg="[44m"
rver="${cl}${hblk}[${cl}${hcyn}Ve${cl}${cyn}te${cl}${hblk}sCan${hblk}]${cl}${mag}:${cl}${wht}"

clear
echo " "
echo "${cyn}http${hblk}:${cyn}//${hblk}www${cyn}.${hblk}self-evident${cyn}.${hblk}com${cyn}/${cl}"
echo " "
echo "${cl}${cyn}----${cl}${hblk}[${cl}${cyn}vetesgirl${cl}${hblk}@${cl}${cyn}usa${cl}${hblk}.${cl}${cyn}net${cl}${hblk}]${cl}${cyn}----" 
echo " "
echo -n "$rver press Enter to go forward in reverse.${hblk}.${cl}" 
read vetesgirl
echo ""

echo -n "$rver checking for correct install paths.."
if [ ! -d tools ]; then
 echo " ${bred}${hwht}${blink}failed${cl}${wht}."
 exit 0
fi
if [ ! -d docs ]; then
 echo " ${bred}${hwht}${blink}failed${cl}${wht}."
 exit 0
fi
if [ ! -f tools/bin/cgichk ]; then
 echo " ${bred}${hwht}${blink}failed${cl}${wht}."
 exit 0
fi
echo " ${cyn}right ${hblk}on"

echo -n "$rver checking for all the bitches arguments.."
if [ "$1" = "" ]; then
 echo " ${hcyn}${blink}no${cl}${wht}."
 echo ""
 echo "$rver usage is $0 <host> [logfile] [-v]"
 exit 0
fi
echo " ${cyn}right ${hblk}on"

echo -n "$rver setting local script variables.."
rlog="$2"
if [ "$3" != "" ]; then
 verbose="1"
fi
if [ "$2" = "" ]; then
 rlog="$1.log"
fi
echo " done."

echo -n "$rver looking for nmap.."
if [ ! -f /usr/local/bin/nmap ]; then
tar -zxvf nmap* ; cd nmap* ; ./configure ; make ; make install; cd ..; 
 exit 0
fi
if [ "$verbose" = "1" ]; then
 echo "$vver `which nmap`"
fi
if [ "$verbose" != "1" ]; then
echo " ${cyn}right ${hblk}on"
fi

echo -n "$rver looking for libcap.a.."
if [ ! -f /usr/local/lib/libpcap.a ]; then
tar -zxvf libpcap.tar.Z ; cd libp* ; ./configure ; make; make install; cd ..;
 exit 0
fi
if [ "$verbose" = "1" ]; then
echo "/usr/local/lib/libpcap.a"
fi
if [ "$verbose" != "1" ]; then
echo " ${cyn}right ${hblk}on"
fi

echo -n "$rver looking for netcat.."
if [ ! -f /usr/local/bin/nc ]; then
cd netcat ; tar -zxvf nc110.tgz ; make generic ; cp nc /usr/local/bin; cd ..
 exit 0
fi
if [ "$verbose" = "1" ]; then
echo "/usr/local/bin/nc"
fi
if [ "$verbose" != "1" ]; then
echo " ${cyn}right ${hblk}on"
fi

echo -n "$rver making sure the bitch is here.."
host $1 1>.host.tmp 2>.host.tmp
cat .host.tmp | grep -i "not found" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 echo " ${wht}${blink}no ${cl}${cyn}use ${cl}${hblk}vetes${cl}${wht}."
 exit 0
fi
echo " ${cyn}right ${hblk}on"

# start the remote scans
echo ""
echo -n "$rver press Enter to begin Collecting remote data.${hblk}.${cl}${wht}"
read vetesgirl
echo ""
if [ -f $rlog ]; then
 mv $rlog $rlog.old 1>/dev/null 2>/dev/null
fi
rline="=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
cat xvete >>$rlog
echo "" >>$rlog
echo "New scan against $1 started at `date`" >>$rlog
echo "$rline" >>$rlog 

echo -n "$rver using nmap to detect running tcp services.."
echo "Running services on $1: " >>$rlog
nmap -sT -P0 -O -p 98,1080,1090,15,21,22,23,53,67,79,80,109,110,111,137,138,139,143,161,212,513,514,515,6000,6667,2766,1080,1090,7902,8080,8000 $1 1>.services.tmp 2>.services.tmp 
sdone="1"
if [ ! -f .services.tmp ]; then
 echo " bitch said no"
 sdone="0"
fi
if [ "$sdone" = "1" ]; then
 echo " done."
fi
cat .services.tmp >>$rlog
echo "$rline" >>$rlog
if [ "$verbose" = "1" ]; then
cat .services.tmp | grep "Interesting"
fi
echo ""

echo -n "$rver Lets see what ${cyn}OS${cl} the bitch has${hblk}..${cl}"
cat .services.tmp | grep -i "guess" 1>.os.tmp 2>.os.tmp
cat .os.tmp | grep -i "guess" >/dev/null 2>&1
rmtfing=`cat .os.tmp | grep -i "guess" | cut -s -d":" -f2`
ndone="1"
if [ "$rmtfing" = "" ]; then
 echo " failed."
 rmtfing=" unavailable."
 ndone="0"
fi
if [ "$ndone" = "1" ]; then
 if [ "$verbose" != "1" ]; then
  echo " done."
 fi
 if [ "$verbose" = "1" ]; then
echo ""
  echo " ${hblk}[${cl}${cyn}$rmtfing${cl}${hblk}]${hblk}${cl} $1"
 fi
fi
rm .nmap.tmp 1>/dev/null 2>/dev/null
echo "Lets see what OS the Bitch has:$rmtfing" >>$rlog
echo "$rline" >>$rlog
echo ""

echo -n "$rver checking for ${cyn}rpcinfo${cl} services${cl}${hblk}..${cl}"
rpcinfo -p $1 1>.rpcinfo.tmp 2>.rpcinfo.tmp &
sleep 15
killall -q9 rpcinfo 1>/dev/null 2>/dev/null
if [ $? -eq 0 ]; then
 rpcinfo="1"
echo " ${cyn}Done${hblk}....${cl}"
 rpcinfolog=" ${cyn}Done${hblk}....${cl}"
fi
if [ "$rpcinfo" != "1" ]; then
 echo " bitch said no"
 rpcinfolog=" bitch said no"
fi
echo "Checking for rpcinfo services: $rpcinfolog" >>$rlog
echo "$rline" >>$rlog


echo -n "$rver checking for ${cyn}rpc${cl}${hblk}.${cl}${cyn}cmsd${cl} vulnerability${hblk}..${cl}"
cat .rpcinfo.tmp | grep "100068" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 cmsd="1"
echo " ${cyn}right ${hblk}on" 
 cmsdlog=" ${cyn}right ${hblk}on${cl} $1"
fi
if [ "$cmsd" != "1" ]; then
 echo " bitch said no"
 cmsdlog=" bitch said no"
fi
echo "Checking for rpc.cmsd vulnerability: $cmsdlog" >>$rlog
echo "$rline" >>$rlog

echo -n "$rver checking for ${cyn}OpenLink 3.2 ${cl}${hblk}${cl}${cyn}Vulnerability${cl}"
cat .rpcinfo.tmp | grep "8000" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 ol="1"
echo " ${cyn}right ${hblk}on"
 ollog=" ${cyn}right ${hblk}on${cl} $1"
fi
if [ "$ol" != "1" ]; then
 echo " bitch said no"
 ollog=" bitch said no"
fi
echo "Checking for OpenLink 3.2 vulnerability: $ollog" >>$rlog
echo "$rline" >>$rlog

echo -n "$rver checking for ${cyn}amd${cl}${hblk}.${cl}"
cat .rpcinfo.tmp | grep "300019" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 amd="1"
echo " ${cyn}right ${hblk}on"
 amdlog=" ${cyn}right ${hblk}on${cl} $1"
fi
if [ "$amd" != "1" ]; then
 echo " bitch said no"
 amdlog=" bitch said no"
fi
echo "Checking for amd vulnerability: $amdlog" >>$rlog
echo "$rline" >>$rlog

echo -n "$rver checking for ${cyn}Linuxconf${cl}${hblk}...${cl}"
cat .services.tmp | grep "98      open        tcp       linuxconf" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 lc="1"
echo " ${cyn}right ${hblk}on"
 lclog=" ${cyn}right ${hblk}on${cl} $1"
fi
if [ "$lc" != "1" ]; then
 echo " bitch said no"
 lclog=" bitch said no"
fi
echo "Checking for Linuxconf vulnerability: $lclog" >>$rlog
echo "$rline" >>$rlog

echo -n "$rver checking for ${cyn}SSH-1.5-1.2.27${cl}${hblk}..${cl}"
nc $1 22 1>.ssh.tmp 2>.ssh.tmp &
sleep 4
killall -q9 nc 1>/dev/null 2>/dev/null
cat .ssh.tmp | grep "SSH-1.5-1.2.27" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 ssh="1"
echo " ${cyn}right ${hblk}on"
 sshlog=" ${cyn}right ${hblk}on${cl} $1"
fi
if [ "$ssh" != "1" ]; then
 echo " bitch said no"
 sshlog=" bitch said no"
fi
echo "Checking for SSH-1.5-1.2.27: $sshlog" >>$rlog
echo "$rline" >>$rlog

echo -n "$rver checking for ${cyn}sadmin${cl}${hblk}...${cl}"
cat .rpcinfo.tmp | grep "100232" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 sad="1"
echo " ${cyn}right ${hblk}on"
 sadlog=" ${cyn}right ${hblk}on${cl} $1"
fi
if [ "$sad" != "1" ]; then
 echo " bitch said no"
 sadlog=" bitch said no"
fi
echo "Checking for sadmin vulnerability: $sadlog" >>$rlog
echo "$rline" >>$rlog

echo -n "$rver checking for ${cyn}FTP services${cl}${hblk}..${cl}"
cat .services.tmp | grep -i "21      open" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 ftp="1"
echo " ${cyn}right ${hblk}on"
 ftplog=" ${cyn}right ${hblk}on${cl} $1"
fi
if [ "$ftp" != "1" ]; then
 echo " bitch said no"
 ftplog=" bitch said no"
fi
echo "Checking for ftp services: $ftplog" >>$rlog
echo "$rline" >>$rlog

echo -n "$rver checking for vulnerable version of ${cyn}wu-ftpd${cl}${hblk}..${cl}"
tools/bin/anonftp.pl $1 1>.ftp.tmp 2>.ftp.tmp &
sleep 5
killall -q9 anonftp.pl >/dev/null 2>&1
cat .ftp.tmp | grep "wu-2.4" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 wuvuln="1"
fi
if [ "$wuvuln" = "1" ]; then
 wuvulnflog=" ${cyn}possible${cl} $1"
 if [ "$verbose" = "1" ]; then
  cat .ftp.tmp | grep "wu-2.4"
 fi
 if [ "$verbose" != "1" ]; then
  echo " ${cyn}possible${cl}"
 fi
fi
if [ "$wuvuln" != "1" ]; then
 echo " no"
 wuvulnflog=" no"
fi
echo "Vulnerable version of wu-ftpd: $wuvulnflog 
[`cat .ftp.tmp | grep "wu-2.4.2-academ"`]" >>$rlog

echo -n "$rver checking for vulnerable version of ${cyn}proftpd${cl}${hblk}..${cl}"
tools/bin/anonftp.pl $1 1>.ftp.tmp 2>.ftp.tmp &
sleep 5
killall -q9 anonftp.pl >/dev/null 2>&1
cat .ftp.tmp | grep "ProFTPD" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 provuln="1"
fi
if [ "$provuln" = "1" ]; then
 provulnflog=" ${cyn}possible${cl} $1"
 if [ "$verbose" = "1" ]; then
  cat .ftp.tmp | grep "ProFTPD"
 fi
 if [ "$verbose" != "1" ]; then
  echo " ${cyn}possible${cl}"
 fi
fi
if [ "$provuln" != "1" ]; then
 echo " no"
 provulnflog=" no"
fi
echo "Vulnerable version of ProFTPD: $provulnflog 
[`cat .ftp.tmp | grep "ProFTPD"`]" >>$rlog

echo -n "$rver checking for vulnerable version of ${cyn}Serv-U${hblk}..${cl}"
tools/bin/anonftp.pl $1 1>.ftp.tmp 2>.ftp.tmp &
sleep 5
killall -q9 anonftp.pl >/dev/null 2>&1
cat .ftp.tmp | grep "Serv-U" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 uvuln="1"
fi
if [ "$uvuln" = "1" ]; then
 uvulnflog=" ${cyn}possible${cl}"
 if [ "$verbose" = "1" ]; then
  cat .ftp.tmp | grep "Serv-U"
 fi
 if [ "$verbose" != "1" ]; then
  echo " ${cyn}possible${cl}"
 fi
fi
if [ "$uvuln" != "1" ]; then
 echo " no"
 uvulnflog=" no"
fi
echo "Vulnerable version of Serv-U: $uvulnflog 
[`cat .ftp.tmp | grep "Serv-U"`]" >>$rlog

echo -n "$rver checking for vulnerable version of ${cyn}glftpd${hblk}..${cl}"
tools/bin/anonftp.pl $1 1>.ftp.tmp 2>.ftp.tmp &
sleep 5
killall -q9 anonftp.pl >/dev/null 2>&1
cat .ftp.tmp | grep "glFtpD" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 uvuln="1"
fi
if [ "$uvuln" = "1" ]; then
 uvulnflog=" ${cyn}possible${cl} $1"
 if [ "$verbose" = "1" ]; then
  cat .ftp.tmp | grep "glftpd"
 fi
 if [ "$verbose" != "1" ]; then
  echo " ${cyn}glFtpD${cl}"
 fi
fi
if [ "$uvuln" != "1" ]; then
 echo " no"
 uvulnflog=" no"
fi
echo "Vulnerable version of glftpd: $uvulnflog
[`cat .ftp.tmp | grep "glFtpD"`]" >>$rlog
 
echo -n "$rver checking for ${cyn}rpc${hblk}.${cl}${cyn}ttdbserverd${cl} vulnerability${cl}${hblk}..${cl}"
cat .rpcinfo.tmp | grep "100083" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 ttdb="1"
echo " ${cyn}right ${hblk}on"
 ttdblog=" ${cyn}right ${hblk}on${cl} $1"
fi
if [ "$ttdb" != "1" ]; then
 echo " bitch said no"
 ttdblog=" bitch said no"
fi
echo "Checking for rpc.ttdbserverd vulnerability: $ttdblog" >>$rlog
echo "$rline" >>$rlog

echo -n "$rver checking for ${cyn}status ${cl}${wht}vulnerability${hblk}..${cl}"
cat .rpcinfo.tmp | grep "100024" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 stat="1"
echo " ${cyn}right ${hblk}on"
 statlog=" ${cyn}right ${hblk}on${cl} $1"
fi
if [ "$stat" != "1" ]; then
 echo " bitch said no"
 statlog=" bitch said no"
fi
echo "Checking for status vulnerability: $statlog" >>$rlog
echo "$rline" >>$rlog

echo -n "$rver checking for ${cyn}rpc${hblk}.${cl}${cyn}nisd${cl} vulnerability${hblk}..${cl}"
cat .rpcinfo.tmp | grep "100300" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 nisd="1"
echo " ${cyn}right ${hblk}on"
 nisdlog=" ${cyn}right ${hblk}on${cl} $1"
fi
if [ "$nisd" != "1" ]; then
 echo " bitch said no"
 nisdlog=" bitch said no"
fi
echo "Checking for rpc.nisd vulnerability: $nisdlog" >>$rlog
echo "$rline" >>$rlog

echo -n "$rver checking for ${cyn}nfsd${cl}${hblk}..${cl}"
cat .rpcinfo.tmp | grep "2049" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 nfsd="1"
echo " ${cyn}right ${hblk}on"
 nfsdlog=" ${cyn}right ${hblk}on${cl} $1"
fi
if [ "$nfsd" != "1" ]; then
 echo " bitch said no"
 nfsdlog=" bitch said no"
fi
echo "Checking for nfsd vulnerability: $nfsdlog" >>$rlog
echo "$rline" >>$rlog

echo -n "$rver checking for ${cyn}autofs${cl}${hblk}..${cl}"
cat .rpcinfo.tmp | grep "autofs" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 fsd="1"
echo " ${cyn}right ${hblk}on $1"
 fsdlog=" ${cyn}right ${hblk}on${cl} $1"
fi
if [ "$fsd" != "1" ]; then
 echo " bitch said no"
 fsdlog=" bitch said no"
fi
echo "Checking for autofsd vulnerability: $fsdlog" >>$rlog
echo "$rline" >>$rlog

echo -n "$rver checking for ${cyn}dopewars${cl} Vulnerability${hblk}..${cl}"
cat .rpcinfo.tmp | grep "7902" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 dope="1"
echo " ${cyn}right ${hblk}on"
 dopelog=" ${cyn}right ${hblk}on${cl} $1"
fi
if [ "$dope" != "1" ]; then
 echo " bitch said no"
 nfsdlog=" bitch said no"
fi
echo "Checking for dopewars vulnerability: $dopelog" >>$rlog
echo "$rline" >>$rlog

echo -n "$rver checking for ${cyn}Innd${cl} vulnerability${hblk}..${cl}"
nc $1 119 1>.innd.tmp 2>.innd.tmp & 
sleep 4
killall -q9 nc 1>/dev/null 2>/dev/null
cat .innd.tmp | grep "NNRP" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 innd="1"
echo " ${cyn}right ${hblk}on"
 inndlog=" ${cyn}right ${hblk}on${cl} $1"
fi
if [ "$innd" != "1" ]; then
 echo " bitch said no"
 inndlog=" bitch said no"
fi
echo "Checking for Innd Vulnerability: $inndlog" >>$rlog
echo "$rline" >>$rlog

echo -n "$rver checking for ${cyn}Pop3d${cl}${hblk}..${cl}"
ftp $1 110 1>.pop.tmp 2>.pop.tmp &
sleep 4
killall -q9 nc 1>/dev/null 2>/dev/null
cat .pop.tmp | grep "+OK POP3" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 pop="1"
echo " ${cyn}right ${hblk}on"
 poplog=" ${cyn}right ${hblk}on${cl} $1"
fi
if [ "$pop" != "1" ]; then
 echo " bitch said no"
 poplog=" bitch said no"
fi
echo "Checking for Pop3d: $poplog" >>$rlog
echo "$rline" >>$rlog

echo -n "$rver checking for ${cyn}Qpop${cl} Vuln${hblk}..${cl}"
ftp $1 110 1>.qpop.tmp 2>.qpop.tmp &
sleep 4
killall -q9 nc 1>/dev/null 2>/dev/null
cat .qpop.tmp | grep "2.2" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 qpop="1"
echo " ${cyn}Qpop ${hblk}on $1"
 qpoplog=" ${cyn}right ${hblk}on${cl} $1"
fi
if [ "$qpop" != "1" ]; then
 echo " bitch said no"
 qpoplog=" bitch said no"
fi
echo "Checking for Qpop: $qpoplog" >>$rlog
echo "$rline" >>$rlog

echo -n "$rver checking for ${cyn}Qpop${cl} Vuln${hblk}..${cl}"
cat .qpop.tmp | grep "2.4" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 qpop="1"
echo " ${cyn}right ${hblk}on"
 qpoplog=" ${cyn}right ${hblk}on${cl} $1"
fi
if [ "q$pop" != "1" ]; then
 echo " bitch said no"
 qpoplog=" bitch said no"
fi
echo "Checking for Qpop: $qpoplog" >>$rlog
echo "$rline" >>$rlog

echo -n "$rver checking for ${cyn}Imapd${cl} vulnerability${hblk}..${cl}"
nc $1 143 1>.imapd.tmp 2>.imapd.tmp & 
sleep 5
killall -q9 nc 1>/dev/null 2>/dev/null
cat .imapd.tmp | grep "IMAP4rev1 v" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 imapd="1"
echo " ${cyn}right ${hblk}on"
 imapdlog=" ${cyn}possible${cl} $1"
fi
if [ "$imapd" != "1" ]; then
 echo " bitch said no"
 imapdlog=" bitch said no"
fi
echo "Checking for Imadp Vulnerability: $imapdlog" >>$rlog
echo "$rline" >>$rlog

echo -n "$rver checking for ${cyn}Listen${cl} vulnerability${hblk}..${cl}"
cat .services.tmp | grep "listen" 1>.nlps.tmp 2>.nlps.tmp   
cat .nlps.tmp | grep "2766    open        tcp       listen" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 nlps="1"
echo " ${cyn}right ${hblk}on"
 nlpslog=" ${cyn}right ${hblk}on${cl} $1"
fi
if [ "$nlps" != "1" ]; then
 echo " bitch said no"
 nlpslog=" bitch said no"
fi
echo "Checking for Listen Vulnerability: $nlpslog" >>$rlog
echo "$rline" >>$rlog

echo -n "$rver checking for ${cyn}Proxie${cl} Server${hblk}....${cl}"
cat .services.tmp | grep "8080" 1>.proxy.tmp 2>.proxy.tmp
cat .proxy.tmp | grep "8080" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 proxy="1"
echo " ${cyn}right ${hblk}on"
 proxylog=" ${cyn}right ${hblk}on${cl} $1"
fi
if [ "$proxy" != "1" ]; then
 echo " bitch said no"
 proxylog=" bitch said no"
fi
echo "Checking for Proxies: $proxylog" >>$rlog
echo "$rline" >>$rlog

echo -n "$rver checking for ${cyn}Wingate${cl}${hblk}..${cl}"
cat .services.tmp | grep -i "socks" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 wingate="1"
echo " ${cyn}right ${hblk}on ${cl} $1"
 wingatelog=" ${cyn}right ${hblk}on${cl} $1"
fi
if [ "$wingate" != "1" ]; then
 echo " bitch said no"
 wingatelog=" bitch said no"
fi
echo "Checking for Wingates: $wingatelog" >>$rlog
echo "$rline" >>$rlog

echo -n "$rver checking for ${cyn}X server${cl}${hblk}....${cl}"
cat .services.tmp | grep "X11" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 cat .services.tmp 1>.xwin.tmp 2>.xwin.tmp 
 cat .services.tmp | grep -i "X11" >/dev/null 2>&1
if [ $? -eq 0 ]; then
  xwinvuln="1"
 fi
fi
if [ "$xwinvuln" = "1" ]; then
 if [ "$verbose" != "1" ]; then
echo " ${cyn}right ${hblk}on"
 fi
 xwinlog=" ${cyn}right ${hblk}on${cl} $1"
 if [ "$verbose" = "1" ]; then
echo " ${cyn}right ${hblk}on"
 fi
fi
if [ "$xwinvuln" != "1" ]; then
 echo " bitch said no"
 xwinlog=" bitch said no"
fi
echo "Checking for X server: $xwinlog" >>$rlog
echo "$rline" >>$rlog

echo -n "$rver checking for ${cyn}Smb${cl} Vulnerability${hblk}..${cl}"
smblog=" bitch said no"
tools/bin/ADM-smb $1 -b 1>.smb.tmp 2>.smb.tmp 
#sleep 30
#killall -9 ADM-smb 1>/dev/null 2>/dev/null
cat .smb.tmp | grep -i "ACCESS GRANTED" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 smb="1"
 smblog=" ${cyn}right ${hblk}on${cl}
 $1${cl}"
fi
echo "$smblog"
echo "Running smb services present:$smblog" >>$rlog
echo "$rline" >>$rlog
echo ""
echo -n "$rver Lets see the ${cyn}SMB Netbios ${cl}Name and ${cyn}WorkGroup${cl}${hblk}:${cl}
"
cat .smb.tmp | grep "Server=" 1>.netbio.tmp 2>.netbio.tmp
rmtfing=`cat .netbio.tmp | grep "Server="`
ndone="1"
if [ "$rmtfing" = "" ]; then
 echo " failed."
 rmtfing=" unavailable."
 ndone="0"
fi
if [ "$ndone" = "1" ]; then
 if [ "$verbose" != "1" ]; then
  echo " done."
 fi
 if [ "$verbose" = "1" ]; then
  echo "[$rmtfing]"
 fi
fi
rm .netbio.tmp 1>/dev/null 2>/dev/null
echo "Lets see what the Netbios and WorkGroup Name is:

$rmtfing" >>$rlog
echo "$rline" >>$rlog
echo ""
echo -n "$rver ${cyn}SMB${cl}${hblk} drive${cl}${hblk}(${cl}${cyn}s${cl}${hblk})${cl} available${hblk}:${cl}
"
cat .smb.tmp | grep "checking" 1>.netbio.tmp 2>.netbio.tmp
rmtfing=`cat .netbio.tmp | grep "checking" | cut -s -d">" -f2`
ndone="1"
if [ "$rmtfing" = "" ]; then
 echo " failed."
 rmtfing=" unavailable."
 ndone="0"
fi
if [ "$ndone" = "1" ]; then
 if [ "$verbose" != "1" ]; then
  echo " done."
 fi
 if [ "$verbose" = "1" ]; then
  echo "$rmtfing"
 fi
fi
rm .netbio.tmp 1>/dev/null 2>/dev/null           
echo "SMB drive(s) available:

$rmtfing">>$rlog
echo "$rline" >>$rlog
echo ""

echo -n "$rver checking for ${cyn}Snmp${cl} vulnerability${hblk}..${cl}"
cat .services.tmp | grep "161    open" 1>.snmp.tmp 2>.snmp.tmp
cat .snmp.tmp | grep "161    open" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 snmp="1"
echo " ${cyn}right ${hblk}on"
 snmplog=" ${cyn}right ${hblk}on${cl} $1"
fi
if [ "$snmp" != "1" ]; then
 echo " bitch said no"
 snmplog=" bitch said no"
fi
echo "Checking for Snmp vulnerability: $snmplog" >>$rlog
echo "$rline" >>$rlog

echo -n "$rver checking for ${cyn}Finger${cl} service${hblk}..${cl}"
cat .services.tmp | grep "79      open        tcp       finger" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 cat .services.tmp 1>.finger.tmp 2>.finger.tmp &
 cat .services.tmp | grep -i "79      open        tcp" >/dev/null 2>&1
 if [ $? -eq 0 ]; then
  finger="1"
 fi
fi
if [ "$finger" = "1" ]; then
 if [ "$verbose" != "1" ]; then
echo " ${cyn}right ${hblk}on ${cl} $1"
 fi
 fingerlog=" ${cyn}right ${hblk}on${cl} $1"
 if [ "$verbose" = "1" ]; then
echo " ${cyn}right ${hblk}on ${cl} $1"
 fi
fi
if [ "$finger" != "1" ]; then
 echo " bitch said no"
 fingerlog=" bitch said no"
fi
echo "Checking for Finger service: $fingerlog" >>$rlog
echo "$rline" >>$rlog

echo -n "$rver checking for ${cyn}pcnfsd${cl} vulnerability${hblk}..${cl}"
cat .rpcinfo.tmp | grep -i "pcn" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 cat .rpcinfo.tmp | grep -i "pcn" >/dev/null 2>&1
 if [ $? -eq 0 ]; then
  pcn="1"
 fi
fi
if [ "$pcn" = "1" ]; then
 if [ "$verbose" != "1" ]; then
echo " ${cyn}right ${hblk}on"
 fi
 pcnlog=" ${cyn}right ${hblk}on${cl} $1"
 if [ "$verbose" = "1" ]; then
echo " ${cyn}right ${hblk}on"
 fi
fi
if [ "$pcn" != "1" ]; then
 echo " bitch said no"
 pcnlog=" bitch said no"
fi
echo "Checking for pcnfsd vulnerability: $pcnlog" >>$rlog
echo "$rline" >>$rlog


echo -n "$rver checking for remotely exploitable ${cyn}Bind${cl} versions${hblk}..${cl}"
cat .services.tmp | grep "domain" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 tools/bin/binfo-udp $1 1>.binfo.tmp 2>.binfo.tmp
 bindver=`cat .binfo.tmp | cut -d: -f2`
 rm .binfo.tmp
 bindvuln="0" 
 echo "$bindver" | grep -i "4.9.5-REL" >/dev/null 2>&1
 if [ $? -eq 0 ]; then
  bindvuln="1"
  bindver="4.9.5-REL"
 fi
 echo "$bindver" | grep -i "4.9.5-P1" >/dev/null 2>&1
 if [ $? -eq 0 ]; then
  bindvuln="1"
  bindver="4.9.5-P1"
 fi
 echo "$bindver" | grep -i "4.9.6-REL" >/dev/null 2>&1
 if [ $? -eq 0 ]; then
  bindvuln="1"
  bindver="4.9.6-REL"
 fi
 echo "$bindver" | grep -i "8.1-REL" >/dev/null 2>&1
 if [ $? -eq 0 ]; then
  bindvuln="1"
  bindver="4.9.5-REL"
 fi
 echo "$bindver" | grep -i "4.9.3-P1" >/dev/null 2>&1
 if [ $? -eq 0 ]; then
  bindvuln="1"
  bindver="4.9.3-P1"
 fi
 echo "$bindver" | grep -i "8.2" >/dev/null 2>&1
 if [ $? -eq 0 ]; then
  bindvuln="1"
  bindver="8.2"
 fi
 echo "$bindver" | grep -i "8.2.1" >/dev/null 2>&1
 if [ $? -eq 0 ]; then
  bindvuln="1"
  bindver="8.2.1"
 fi
 echo "$bindver" | grep -i "8.8.1-REL" >/dev/null 2>&1
 if [ $? -eq 0 ]; then
  bindvuln="1"
  bindver="8.1.1-REL"
 fi
fi

if [ "$bindvuln" = "1" ]; then
 if [ "$verbose" != "1" ]; then
echo " ${cyn}right ${hblk}on"
 fi
 bindflog=" ${cyn}right ${hblk}on${cl} $1"
 if [ "$verbose" = "1" ]; then
 echo "${cyn}right ${hblk}on" ${cl}"[$bindver]"
 fi
fi
if [ "$bindvuln" != "1" ]; then
 echo " bitch said no"
 bindflog=" bitch said no"
fi
echo "Checking for remotely exploitable bind version: $bindflog [$bindver]" >>$rlog
echo "$rline" >>$rlog

echo -n "$rver checking for ${cyn}rpc${cl}${hblk}.${cl}${cyn}mountd${cl} vulnerability${hblk}..${cl}"
#tools/bin/madm $1 1>.mnt.tmp 2>.mnt.tmp &
#sleep 20
#killall -9 madm 1>/dev/null 2>/dev/null
cat .rpcinfo.tmp | grep -i "mountd" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 mnta="1"
echo " ${cyn}right ${hblk}on${cl}${cyn} ${cl}${hblk}"
 mntflog=" Yes Possible try tools/bin/madm $1"
fi
if [ "$mnta" != "1" ]; then
 echo " bitch said no"
 mntflog=" bitch said no"
fi
echo "Checking for rpc.mountd vulnerability(s): $mntflog" >>$rlog
echo "$rline" >>$rlog


echo -n "$rver checking for ${cyn}insecure exports${cl} vulnerability${hblk}..${cl}"
/usr/sbin/showmount -e $1 1>.mnt2.tmp 2>.mnt2.tmp &
sleep 4
killall -q9 showmount 1>/dev/null 2>/dev/null
cat .mnt2.tmp | grep "everyone" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 expvuln="1"
fi
cat .mnt2.tmp | grep "/" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 expvuln="1"
fi
if [ "$expvuln" = "1" ]; then
echo " ${cyn}right ${hblk}on${cl}
${cyn}$1"${cl}${hblk}
cat .mnt2.tmp | grep "/"
 expflog=" ${cyn}right ${hblk}on${cl} 
$1 
`cat .mnt2.tmp | grep "/"` "
fi
if [ "$expvuln" != "1" ]; then
 echo " bitch said no"
 expflog=" bitch said no 
$1" 
fi
echo "Checking for vulnerable export(s): $expflog" >>$rlog
echo "$rline" >>$rlog


echo -n "$rver checking for dns ${cyn}Iquery${cl} vulnerability${hblk}..${cl}"
tools/bin/iquery $1 1>.iq.tmp 2>.iq.tmp &
sleep 5
killall -q9 iquery 1>/dev/null 2>/dev/null
cat .iq.tmp | grep "exploit code" >/dev/null 2>&1
if [ $? -eq 0 ]; then
echo " ${cyn}right ${hblk}on"
 iqvuln="1"
 iqflog=" ${cyn}right ${hblk}on${cl} $1"
fi
if [ "$iqvuln" != "1" ]; then
 echo " bitch said no"
 iqflog=" bitch said no"
fi
echo "dns iquery vulnerability:$iqflog" >>$rlog
echo "$rline" >>$rlog


echo -n "$rver checking for ${cyn}IRC server${cl}${hblk}....${cl}"
cat .services.tmp | grep "irc" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 cat .services.tmp 1>.irc.tmp 2>.irc.tmp &
cat .services.tmp | grep -i "irc" >/dev/null 2>&1
 if [ $? -eq 0 ]; then
  irc="1"
 fi
fi
if [ "$irc" = "1" ]; then
 if [ "$verbose" != "1" ]; then
echo " ${cyn}right ${hblk}on${cl}"
 fi
 irclog=" ${cyn}right ${hblk}on${cl} $1"
 if [ "$verbose" = "1" ]; then
echo " ${cyn}right ${hblk}on${cl}"
 fi
fi
if [ "$irc" != "1" ]; then
 echo " bitch said no"
fi
irclog=" No"
echo "Checking for irc service: $irclog${cl}" >>$rlog
echo "$rline" >>$rlog

echo -n "$rver checking for ${cyn}bootp${cl}${hblk}....${cl}"
btpflog=" bitch said no"
ftp $1 67 1>.bootp.tmp 2>.bootp.tmp &
sleep 4
killall -q9 ftp 1>/dev/null 2>/dev/null
cat .bootp.tmp | grep -i "connected" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 btpflog=" ${cyn}right ${hblk}on${cl} $1"
 btpvuln="1"
fi
echo "$btpflog"
echo "BOOTP server running on tcp/67:$btpflog" >>$rlog
echo "$rline" >>$rlog

echo -n "$rver checking rpcbind/portmap for ${cyn}statd${cl} overflow${hblk}..${cl}"
sdflog=" bitch said no"
#rpcinfo -p $1 1>.statd.tmp 2>.statd.tmp &
#sleep 4
#killall -9 rpcinfo 1>/dev/null 2>/dev/null 
cat .rpcinfo.tmp | grep "stat" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 sdflog=" ${cyn}right ${hblk}on${cl} $1"
 sdvuln="1"
fi
echo "$sdflog"
echo "RPC/Statd running on host:$sdflog" >>$rlog
echo "$rline" >>$rlog


echo -n "$rver checking for a running ${cyn}web ${cl}server${cl}${hblk}....${cl}"
(echo "GET /" ; sleep 5) | nc -w 6 $1 80 1>.www.tmp 2>.www.tmp
cat .www.tmp | grep -i "<" >/dev/null 2>&1
if [ $? -eq 0 ]; then
 httpdflog=" ${cyn}right ${hblk}on${cl} $1"
 httpd="1"
fi
if [ "$httpd" != "1" ]; then
 echo " bitch said no"
 httpdflog=" bitch said no"
fi
hver=`(echo "HEAD / HTTP/1.0"; echo; echo) | nc -w 3 $1 80 | grep -i "Server:" | cut -d: -f2`
echo "Running httpd: $httpdflog.$hver" >>$rlog
echo "$rline" >>$rlog
if [ "$httpd" = "1" ]; then
 if [ "$verbose" != "1" ]; then
echo " ${cyn}right ${hblk}on${cl}"
 fi
 httpdflog=" ${cyn}right ${hblk}on${cl} $1"
 if [ "$verbose" = "1" ]; then
 if [ "$hver" = "" ]; then
  hver="unavailable"
 fi
 echo " $hver"
 fi
fi

 echo -n "$rver scanning for various cgi scripts.."
 if [ "$verbose" = "1" ]; then
  echo ""
  tools/bin/cgichk $1
 fi
 if [ "$verbose" != "1" ]; then
  tools/bin/cgichk $1 1>/dev/null 2>/dev/null
 fi
 if [ -f cgilist ]; then
  echo "$rline" >>$rlog
  echo "The following vulnerable cgi scripts are present: " >>$rlog
  cat cgilist >>$rlog
fi

# start the view log
echo ""
echo -n "$rver${hblk}  Press${cl}${cyn} Enter${cl}${hblk} to view the Results${cl}${wht}.${cl}${cyn}.${cl}${wht}"
read viewlog
echo ""
cat $rlog |more 
