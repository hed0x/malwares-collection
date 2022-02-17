using System;
using System.Collections;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[DefaultMember("Item"), Guid("F935DC27-1CF0-11D0-ADB9-00C04FD58A0B"), TypeLibType(4160)]
	[ComImport]
	public interface IWshCollection : IEnumerable
	{
		[DispId(2)]
		int length
		{
			[DispId(2)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			get;
		}

		[DispId(0)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.Struct)]
		object Item([MarshalAs(UnmanagedType.Struct)] [In] ref object Index);

		[DispId(1)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		int Count();

		[DispId(-4)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.CustomMarshaler, MarshalType = "System.Runtime.InteropServices.CustomMarshalers.EnumeratorToEnumVariantMarshaler")]
		IEnumerator GetEnumerator();
	}
}
