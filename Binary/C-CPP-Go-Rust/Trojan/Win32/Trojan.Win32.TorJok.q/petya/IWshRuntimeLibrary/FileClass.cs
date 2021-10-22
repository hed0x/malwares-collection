using System;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[DefaultMember("Path"), ClassInterface(0), Guid("C7C3F5B5-88A3-11D0-ABCB-00A0C90FFFC0")]
	[ComImport]
	public sealed class FileClass : IFile, File
	{
		[DispId(0)]
		public virtual extern string Path
		{
			[DispId(0)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[DispId(1000)]
		public virtual extern string Name
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
		public virtual extern string ShortPath
		{
			[DispId(1002)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[DispId(1001)]
		public virtual extern string ShortName
		{
			[DispId(1001)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[DispId(1004)]
		public virtual extern Drive Drive
		{
			[DispId(1004)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.Interface)]
			get;
		}

		[DispId(1005)]
		public virtual extern Folder ParentFolder
		{
			[DispId(1005)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.Interface)]
			get;
		}

		[ComAliasName("IWshRuntimeLibrary.FileAttribute"), DispId(1003)]
		public virtual extern FileAttribute Attributes
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
		public virtual extern DateTime DateCreated
		{
			[DispId(1006)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			get;
		}

		[DispId(1007)]
		public virtual extern DateTime DateLastModified
		{
			[DispId(1007)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			get;
		}

		[DispId(1008)]
		public virtual extern DateTime DateLastAccessed
		{
			[DispId(1008)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			get;
		}

		[DispId(1009)]
		public virtual extern object Size
		{
			[DispId(1009)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.Struct)]
			get;
		}

		[DispId(1010)]
		public virtual extern string Type
		{
			[DispId(1010)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[MethodImpl(MethodImplOptions.InternalCall)]
		internal extern FileClass();

		[DispId(1200)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern void Delete([In] bool Force = false);

		[DispId(1202)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern void Copy([MarshalAs(UnmanagedType.BStr)] [In] string Destination, [In] bool OverWriteFiles = true);

		[DispId(1204)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern void Move([MarshalAs(UnmanagedType.BStr)] [In] string Destination);

		[DispId(1100)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.Interface)]
		public virtual extern TextStream OpenAsTextStream([In] IOMode IOMode = IOMode.ForReading, [In] Tristate Format = Tristate.TristateFalse);
	}
}
