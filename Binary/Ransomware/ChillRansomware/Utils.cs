using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace ChillRansomware
{
    class Utils
    {
        //Create cryptographically secure string
        public static string RandomString(int length)
        {
            const string valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890*!=?()";
            StringBuilder res = new StringBuilder();
            int randomInteger = CryptoRandom.RNGUtil.Next(0, valid.Length);
            while (0 < length--)
            {
                res.Append(valid[randomInteger]);
                randomInteger = CryptoRandom.RNGUtil.Next(0, valid.Length);
            }
            return res.ToString();
        }

        public static byte[] RandomSaltBytes()
        {
            byte[] salt = new byte[8];
            RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
            rng.GetBytes(salt);
            return salt;
        }

        //Checks for internet connection using google, if google is down returns false but that rarely happens
        public static bool CheckForInternetConnection()
        {
            try
            {
                using (var client = new WebClient())
                {
                    using (var stream = client.OpenRead("https://www.google.com"))
                    {
                        return true;
                    }
                }
            }
            catch
            {
                return false;
            }
        }
    }
}
