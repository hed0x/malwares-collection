using System;
using System.Collections;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[ClassInterface(0), Guid("F48229AF-E28C-42B5-BB92-E114E62BDD54")]
	[ComImport]
	public sealed class WshEnvironmentClass : IEnumerable, IWshEnvironment, WshEnvironment
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
		internal extern WshEnvironmentClass();

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
