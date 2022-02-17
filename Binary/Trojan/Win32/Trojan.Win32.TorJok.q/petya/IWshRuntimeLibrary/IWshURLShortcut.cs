using System;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[DefaultMember("FullName"), Guid("F935DC2B-1CF0-11D0-ADB9-00C04FD58A0B"), TypeLibType(4160)]
	[ComImport]
	public interface IWshURLShortcut
	{
		[DispId(0)]
		string FullName
		{
			[DispId(0)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
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

		[DispId(2000), TypeLibFunc(64)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		void Load([MarshalAs(UnmanagedType.BStr)] [In] string PathLink);

		[DispId(2001)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		void Save();
	}
}
