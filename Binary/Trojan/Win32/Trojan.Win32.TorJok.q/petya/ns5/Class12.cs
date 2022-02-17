using Ionic;
using ns10;
using ns12;
using ns15;
using System;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;

namespace ns5
{
	internal sealed class Class12 : Class9
	{
		internal Regex regex_0;

		private string string_0;

		internal ComparisonOperator comparisonOperator_0;

		internal string string_1;

		internal virtual void vmethod_2(string string_2)
		{
			if (Directory.Exists(string_2))
			{
				this.string_1 = ".\\" + string_2 + "\\*.*";
			}
			else
			{
				this.string_1 = string_2;
			}
			this.string_0 = "^" + Regex.Escape(this.string_1).Replace("\\\\\\*\\.\\*", "\\\\([^\\.]+|.*\\.[^\\\\\\.]*)").Replace("\\.\\*", "\\.[^\\\\\\.]*").Replace("\\*", ".*").Replace("\\?", "[^\\\\\\.]") + "$";
			this.regex_0 = new Regex(this.string_0, RegexOptions.IgnoreCase);
		}

		public override string ToString()
		{
			StringBuilder stringBuilder = new StringBuilder();
			stringBuilder.Append("name ").Append(Class16.smethod_375(this.comparisonOperator_0)).Append(" '").Append(this.string_1).Append("'");
			return stringBuilder.ToString();
		}

		internal override bool vmethod_0(string string_2)
		{
			return Class16.smethod_656(string_2, this);
		}

		internal override bool vmethod_1(GClass0 gclass0_0)
		{
			string text = gclass0_0.string_1.Replace("/", "\\");
			return Class16.smethod_656(text, this);
		}
	}
}
