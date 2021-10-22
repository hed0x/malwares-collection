using ns12;
using ns3;
using System;
using System.Net;
using System.Net.Sockets;

namespace ns0
{
	internal abstract class Class61 : IDisposable
	{
		private Delegate7 delegate7_0;

		internal Socket socket_0;

		internal Socket socket_1;

		internal byte[] byte_0 = new byte[4096];

		internal byte[] byte_1 = new byte[1024];

		public Class61(Socket socket_2, Delegate7 delegate7_1)
		{
			Class16.smethod_271(this, socket_2);
			this.delegate7_0 = delegate7_1;
		}

		public Class61()
		{
			Class16.smethod_271(this, null);
			this.delegate7_0 = null;
		}

		public void Dispose()
		{
			try
			{
				Class16.smethod_607(this).Shutdown(SocketShutdown.Both);
			}
			catch
			{
			}
			try
			{
				Class16.smethod_261(this).Shutdown(SocketShutdown.Both);
			}
			catch
			{
			}
			if (Class16.smethod_607(this) != null)
			{
				Class16.smethod_607(this).Close();
			}
			if (Class16.smethod_261(this) != null)
			{
				Class16.smethod_261(this).Close();
			}
			Class16.smethod_271(this, null);
			Class16.smethod_595(null, this);
			if (this.delegate7_0 != null)
			{
				this.delegate7_0(this);
			}
		}

		public override string ToString()
		{
			string result;
			try
			{
				result = "Incoming connection from " + ((IPEndPoint)Class16.smethod_261(this).RemoteEndPoint).Address.ToString();
			}
			catch
			{
				result = "Client connection";
			}
			return result;
		}

		public void method_0()
		{
			try
			{
				Class16.smethod_607(this).BeginReceive(Class16.smethod_131(this), 0, Class16.smethod_131(this).Length, SocketFlags.None, new AsyncCallback(this.method_1), Class16.smethod_607(this));
				Class16.smethod_261(this).BeginReceive(Class16.smethod_657(this), 0, Class16.smethod_657(this).Length, SocketFlags.None, new AsyncCallback(this.method_3), Class16.smethod_261(this));
			}
			catch
			{
				this.System.IDisposable.Dispose();
			}
		}

		protected void method_1(IAsyncResult iasyncResult_0)
		{
			try
			{
				int num = Class16.smethod_607(this).EndReceive(iasyncResult_0);
				if (num <= 0)
				{
					this.System.IDisposable.Dispose();
				}
				else
				{
					Class16.smethod_261(this).BeginSend(Class16.smethod_131(this), 0, num, SocketFlags.None, new AsyncCallback(this.method_2), Class16.smethod_261(this));
				}
			}
			catch
			{
				this.System.IDisposable.Dispose();
			}
		}

		protected void method_2(IAsyncResult iasyncResult_0)
		{
			try
			{
				int num = Class16.smethod_261(this).EndSend(iasyncResult_0);
				if (num > 0)
				{
					Class16.smethod_607(this).BeginReceive(Class16.smethod_131(this), 0, Class16.smethod_131(this).Length, SocketFlags.None, new AsyncCallback(this.method_1), Class16.smethod_607(this));
					return;
				}
			}
			catch
			{
			}
			this.System.IDisposable.Dispose();
		}

		protected void method_3(IAsyncResult iasyncResult_0)
		{
			try
			{
				int num = Class16.smethod_261(this).EndReceive(iasyncResult_0);
				if (num <= 0)
				{
					this.System.IDisposable.Dispose();
				}
				else
				{
					Class16.smethod_607(this).BeginSend(Class16.smethod_657(this), 0, num, SocketFlags.None, new AsyncCallback(this.method_4), Class16.smethod_607(this));
				}
			}
			catch
			{
				this.System.IDisposable.Dispose();
			}
		}

		protected void method_4(IAsyncResult iasyncResult_0)
		{
			try
			{
				int num = Class16.smethod_607(this).EndSend(iasyncResult_0);
				if (num > 0)
				{
					Class16.smethod_261(this).BeginReceive(Class16.smethod_657(this), 0, Class16.smethod_657(this).Length, SocketFlags.None, new AsyncCallback(this.method_3), Class16.smethod_261(this));
					return;
				}
			}
			catch
			{
			}
			this.System.IDisposable.Dispose();
		}

		public abstract void vmethod_0();
	}
}
