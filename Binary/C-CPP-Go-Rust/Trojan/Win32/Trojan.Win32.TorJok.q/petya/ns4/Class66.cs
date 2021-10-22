using ns11;
using ns12;
using ns2;
using ns3;
using ns6;
using System;
using System.Net.Sockets;
using System.Runtime.CompilerServices;

namespace ns4
{
	internal sealed class Class66 : Class65
	{
		[CompilerGenerated]
		private int int_1;

		[CompilerGenerated]
		private Class84.Enum26 enum26_0;

		[CompilerGenerated]
		private Class84 class84_0;

		[CompilerGenerated]
		public int method_1()
		{
			return this.int_1;
		}

		[CompilerGenerated]
		private void method_2(int int_2)
		{
			this.int_1 = int_2;
		}

		[CompilerGenerated]
		public Class84.Enum26 method_3()
		{
			return this.enum26_0;
		}

		[CompilerGenerated]
		private void method_4(Class84.Enum26 enum26_1)
		{
			this.enum26_0 = enum26_1;
		}

		[CompilerGenerated]
		private Class84 method_5()
		{
			return this.class84_0;
		}

		[CompilerGenerated]
		private void method_6(Class84 class84_1)
		{
			this.class84_0 = class84_1;
		}

		public Class66(Class84 class84_1) : base(class84_1.method_2(), class84_1.method_0())
		{
			this.method_2(class84_1.method_0());
			this.method_4(class84_1.method_8());
			this.method_6(class84_1);
		}

		public override void vmethod_0(IAsyncResult iasyncResult_0)
		{
			try
			{
				Socket socket = Class16.smethod_541(this).EndAccept(iasyncResult_0);
				if (socket != null)
				{
					Class63 @class = new Class63(this.method_5(), socket, new Delegate7(base.method_0));
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
	}
}
