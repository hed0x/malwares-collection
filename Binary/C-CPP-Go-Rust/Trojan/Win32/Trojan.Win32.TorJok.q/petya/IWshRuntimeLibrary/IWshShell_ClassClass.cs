using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[ClassInterface(0), Guid("F935DC22-1CF0-11D0-ADB9-00C04FD58A0B"), TypeLibType(18)]
	[ComImport]
	public sealed class IWshShell_ClassClass : IWshShell3, IWshShell_Class
	{
		[DispId(100)]
		public virtual extern IWshCollection SpecialFolders
		{
			[DispId(100)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.Interface)]
			get;
		}

		[DispId(200)]
		public virtual extern IWshEnvironment Environment
		{
			[DispId(200)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.Interface)]
			get;
		}

		[DispId(3013)]
		public virtual extern string CurrentDirectory
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

		[MethodImpl(MethodImplOptions.InternalCall)]
		public extern IWshShell_ClassClass();

		[DispId(1000)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern int Run([MarshalAs(UnmanagedType.BStr)] [In] string Command, [MarshalAs(UnmanagedType.Struct)] [In] ref object WindowStyle = null, [MarshalAs(UnmanagedType.Struct)] [In] ref object WaitOnReturn = null);

		[DispId(1001)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern int Popup([MarshalAs(UnmanagedType.BStr)] [In] string Text, [MarshalAs(UnmanagedType.Struct)] [In] ref object SecondsToWait = null, [MarshalAs(UnmanagedType.Struct)] [In] ref object Title = null, [MarshalAs(UnmanagedType.Struct)] [In] ref object Type = null);

		[DispId(1002)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.IDispatch)]
		public virtual extern object CreateShortcut([MarshalAs(UnmanagedType.BStr)] [In] string PathLink);

		[DispId(1006)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.BStr)]
		public virtual extern string ExpandEnvironmentStrings([MarshalAs(UnmanagedType.BStr)] [In] string Src);

		[DispId(2000)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.Struct)]
		public virtual extern object RegRead([MarshalAs(UnmanagedType.BStr)] [In] string Name);

		[DispId(2001)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern void RegWrite([MarshalAs(UnmanagedType.BStr)] [In] string Name, [MarshalAs(UnmanagedType.Struct)] [In] ref object Value, [MarshalAs(UnmanagedType.Struct)] [In] ref object Type = null);

		[DispId(2002)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern void RegDelete([MarshalAs(UnmanagedType.BStr)] [In] string Name);

		[DispId(3000)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern bool LogEvent([MarshalAs(UnmanagedType.Struct)] [In] ref object Type, [MarshalAs(UnmanagedType.BStr)] [In] string Message, [MarshalAs(UnmanagedType.BStr)] [In] string Target = "");

		[DispId(3010)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern bool AppActivate([MarshalAs(UnmanagedType.Struct)] [In] ref object App, [MarshalAs(UnmanagedType.Struct)] [In] ref object Wait = null);

		[DispId(3011)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern void SendKeys([MarshalAs(UnmanagedType.BStr)] [In] string Keys, [MarshalAs(UnmanagedType.Struct)] [In] ref object Wait = null);

		[DispId(3012)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.Interface)]
		public virtual extern WshExec Exec([MarshalAs(UnmanagedType.BStr)] [In] string Command);
	}
}
