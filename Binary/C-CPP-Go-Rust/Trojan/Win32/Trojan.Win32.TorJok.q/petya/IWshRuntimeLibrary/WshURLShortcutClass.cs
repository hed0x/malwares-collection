using System;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[DefaultMember("FullName"), ClassInterface(0), Guid("50E13488-6F1E-4450-96B0-873755403955")]
	[ComImport]
	public sealed class WshURLShortcutClass : IWshURLShortcut, WshURLShortcut
	{
		[DispId(0)]
		public virtual extern string FullName
		{
			[DispId(0)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[DispId(1005)]
		public virtual extern string TargetPath
		{
			[DispId(1005)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
			[DispId(1005)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[param: MarshalAs(UnmanagedType.BStr)]
			set;
		}

		[MethodImpl(MethodImplOptions.InternalCall)]
		internal extern WshURLShortcutClass();

		[DispId(2000), TypeLibFunc(64)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern void Load([MarshalAs(UnmanagedType.BStr)] [In] string PathLink);

		[DispId(2001)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern void Save();
	}
}
