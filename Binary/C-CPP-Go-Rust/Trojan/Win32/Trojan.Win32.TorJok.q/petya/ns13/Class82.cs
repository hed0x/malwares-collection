using ns12;
using ns2;
using ns4;
using System;
using System.Collections.Generic;
using System.Net;
using System.Runtime.CompilerServices;

namespace ns13
{
	internal sealed class Class82 : IWebProxy
	{
		[CompilerGenerated]
		internal sealed class Class83
		{
			public Class84 class84_0;

			internal bool method_0(Class66 class66_0)
			{
				return class66_0.method_1() == this.class84_0.method_0();
			}
		}

		internal static object object_0 = new object();

		internal static List<Class66> list_0;

		internal static bool bool_0;

		[CompilerGenerated]
		private Class84 class84_0;

		private ICredentials icredentials_0 = null;

		public ICredentials Credentials
		{
			get
			{
				return this.icredentials_0;
			}
			set
			{
				this.icredentials_0 = value;
			}
		}

		[CompilerGenerated]
		private Class84 method_0()
		{
			return this.class84_0;
		}

		[CompilerGenerated]
		private void method_1(Class84 class84_1)
		{
			this.class84_0 = class84_1;
		}

		public Class82(Class84 config = null, bool allowBypass = true)
		{
			this.method_1(config);
			Class16.smethod_303(allowBypass, this, config);
		}

		public Uri GetProxy(Uri destination)
		{
			return new Uri("http://127.0.0.1:" + this.method_0().method_0());
		}

		public bool IsBypassed(Uri host)
		{
			return Class82.bool_0 && !Class16.smethod_509(this);
		}

		[CompilerGenerated]
		internal bool method_2(IPEndPoint ipendPoint_0)
		{
			return ipendPoint_0.Port == this.method_0().method_4();
		}
	}
}
