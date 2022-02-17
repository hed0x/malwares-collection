using System;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[DefaultMember("Path"), Guid("C7C3F5A0-88A3-11D0-ABCB-00A0C90FFFC0"), TypeLibType(4304)]
	[ComImport]
	public interface IDrive
	{
		[DispId(0)]
		string Path
		{
			[DispId(0)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[DispId(10000)]
		string DriveLetter
		{
			[DispId(10000)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[DispId(10001)]
		string ShareName
		{
			[DispId(10001)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[ComAliasName("IWshRuntimeLibrary.DriveTypeConst"), DispId(10002)]
		DriveTypeConst DriveType
		{
			[DispId(10002)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: ComAliasName("IWshRuntimeLibrary.DriveTypeConst")]
			get;
		}

		[DispId(10003)]
		Folder RootFolder
		{
			[DispId(10003)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.Interface)]
			get;
		}

		[DispId(10005)]
		object AvailableSpace
		{
			[DispId(10005)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.Struct)]
			get;
		}

		[DispId(10004)]
		object FreeSpace
		{
			[DispId(10004)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.Struct)]
			get;
		}

		[DispId(10006)]
		object TotalSize
		{
			[DispId(10006)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.Struct)]
			get;
		}

		[DispId(10007)]
		string VolumeName
		{
			[DispId(10007)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
			[DispId(10007)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[param: MarshalAs(UnmanagedType.BStr)]
			set;
		}

		[DispId(10008)]
		string FileSystem
		{
			[DispId(10008)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[DispId(10009)]
		int SerialNumber
		{
			[DispId(10009)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			get;
		}

		[DispId(10010)]
		bool IsReady
		{
			[DispId(10010)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			get;
		}
	}
}
