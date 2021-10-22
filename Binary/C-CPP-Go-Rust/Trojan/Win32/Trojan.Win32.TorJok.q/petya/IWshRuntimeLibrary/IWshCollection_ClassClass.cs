using System;
using System.Collections;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[DefaultMember("Item"), ClassInterface(0), Guid("F935DC28-1CF0-11D0-ADB9-00C04FD58A0B"), TypeLibType(16)]
	[ComImport]
	public sealed class IWshCollection_ClassClass : IEnumerable, IWshCollection, IWshCollection_Class
	{
		[DispId(2)]
		public virtual extern int length
		{
			[DispId(2)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			get;
		}

		[MethodImpl(MethodImplOptions.InternalCall)]
		internal extern IWshCollection_ClassClass();

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
