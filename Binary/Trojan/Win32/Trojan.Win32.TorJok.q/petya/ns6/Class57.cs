using ns10;
using ns12;
using ns14;
using ns2;
using ns8;
using System;
using System.Net;
using System.Net.Sockets;

namespace ns6
{
	internal sealed class Class57 : Class55
	{
		internal string string_1;

		internal byte[] byte_1;

		public Class57(Socket socket_1, string string_2, string string_3) : base(socket_1, string_2)
		{
			Class16.smethod_669(string_3, this);
		}

		public override Class53 vmethod_0(string string_2, int int_1, Delegate6 delegate6_1, IPEndPoint ipendPoint_0)
		{
			this.delegate6_0 = delegate6_1;
			this.byte_1 = Class16.smethod_405(int_1, string_2, this);
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
				Class16.smethod_130(this).BeginSend(new byte[]
				{
					5,
					2,
					0,
					2
				}, 0, 4, SocketFlags.None, new AsyncCallback(this.method_1), Class16.smethod_130(this));
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
				Class16.smethod_130(this).EndSend(iasyncResult_0);
			}
			catch (Exception exception_)
			{
				this.delegate6_0(exception_);
				return;
			}
			try
			{
				this.byte_0 = new byte[1024];
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
				this.int_0 = Class16.smethod_255(this) + Class16.smethod_130(this).EndReceive(iasyncResult_0);
				if (Class16.smethod_255(this) <= 0)
				{
					throw new SocketException();
				}
			}
			catch (Exception exception_)
			{
				this.delegate6_0(exception_);
				return;
			}
			try
			{
				if (Class16.smethod_255(this) < 2)
				{
					Class16.smethod_130(this).BeginReceive(Class16.smethod_515(this), Class16.smethod_255(this), Class16.smethod_515(this).Length - Class16.smethod_255(this), SocketFlags.None, new AsyncCallback(this.method_2), Class16.smethod_130(this));
				}
				else
				{
					byte b = Class16.smethod_515(this)[1];
					Class58 @class;
					if (b != 0)
					{
						if (b != 2)
						{
							this.delegate6_0(new SocketException());
							return;
						}
						@class = new Class60(Class16.smethod_130(this), Class16.smethod_172(this), Class16.smethod_222(this));
					}
					else
					{
						@class = new Class59(Class16.smethod_130(this));
					}
					@class.vmethod_0(new Delegate6(this.method_3));
				}
			}
			catch (Exception exception_2)
			{
				this.delegate6_0(exception_2);
			}
		}

		private void method_3(Exception exception_0)
		{
			if (exception_0 != null)
			{
				this.delegate6_0(exception_0);
			}
			else
			{
				try
				{
					Class16.smethod_130(this).BeginSend(Class16.smethod_225(this), 0, Class16.smethod_225(this).Length, SocketFlags.None, new AsyncCallback(this.method_4), Class16.smethod_130(this));
				}
				catch (Exception exception_)
				{
					this.delegate6_0(exception_);
				}
			}
		}

		private void method_4(IAsyncResult iasyncResult_0)
		{
			try
			{
				Class16.smethod_130(this).EndSend(iasyncResult_0);
			}
			catch (Exception exception_)
			{
				this.delegate6_0(exception_);
				return;
			}
			try
			{
				this.byte_0 = new byte[5];
				this.int_0 = 0;
				Class16.smethod_130(this).BeginReceive(Class16.smethod_515(this), 0, Class16.smethod_515(this).Length, SocketFlags.None, new AsyncCallback(this.method_5), Class16.smethod_130(this));
			}
			catch (Exception exception_2)
			{
				this.delegate6_0(exception_2);
			}
		}

		private void method_5(IAsyncResult iasyncResult_0)
		{
			try
			{
				this.int_0 = Class16.smethod_255(this) + Class16.smethod_130(this).EndReceive(iasyncResult_0);
			}
			catch (Exception exception_)
			{
				this.delegate6_0(exception_);
				return;
			}
			try
			{
				if (Class16.smethod_255(this) == Class16.smethod_515(this).Length)
				{
					Class16.smethod_43(Class16.smethod_515(this), this);
				}
				else
				{
					Class16.smethod_130(this).BeginReceive(Class16.smethod_515(this), Class16.smethod_255(this), Class16.smethod_515(this).Length - Class16.smethod_255(this), SocketFlags.None, new AsyncCallback(this.method_5), Class16.smethod_130(this));
				}
			}
			catch (Exception exception_2)
			{
				this.delegate6_0(exception_2);
			}
		}

		internal void method_6(IAsyncResult iasyncResult_0)
		{
			try
			{
				this.int_0 = Class16.smethod_255(this) + Class16.smethod_130(this).EndReceive(iasyncResult_0);
			}
			catch (Exception exception_)
			{
				this.delegate6_0(exception_);
				return;
			}
			try
			{
				if (Class16.smethod_255(this) == Class16.smethod_515(this).Length)
				{
					this.delegate6_0(null);
				}
				else
				{
					Class16.smethod_130(this).BeginReceive(Class16.smethod_515(this), Class16.smethod_255(this), Class16.smethod_515(this).Length - Class16.smethod_255(this), SocketFlags.None, new AsyncCallback(this.method_6), Class16.smethod_130(this));
				}
			}
			catch (Exception exception_2)
			{
				this.delegate6_0(exception_2);
			}
		}
	}
}
