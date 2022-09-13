// Decompiled with JetBrains decompiler
// Type: Complex.Crypto
// Assembly: Client-2, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 10231E92-BCE6-4007-A463-67D77912E754
// Assembly location: C:\Users\WDAGUtilityAccount\Desktop\5d40615701c48a122e44f831e7c8643d07765629a83b15d090587f469c77693d

using System;
using System.Security.Cryptography;

namespace Complex
{
  public class Crypto
  {
    public static string RandomString(int string_length)
    {
      using (RNGCryptoServiceProvider cryptoServiceProvider = new RNGCryptoServiceProvider())
      {
        byte[] numArray = new byte[(string_length * 6 + 7) / 8];
        cryptoServiceProvider.GetBytes(numArray);
        return Convert.ToBase64String(numArray);
      }
    }
  }
}
