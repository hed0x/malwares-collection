using System;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Text;

internal static class Class3
{
	static T smethod_0<T>(uint a, ulong b)
	{
		uint num = (uint)((long)typeof(Class3).MetadataToken * (long)((ulong)a));
		ulong num2 = ((16739853636115156771uL ^ 18446744072204685584uL) + (18446744071868639474uL ^ 18446744072855483536uL)) * (ulong)num;
		ulong num3 = 922421070232253664uL * num2;
		ulong num4 = 2412863187070446356uL * num2;
		num2 *= num2;
		ulong num5 = 14695981039346656037uL;
		while (num2 != 0uL)
		{
			num5 *= 1099511628211uL;
			num5 = (num5 ^ num2) + (num3 ^ num4) * (ulong)(259893789 ^ -1824787532 - (1287168080 - 1192622889 + 2044955592));
			num3 *= (ulong)-2128831035;
			num4 *= (ulong)-1563510094;
			num2 >>= 8;
		}
		ulong num6 = num5 ^ b;
		uint num7 = (uint)(num6 >> -1972949523 + 1972949555);
		uint num8 = (uint)num6;
		object obj;
		if (!<Module>.dictionary_0.TryGetValue(num7, out obj))
		{
			byte[] array = new byte[num8];
			Array.Copy(<Module>.byte_0, (long)num7, array, 0L, (long)((ulong)num8));
			MethodBase currentMethod = MethodBase.GetCurrentMethod();
			byte[] bytes = BitConverter.GetBytes(currentMethod.MetadataToken ^ 1896509743);
			for (int i = 0; i < array.Length; i++)
			{
				byte[] expr_153_cp_0 = array;
				int expr_153_cp_1 = i;
				expr_153_cp_0[expr_153_cp_1] ^= bytes[(int)(checked((IntPtr)(unchecked((ulong)num7 + (ulong)((long)i)) % 4uL)))];
			}
			if (typeof(T) == typeof(string))
			{
				obj = Encoding.UTF8.GetString(array);
			}
			else
			{
				T[] array2 = new T[1];
				Buffer.BlockCopy(array, 0, array2, 0, Marshal.SizeOf(default(T)));
				obj = array2[0];
			}
			<Module>.dictionary_0[num7] = obj;
		}
		return (T)((object)obj);
	}

	static T smethod_1<T>(uint a, ulong b)
	{
		uint num = (uint)((long)typeof(Class3).MetadataToken * (long)((ulong)a));
		ulong num2 = (2392827598014423246uL - (18446744071890499512uL ^ 18446744072802835702uL)) * (ulong)num;
		ulong num3 = 105071933386819930uL ^ 401076932uL;
		num3 = 105071933741431710uL * num2;
		ulong num4 = 3675884757248313740uL * num2;
		num2 *= num2;
		ulong num5 = 14695981039346656037uL;
		while (num2 != 0uL)
		{
			num5 *= 1100062178413uL - 550550202uL;
			num5 = (num5 ^ num2) + (num3 ^ num4) * (ulong)2111972738;
			num3 *= (ulong)-2128831035;
			num4 *= (ulong)-1563510094;
			num2 >>= 8;
		}
		ulong num6 = num5 ^ b;
		uint num7 = (uint)(num6 >> (1828390279 ^ (646407446 ^ 606425138 ^ 187666334 ^ 1702280989)));
		uint num8 = (uint)num6;
		object obj;
		if (!<Module>.dictionary_0.TryGetValue(num7, out obj))
		{
			byte[] array = new byte[num8];
			Array.Copy(<Module>.byte_0, (long)num7, array, 0L, (long)((ulong)num8));
			MethodBase currentMethod = MethodBase.GetCurrentMethod();
			byte[] bytes = BitConverter.GetBytes(currentMethod.MetadataToken ^ 1896509742);
			for (int i = 0; i < array.Length; i++)
			{
				byte[] expr_154_cp_0 = array;
				int expr_154_cp_1 = i;
				expr_154_cp_0[expr_154_cp_1] ^= bytes[(int)(checked((IntPtr)(unchecked((ulong)num7 + (ulong)((long)i)) % 4uL)))];
			}
			if (typeof(T) == typeof(string))
			{
				obj = Encoding.UTF8.GetString(array);
			}
			else
			{
				T[] array2 = new T[1];
				Buffer.BlockCopy(array, 0, array2, 0, Marshal.SizeOf(default(T)));
				obj = array2[0];
			}
			<Module>.dictionary_0[num7] = obj;
		}
		return (T)((object)obj);
	}
}
