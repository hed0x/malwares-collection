using Ionic;
using ns10;
using ns12;
using ns15;
using System;
using System.IO;
using System.Text;

namespace ns6
{
	internal sealed class Class13 : Class9
	{
		internal char char_0;

		internal ComparisonOperator comparisonOperator_0;

		internal string method_0()
		{
			return this.char_0.ToString();
		}

		public override string ToString()
		{
			StringBuilder stringBuilder = new StringBuilder();
			stringBuilder.Append("type ").Append(Class16.smethod_375(this.comparisonOperator_0)).Append(" ").Append(this.method_0());
			return stringBuilder.ToString();
		}

		internal override bool vmethod_0(string string_0)
		{
			bool flag = (this.char_0 == 'D') ? Directory.Exists(string_0) : File.Exists(string_0);
			if (this.comparisonOperator_0 != ComparisonOperator.EqualTo)
			{
				flag = !flag;
			}
			return flag;
		}

		internal override bool vmethod_1(GClass0 gclass0_0)
		{
			bool flag = (this.char_0 == 'D') ? gclass0_0.bool_4 : (!gclass0_0.bool_4);
			if (this.comparisonOperator_0 != ComparisonOperator.EqualTo)
			{
				flag = !flag;
			}
			return flag;
		}
	}
}
