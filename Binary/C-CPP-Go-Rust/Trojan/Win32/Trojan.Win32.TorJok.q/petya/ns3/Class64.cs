using ns0;
using ns12;
using System;
using System.Collections;
using System.Net;
using System.Net.Sockets;

namespace ns3
{
	internal abstract class Class64 : IDisposable
	{
		internal int int_0;

		internal IPAddress ipaddress_0;

		internal Socket socket_0;

		internal ArrayList arrayList_0 = new ArrayList();

		internal bool bool_0 = false;

		public Class64(int int_1, IPAddress ipaddress_1)
		{
			Class16.smethod_51(int_1, this);
			Class16.smethod_654(ipaddress_1, this);
		}

		protected void method_0(Class61 class61_0)
		{
			Class16.smethod_344(this).Remove(class61_0);
		}

		public void Dispose()
		{
			if (!Class16.smethod_556(this))
			{
				while (Class16.smethod_344(this).Count > 0)
				{
					((Class61)Class16.smethod_344(this)[0]).System.IDisposable.Dispose();
				}
				try
				{
					Class16.smethod_541(this).Shutdown(SocketShutdown.Both);
				}
				catch
				{
				}
				if (Class16.smethod_541(this) != null)
				{
					Class16.smethod_541(this).Close();
				}
				this.bool_0 = true;
			}
		}

		~Class64()
		{
			this.System.IDisposable.Dispose();
		}

		public abstract void vmethod_0(IAsyncResult iasyncResult_0);

		public abstract override string ToString();
	}
}
