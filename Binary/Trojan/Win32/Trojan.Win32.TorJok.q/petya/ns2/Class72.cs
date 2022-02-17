using System;
using System.Diagnostics;
using System.Reflection;

namespace ns2
{
	internal sealed class Class72
	{
		private static Assembly assembly_0 = null;

		private static string[] string_0 = new string[0];

		internal static void smethod_0()
		{
			try
			{
				AppDomain.CurrentDomain.ResourceResolve += new ResolveEventHandler(Class72.smethod_1);
			}
			catch (Exception)
			{
			}
		}

		private static Assembly smethod_1(object object_0, ResolveEventArgs resolveEventArgs_0)
		{
			if (Class72.assembly_0 == null)
			{
				lock (Class72.string_0)
				{
					Class72.assembly_0 = Assembly.Load("{475e9724-c092-48bc-bb57-8c8eed5a6593}, PublicKeyToken=3e56350693f7355e");
					if (Class72.assembly_0 != null)
					{
						Class72.string_0 = Class72.assembly_0.GetManifestResourceNames();
					}
				}
			}
			string name = resolveEventArgs_0.Name;
			int i = 0;
			while (i < Class72.string_0.Length)
			{
				if (!(Class72.string_0[i] == name))
				{
					i++;
				}
				else
				{
					if (!Class72.smethod_2())
					{
						return null;
					}
					return Class72.assembly_0;
				}
			}
			return null;
		}

		private static bool smethod_2()
		{
			bool result;
			try
			{
				StackFrame[] frames = new StackTrace().GetFrames();
				for (int i = 2; i < frames.Length; i++)
				{
					StackFrame stackFrame = frames[i];
					if (stackFrame.GetMethod().Module.Assembly == Assembly.GetExecutingAssembly())
					{
						result = true;
						return result;
					}
				}
				result = false;
			}
			catch
			{
				result = true;
			}
			return result;
		}
	}
}
