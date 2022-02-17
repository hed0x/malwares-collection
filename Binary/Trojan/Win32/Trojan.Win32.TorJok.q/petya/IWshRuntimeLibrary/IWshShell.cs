using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[Guid("F935DC21-1CF0-11D0-ADB9-00C04FD58A0B"), TypeLibType(4176)]
	[ComImport]
	public interface IWshShell
	{
		[DispId(100)]
		IWshCollection SpecialFolders
		{
			[DispId(100)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.Interface)]
			get;
		}

		[DispId(200)]
		IWshEnvironment Environment
		{
			[DispId(200)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.Interface)]
			get;
		}

		[DispId(1000)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		int Run([MarshalAs(UnmanagedType.BStr)] [In] string Command, [MarshalAs(UnmanagedType.Struct)] [In] ref object WindowStyle = null, [MarshalAs(UnmanagedType.Struct)] [In] ref object WaitOnReturn = null);

		[DispId(1001)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		int Popup([MarshalAs(UnmanagedType.BStr)] [In] string Text, [MarshalAs(UnmanagedType.Struct)] [In] ref object SecondsToWait = null, [MarshalAs(UnmanagedType.Struct)] [In] ref object Title = null, [MarshalAs(UnmanagedType.Struct)] [In] ref object Type = null);

		[DispId(1002)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.IDispatch)]
		object CreateShortcut([MarshalAs(UnmanagedType.BStr)] [In] string PathLink);

		[DispId(1006)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.BStr)]
		string ExpandEnvironmentStrings([MarshalAs(UnmanagedType.BStr)] [In] string Src);

		[DispId(2000)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.Struct)]
		object RegRead([MarshalAs(UnmanagedType.BStr)] [In] string Name);

		[DispId(2001)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		void RegWrite([MarshalAs(UnmanagedType.BStr)] [In] string Name, [MarshalAs(UnmanagedType.Struct)] [In] ref object Value, [MarshalAs(UnmanagedType.Struct)] [In] ref object Type = null);

		[DispId(2002)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		void RegDelete([MarshalAs(UnmanagedType.BStr)] [In] string Name);
	}
}
