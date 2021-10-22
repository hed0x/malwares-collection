using Ionic;
using ns0;
using ns10;
using ns11;
using ns12;
using ns5;
using ns6;
using ns7;
using ns8;
using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;

namespace ns2
{
	internal sealed class Class17
	{
		private enum Enum4
		{
			const_0,
			const_1,
			const_2,
			const_3,
			const_4
		}

		internal static class Class18
		{
			public static readonly string string_0 = "(?<=(?:[^']*'[^']*')*'[^']*)";

			public static readonly string string_1 = "(?=[^']*'(?:[^']*'[^']*')*[^']*$)";

			public static readonly string string_2 = "(?<=(?:[^']*'[^']*')*[^']*)";

			public static readonly string string_3 = "(?=(?:[^']*'[^']*')*[^']*$)";
		}

		internal Class9 class9_0;

		[CompilerGenerated]
		private bool bool_0;

		public Class17(string string_0, bool bool_1)
		{
			if (!string.IsNullOrEmpty(string_0))
			{
				this.class9_0 = Class17.smethod_0(string_0);
			}
			this.method_1(bool_1);
		}

		[CompilerGenerated]
		public bool method_0()
		{
			return this.bool_0;
		}

		[CompilerGenerated]
		public void method_1(bool bool_1)
		{
			this.bool_0 = bool_1;
		}

		private static Class9 smethod_0(string string_0)
		{
			if (string_0 == null)
			{
				return null;
			}
			string_0 = Class16.smethod_568(string_0);
			if (string_0.IndexOf(" ") == -1)
			{
				string_0 = "name = " + string_0;
			}
			string[] array = string_0.Trim().Split(new char[]
			{
				' ',
				'\t'
			});
			if (array.Length < 3)
			{
				throw new ArgumentException(string_0);
			}
			Class9 @class = null;
			Stack<Class17.Enum4> stack = new Stack<Class17.Enum4>();
			Stack<Class9> stack2 = new Stack<Class9>();
			stack.Push(Class17.Enum4.const_0);
			int i = 0;
			while (i < array.Length)
			{
				string text = array[i].ToLower();
				string key;
				if ((key = text) != null)
				{
					if (Class52.dictionary_0 == null)
					{
						Class52.dictionary_0 = new Dictionary<string, int>(16)
						{
							{
								"and",
								0
							},
							{
								"xor",
								1
							},
							{
								"or",
								2
							},
							{
								"(",
								3
							},
							{
								")",
								4
							},
							{
								"atime",
								5
							},
							{
								"ctime",
								6
							},
							{
								"mtime",
								7
							},
							{
								"length",
								8
							},
							{
								"size",
								9
							},
							{
								"filename",
								10
							},
							{
								"name",
								11
							},
							{
								"attrs",
								12
							},
							{
								"attributes",
								13
							},
							{
								"type",
								14
							},
							{
								"",
								15
							}
						};
					}
					int num;
					if (Class52.dictionary_0.TryGetValue(key, out num))
					{
						Class17.Enum4 @enum;
						switch (num)
						{
						case 0:
						case 1:
						case 2:
						{
							@enum = stack.Peek();
							if (@enum != Class17.Enum4.const_2)
							{
								throw new ArgumentException(string.Join(" ", array, i, array.Length - i));
							}
							if (array.Length <= i + 3)
							{
								throw new ArgumentException(string.Join(" ", array, i, array.Length - i));
							}
							LogicalConjunction logicalConjunction_ = (LogicalConjunction)Enum.Parse(typeof(LogicalConjunction), array[i].ToUpper(), true);
							Class15 class2 = new Class15();
							class2.class9_0 = @class;
							Class16.smethod_452(class2, null);
							class2.logicalConjunction_0 = logicalConjunction_;
							@class = class2;
							stack.Push(@enum);
							stack.Push(Class17.Enum4.const_3);
							stack2.Push(@class);
							break;
						}
						case 3:
							@enum = stack.Peek();
							if (@enum != Class17.Enum4.const_0 && @enum != Class17.Enum4.const_3 && @enum != Class17.Enum4.const_1)
							{
								throw new ArgumentException(string.Join(" ", array, i, array.Length - i));
							}
							if (array.Length <= i + 4)
							{
								throw new ArgumentException(string.Join(" ", array, i, array.Length - i));
							}
							stack.Push(Class17.Enum4.const_1);
							break;
						case 4:
							@enum = stack.Pop();
							if (stack.Peek() != Class17.Enum4.const_1)
							{
								throw new ArgumentException(string.Join(" ", array, i, array.Length - i));
							}
							stack.Pop();
							stack.Push(Class17.Enum4.const_2);
							break;
						case 5:
						case 6:
						case 7:
						{
							if (array.Length <= i + 2)
							{
								throw new ArgumentException(string.Join(" ", array, i, array.Length - i));
							}
							DateTime dateTime;
							try
							{
								dateTime = DateTime.ParseExact(array[i + 2], "yyyy-MM-dd-HH:mm:ss", null);
								goto IL_6D3;
							}
							catch (FormatException)
							{
								try
								{
									dateTime = DateTime.ParseExact(array[i + 2], "yyyy/MM/dd-HH:mm:ss", null);
								}
								catch (FormatException)
								{
									try
									{
										dateTime = DateTime.ParseExact(array[i + 2], "yyyy/MM/dd", null);
									}
									catch (FormatException)
									{
										try
										{
											dateTime = DateTime.ParseExact(array[i + 2], "MM/dd/yyyy", null);
										}
										catch (FormatException)
										{
											dateTime = DateTime.ParseExact(array[i + 2], "yyyy-MM-dd", null);
										}
									}
								}
								goto IL_6D3;
							}
							goto IL_332;
							IL_6D3:
							dateTime = DateTime.SpecifyKind(dateTime, DateTimeKind.Local).ToUniversalTime();
							@class = new Class11
							{
								whichTime_0 = (WhichTime)Enum.Parse(typeof(WhichTime), array[i], true),
								comparisonOperator_0 = (ComparisonOperator)Class16.smethod_422(typeof(ComparisonOperator), array[i + 1]),
								dateTime_0 = dateTime
							};
							i += 2;
							stack.Push(Class17.Enum4.const_2);
							break;
						}
						case 8:
						case 9:
							goto IL_332;
						case 10:
						case 11:
						{
							if (array.Length <= i + 2)
							{
								throw new ArgumentException(string.Join(" ", array, i, array.Length - i));
							}
							ComparisonOperator comparisonOperator = (ComparisonOperator)Class16.smethod_422(typeof(ComparisonOperator), array[i + 1]);
							if (comparisonOperator != ComparisonOperator.NotEqualTo && comparisonOperator != ComparisonOperator.EqualTo)
							{
								throw new ArgumentException(string.Join(" ", array, i, array.Length - i));
							}
							string text2 = array[i + 2];
							if (text2.StartsWith("'") && text2.EndsWith("'"))
							{
								text2 = text2.Substring(1, text2.Length - 2).Replace("\u0006", " ");
							}
							Class12 class3 = new Class12();
							class3.vmethod_2(text2);
							class3.comparisonOperator_0 = comparisonOperator;
							@class = class3;
							i += 2;
							stack.Push(Class17.Enum4.const_2);
							break;
						}
						case 12:
						case 13:
						case 14:
						{
							if (array.Length <= i + 2)
							{
								throw new ArgumentException(string.Join(" ", array, i, array.Length - i));
							}
							ComparisonOperator comparisonOperator2 = (ComparisonOperator)Class16.smethod_422(typeof(ComparisonOperator), array[i + 1]);
							if (comparisonOperator2 != ComparisonOperator.NotEqualTo && comparisonOperator2 != ComparisonOperator.EqualTo)
							{
								throw new ArgumentException(string.Join(" ", array, i, array.Length - i));
							}
							Class9 arg_63D_0;
							if (!(text == "type"))
							{
								Class14 class4 = new Class14();
								Class16.smethod_359(array[i + 2], class4);
								class4.comparisonOperator_0 = comparisonOperator2;
								arg_63D_0 = class4;
							}
							else
							{
								Class13 class5 = new Class13();
								Class16.smethod_329(array[i + 2], class5);
								class5.comparisonOperator_0 = comparisonOperator2;
								arg_63D_0 = class5;
							}
							@class = arg_63D_0;
							i += 2;
							stack.Push(Class17.Enum4.const_2);
							break;
						}
						case 15:
							stack.Push(Class17.Enum4.const_4);
							break;
						default:
							goto IL_86B;
						}
						IL_656:
						@enum = stack.Peek();
						if (@enum == Class17.Enum4.const_2)
						{
							stack.Pop();
							if (stack.Peek() == Class17.Enum4.const_3)
							{
								while (stack.Peek() == Class17.Enum4.const_3)
								{
									Class15 class6 = stack2.Pop() as Class15;
									Class16.smethod_452(class6, @class);
									@class = class6;
									stack.Pop();
									@enum = stack.Pop();
									if (@enum != Class17.Enum4.const_2)
									{
										throw new ArgumentException("??");
									}
								}
							}
							else
							{
								stack.Push(Class17.Enum4.const_2);
							}
						}
						if (@enum == Class17.Enum4.const_4)
						{
							stack.Pop();
						}
						i++;
						continue;
						IL_332:
						if (array.Length > i + 2)
						{
							string text3 = array[i + 2];
							long long_;
							if (text3.ToUpper().EndsWith("K"))
							{
								long_ = long.Parse(text3.Substring(0, text3.Length - 1)) * 1024L;
							}
							else if (text3.ToUpper().EndsWith("KB"))
							{
								long_ = long.Parse(text3.Substring(0, text3.Length - 2)) * 1024L;
							}
							else if (text3.ToUpper().EndsWith("M"))
							{
								long_ = long.Parse(text3.Substring(0, text3.Length - 1)) * 1024L * 1024L;
							}
							else if (text3.ToUpper().EndsWith("MB"))
							{
								long_ = long.Parse(text3.Substring(0, text3.Length - 2)) * 1024L * 1024L;
							}
							else if (text3.ToUpper().EndsWith("G"))
							{
								long_ = long.Parse(text3.Substring(0, text3.Length - 1)) * 1024L * 1024L * 1024L;
							}
							else if (text3.ToUpper().EndsWith("GB"))
							{
								long_ = long.Parse(text3.Substring(0, text3.Length - 2)) * 1024L * 1024L * 1024L;
							}
							else
							{
								long_ = long.Parse(array[i + 2]);
							}
							@class = new Class10
							{
								long_0 = long_,
								comparisonOperator_0 = (ComparisonOperator)Class16.smethod_422(typeof(ComparisonOperator), array[i + 1])
							};
							i += 2;
							stack.Push(Class17.Enum4.const_2);
							goto IL_656;
						}
						throw new ArgumentException(string.Join(" ", array, i, array.Length - i));
					}
				}
				IL_86B:
				throw new ArgumentException("'" + array[i] + "'");
			}
			return @class;
		}

		public override string ToString()
		{
			return "FileSelector(" + this.class9_0.ToString() + ")";
		}
	}
}
