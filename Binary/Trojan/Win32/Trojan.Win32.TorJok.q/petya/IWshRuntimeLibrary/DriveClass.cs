using System;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[DefaultMember("Path"), ClassInterface(0), Guid("C7C3F5B1-88A3-11D0-ABCB-00A0C90FFFC0")]
	[ComImport]
	public sealed class DriveClass : IDrive, Drive
	{
		[DispId(0)]
		public virtual extern string Path
		{
			[DispId(0)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[DispId(10000)]
		public virtual extern string DriveLetter
		{
			[DispId(10000)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[DispId(10001)]
		public virtual extern string ShareName
		{
			[DispId(10001)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[ComAliasName("IWshRuntimeLibrary.DriveTypeConst"), DispId(10002)]
		public virtual extern DriveTypeConst DriveType
		{
			[DispId(10002)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: ComAliasName("IWshRuntimeLibrary.DriveTypeConst")]
			get;
		}

		[DispId(10003)]
		public virtual extern Folder RootFolder
		{
			[DispId(10003)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.Interface)]
			get;
		}

		[DispId(10005)]
		public virtual extern object AvailableSpace
		{
			[DispId(10005)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.Struct)]
			get;
		}

		[DispId(10004)]
		public virtual extern object FreeSpace
		{
			[DispId(10004)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.Struct)]
			get;
		}

		[DispId(10006)]
		public virtual extern object TotalSize
		{
			[DispId(10006)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.Struct)]
			get;
		}

		[DispId(10007)]
		public virtual extern string VolumeName
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
		public virtual extern string FileSystem
		{
			[DispId(10008)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[DispId(10009)]
		public virtual extern int SerialNumber
		{
			[DispId(10009)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			get;
		}

		[DispId(10010)]
		public virtual extern bool IsReady
		{
			[DispId(10010)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			get;
		}

		[MethodImpl(MethodImplOptions.InternalCall)]
		internal extern DriveClass();
	}
}
