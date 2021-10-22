using System;
using System.Collections;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[Guid("F935DC29-1CF0-11D0-ADB9-00C04FD58A0B"), TypeLibType(4160)]
	[ComImport]
	public interface IWshEnvironment : IEnumerable
	{
		[DispId(0)]
		string this[[MarshalAs(UnmanagedType.BStr)] [In] string Name]
		{
			[DispId(0)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
			[DispId(0)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[param: MarshalAs(UnmanagedType.BStr)]
			set;
		}

		[DispId(2)]
		int length
		{
			[DispId(2)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			get;
		}

		[DispId(1)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		int Count();

		[DispId(-4)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.CustomMarshaler, MarshalType = "System.Runtime.InteropServices.CustomMarshalers.EnumeratorToEnumVariantMarshaler")]
		IEnumerator GetEnumerator();

		[DispId(1001)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		void Remove([MarshalAs(UnmanagedType.BStr)] [In] string Name);
	}
}
