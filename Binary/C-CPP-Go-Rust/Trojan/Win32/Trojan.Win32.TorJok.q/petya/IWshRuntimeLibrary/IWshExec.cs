using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[Guid("08FED190-BE19-11D3-A28B-00104BD35090"), TypeLibType(4160)]
	[ComImport]
	public interface IWshExec
	{
		[ComAliasName("IWshRuntimeLibrary.WshExecStatus"), DispId(1)]
		WshExecStatus Status
		{
			[DispId(1)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: ComAliasName("IWshRuntimeLibrary.WshExecStatus")]
			get;
		}

		[DispId(3)]
		TextStream StdIn
		{
			[DispId(3)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.Interface)]
			get;
		}

		[DispId(4)]
		TextStream StdOut
		{
			[DispId(4)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.Interface)]
			get;
		}

		[DispId(5)]
		TextStream StdErr
		{
			[DispId(5)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.Interface)]
			get;
		}

		[DispId(6)]
		int ProcessID
		{
			[DispId(6)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			get;
		}

		[DispId(7)]
		int ExitCode
		{
			[DispId(7)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			get;
		}

		[DispId(8)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		void Terminate();
	}
}
