using Ionic;
using ns10;
using ns12;
using ns15;
using System;
using System.IO;
using System.Text;

namespace ns0
{
	internal sealed class Class14 : Class9
	{
		internal FileAttributes fileAttributes_0;

		internal ComparisonOperator comparisonOperator_0;

		public override string ToString()
		{
			StringBuilder stringBuilder = new StringBuilder();
			stringBuilder.Append("attributes ").Append(Class16.smethod_375(this.comparisonOperator_0)).Append(" ").Append(Class16.smethod_342(this));
			return stringBuilder.ToString();
		}

		internal override bool vmethod_0(string string_0)
		{
			if (Directory.Exists(string_0))
			{
				return this.comparisonOperator_0 != ComparisonOperator.EqualTo;
			}
			FileAttributes attributes = File.GetAttributes(string_0);
			return Class16.smethod_410(attributes, this);
		}

		internal override bool vmethod_1(GClass0 gclass0_0)
		{
			FileAttributes int_ = (FileAttributes)gclass0_0.int_0;
			return Class16.smethod_410(int_, this);
		}
	}
}
