using System;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[DefaultMember("Path"), Guid("C7C3F5A4-88A3-11D0-ABCB-00A0C90FFFC0"), TypeLibType(4304)]
	[ComImport]
	public interface IFile
	{
		[DispId(0)]
		string Path
		{
			[DispId(0)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[DispId(1000)]
		string Name
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

		[DispId(1002)]
		string ShortPath
		{
			[DispId(1002)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[DispId(1001)]
		string ShortName
		{
			[DispId(1001)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[DispId(1004)]
		Drive Drive
		{
			[DispId(1004)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.Interface)]
			get;
		}

		[DispId(1005)]
		Folder ParentFolder
		{
			[DispId(1005)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.Interface)]
			get;
		}

		[ComAliasName("IWshRuntimeLibrary.FileAttribute"), DispId(1003)]
		FileAttribute Attributes
		{
			[DispId(1003)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: ComAliasName("IWshRuntimeLibrary.FileAttribute")]
			get;
			[DispId(1003)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[param: ComAliasName("IWshRuntimeLibrary.FileAttribute")]
			set;
		}

		[DispId(1006)]
		DateTime DateCreated
		{
			[DispId(1006)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			get;
		}

		[DispId(1007)]
		DateTime DateLastModified
		{
			[DispId(1007)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			get;
		}

		[DispId(1008)]
		DateTime DateLastAccessed
		{
			[DispId(1008)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			get;
		}

		[DispId(1009)]
		object Size
		{
			[DispId(1009)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.Struct)]
			get;
		}

		[DispId(1010)]
		string Type
		{
			[DispId(1010)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[DispId(1200)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		void Delete([In] bool Force = false);

		[DispId(1202)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		void Copy([MarshalAs(UnmanagedType.BStr)] [In] string Destination, [In] bool OverWriteFiles = true);

		[DispId(1204)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		void Move([MarshalAs(UnmanagedType.BStr)] [In] string Destination);

		[DispId(1100)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.Interface)]
		TextStream OpenAsTextStream([In] IOMode IOMode = IOMode.ForReading, [In] Tristate Format = Tristate.TristateFalse);
	}
}
