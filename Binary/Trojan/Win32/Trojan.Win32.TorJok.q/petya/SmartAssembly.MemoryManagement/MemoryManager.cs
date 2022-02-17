using System;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Windows.Forms;

namespace SmartAssembly.MemoryManagement
{
	public sealed class MemoryManager
	{
		internal static MemoryManager memoryManager_0;

		private long long_0 = DateTime.Now.Ticks;

		[DllImport("kernel32")]
		private static extern int SetProcessWorkingSetSize(IntPtr intptr_0, int int_0, int int_1);

		private void method_0()
		{
			try
			{
				using (Process currentProcess = Process.GetCurrentProcess())
				{
					MemoryManager.SetProcessWorkingSetSize(currentProcess.Handle, -1, -1);
				}
			}
			catch
			{
			}
		}

		private void method_1(object sender, EventArgs e)
		{
			try
			{
				long ticks = DateTime.Now.Ticks;
				if (ticks - this.long_0 > 10000000L)
				{
					this.long_0 = ticks;
					this.method_0();
				}
			}
			catch
			{
			}
		}

		internal MemoryManager()
		{
			Application.Idle += new EventHandler(this.method_1);
			this.method_0();
		}
	}
}
