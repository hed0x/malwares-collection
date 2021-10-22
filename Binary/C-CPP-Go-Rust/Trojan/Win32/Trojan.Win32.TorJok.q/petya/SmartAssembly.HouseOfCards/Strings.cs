using ns1;
using ns4;
using SmartAssembly.Delegates;
using System;
using System.Reflection;
using System.Reflection.Emit;

namespace SmartAssembly.HouseOfCards
{
	public static class Strings
	{
		[Attribute1]
		public static void CreateGetStringDelegate(Type ownerType)
		{
			FieldInfo[] fields = ownerType.GetFields(BindingFlags.Static | BindingFlags.NonPublic | BindingFlags.GetField);
			for (int i = 0; i < fields.Length; i++)
			{
				FieldInfo fieldInfo = fields[i];
				try
				{
					if (fieldInfo.FieldType == typeof(GetString))
					{
						DynamicMethod dynamicMethod = new DynamicMethod(string.Empty, typeof(string), new Type[]
						{
							typeof(int)
						}, ownerType.Module, true);
						ILGenerator iLGenerator = dynamicMethod.GetILGenerator();
						iLGenerator.Emit(OpCodes.Ldarg_0);
						MethodInfo[] methods = typeof(Class73).GetMethods(BindingFlags.Static | BindingFlags.Public);
						for (int j = 0; j < methods.Length; j++)
						{
							MethodInfo methodInfo = methods[j];
							if (methodInfo.ReturnType == typeof(string))
							{
								iLGenerator.Emit(OpCodes.Ldc_I4, fieldInfo.MetadataToken & 16777215);
								iLGenerator.Emit(OpCodes.Sub);
								iLGenerator.Emit(OpCodes.Call, methodInfo);
								IL_EC:
								iLGenerator.Emit(OpCodes.Ret);
								fieldInfo.SetValue(null, dynamicMethod.CreateDelegate(typeof(GetString)));
								return;
							}
						}
						goto IL_EC;
					}
				}
				catch
				{
				}
			}
		}
	}
}
