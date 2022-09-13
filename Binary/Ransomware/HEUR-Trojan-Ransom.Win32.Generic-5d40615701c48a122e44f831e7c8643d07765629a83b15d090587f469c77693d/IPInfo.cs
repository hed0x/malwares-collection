// Decompiled with JetBrains decompiler
// Type: Complex.IPInfo
// Assembly: Client-2, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 10231E92-BCE6-4007-A463-67D77912E754
// Assembly location: C:\Users\WDAGUtilityAccount\Desktop\5d40615701c48a122e44f831e7c8643d07765629a83b15d090587f469c77693d

using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;

namespace Complex
{
  public class IPInfo
  {
    private string _HostName = string.Empty;

    public IPInfo(string macAddress, string ipAddress)
    {
      this.MacAddress = macAddress;
      this.IPAddress = ipAddress;
    }

    public string MacAddress { get; private set; }

    public string IPAddress { get; private set; }

    public string HostName
    {
      get
      {
        if (string.IsNullOrEmpty(this._HostName))
        {
          try
          {
            this._HostName = Dns.GetHostEntry(this.IPAddress).HostName;
          }
          catch
          {
            this._HostName = string.Empty;
          }
        }
        return this._HostName;
      }
    }

    public static IPInfo GetIPInfo(string macAddress) => IPInfo.GetIPInfo().Where<IPInfo>((Func<IPInfo, bool>) (ip => ip.MacAddress.ToLowerInvariant() == macAddress.ToLowerInvariant())).FirstOrDefault<IPInfo>();

    public static List<IPInfo> GetIPInfo()
    {
      try
      {
        List<IPInfo> ipInfo = new List<IPInfo>();
        string arpResult = IPInfo.GetARPResult();
        char[] chArray = new char[2]{ '\n', '\r' };
        foreach (string str in arpResult.Split(chArray))
        {
          if (!string.IsNullOrEmpty(str))
          {
            string[] array = ((IEnumerable<string>) str.Split(' ', '\t')).Where<string>((Func<string, bool>) (piece => !string.IsNullOrEmpty(piece))).ToArray<string>();
            if (array.Length == 3)
              ipInfo.Add(new IPInfo(array[1], array[0]));
          }
        }
        return ipInfo;
      }
      catch (Exception ex)
      {
        throw new Exception("IPInfo: Error Parsing 'arp -a' results", ex);
      }
    }

    private static string GetARPResult()
    {
      Process process = (Process) null;
      string arpResult = string.Empty;
      try
      {
        process = Process.Start(new ProcessStartInfo("arp", "-a")
        {
          CreateNoWindow = true,
          UseShellExecute = false,
          RedirectStandardOutput = true
        });
        arpResult = process.StandardOutput.ReadToEnd();
        process.Close();
      }
      catch (Exception ex)
      {
        throw new Exception("IPInfo: Error Retrieving 'arp -a' Results", ex);
      }
      finally
      {
        process?.Close();
      }
      return arpResult;
    }
  }
}
