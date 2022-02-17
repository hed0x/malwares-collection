using ns1;
using System;
using System.Reflection;
using System.Reflection.Emit;

namespace SmartAssembly.HouseOfCards
{
	public static class MemberRefsProxy
	{
		private static ModuleHandle moduleHandle_0;

		private static char[] char_0;

		[Attribute1]
		public static void CreateMemberRefsDelegates(int typeID)
		{
			Type typeFromHandle;
			try
			{
				typeFromHandle = Type.GetTypeFromHandle(MemberRefsProxy.moduleHandle_0.ResolveTypeHandle(33554433 + typeID));
			}
			catch
			{
				return;
			}
			FieldInfo[] fields = typeFromHandle.GetFields(BindingFlags.Static | BindingFlags.NonPublic | BindingFlags.GetField);
			int i = 0;
			IL_2F:
			while (i < fields.Length)
			{
				FieldInfo fieldInfo = fields[i];
				string name = fieldInfo.Name;
				bool flag = false;
				int num = 0;
				int j = name.Length - 1;
				IL_9B:
				while (j >= 0)
				{
					char c = name[j];
					if (c == '~')
					{
						flag = true;
						MethodInfo methodInfo;
						try
						{
							IL_A4:
							methodInfo = (MethodInfo)MethodBase.GetMethodFromHandle(MemberRefsProxy.moduleHandle_0.ResolveMethodHandle(num + 167772161));
						}
						catch
						{
							goto IL_207;
						}
						goto IL_CA;
						IL_207:
						i++;
						goto IL_2F;
						IL_CA:
						Delegate value;
						if (methodInfo.IsStatic)
						{
							try
							{
								value = Delegate.CreateDelegate(fieldInfo.FieldType, methodInfo);
								goto IL_1F9;
							}
							catch (Exception)
							{
								goto IL_207;
							}
						}
						ParameterInfo[] parameters = methodInfo.GetParameters();
						int num2 = parameters.Length + 1;
						Type[] array = new Type[num2];
						array[0] = typeof(object);
						for (int k = 1; k < num2; k++)
						{
							array[k] = parameters[k - 1].ParameterType;
						}
						DynamicMethod dynamicMethod = new DynamicMethod(string.Empty, methodInfo.ReturnType, array, typeFromHandle, true);
						ILGenerator iLGenerator = dynamicMethod.GetILGenerator();
						iLGenerator.Emit(OpCodes.Ldarg_0);
						if (num2 > 1)
						{
							iLGenerator.Emit(OpCodes.Ldarg_1);
						}
						if (num2 > 2)
						{
							iLGenerator.Emit(OpCodes.Ldarg_2);
						}
						if (num2 > 3)
						{
							iLGenerator.Emit(OpCodes.Ldarg_3);
						}
						if (num2 > 4)
						{
							for (int l = 4; l < num2; l++)
							{
								iLGenerator.Emit(OpCodes.Ldarg_S, l);
							}
						}
						iLGenerator.Emit(OpCodes.Tailcall);
						iLGenerator.Emit(flag ? OpCodes.Callvirt : OpCodes.Call, methodInfo);
						iLGenerator.Emit(OpCodes.Ret);
						try
						{
							value = dynamicMethod.CreateDelegate(typeFromHandle);
						}
						catch
						{
							goto IL_207;
						}
						try
						{
							IL_1F9:
							fieldInfo.SetValue(null, value);
						}
						catch
						{
						}
						goto IL_207;
					}
					for (int m = 0; m < 58; m++)
					{
						if (MemberRefsProxy.char_0[m] == c)
						{
							num = num * 58 + m;
							IL_95:
							j--;
							goto IL_9B;
						}
					}
					goto IL_95;
				}
				goto IL_A4;
			}
		}

		static MemberRefsProxy()
		{
			MemberRefsProxy.char_0 = new char[]
			{
				'\u0001',
				'\u0002',
				'\u0003',
				'\u0004',
				'\u0005',
				'\u0006',
				'\a',
				'\b',
				'\u000e',
				'\u000f',
				'\u0010',
				'\u0011',
				'\u0012',
				'\u0013',
				'\u0014',
				'\u0015',
				'\u0016',
				'\u0017',
				'\u0018',
				'\u0019',
				'\u001a',
				'\u001b',
				'\u001c',
				'\u001d',
				'\u001e',
				'\u001f',
				'\u007f',
				'\u0080',
				'\u0081',
				'\u0082',
				'\u0083',
				'\u0084',
				'\u0086',
				'\u0087',
				'\u0088',
				'\u0089',
				'\u008a',
				'\u008b',
				'\u008c',
				'\u008d',
				'\u008e',
				'\u008f',
				'\u0090',
				'\u0091',
				'\u0092',
				'\u0093',
				'\u0094',
				'\u0095',
				'\u0096',
				'\u0097',
				'\u0098',
				'\u0099',
				'\u009a',
				'\u009b',
				'\u009c',
				'\u009d',
				'\u009e',
				'\u009f'
			};
			Type typeFromHandle = typeof(MulticastDelegate);
			if (typeFromHandle != null)
			{
				MemberRefsProxy.moduleHandle_0 = Assembly.GetExecutingAssembly().GetModules()[0].ModuleHandle;
			}
		}
	}
}
