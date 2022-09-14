using System.Runtime.InteropServices;

namespace Ransom
{
    internal sealed class NativeMethods
    {
        [DllImport("kernel32.dll")]
        internal static extern IntPtr GetConsoleWindow();
        [DllImport("kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
        internal static extern bool DefineDosDeviceW(uint dwFlags, string lpDeviceName, string lpTargetPath);
        [DllImport("kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
        internal static extern bool MoveFileExW(string lpExistingFileName, string lpNewFileName, uint dwFlags);

        [DllImport("user32.dll")]
        internal static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
        [DllImport("user32.dll")]
        internal static extern int GetSystemMetrics(int smIndex);
        
        public const int SW_HIDE = 0;
        public const int SW_SHOW = 5;
    }
}