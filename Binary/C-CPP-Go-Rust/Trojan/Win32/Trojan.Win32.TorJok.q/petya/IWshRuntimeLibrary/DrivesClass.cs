using System;
using System.Collections;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[ClassInterface(0), Guid("C7C3F5B2-88A3-11D0-ABCB-00A0C90FFFC0")]
	[ComImport]
	public sealed class DrivesClass : IEnumerable, IDriveCollection, Drives
	{
		[DispId(0)]
		public virtual extern Drive this[[MarshalAs(UnmanagedType.Struct)] [In] object Key]
		{
			[DispId(0)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.Interface)]
			get;
		}

		[DispId(1)]
		public virtual extern int Count
		{
			[DispId(1)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			get;
		}

		[MethodImpl(MethodImplOptions.InternalCall)]
		internal extern DrivesClass();

		[DispId(-4), TypeLibFunc(65)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.CustomMarshaler, MarshalType = "System.Runtime.InteropServices.CustomMarshalers.EnumeratorToEnumVariantMarshaler")]
		public virtual extern IEnumerator GetEnumerator();
	}
}
