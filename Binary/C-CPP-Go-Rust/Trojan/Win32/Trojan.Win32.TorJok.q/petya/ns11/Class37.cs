using ns12;
using ns6;
using System;
using System.IO;
using System.Runtime.CompilerServices;

namespace ns11
{
	internal sealed class Class37
	{
		public int int_0;

		public MemoryStream memoryStream_0;

		public int int_1;

		public Class32 class32_0;

		[CompilerGenerated]
		private Class33 class33_0;

		[CompilerGenerated]
		public Class33 method_0()
		{
			return this.class33_0;
		}

		[CompilerGenerated]
		private void method_1(Class33 class33_1)
		{
			this.class33_0 = class33_1;
		}

		public Class37(int int_2, int int_3)
		{
			this.memoryStream_0 = new MemoryStream();
			this.class32_0 = new Class32(this.memoryStream_0);
			this.method_1(new Class33(this.class32_0, int_3));
			this.int_0 = int_2;
		}
	}
}
