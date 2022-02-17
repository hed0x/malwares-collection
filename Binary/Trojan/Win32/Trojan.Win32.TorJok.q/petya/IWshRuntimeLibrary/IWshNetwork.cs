using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[Guid("F935DC25-1CF0-11D0-ADB9-00C04FD58A0B"), TypeLibType(4176)]
	[ComImport]
	public interface IWshNetwork
	{
		[DispId(1610743808)]
		string UserDomain
		{
			[DispId(1610743808)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[DispId(1610743809)]
		string UserName
		{
			[DispId(1610743809)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[DispId(1610743810)]
		string UserProfile
		{
			[DispId(1610743810), TypeLibFunc(64)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[DispId(1610743811)]
		string ComputerName
		{
			[DispId(1610743811)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[DispId(1610743812)]
		string Organization
		{
			[DispId(1610743812), TypeLibFunc(64)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[DispId(1610743813)]
		string Site
		{
			[DispId(1610743813), TypeLibFunc(64)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[DispId(1000)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		void MapNetworkDrive([MarshalAs(UnmanagedType.BStr)] [In] string LocalName, [MarshalAs(UnmanagedType.BStr)] [In] string RemoteName, [MarshalAs(UnmanagedType.Struct)] [In] ref object UpdateProfile = null, [MarshalAs(UnmanagedType.Struct)] [In] ref object UserName = null, [MarshalAs(UnmanagedType.Struct)] [In] ref object Password = null);

		[DispId(1001)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		void RemoveNetworkDrive([MarshalAs(UnmanagedType.BStr)] [In] string Name, [MarshalAs(UnmanagedType.Struct)] [In] ref object Force = null, [MarshalAs(UnmanagedType.Struct)] [In] ref object UpdateProfile = null);

		[DispId(1002)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.Interface)]
		IWshCollection EnumNetworkDrives();

		[DispId(2000)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		void AddPrinterConnection([MarshalAs(UnmanagedType.BStr)] [In] string LocalName, [MarshalAs(UnmanagedType.BStr)] [In] string RemoteName, [MarshalAs(UnmanagedType.Struct)] [In] ref object UpdateProfile = null, [MarshalAs(UnmanagedType.Struct)] [In] ref object UserName = null, [MarshalAs(UnmanagedType.Struct)] [In] ref object Password = null);

		[DispId(2001)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		void RemovePrinterConnection([MarshalAs(UnmanagedType.BStr)] [In] string Name, [MarshalAs(UnmanagedType.Struct)] [In] ref object Force = null, [MarshalAs(UnmanagedType.Struct)] [In] ref object UpdateProfile = null);

		[DispId(2002)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.Interface)]
		IWshCollection EnumPrinterConnections();

		[DispId(2003)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		void SetDefaultPrinter([MarshalAs(UnmanagedType.BStr)] [In] string Name);
	}
}
