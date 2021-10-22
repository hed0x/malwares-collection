using ns12;
using ns2;
using ns6;
using System;
using System.Net;
using System.Net.Sockets;

namespace ns14
{
	internal abstract class Class55
	{
		internal Socket socket_0;

		internal string string_0;

		internal Class53 class53_0;

		internal byte[] byte_0;

		internal int int_0;

		protected Delegate6 delegate6_0;

		public Class55(Socket socket_1, string string_1)
		{
			Class16.smethod_174(this, socket_1);
			Class16.smethod_18(this, string_1);
		}

		public abstract Class53 vmethod_0(string string_1, int int_1, Delegate6 delegate6_1, IPEndPoint ipendPoint_0);
	}
}
