using System;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[DefaultMember("FullName"), Guid("F935DC23-1CF0-11D0-ADB9-00C04FD58A0B"), TypeLibType(4160)]
	[ComImport]
	public interface IWshShortcut
	{
		[DispId(0)]
		string FullName
		{
			[DispId(0)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[DispId(1000)]
		string Arguments
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
		string Description
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
		string Hotkey
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
		string IconLocation
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
		string RelativePath
		{
			[DispId(1004)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[param: MarshalAs(UnmanagedType.BStr)]
			set;
		}

		[DispId(1005)]
		string TargetPath
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
		int WindowStyle
		{
			[DispId(1006)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			get;
			[DispId(1006)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			set;
		}

		[DispId(1007)]
		string WorkingDirectory
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

		[DispId(2000), TypeLibFunc(64)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		void Load([MarshalAs(UnmanagedType.BStr)] [In] string PathLink);

		[DispId(2001)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		void Save();
	}
}
