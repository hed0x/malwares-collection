using Ionic;
using ns10;
using ns12;
using ns15;
using System;
using System.IO;
using System.Text;

namespace ns11
{
	internal sealed class Class11 : Class9
	{
		internal ComparisonOperator comparisonOperator_0;

		internal WhichTime whichTime_0;

		internal DateTime dateTime_0;

		public override string ToString()
		{
			StringBuilder stringBuilder = new StringBuilder();
			stringBuilder.Append(this.whichTime_0.ToString()).Append(" ").Append(Class16.smethod_375(this.comparisonOperator_0)).Append(" ").Append(this.dateTime_0.ToString("yyyy-MM-dd-HH:mm:ss"));
			return stringBuilder.ToString();
		}

		internal override bool vmethod_0(string string_0)
		{
			DateTime dateTime;
			switch (this.whichTime_0)
			{
			case WhichTime.atime:
				dateTime = File.GetLastAccessTime(string_0).ToUniversalTime();
				break;
			case WhichTime.mtime:
				dateTime = File.GetLastWriteTime(string_0).ToUniversalTime();
				break;
			case WhichTime.ctime:
				dateTime = File.GetCreationTime(string_0).ToUniversalTime();
				break;
			default:
				throw new ArgumentException("Operator");
			}
			return Class16.smethod_566(this, dateTime);
		}

		internal override bool vmethod_1(GClass0 gclass0_0)
		{
			DateTime dateTime;
			switch (this.whichTime_0)
			{
			case WhichTime.atime:
				dateTime = gclass0_0.dateTime_2;
				break;
			case WhichTime.mtime:
				dateTime = gclass0_0.dateTime_1;
				break;
			case WhichTime.ctime:
				dateTime = gclass0_0.dateTime_3;
				break;
			default:
				throw new ArgumentException("??time");
			}
			return Class16.smethod_566(this, dateTime);
		}
	}
}
