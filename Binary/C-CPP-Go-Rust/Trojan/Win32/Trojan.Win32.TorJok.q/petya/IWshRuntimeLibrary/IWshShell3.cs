using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[Guid("41904400-BE18-11D3-A28B-00104BD35090"), TypeLibType(4160)]
	[ComImport]
	public interface IWshShell3 : IWshShell2
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

		[DispId(3013)]
		string CurrentDirectory
		{
			[DispId(3013)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
			[DispId(3013)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[param: MarshalAs(UnmanagedType.BStr)]
			set;
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

		[DispId(3000)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		bool LogEvent([MarshalAs(UnmanagedType.Struct)] [In] ref object Type, [MarshalAs(UnmanagedType.BStr)] [In] string Message, [MarshalAs(UnmanagedType.BStr)] [In] string Target = "");

		[DispId(3010)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		bool AppActivate([MarshalAs(UnmanagedType.Struct)] [In] ref object App, [MarshalAs(UnmanagedType.Struct)] [In] ref object Wait = null);

		[DispId(3011)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		void SendKeys([MarshalAs(UnmanagedType.BStr)] [In] string Keys, [MarshalAs(UnmanagedType.Struct)] [In] ref object Wait = null);

		[DispId(3012)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.Interface)]
		WshExec Exec([MarshalAs(UnmanagedType.BStr)] [In] string Command);
	}
}
