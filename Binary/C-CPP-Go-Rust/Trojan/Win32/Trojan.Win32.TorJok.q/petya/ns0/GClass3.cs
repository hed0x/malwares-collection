using ns12;
using System;
using System.Runtime.InteropServices;

namespace ns0
{
	[ClassInterface(ClassInterfaceType.AutoDispatch), ComVisible(true), Guid("ebc25cf6-9120-4283-b972-0e5520d0000C")]
	public sealed class GClass3
	{
		private const int int_0 = 8192;

		internal uint uint_0;

		internal long long_0;

		internal bool bool_0;

		internal uint[] uint_1;

		internal uint uint_2 = 4294967295u;

		public long TotalBytesRead
		{
			get
			{
				return this.long_0;
			}
		}

		public int Crc32Result
		{
			get
			{
				return (int)(~(int)this.uint_2);
			}
		}

		public GClass3() : this(false)
		{
		}

		public GClass3(bool bool_1) : this(-306674912, bool_1)
		{
		}

		public GClass3(int int_1, bool bool_1)
		{
			this.bool_0 = bool_1;
			this.uint_0 = (uint)int_1;
			Class16.smethod_23(this);
		}
	}
}
