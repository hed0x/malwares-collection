using Ionic;
using ns10;
using ns12;
using ns15;
using System;
using System.IO;
using System.Text;

namespace ns8
{
	internal sealed class Class10 : Class9
	{
		internal ComparisonOperator comparisonOperator_0;

		internal long long_0;

		public override string ToString()
		{
			StringBuilder stringBuilder = new StringBuilder();
			stringBuilder.Append("size ").Append(Class16.smethod_375(this.comparisonOperator_0)).Append(" ").Append(this.long_0.ToString());
			return stringBuilder.ToString();
		}

		internal override bool vmethod_0(string string_0)
		{
			FileInfo fileInfo = new FileInfo(string_0);
			return Class16.smethod_593(fileInfo.Length, this);
		}

		internal override bool vmethod_1(GClass0 gclass0_0)
		{
			return Class16.smethod_593(gclass0_0.long_2, this);
		}
	}
}
