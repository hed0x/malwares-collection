using ns12;
using ns3;
using ns5;
using System;
using System.Net;
using System.Net.Sockets;

namespace ns11
{
	internal class Class65 : Class64
	{
		public Class65(IPAddress ipaddress_1, int int_1) : base(int_1, ipaddress_1)
		{
		}

		public override void vmethod_0(IAsyncResult iasyncResult_0)
		{
			try
			{
				Socket socket = Class16.smethod_541(this).EndAccept(iasyncResult_0);
				if (socket != null)
				{
					Class62 @class = new Class62(socket, new Delegate7(base.method_0));
					Class16.smethod_278(this, @class);
					@class.vmethod_0();
				}
			}
			catch
			{
			}
			try
			{
				Class16.smethod_541(this).BeginAccept(new AsyncCallback(this.vmethod_0), Class16.smethod_541(this));
			}
			catch
			{
				base.System.IDisposable.Dispose();
			}
		}

		public override string ToString()
		{
			return "HTTP service on " + Class16.smethod_250(this).ToString() + ":" + Class16.smethod_53(this).ToString();
		}
	}
}
