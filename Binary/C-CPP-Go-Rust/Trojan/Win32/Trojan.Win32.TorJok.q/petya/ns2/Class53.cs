using System;
using System.Threading;

namespace ns2
{
	internal sealed class Class53 : IAsyncResult
	{
		internal bool bool_0 = true;

		internal object object_0;

		internal ManualResetEvent manualResetEvent_0;

		public bool IsCompleted
		{
			get
			{
				return this.bool_0;
			}
		}

		public bool CompletedSynchronously
		{
			get
			{
				return false;
			}
		}

		public object AsyncState
		{
			get
			{
				return this.object_0;
			}
		}

		public WaitHandle AsyncWaitHandle
		{
			get
			{
				if (this.manualResetEvent_0 == null)
				{
					this.manualResetEvent_0 = new ManualResetEvent(false);
				}
				return this.manualResetEvent_0;
			}
		}
	}
}
