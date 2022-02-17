using ns12;
using ns3;
using ns6;
using ns8;
using System;
using System.Net.Sockets;

namespace ns10
{
	internal sealed class Class60 : Class58
	{
		internal string string_0;

		internal string string_1;

		public Class60(Socket socket_1, string string_2, string string_3) : base(socket_1)
		{
			Class16.smethod_368(string_2, this);
			Class16.smethod_615(string_3, this);
		}

		public override void vmethod_0(Delegate6 delegate6_1)
		{
			this.delegate6_0 = delegate6_1;
			Class16.smethod_351(this).BeginSend(Class16.smethod_64(this), 0, 3 + Class16.smethod_91(this).Length + Class16.smethod_111(this).Length, SocketFlags.None, new AsyncCallback(this.method_0), Class16.smethod_351(this));
		}

		private void method_0(IAsyncResult iasyncResult_0)
		{
			try
			{
				Class16.smethod_351(this).EndSend(iasyncResult_0);
				this.byte_0 = new byte[2];
				Class16.smethod_351(this).BeginReceive(Class16.smethod_76(this), 0, 2, SocketFlags.None, new AsyncCallback(this.method_1), Class16.smethod_351(this));
			}
			catch (Exception exception_)
			{
				this.delegate6_0(exception_);
			}
		}

		private void method_1(IAsyncResult iasyncResult_0)
		{
			try
			{
				this.int_0 = Class16.smethod_142(this) + Class16.smethod_351(this).EndReceive(iasyncResult_0);
				if (Class16.smethod_142(this) == Class16.smethod_76(this).Length)
				{
					if (Class16.smethod_76(this)[1] != 0)
					{
						throw new Exception0("Username/password combination not accepted.");
					}
					this.delegate6_0(null);
				}
				else
				{
					Class16.smethod_351(this).BeginReceive(Class16.smethod_76(this), Class16.smethod_142(this), Class16.smethod_76(this).Length - Class16.smethod_142(this), SocketFlags.None, new AsyncCallback(this.method_1), Class16.smethod_351(this));
				}
			}
			catch (Exception exception_)
			{
				this.delegate6_0(exception_);
			}
		}
	}
}
