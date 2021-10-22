using ns0;
using ns11;
using ns12;
using ns15;
using ns3;
using ns5;
using ns7;
using ns8;
using System;

namespace ns10
{
	internal sealed class Class39
	{
		internal delegate Enum14 Delegate5(Enum19 enum19_0);

		internal sealed class Class40
		{
			internal int int_0;

			internal int int_1;

			internal int int_2;

			internal int int_3;

			internal Enum15 enum15_0;

			internal static readonly Class39.Class40[] class40_0;

			private Class40(int int_4, int int_5, int int_6, int int_7, Enum15 enum15_1)
			{
				this.int_0 = int_4;
				this.int_1 = int_5;
				this.int_2 = int_6;
				this.int_3 = int_7;
				this.enum15_0 = enum15_1;
			}

			static Class40()
			{
				Class39.Class40.class40_0 = new Class39.Class40[]
				{
					new Class39.Class40(0, 0, 0, 0, Enum15.const_0),
					new Class39.Class40(4, 4, 8, 4, Enum15.const_1),
					new Class39.Class40(4, 5, 16, 8, Enum15.const_1),
					new Class39.Class40(4, 6, 32, 32, Enum15.const_1),
					new Class39.Class40(4, 4, 16, 16, Enum15.const_2),
					new Class39.Class40(8, 16, 32, 32, Enum15.const_2),
					new Class39.Class40(8, 16, 128, 128, Enum15.const_2),
					new Class39.Class40(8, 32, 128, 256, Enum15.const_2),
					new Class39.Class40(32, 128, 258, 1024, Enum15.const_2),
					new Class39.Class40(32, 258, 258, 4096, Enum15.const_2)
				};
			}
		}

		internal static readonly int int_0 = 9;

		internal static readonly int int_1 = 8;

		internal Class39.Delegate5 delegate5_0;

		internal static readonly string[] string_0 = new string[]
		{
			"need dictionary",
			"stream end",
			"",
			"file error",
			"stream error",
			"data error",
			"insufficient memory",
			"buffer error",
			"incompatible version",
			""
		};

		internal static readonly int int_2 = 32;

		internal static readonly int int_3 = 42;

		internal static readonly int int_4 = 113;

		internal static readonly int int_5 = 666;

		internal static readonly int int_6 = 8;

		internal static readonly int int_7 = 0;

		internal static readonly int int_8 = 1;

		internal static readonly int int_9 = 2;

		internal static readonly int int_10 = 0;

		internal static readonly int int_11 = 1;

		internal static readonly int int_12 = 2;

		internal static readonly int int_13 = 16;

		internal static readonly int int_14 = 3;

		internal static readonly int int_15 = 258;

		internal static readonly int int_16 = Class39.int_15 + Class39.int_14 + 1;

		private static readonly int int_17 = 2 * Class49.int_5 + 1;

		internal static readonly int int_18 = 256;

		internal GClass2 gclass2_0;

		internal int int_19;

		internal byte[] byte_0;

		internal int int_20;

		internal int int_21;

		internal sbyte sbyte_0;

		internal int int_22;

		internal int int_23;

		internal int int_24;

		internal int int_25;

		internal byte[] byte_1;

		internal int int_26;

		internal short[] short_0;

		internal short[] short_1;

		internal int int_27;

		internal int int_28;

		internal int int_29;

		internal int int_30;

		internal int int_31;

		internal int int_32;

		internal Class39.Class40 class40_0;

		internal int int_33;

		internal int int_34;

		internal int int_35;

		internal int int_36;

		internal int int_37;

		internal int int_38;

		internal int int_39;

		internal Enum20 enum20_0;

		internal Enum21 enum21_0;

		internal short[] short_2;

		internal short[] short_3;

		internal short[] short_4;

		internal Class47 class47_0 = new Class47();

		internal Class47 class47_1 = new Class47();

		internal Class47 class47_2 = new Class47();

		internal short[] short_5 = new short[Class49.int_0 + 1];

		internal int[] int_40 = new int[2 * Class49.int_5 + 1];

		internal int int_41;

		internal int int_42;

		internal sbyte[] sbyte_1 = new sbyte[2 * Class49.int_5 + 1];

		internal int int_43;

		internal int int_44;

		internal int int_45;

		internal int int_46;

		internal int int_47;

		internal int int_48;

		internal int int_49;

		internal int int_50;

		internal short short_6;

		internal int int_51;

		internal bool bool_0;

		internal bool bool_1 = true;

		internal Class39()
		{
			this.short_2 = new short[Class39.int_17 * 2];
			this.short_3 = new short[(2 * Class49.int_2 + 1) * 2];
			this.short_4 = new short[(2 * Class49.int_1 + 1) * 2];
		}

		internal Enum14 method_0(Enum19 enum19_0)
		{
			int num = 65535;
			if (65535 > this.byte_0.Length - 5)
			{
				num = this.byte_0.Length - 5;
			}
			while (true)
			{
				if (this.int_38 <= 1)
				{
					Class16.smethod_212(this);
					if (this.int_38 == 0 && enum19_0 == Enum19.const_0)
					{
						return Enum14.const_0;
					}
					if (this.int_38 == 0)
					{
						goto IL_E9;
					}
				}
				this.int_36 += this.int_38;
				this.int_38 = 0;
				int num2 = this.int_32 + num;
				if (this.int_36 == 0 || this.int_36 >= num2)
				{
					this.int_38 = this.int_36 - num2;
					this.int_36 = num2;
					Class16.smethod_637(this, false);
					if (this.gclass2_0.int_3 == 0)
					{
						return Enum14.const_0;
					}
				}
				if (this.int_36 - this.int_32 >= this.int_23 - Class39.int_16)
				{
					Class16.smethod_637(this, false);
					if (this.gclass2_0.int_3 == 0)
					{
						break;
					}
				}
			}
			return Enum14.const_0;
			IL_E9:
			Class16.smethod_637(this, enum19_0 == Enum19.const_4);
			if (this.gclass2_0.int_3 == 0)
			{
				if (enum19_0 != Enum19.const_4)
				{
					return Enum14.const_0;
				}
				return Enum14.const_2;
			}
			else
			{
				if (enum19_0 != Enum19.const_4)
				{
					return Enum14.const_1;
				}
				return Enum14.const_3;
			}
			return Enum14.const_0;
		}

		internal Enum14 method_1(Enum19 enum19_0)
		{
			int num = 0;
			while (true)
			{
				if (this.int_38 < Class39.int_16)
				{
					Class16.smethod_212(this);
					if (this.int_38 < Class39.int_16 && enum19_0 == Enum19.const_0)
					{
						return Enum14.const_0;
					}
					if (this.int_38 == 0)
					{
						goto IL_2F0;
					}
				}
				if (this.int_38 >= Class39.int_14)
				{
					this.int_27 = ((this.int_27 << this.int_31 ^ (int)(this.byte_1[this.int_36 + (Class39.int_14 - 1)] & 255)) & this.int_30);
					num = ((int)this.short_1[this.int_27] & 65535);
					this.short_0[this.int_36 & this.int_25] = this.short_1[this.int_27];
					this.short_1[this.int_27] = (short)this.int_36;
				}
				if ((long)num != 0L && (this.int_36 - num & 65535) <= this.int_23 - Class39.int_16 && this.enum21_0 != Enum21.const_2)
				{
					this.int_33 = Class16.smethod_576(this, num);
				}
				bool flag;
				if (this.int_33 >= Class39.int_14)
				{
					flag = Class16.smethod_50(this, this.int_36 - this.int_37, this.int_33 - Class39.int_14);
					this.int_38 -= this.int_33;
					if (this.int_33 <= this.class40_0.int_1 && this.int_38 >= Class39.int_14)
					{
						this.int_33--;
						do
						{
							this.int_36++;
							this.int_27 = ((this.int_27 << this.int_31 ^ (int)(this.byte_1[this.int_36 + (Class39.int_14 - 1)] & 255)) & this.int_30);
							num = ((int)this.short_1[this.int_27] & 65535);
							this.short_0[this.int_36 & this.int_25] = this.short_1[this.int_27];
							this.short_1[this.int_27] = (short)this.int_36;
						}
						while (--this.int_33 != 0);
						this.int_36++;
					}
					else
					{
						this.int_36 += this.int_33;
						this.int_33 = 0;
						this.int_27 = (int)(this.byte_1[this.int_36] & 255);
						this.int_27 = ((this.int_27 << this.int_31 ^ (int)(this.byte_1[this.int_36 + 1] & 255)) & this.int_30);
					}
				}
				else
				{
					flag = Class16.smethod_50(this, 0, (int)(this.byte_1[this.int_36] & 255));
					this.int_38--;
					this.int_36++;
				}
				if (flag)
				{
					Class16.smethod_637(this, false);
					if (this.gclass2_0.int_3 == 0)
					{
						break;
					}
				}
			}
			return Enum14.const_0;
			IL_2F0:
			Class16.smethod_637(this, enum19_0 == Enum19.const_4);
			if (this.gclass2_0.int_3 == 0)
			{
				if (enum19_0 == Enum19.const_4)
				{
					return Enum14.const_2;
				}
				return Enum14.const_0;
			}
			else
			{
				if (enum19_0 != Enum19.const_4)
				{
					return Enum14.const_1;
				}
				return Enum14.const_3;
			}
		}

		internal Enum14 method_2(Enum19 enum19_0)
		{
			int num = 0;
			while (true)
			{
				if (this.int_38 < Class39.int_16)
				{
					Class16.smethod_212(this);
					if (this.int_38 < Class39.int_16 && enum19_0 == Enum19.const_0)
					{
						return Enum14.const_0;
					}
					if (this.int_38 == 0)
					{
						goto IL_385;
					}
				}
				if (this.int_38 >= Class39.int_14)
				{
					this.int_27 = ((this.int_27 << this.int_31 ^ (int)(this.byte_1[this.int_36 + (Class39.int_14 - 1)] & 255)) & this.int_30);
					num = ((int)this.short_1[this.int_27] & 65535);
					this.short_0[this.int_36 & this.int_25] = this.short_1[this.int_27];
					this.short_1[this.int_27] = (short)this.int_36;
				}
				this.int_39 = this.int_33;
				this.int_34 = this.int_37;
				this.int_33 = Class39.int_14 - 1;
				if (num != 0 && this.int_39 < this.class40_0.int_1 && (this.int_36 - num & 65535) <= this.int_23 - Class39.int_16)
				{
					if (this.enum21_0 != Enum21.const_2)
					{
						this.int_33 = Class16.smethod_576(this, num);
					}
					if (this.int_33 <= 5 && (this.enum21_0 == Enum21.const_1 || (this.int_33 == Class39.int_14 && this.int_36 - this.int_37 > 4096)))
					{
						this.int_33 = Class39.int_14 - 1;
					}
				}
				if (this.int_39 >= Class39.int_14 && this.int_33 <= this.int_39)
				{
					int num2 = this.int_36 + this.int_38 - Class39.int_14;
					bool flag = Class16.smethod_50(this, this.int_36 - 1 - this.int_34, this.int_39 - Class39.int_14);
					this.int_38 -= this.int_39 - 1;
					this.int_39 -= 2;
					do
					{
						if (++this.int_36 <= num2)
						{
							this.int_27 = ((this.int_27 << this.int_31 ^ (int)(this.byte_1[this.int_36 + (Class39.int_14 - 1)] & 255)) & this.int_30);
							num = ((int)this.short_1[this.int_27] & 65535);
							this.short_0[this.int_36 & this.int_25] = this.short_1[this.int_27];
							this.short_1[this.int_27] = (short)this.int_36;
						}
					}
					while (--this.int_39 != 0);
					this.int_35 = 0;
					this.int_33 = Class39.int_14 - 1;
					this.int_36++;
					if (flag)
					{
						Class16.smethod_637(this, false);
						if (this.gclass2_0.int_3 == 0)
						{
							break;
						}
					}
				}
				else if (this.int_35 != 0)
				{
					if (Class16.smethod_50(this, 0, (int)(this.byte_1[this.int_36 - 1] & 255)))
					{
						Class16.smethod_637(this, false);
					}
					this.int_36++;
					this.int_38--;
					if (this.gclass2_0.int_3 == 0)
					{
						return Enum14.const_0;
					}
				}
				else
				{
					this.int_35 = 1;
					this.int_36++;
					this.int_38--;
				}
			}
			return Enum14.const_0;
			IL_385:
			if (this.int_35 != 0)
			{
				bool flag = Class16.smethod_50(this, 0, (int)(this.byte_1[this.int_36 - 1] & 255));
				this.int_35 = 0;
			}
			Class16.smethod_637(this, enum19_0 == Enum19.const_4);
			if (this.gclass2_0.int_3 == 0)
			{
				if (enum19_0 == Enum19.const_4)
				{
					return Enum14.const_2;
				}
				return Enum14.const_0;
			}
			else
			{
				if (enum19_0 != Enum19.const_4)
				{
					return Enum14.const_1;
				}
				return Enum14.const_3;
			}
		}
	}
}
