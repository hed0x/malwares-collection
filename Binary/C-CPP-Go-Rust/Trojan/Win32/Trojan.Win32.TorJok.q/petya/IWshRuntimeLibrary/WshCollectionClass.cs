using System;
using System.Collections;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[DefaultMember("Item"), ClassInterface(0), Guid("387DAFF4-DA03-44D2-B0D1-80C927C905AC")]
	[ComImport]
	public sealed class WshCollectionClass : IEnumerable, IWshCollection, WshCollection
	{
		[DispId(2)]
		public virtual extern int length
		{
			[DispId(2)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			get;
		}

		[MethodImpl(MethodImplOptions.InternalCall)]
		internal extern WshCollectionClass();

		[DispId(0)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.Struct)]
		public virtual extern object Item([MarshalAs(UnmanagedType.Struct)] [In] ref object Index);

		[DispId(1)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern int Count();

		[DispId(-4)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.CustomMarshaler, MarshalType = "System.Runtime.InteropServices.CustomMarshalers.EnumeratorToEnumVariantMarshaler")]
		public virtual extern IEnumerator GetEnumerator();
	}
}
