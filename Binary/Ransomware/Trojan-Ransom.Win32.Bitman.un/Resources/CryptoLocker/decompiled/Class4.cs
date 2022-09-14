using System;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Text;

internal static class Class4
{
	static T smethod_0<T>(uint a, ulong b)
	{
		uint num = (uint)((long)typeof(Class4).MetadataToken * (long)((ulong)a));
		ulong num2 = 150743373599548932uL * (ulong)num;
		ulong num3 = 3638814639193074868uL - 18446744073648054575uL + 18446744072053541202uL + 18446744072945445175uL - 18446744073540632880uL;
		ulong num4 = (18430813105594666618uL ^ 18446744073260461306uL) - 18446744072586010394uL + 932756914uL;
		num3 = 3638814637003373790uL * num2;
		num4 = 15930970276331800uL * num2;
		num2 *= num2;
		ulong num5 = 14695981039346656037uL;
		while (num2 != 0uL)
		{
			num5 *= (1100244949808uL ^ (1657838365uL ^ 2135134646uL ^ 908496936uL));
			num5 = (num5 ^ num2) + (num3 ^ num4) * (ulong)(-1388857861 + 1508195737);
			num3 *= (ulong)-2128831035;
			num4 *= (ulong)-1563510094;
			num2 >>= 8;
		}
		ulong num6 = num5 ^ b;
		uint num7 = (uint)(num6 >> 32);
		uint num8 = (uint)num6;
		object obj;
		if (!<Module>.dictionary_0.TryGetValue(num7, out obj))
		{
			byte[] array = new byte[num8];
			Array.Copy(<Module>.byte_0, (long)num7, array, 0L, (long)((ulong)num8));
			MethodBase currentMethod = MethodBase.GetCurrentMethod();
			byte[] bytes = BitConverter.GetBytes(currentMethod.MetadataToken ^ 1896509737);
			for (int i = 0; i < array.Length; i++)
			{
				byte[] expr_17A_cp_0 = array;
				int expr_17A_cp_1 = i;
				expr_17A_cp_0[expr_17A_cp_1] ^= bytes[(int)(checked((IntPtr)(unchecked((ulong)num7 + (ulong)((long)i)) % 4uL)))];
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
