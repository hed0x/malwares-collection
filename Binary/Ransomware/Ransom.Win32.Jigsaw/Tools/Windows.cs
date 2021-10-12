using System;
using System.IO;
using System.Runtime.InteropServices;
using System.Windows.Forms;
using Microsoft.Win32;

namespace Main.Tools
{
    internal static class Windows
    {
        internal static void SetStartup(StartupMethodType startupMethod)
        {
            switch (startupMethod)
            {
                case StartupMethodType.Registry:
                    try
                    {
                        SetStartupRegistry(Config.FinalExePath);
                    }
                    catch
                    {
                        SetStartupFolder();
                    }
                    break;
                case StartupMethodType.StartupFolder:
                    SetStartupFolder();
                    break;
            }
        }

        private static void SetStartupFolder()
        {
            if (Config.FinalExeRelativePath == null) return;
            var startupExePath = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.Startup),
                Path.GetFileName(Config.FinalExeRelativePath));
            Config.FinalExePath = startupExePath;
        }

        internal enum StartupMethodType
        {
            StartupFolder,
            Registry
        }

        private static void SetStartupRegistry(string exePath)
        {
            var rk = Registry.CurrentUser.OpenSubKey
                (@"SOFTWARE\Microsoft\Windows\CurrentVersion\Run", true);

            if (rk == null) return;

            rk.SetValue(Path.GetFileName(exePath), exePath);
        }

        internal static void RemoveStartupRegistry(string exePath)
        {
            var rk = Registry.CurrentUser.OpenSubKey
                (@"SOFTWARE\Microsoft\Windows\CurrentVersion\Run", true);

            if (rk == null) return;

            rk.DeleteValue(Path.GetFileName(exePath), false);
        }

        [DllImport("user32.dll")]
        private static extern bool SetWindowPos(IntPtr hWnd, IntPtr hWndInsertAfter, int X, int Y, int cx, int cy, uint uFlags);

        // ReSharper disable once InconsistentNaming
        private static readonly IntPtr HWND_TOPMOST = new IntPtr(-1);

        // ReSharper disable once InconsistentNaming
        private const uint SWP_NOSIZE = 0x0001;
        // ReSharper disable once InconsistentNaming
        private const uint SWP_NOMOVE = 0x0002;

        internal static void MakeTopMost(Form f)
        {
            SetWindowPos(f.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE | SWP_NOSIZE);
        }
    }
}
