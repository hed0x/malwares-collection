using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[ClassInterface(0), Guid("F935DC26-1CF0-11D0-ADB9-00C04FD58A0B"), TypeLibType(18)]
	[ComImport]
	public sealed class IWshNetwork_ClassClass : IWshNetwork2, IWshNetwork_Class
	{
		[DispId(1610743808)]
		public virtual extern string UserDomain
		{
			[DispId(1610743808)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[DispId(1610743809)]
		public virtual extern string UserName
		{
			[DispId(1610743809)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[DispId(1610743810)]
		public virtual extern string UserProfile
		{
			[DispId(1610743810), TypeLibFunc(64)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[DispId(1610743811)]
		public virtual extern string ComputerName
		{
			[DispId(1610743811)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[DispId(1610743812)]
		public virtual extern string Organization
		{
			[DispId(1610743812), TypeLibFunc(64)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[DispId(1610743813)]
		public virtual extern string Site
		{
			[DispId(1610743813), TypeLibFunc(64)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[MethodImpl(MethodImplOptions.InternalCall)]
		public extern IWshNetwork_ClassClass();

		[DispId(1000)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern void MapNetworkDrive([MarshalAs(UnmanagedType.BStr)] [In] string LocalName, [MarshalAs(UnmanagedType.BStr)] [In] string RemoteName, [MarshalAs(UnmanagedType.Struct)] [In] ref object UpdateProfile = null, [MarshalAs(UnmanagedType.Struct)] [In] ref object UserName = null, [MarshalAs(UnmanagedType.Struct)] [In] ref object Password = null);

		[DispId(1001)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern void RemoveNetworkDrive([MarshalAs(UnmanagedType.BStr)] [In] string Name, [MarshalAs(UnmanagedType.Struct)] [In] ref object Force = null, [MarshalAs(UnmanagedType.Struct)] [In] ref object UpdateProfile = null);

		[DispId(1002)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.Interface)]
		public virtual extern IWshCollection EnumNetworkDrives();

		[DispId(2000)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern void AddPrinterConnection([MarshalAs(UnmanagedType.BStr)] [In] string LocalName, [MarshalAs(UnmanagedType.BStr)] [In] string RemoteName, [MarshalAs(UnmanagedType.Struct)] [In] ref object UpdateProfile = null, [MarshalAs(UnmanagedType.Struct)] [In] ref object UserName = null, [MarshalAs(UnmanagedType.Struct)] [In] ref object Password = null);

		[DispId(2001)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern void RemovePrinterConnection([MarshalAs(UnmanagedType.BStr)] [In] string Name, [MarshalAs(UnmanagedType.Struct)] [In] ref object Force = null, [MarshalAs(UnmanagedType.Struct)] [In] ref object UpdateProfile = null);

		[DispId(2002)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.Interface)]
		public virtual extern IWshCollection EnumPrinterConnections();

		[DispId(2003)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern void SetDefaultPrinter([MarshalAs(UnmanagedType.BStr)] [In] string Name);

		[DispId(2004)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern void AddWindowsPrinterConnection([MarshalAs(UnmanagedType.BStr)] [In] string PrinterName, [MarshalAs(UnmanagedType.BStr)] [In] string DriverName = "", [MarshalAs(UnmanagedType.BStr)] [In] string Port = "LPT1");
	}
}
