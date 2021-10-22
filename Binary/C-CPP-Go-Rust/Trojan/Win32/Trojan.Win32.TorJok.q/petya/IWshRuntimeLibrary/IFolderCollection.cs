using System;
using System.Collections;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[Guid("C7C3F5A3-88A3-11D0-ABCB-00A0C90FFFC0"), TypeLibType(4304)]
	[ComImport]
	public interface IFolderCollection : IEnumerable
	{
		[DispId(0)]
		Folder this[[MarshalAs(UnmanagedType.Struct)] [In] object Key]
		{
			[DispId(0)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.Interface)]
			get;
		}

		[DispId(1)]
		int Count
		{
			[DispId(1)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			get;
		}

		[DispId(2)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.Interface)]
		Folder Add([MarshalAs(UnmanagedType.BStr)] [In] string Name);

		[DispId(-4), TypeLibFunc(65)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.CustomMarshaler, MarshalType = "System.Runtime.InteropServices.CustomMarshalers.EnumeratorToEnumVariantMarshaler")]
		IEnumerator GetEnumerator();
	}
}
