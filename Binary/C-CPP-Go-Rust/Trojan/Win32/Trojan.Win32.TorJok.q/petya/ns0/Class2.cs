using karo;
using ns12;
using System;
using System.Threading;
using System.Windows.Forms;

namespace ns0
{
	internal static class Class2
	{
		[STAThread]
		private static void Main()
		{
			Class16.smethod_367();
			Mutex mutex = new Mutex(false, "MyUniqueMutexName");
			try
			{
				if (mutex.WaitOne(0, false))
				{
					Application.EnableVisualStyles();
					Application.SetCompatibleTextRenderingDefault(false);
					Application.Run(new Form1());
				}
			}
			finally
			{
				mutex.Close();
			}
		}
	}
}
