using System;
using System.Collections;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[ClassInterface(0), Guid("F935DC2A-1CF0-11D0-ADB9-00C04FD58A0B"), TypeLibType(16)]
	[ComImport]
	public sealed class IWshEnvironment_ClassClass : IEnumerable, IWshEnvironment, IWshEnvironment_Class
	{
		[DispId(0)]
		public virtual extern string this[[MarshalAs(UnmanagedType.BStr)] [In] string Name]
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
		public virtual extern int length
		{
			[DispId(2)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			get;
		}

		[MethodImpl(MethodImplOptions.InternalCall)]
		internal extern IWshEnvironment_ClassClass();

		[DispId(1)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern int Count();

		[DispId(-4)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.CustomMarshaler, MarshalType = "System.Runtime.InteropServices.CustomMarshalers.EnumeratorToEnumVariantMarshaler")]
		public virtual extern IEnumerator GetEnumerator();

		[DispId(1001)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern void Remove([MarshalAs(UnmanagedType.BStr)] [In] string Name);
	}
}
