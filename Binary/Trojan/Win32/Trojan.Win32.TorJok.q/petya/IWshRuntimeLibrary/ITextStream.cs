using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[Guid("53BAD8C1-E718-11CF-893D-00A0C9054228"), TypeLibType(4304)]
	[ComImport]
	public interface ITextStream
	{
		[DispId(10000)]
		int Line
		{
			[DispId(10000)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			get;
		}

		[DispId(-529)]
		int Column
		{
			[DispId(-529)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			get;
		}

		[DispId(10002)]
		bool AtEndOfStream
		{
			[DispId(10002)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			get;
		}

		[DispId(10003)]
		bool AtEndOfLine
		{
			[DispId(10003)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			get;
		}

		[DispId(10004)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.BStr)]
		string Read([In] int Characters);

		[DispId(10005)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.BStr)]
		string ReadLine();

		[DispId(10006)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.BStr)]
		string ReadAll();

		[DispId(10007)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		void Write([MarshalAs(UnmanagedType.BStr)] [In] string Text);

		[DispId(10008)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		void WriteLine([MarshalAs(UnmanagedType.BStr)] [In] string Text = "");

		[DispId(10009)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		void WriteBlankLines([In] int Lines);

		[DispId(10010)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		void Skip([In] int Characters);

		[DispId(10011)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		void SkipLine();

		[DispId(10012)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		void Close();
	}
}
