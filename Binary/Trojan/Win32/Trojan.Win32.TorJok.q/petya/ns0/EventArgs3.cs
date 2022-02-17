using ns15;
using ns4;
using ns8;
using System;

namespace ns0
{
	internal sealed class EventArgs3 : EventArgs0
	{
		private int int_1;

		internal EventArgs3(string string_1, bool bool_1, int int_2, int int_3, GClass0 gclass0_1) : base(string_1, bool_1 ? Enum6.const_9 : Enum6.const_10)
		{
			this.int_0 = int_2;
			this.gclass0_0 = gclass0_1;
			this.int_1 = int_3;
		}

		internal EventArgs3()
		{
		}

		internal EventArgs3(string string_1, Enum6 enum6_1) : base(string_1, enum6_1)
		{
		}
	}
}
