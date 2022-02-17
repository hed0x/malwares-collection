using System;
using System.Net;
using System.Runtime.CompilerServices;

namespace ns2
{
	internal sealed class Class84
	{
		public enum Enum26
		{
			const_0,
			const_1
		}

		[CompilerGenerated]
		private int int_0;

		[CompilerGenerated]
		private IPAddress ipaddress_0;

		[CompilerGenerated]
		private int int_1;

		[CompilerGenerated]
		private IPAddress ipaddress_1;

		[CompilerGenerated]
		private Class84.Enum26 enum26_0;

		[CompilerGenerated]
		public int method_0()
		{
			return this.int_0;
		}

		[CompilerGenerated]
		public void method_1(int int_2)
		{
			this.int_0 = int_2;
		}

		[CompilerGenerated]
		public IPAddress method_2()
		{
			return this.ipaddress_0;
		}

		[CompilerGenerated]
		public void method_3(IPAddress ipaddress_2)
		{
			this.ipaddress_0 = ipaddress_2;
		}

		[CompilerGenerated]
		public int method_4()
		{
			return this.int_1;
		}

		[CompilerGenerated]
		public void method_5(int int_2)
		{
			this.int_1 = int_2;
		}

		[CompilerGenerated]
		public IPAddress method_6()
		{
			return this.ipaddress_1;
		}

		[CompilerGenerated]
		public void method_7(IPAddress ipaddress_2)
		{
			this.ipaddress_1 = ipaddress_2;
		}

		[CompilerGenerated]
		public Class84.Enum26 method_8()
		{
			return this.enum26_0;
		}

		[CompilerGenerated]
		public void method_9(Class84.Enum26 enum26_1)
		{
			this.enum26_0 = enum26_1;
		}

		public Class84()
		{
			this.method_3(IPAddress.Parse("127.0.0.1"));
			this.method_1(12345);
			this.method_7(IPAddress.Parse("127.0.0.1"));
			this.method_5(9150);
			this.method_9(Class84.Enum26.const_1);
		}

		public Class84(IPAddress ipaddress_2, int int_2, IPAddress ipaddress_3, int int_3, Class84.Enum26 enum26_1)
		{
			this.method_3(ipaddress_2);
			this.method_1(int_2);
			this.method_7(ipaddress_3);
			this.method_5(int_3);
			this.method_9(enum26_1);
		}
	}
}
