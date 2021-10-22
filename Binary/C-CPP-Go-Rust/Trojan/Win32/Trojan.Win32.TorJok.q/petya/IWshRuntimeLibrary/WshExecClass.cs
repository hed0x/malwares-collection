using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[ClassInterface(0), Guid("08FED191-BE19-11D3-A28B-00104BD35090")]
	[ComImport]
	public sealed class WshExecClass : IWshExec, WshExec
	{
		[ComAliasName("IWshRuntimeLibrary.WshExecStatus"), DispId(1)]
		public virtual extern WshExecStatus Status
		{
			[DispId(1)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: ComAliasName("IWshRuntimeLibrary.WshExecStatus")]
			get;
		}

		[DispId(3)]
		public virtual extern TextStream StdIn
		{
			[DispId(3)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.Interface)]
			get;
		}

		[DispId(4)]
		public virtual extern TextStream StdOut
		{
			[DispId(4)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.Interface)]
			get;
		}

		[DispId(5)]
		public virtual extern TextStream StdErr
		{
			[DispId(5)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.Interface)]
			get;
		}

		[DispId(6)]
		public virtual extern int ProcessID
		{
			[DispId(6)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			get;
		}

		[DispId(7)]
		public virtual extern int ExitCode
		{
			[DispId(7)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			get;
		}

		[MethodImpl(MethodImplOptions.InternalCall)]
		internal extern WshExecClass();

		[DispId(8)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern void Terminate();
	}
}
