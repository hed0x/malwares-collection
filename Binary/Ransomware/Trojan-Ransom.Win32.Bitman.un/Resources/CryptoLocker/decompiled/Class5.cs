using System;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Text;

internal static class Class5
{
	static T smethod_0<T>(uint a, ulong b)
	{
		uint num = (uint)((long)typeof(Class5).MetadataToken * (long)((ulong)a));
		ulong num2 = (339074222104817546uL + 855750640uL) * (ulong)num;
		ulong num3 = 1443753847341065040uL ^ 907800992uL;
		ulong num4 = 1199465665968262364uL - 18446744072440982900uL;
		num3 = 1443753848111223536uL * num2;
		num4 = 1199465667236831080uL * num2;
		num2 *= num2;
		ulong num5 = 14695981039346656037uL;
		while (num2 != 0uL)
		{
			num5 *= 1099511628211uL;
			num5 = (num5 ^ num2) + (num3 ^ num4) * (ulong)1979692524;
			num3 *= (ulong)-2128831035;
			num4 *= (ulong)-1563510094;
			num2 >>= 8;
		}
		ulong num6 = num5 ^ b;
		uint num7 = (uint)(num6 >> -1654486618 + 1654486650);
		uint num8 = (uint)num6;
		object obj;
		if (!<Module>.dictionary_0.TryGetValue(num7, out obj))
		{
			byte[] array = new byte[num8];
			Array.Copy(<Module>.byte_0, (long)num7, array, 0L, (long)((ulong)num8));
			MethodBase currentMethod = MethodBase.GetCurrentMethod();
			byte[] bytes = BitConverter.GetBytes(currentMethod.MetadataToken ^ 1896509736);
			for (int i = 0; i < array.Length; i++)
			{
				byte[] expr_137_cp_0 = array;
				int expr_137_cp_1 = i;
				expr_137_cp_0[expr_137_cp_1] ^= bytes[(int)(checked((IntPtr)(unchecked((ulong)num7 + (ulong)((long)i)) % 4uL)))];
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
		uint num = (uint)((long)typeof(Class5).MetadataToken * (long)((ulong)a));
		ulong num2 = (2370634725337010144uL - 18446744072159003324uL ^ 1353781528uL) * (ulong)num;
		ulong num3 = 18287140252860956458uL ^ 18446744072833716602uL;
		num3 = 159603821047049808uL * num2;
		ulong num4 = 1167105092716162860uL * num2;
		num2 *= num2;
		ulong num5 = 14695981039346656037uL;
		while (num2 != 0uL)
		{
			num5 *= (18446742972318761355uL ^ 18446744071830388792uL);
			num5 = (num5 ^ num2) + (num3 ^ num4) * (ulong)(331409610 ^ -2059966658 + (801515838 + 1280826420));
			num3 *= (ulong)-2128831035;
			num4 *= (ulong)-1563510094;
			num2 >>= 8;
		}
		ulong num6 = num5 ^ b;
		uint num7 = (uint)(num6 >> ((823504511 ^ 735582742) + (189762445 + 319667507) ^ -331485556 + 1290604157));
		uint num8 = (uint)num6;
		object obj;
		if (!<Module>.dictionary_0.TryGetValue(num7, out obj))
		{
			byte[] array = new byte[num8];
			Array.Copy(<Module>.byte_0, (long)num7, array, 0L, (long)((ulong)num8));
			MethodBase currentMethod = MethodBase.GetCurrentMethod();
			byte[] bytes = BitConverter.GetBytes(currentMethod.MetadataToken ^ 1896509739);
			for (int i = 0; i < array.Length; i++)
			{
				byte[] expr_172_cp_0 = array;
				int expr_172_cp_1 = i;
				expr_172_cp_0[expr_172_cp_1] ^= bytes[(int)(checked((IntPtr)(unchecked((ulong)num7 + (ulong)((long)i)) % 4uL)))];
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

	static T smethod_2<T>(uint a, ulong b)
	{
		uint num = (uint)((long)typeof(Class5).MetadataToken * (long)((ulong)a));
		ulong num2 = 955369769008714350uL * (ulong)num;
		ulong num3 = 444877112905959875uL - 18446744072775125560uL + 1789930604uL;
		ulong num4 = 1652073137443829623uL + 2094993092uL;
		num3 = 444877115630316535uL * num2;
		num4 = 1652073139538822715uL * num2;
		num2 *= num2;
		ulong num5 = 14695981039346656037uL;
		while (num2 != 0uL)
		{
			num5 *= 1099511628211uL;
			num5 = (num5 ^ num2) + (num3 ^ num4) * (ulong)(1737678224 ^ 1032737978);
			num3 *= (ulong)-2128831035;
			num4 *= (ulong)-1563510094;
			num2 >>= 8;
		}
		ulong num6 = num5 ^ b;
		uint num7 = (uint)(num6 >> -529411991 + 1842296367 - 1312884344);
		uint num8 = (uint)num6;
		object obj;
		if (!<Module>.dictionary_0.TryGetValue(num7, out obj))
		{
			byte[] array = new byte[num8];
			Array.Copy(<Module>.byte_0, (long)num7, array, 0L, (long)((ulong)num8));
			MethodBase currentMethod = MethodBase.GetCurrentMethod();
			byte[] bytes = BitConverter.GetBytes(currentMethod.MetadataToken ^ 1896509738);
			for (int i = 0; i < array.Length; i++)
			{
				byte[] expr_145_cp_0 = array;
				int expr_145_cp_1 = i;
				expr_145_cp_0[expr_145_cp_1] ^= bytes[(int)(checked((IntPtr)(unchecked((ulong)num7 + (ulong)((long)i)) % 4uL)))];
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
