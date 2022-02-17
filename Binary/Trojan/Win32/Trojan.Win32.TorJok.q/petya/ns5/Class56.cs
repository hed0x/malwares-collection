using ns12;
using ns14;
using ns2;
using ns3;
using ns6;
using System;
using System.Net;
using System.Net.Sockets;

namespace ns5
{
	internal sealed class Class56 : Class55
	{
		public Class56(Socket socket_1, string string_1) : base(socket_1, string_1)
		{
		}

		public override Class53 vmethod_0(string string_1, int int_1, Delegate6 delegate6_1, IPEndPoint ipendPoint_0)
		{
			this.delegate6_0 = delegate6_1;
			this.byte_0 = Class16.smethod_616(int_1, string_1, this);
			Class16.smethod_130(this).BeginConnect(ipendPoint_0, new AsyncCallback(this.method_0), Class16.smethod_130(this));
			this.class53_0 = new Class53();
			return Class16.smethod_653(this);
		}

		private void method_0(IAsyncResult iasyncResult_0)
		{
			try
			{
				Class16.smethod_130(this).EndConnect(iasyncResult_0);
			}
			catch (Exception exception_)
			{
				this.delegate6_0(exception_);
				return;
			}
			try
			{
				Class16.smethod_130(this).BeginSend(Class16.smethod_515(this), 0, Class16.smethod_515(this).Length, SocketFlags.None, new AsyncCallback(this.method_1), Class16.smethod_130(this));
			}
			catch (Exception exception_2)
			{
				this.delegate6_0(exception_2);
			}
		}

		private void method_1(IAsyncResult iasyncResult_0)
		{
			try
			{
				if (Class16.smethod_130(this).EndSend(iasyncResult_0) < Class16.smethod_515(this).Length)
				{
					this.delegate6_0(new SocketException());
					return;
				}
			}
			catch (Exception exception_)
			{
				this.delegate6_0(exception_);
				return;
			}
			try
			{
				this.byte_0 = new byte[8];
				this.int_0 = 0;
				Class16.smethod_130(this).BeginReceive(Class16.smethod_515(this), 0, Class16.smethod_515(this).Length, SocketFlags.None, new AsyncCallback(this.method_2), Class16.smethod_130(this));
			}
			catch (Exception exception_2)
			{
				this.delegate6_0(exception_2);
			}
		}

		private void method_2(IAsyncResult iasyncResult_0)
		{
			try
			{
				int num = Class16.smethod_130(this).EndReceive(iasyncResult_0);
				if (num <= 0)
				{
					this.delegate6_0(new SocketException());
				}
				else
				{
					this.int_0 = Class16.smethod_255(this) + num;
					if (Class16.smethod_255(this) == 8)
					{
						if (Class16.smethod_515(this)[1] == 90)
						{
							this.delegate6_0(null);
						}
						else
						{
							Class16.smethod_130(this).Close();
							this.delegate6_0(new Exception0("Negotiation failed."));
						}
					}
					else
					{
						Class16.smethod_130(this).BeginReceive(Class16.smethod_515(this), Class16.smethod_255(this), Class16.smethod_515(this).Length - Class16.smethod_255(this), SocketFlags.None, new AsyncCallback(this.method_2), Class16.smethod_130(this));
					}
				}
			}
			catch (Exception exception_)
			{
				this.delegate6_0(exception_);
			}
		}
	}
}
