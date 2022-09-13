// Decompiled with JetBrains decompiler
// Type: Complex.CryptographyHelper
// Assembly: Client-2, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 10231E92-BCE6-4007-A463-67D77912E754
// Assembly location: C:\Users\WDAGUtilityAccount\Desktop\5d40615701c48a122e44f831e7c8643d07765629a83b15d090587f469c77693d

using System;
using System.Security.Cryptography;
using System.Text;

namespace Complex
{
  public static class CryptographyHelper
  {
    private static bool _optimalAsymmetricEncryptionPadding = false;
    private static readonly string PublicKey = "MjA0OCE8UlNBS2V5VmFsdWU+PE1vZHVsdXM+bksvNHYwNlJOS2UzWU9FRTJXRVBQbE9EajF3aFh4UGxZZTcyZXRnUm9uR2JOQ3lMbTJFTjd3aWh6NkIxaDJYRkx5OGsydjhPUUJ6RTFocHZuRE5WOTlJdHQzL3dPaEpJei93QTA0MTg1MVFkY3lnTmlhYkdhT2VFWUdGZEZvQUlOT2VyalNUaFV3S1JuQTUwcW9qekRFc1kzbHhsMFVuUjlDaGJtL3JxM2s5NHZkbFVuNk1GZGw0cVFQTkowdC9SSzdyOGFhKzcvSkNIVTdKRWtVVElMZ3ZhZnd6bHZtZjcxSmd5bUI3Njlvb242eVZFcXoxQVZOZHlWT3lkQnVINEFEYlI5SGlBeVFoT3dWQ0NYdVlHeUEzRHhKbGJUSHh0U2lKaVU2VkNjVjNBV21zMk1DMFR4V0NRakNSNnpNRmpoK2dYMXNmRVlpMHM1RldwVnlPcnJ3PT08L01vZHVsdXM+PEV4cG9uZW50PkFRQUI8L0V4cG9uZW50PjwvUlNBS2V5VmFsdWU+";

    public static string Encrypt(string plainText)
    {
      int keySize = 0;
      string xmlKey = "";
      CryptographyHelper.GetKeyFromEncryptionString(CryptographyHelper.PublicKey, out keySize, out xmlKey);
      return Convert.ToBase64String(CryptographyHelper.Encrypt(Encoding.UTF8.GetBytes(plainText), keySize, xmlKey));
    }

    private static byte[] Encrypt(byte[] data, int keySize, string publicKeyXml)
    {
      if (data == null || data.Length == 0)
        throw new ArgumentException("Data are empty", nameof (data));
      int maxDataLength = CryptographyHelper.GetMaxDataLength(keySize);
      if (data.Length > maxDataLength)
        throw new ArgumentException(string.Format("Maximum data length is {0}", (object) maxDataLength), nameof (data));
      if (!CryptographyHelper.IsKeySizeValid(keySize))
        throw new ArgumentException("Key size is not valid", nameof (keySize));
      if (string.IsNullOrEmpty(publicKeyXml))
        throw new ArgumentException("Key is null or empty", nameof (publicKeyXml));
      using (RSACryptoServiceProvider cryptoServiceProvider = new RSACryptoServiceProvider(keySize))
      {
        cryptoServiceProvider.FromXmlString(publicKeyXml);
        return cryptoServiceProvider.Encrypt(data, CryptographyHelper._optimalAsymmetricEncryptionPadding);
      }
    }

    private static int GetMaxDataLength(int keySize) => CryptographyHelper._optimalAsymmetricEncryptionPadding ? (keySize - 384) / 8 + 7 : (keySize - 384) / 8 + 37;

    private static bool IsKeySizeValid(int keySize) => keySize >= 384 && keySize <= 16384 && keySize % 8 == 0;

    private static void GetKeyFromEncryptionString(
      string rawkey,
      out int keySize,
      out string xmlKey)
    {
      keySize = 0;
      xmlKey = "";
      if (rawkey == null || rawkey.Length <= 0)
        return;
      string str = Encoding.UTF8.GetString(Convert.FromBase64String(rawkey));
      if (str.Contains("!"))
      {
        string[] strArray = str.Split(new char[1]{ '!' }, 2);
        try
        {
          keySize = int.Parse(strArray[0]);
          xmlKey = strArray[1];
        }
        catch (Exception ex)
        {
        }
      }
    }
  }
}
