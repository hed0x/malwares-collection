using Ionic;
using ns10;
using ns15;
using System;
using System.Text;

namespace ns7
{
	internal sealed class Class15 : Class9
	{
		internal LogicalConjunction logicalConjunction_0;

		internal Class9 class9_0;

		internal Class9 class9_1;

		internal override bool vmethod_0(string string_0)
		{
			bool flag = this.class9_0.vmethod_0(string_0);
			switch (this.logicalConjunction_0)
			{
			case LogicalConjunction.AND:
				if (flag)
				{
					flag = this.class9_1.vmethod_0(string_0);
				}
				break;
			case LogicalConjunction.OR:
				if (!flag)
				{
					flag = this.class9_1.vmethod_0(string_0);
				}
				break;
			case LogicalConjunction.XOR:
				flag ^= this.class9_1.vmethod_0(string_0);
				break;
			default:
				throw new ArgumentException("Conjunction");
			}
			return flag;
		}

		public override string ToString()
		{
			StringBuilder stringBuilder = new StringBuilder();
			stringBuilder.Append("(").Append((this.class9_0 != null) ? this.class9_0.ToString() : "null").Append(" ").Append(this.logicalConjunction_0.ToString()).Append(" ").Append((this.class9_1 != null) ? this.class9_1.ToString() : "null").Append(")");
			return stringBuilder.ToString();
		}

		internal override bool vmethod_1(GClass0 gclass0_0)
		{
			bool flag = this.class9_0.vmethod_1(gclass0_0);
			switch (this.logicalConjunction_0)
			{
			case LogicalConjunction.AND:
				if (flag)
				{
					flag = this.class9_1.vmethod_1(gclass0_0);
				}
				break;
			case LogicalConjunction.OR:
				if (!flag)
				{
					flag = this.class9_1.vmethod_1(gclass0_0);
				}
				break;
			case LogicalConjunction.XOR:
				flag ^= this.class9_1.vmethod_1(gclass0_0);
				break;
			}
			return flag;
		}
	}
}
