using System;
using System.Runtime.InteropServices;

internal static class Class7
{
	[DllImport("kernel32.dll")]
	private unsafe static extern bool VirtualProtect(byte* lpAddress, int dwSize, uint flNewProtect, out uint lpflOldProtect);

	public unsafe static void smethod_0()
	{
		byte* ptr = (byte*)((void*)Marshal.GetHINSTANCE(typeof(Class7).Module));
		byte* ptr2 = ptr + 60;
		ptr2 = ptr + *(uint*)ptr2;
		ptr2 += 6;
		ushort num = *(ushort*)ptr2;
		ptr2 += 14;
		ushort num2 = *(ushort*)ptr2;
		ptr2 = ptr2 + 4 + num2;
		byte* ptr3 = stackalloc byte[11];
		if (typeof(Class7).Module.FullyQualifiedName != "<Unknown>")
		{
			byte* ptr4 = ptr + *(uint*)(ptr2 - 16);
			uint num3;
			if (*(uint*)(ptr2 - 120) != 0u)
			{
				byte* ptr5 = ptr + *(uint*)(ptr2 - 120);
				byte* ptr6 = ptr + *(uint*)ptr5;
				byte* ptr7 = ptr + *(uint*)(ptr5 + 12);
				byte* ptr8 = ptr + *(uint*)ptr6 + 2;
				Class7.VirtualProtect(ptr7, 11, 64u, out num3);
				*(int*)ptr3 = 1818522734;
				*(int*)(ptr3 + 4) = 1818504812;
				*(short*)(ptr3 + 8) = 108;
				ptr3[10] = 0;
				for (int i = 0; i < 11; i++)
				{
					ptr7[i] = ptr3[i];
				}
				Class7.VirtualProtect(ptr8, 11, 64u, out num3);
				*(int*)ptr3 = 1866691662;
				*(int*)(ptr3 + 4) = 1852404846;
				*(short*)(ptr3 + 8) = 25973;
				ptr3[10] = 0;
				for (int j = 0; j < 11; j++)
				{
					ptr8[j] = ptr3[j];
				}
			}
			for (int k = 0; k < (int)num; k++)
			{
				Class7.VirtualProtect(ptr2, 8, 64u, out num3);
				Marshal.Copy(new byte[8], 0, (IntPtr)((void*)ptr2), 8);
				ptr2 += 40;
			}
			Class7.VirtualProtect(ptr4, 72, 64u, out num3);
			byte* ptr9 = ptr + *(uint*)(ptr4 + 8);
			*(int*)ptr4 = 0;
			*(int*)(ptr4 + 4) = 0;
			*(int*)(ptr4 + 8) = 0;
			*(int*)(ptr4 + 12) = 0;
			Class7.VirtualProtect(ptr9, 4, 64u, out num3);
			*(int*)ptr9 = 0;
			ptr9 += 12;
			ptr9 += *(uint*)ptr9;
			ptr9 = (ptr9 + 7u & -4L);
			ptr9 += 2;
			ushort num4 = (ushort)(*ptr9);
			ptr9 += 2;
			int l = 0;
			IL_28F:
			while (l < (int)num4)
			{
				Class7.VirtualProtect(ptr9, 8, 64u, out num3);
				*(int*)ptr9 = 0;
				ptr9 += 4;
				*(int*)ptr9 = 0;
				ptr9 += 4;
				int m = 0;
				while (m < 8)
				{
					Class7.VirtualProtect(ptr9, 4, 64u, out num3);
					*ptr9 = 0;
					ptr9++;
					if (*ptr9 != 0)
					{
						*ptr9 = 0;
						ptr9++;
						if (*ptr9 != 0)
						{
							*ptr9 = 0;
							ptr9++;
							if (*ptr9 != 0)
							{
								*ptr9 = 0;
								ptr9++;
								m++;
								continue;
							}
							ptr9++;
						}
						else
						{
							ptr9 += 2;
						}
					}
					else
					{
						ptr9 += 3;
					}
					IL_289:
					l++;
					goto IL_28F;
				}
				goto IL_289;
			}
			return;
		}
		uint num5 = *(uint*)(ptr2 - 16);
		uint num6 = *(uint*)(ptr2 - 120);
		uint[] array = new uint[(int)num];
		uint[] array2 = new uint[(int)num];
		uint[] array3 = new uint[(int)num];
		for (int n = 0; n < (int)num; n++)
		{
			uint num3;
			Class7.VirtualProtect(ptr2, 8, 64u, out num3);
			Marshal.Copy(new byte[8], 0, (IntPtr)((void*)ptr2), 8);
			array[n] = *(uint*)(ptr2 + 12);
			array2[n] = *(uint*)(ptr2 + 8);
			array3[n] = *(uint*)(ptr2 + 20);
			ptr2 += 40;
		}
		if (num6 != 0u)
		{
			for (int num7 = 0; num7 < (int)num; num7++)
			{
				if (array[num7] < num6 && num6 < array[num7] + array2[num7])
				{
					num6 = num6 - array[num7] + array3[num7];
					IL_357:
					byte* ptr10 = ptr + num6;
					uint num8 = *(uint*)ptr10;
					for (int num9 = 0; num9 < (int)num; num9++)
					{
						if (array[num9] < num8 && num8 < array[num9] + array2[num9])
						{
							num8 = num8 - array[num9] + array3[num9];
							IL_39C:
							byte* ptr11 = ptr + num8;
							uint num10 = *(uint*)(ptr10 + 12);
							for (int num11 = 0; num11 < (int)num; num11++)
							{
								if (array[num11] < num10 && num10 < array[num11] + array2[num11])
								{
									num10 = num10 - array[num11] + array3[num11];
									IL_3E5:
									uint num12 = *(uint*)ptr11 + 2u;
									for (int num13 = 0; num13 < (int)num; num13++)
									{
										if (array[num13] < num12 && num12 < array[num13] + array2[num13])
										{
											num12 = num12 - array[num13] + array3[num13];
											IL_426:
											uint num3;
											Class7.VirtualProtect(ptr + num10, 11, 64u, out num3);
											*(int*)ptr3 = 1818522734;
											*(int*)(ptr3 + 4) = 1818504812;
											*(short*)(ptr3 + 8) = 108;
											ptr3[10] = 0;
											for (int num14 = 0; num14 < 11; num14++)
											{
												(ptr + num10)[num14] = ptr3[num14];
											}
											Class7.VirtualProtect(ptr + num12, 11, 64u, out num3);
											*(int*)ptr3 = 1866691662;
											*(int*)(ptr3 + 4) = 1852404846;
											*(short*)(ptr3 + 8) = 25973;
											ptr3[10] = 0;
											for (int num15 = 0; num15 < 11; num15++)
											{
												(ptr + num12)[num15] = ptr3[num15];
											}
											goto IL_4CD;
										}
									}
									goto IL_426;
								}
							}
							goto IL_3E5;
						}
					}
					goto IL_39C;
				}
			}
			goto IL_357;
		}
		IL_4CD:
		for (int num16 = 0; num16 < (int)num; num16++)
		{
			if (array[num16] < num5 && num5 < array[num16] + array2[num16])
			{
				num5 = num5 - array[num16] + array3[num16];
				IL_507:
				byte* ptr12 = ptr + num5;
				uint num3;
				Class7.VirtualProtect(ptr12, 72, 64u, out num3);
				uint num17 = *(uint*)(ptr12 + 8);
				for (int num18 = 0; num18 < (int)num; num18++)
				{
					if (array[num18] < num17 && num17 < array[num18] + array2[num18])
					{
						num17 = num17 - array[num18] + array3[num18];
						IL_55D:
						*(int*)ptr12 = 0;
						*(int*)(ptr12 + 4) = 0;
						*(int*)(ptr12 + 8) = 0;
						*(int*)(ptr12 + 12) = 0;
						byte* ptr13 = ptr + num17;
						Class7.VirtualProtect(ptr13, 4, 64u, out num3);
						*(int*)ptr13 = 0;
						ptr13 += 12;
						ptr13 += *(uint*)ptr13;
						ptr13 = (ptr13 + 7u & -4L);
						ptr13 += 2;
						ushort num19 = (ushort)(*ptr13);
						ptr13 += 2;
						int num20 = 0;
						IL_662:
						while (num20 < (int)num19)
						{
							Class7.VirtualProtect(ptr13, 8, 64u, out num3);
							*(int*)ptr13 = 0;
							ptr13 += 4;
							*(int*)ptr13 = 0;
							ptr13 += 4;
							int num21 = 0;
							while (num21 < 8)
							{
								Class7.VirtualProtect(ptr13, 4, 64u, out num3);
								*ptr13 = 0;
								ptr13++;
								if (*ptr13 != 0)
								{
									*ptr13 = 0;
									ptr13++;
									if (*ptr13 != 0)
									{
										*ptr13 = 0;
										ptr13++;
										if (*ptr13 != 0)
										{
											*ptr13 = 0;
											ptr13++;
											num21++;
											continue;
										}
										ptr13++;
									}
									else
									{
										ptr13 += 2;
									}
								}
								else
								{
									ptr13 += 3;
								}
								IL_65C:
								num20++;
								goto IL_662;
							}
							goto IL_65C;
						}
						return;
					}
				}
				goto IL_55D;
			}
		}
		goto IL_507;
	}
}
