using ns12;
using ns2;
using ns3;
using System;
using System.Net;
using System.Net.Sockets;

namespace ns9
{
	internal sealed class Class54 : Socket
	{
		internal object object_0;

		internal IPEndPoint ipendPoint_0 = null;

		internal Enum25 enum25_0 = Enum25.const_0;

		internal string string_0 = null;

		internal string string_1 = null;

		internal AsyncCallback asyncCallback_0 = null;

		internal Class53 class53_0;

		internal Exception exception_0 = null;

		internal int int_0;

		public Class54(AddressFamily addressFamily_0, SocketType socketType_0, ProtocolType protocolType_0) : this(addressFamily_0, socketType_0, protocolType_0, "")
		{
		}

		public Class54(AddressFamily addressFamily_0, SocketType socketType_0, ProtocolType protocolType_0, string string_2) : this(addressFamily_0, socketType_0, protocolType_0, string_2, "")
		{
		}

		public Class54(AddressFamily addressFamily_0, SocketType socketType_0, ProtocolType protocolType_0, string string_2, string string_3) : base(addressFamily_0, socketType_0, protocolType_0)
		{
			Class16.smethod_561(string_2, this);
			Class16.smethod_292(this, string_3);
			this.exception_0 = new InvalidOperationException();
		}

		internal void method_0(IAsyncResult iasyncResult_0)
		{
			try
			{
				IPHostEntry iPHostEntry = Dns.EndResolve(iasyncResult_0);
				base.BeginConnect(new IPEndPoint(iPHostEntry.AddressList[0], Class16.smethod_407(this)), new AsyncCallback(this.method_1), Class16.smethod_643(this));
			}
			catch (Exception exception_)
			{
				this.method_2(exception_);
			}
		}

		private void method_1(IAsyncResult iasyncResult_0)
		{
			try
			{
				base.EndConnect(iasyncResult_0);
				this.method_2(null);
			}
			catch (Exception exception_)
			{
				this.method_2(exception_);
			}
		}

		internal void method_2(Exception exception_1)
		{
			if (exception_1 != null)
			{
				base.Close();
			}
			this.exception_0 = exception_1;
			Class16.smethod_159(Class16.smethod_350(this));
			if (this.asyncCallback_0 != null)
			{
				this.asyncCallback_0(Class16.smethod_350(this));
			}
		}
	}
}
