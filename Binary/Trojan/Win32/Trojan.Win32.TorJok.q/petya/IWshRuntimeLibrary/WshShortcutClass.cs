using System;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[DefaultMember("FullName"), ClassInterface(0), Guid("A548B8E4-51D5-4661-8824-DAA1D893DFB2")]
	[ComImport]
	public sealed class WshShortcutClass : IWshShortcut, WshShortcut
	{
		[DispId(0)]
		public virtual extern string FullName
		{
			[DispId(0)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[DispId(1000)]
		public virtual extern string Arguments
		{
			[DispId(1000)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
			[DispId(1000)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[param: MarshalAs(UnmanagedType.BStr)]
			set;
		}

		[DispId(1001)]
		public virtual extern string Description
		{
			[DispId(1001)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
			[DispId(1001)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[param: MarshalAs(UnmanagedType.BStr)]
			set;
		}

		[DispId(1002)]
		public virtual extern string Hotkey
		{
			[DispId(1002)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
			[DispId(1002)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[param: MarshalAs(UnmanagedType.BStr)]
			set;
		}

		[DispId(1003)]
		public virtual extern string IconLocation
		{
			[DispId(1003)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
			[DispId(1003)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[param: MarshalAs(UnmanagedType.BStr)]
			set;
		}

		[DispId(1004)]
		public virtual extern string RelativePath
		{
			[DispId(1004)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[param: MarshalAs(UnmanagedType.BStr)]
			set;
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

		[DispId(1006)]
		public virtual extern int WindowStyle
		{
			[DispId(1006)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			get;
			[DispId(1006)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			set;
		}

		[DispId(1007)]
		public virtual extern string WorkingDirectory
		{
			[DispId(1007)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
			[DispId(1007)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[param: MarshalAs(UnmanagedType.BStr)]
			set;
		}

		[MethodImpl(MethodImplOptions.InternalCall)]
		internal extern WshShortcutClass();

		[DispId(2000), TypeLibFunc(64)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern void Load([MarshalAs(UnmanagedType.BStr)] [In] string PathLink);

		[DispId(2001)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern void Save();
	}
}
