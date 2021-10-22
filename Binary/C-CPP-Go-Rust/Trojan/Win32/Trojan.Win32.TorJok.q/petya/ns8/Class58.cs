using ns12;
using ns6;
using System;
using System.Net.Sockets;

namespace ns8
{
	internal abstract class Class58
	{
		internal byte[] byte_0;

		internal Socket socket_0;

		protected Delegate6 delegate6_0;

		internal int int_0;

		public Class58(Socket socket_1)
		{
			Class16.smethod_272(socket_1, this);
		}

		public abstract void vmethod_0(Delegate6 delegate6_1);
	}
}
