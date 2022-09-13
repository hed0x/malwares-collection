// Decompiled with JetBrains decompiler
// Type: Complex.WakeOnLan
// Assembly: Client-2, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 10231E92-BCE6-4007-A463-67D77912E754
// Assembly location: C:\Users\WDAGUtilityAccount\Desktop\5d40615701c48a122e44f831e7c8643d07765629a83b15d090587f469c77693d

using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Net;
using System.Net.Sockets;
using System.Text.RegularExpressions;

namespace Complex
{
  public static class WakeOnLan
  {
    public static void WakeUp(string macAddress, string ipAddress, string subnetMask)
    {
      UdpClient udpClient = new UdpClient();
      byte[] dgram = new byte[102];
      for (int index = 0; index <= 5; ++index)
        dgram[index] = byte.MaxValue;
      string[] strArray;
      if (macAddress.Contains("-"))
        strArray = macAddress.Split('-');
      else
        strArray = macAddress.Split(':');
      if (strArray.Length != 6)
        throw new ArgumentException("Incorrect MAC address supplied!");
      int num = 6;
      for (int index1 = 0; index1 < 16; ++index1)
      {
        for (int index2 = 0; index2 < 6; ++index2)
          dgram[num + index1 * 6 + index2] = (byte) Convert.ToInt32(strArray[index2], 16);
      }
      IPAddress broadcastAddress = IPAddress.Parse(ipAddress).GetBroadcastAddress(IPAddress.Parse(subnetMask));
      udpClient.Send(dgram, dgram.Length, broadcastAddress.ToString(), 3);
    }

    public static IPAddress GetBroadcastAddress(
      this IPAddress address,
      IPAddress subnetMask)
    {
      byte[] addressBytes1 = address.GetAddressBytes();
      byte[] addressBytes2 = subnetMask.GetAddressBytes();
      if (addressBytes1.Length != addressBytes2.Length)
        throw new ArgumentException("Lengths of IP address and subnet mask do not match.");
      byte[] address1 = new byte[addressBytes1.Length];
      for (int index = 0; index < address1.Length; ++index)
        address1[index] = (byte) ((uint) addressBytes1[index] | (uint) addressBytes2[index] ^ (uint) byte.MaxValue);
      return new IPAddress(address1);
    }

    public static string getMacByIp(string ip)
    {
      List<WakeOnLan.MacIpPair> addressesAndIppairs = WakeOnLan.GetAllMacAddressesAndIppairs();
      int index = addressesAndIppairs.FindIndex((Predicate<WakeOnLan.MacIpPair>) (x => x.IpAddress == ip));
      return index >= 0 ? addressesAndIppairs[index].MacAddress.ToUpper() : (string) null;
    }

    public static List<WakeOnLan.MacIpPair> GetAllMacAddressesAndIppairs()
    {
      List<WakeOnLan.MacIpPair> addressesAndIppairs = new List<WakeOnLan.MacIpPair>();
      Process process = new Process();
      process.StartInfo.FileName = "arp";
      process.StartInfo.Arguments = "-a ";
      process.StartInfo.UseShellExecute = false;
      process.StartInfo.RedirectStandardOutput = true;
      process.StartInfo.CreateNoWindow = true;
      process.Start();
      foreach (Match match in Regex.Matches(process.StandardOutput.ReadToEnd(), "(?<ip>([0-9]{1,3}\\.?){4})\\s*(?<mac>([a-f0-9]{2}-?){6})", RegexOptions.IgnoreCase))
        addressesAndIppairs.Add(new WakeOnLan.MacIpPair()
        {
          MacAddress = match.Groups["mac"].Value,
          IpAddress = match.Groups["ip"].Value
        });
      return addressesAndIppairs;
    }

    public struct MacIpPair
    {
      public string MacAddress;
      public string IpAddress;
    }
  }
}
