using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[ClassInterface(0), Guid("0BB02EC0-EF49-11CF-8940-00A0C9054228")]
	[ComImport]
	public sealed class TextStreamClass : ITextStream, TextStream
	{
		[DispId(10000)]
		public virtual extern int Line
		{
			[DispId(10000)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			get;
		}

		[DispId(-529)]
		public virtual extern int Column
		{
			[DispId(-529)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			get;
		}

		[DispId(10002)]
		public virtual extern bool AtEndOfStream
		{
			[DispId(10002)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			get;
		}

		[DispId(10003)]
		public virtual extern bool AtEndOfLine
		{
			[DispId(10003)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			get;
		}

		[MethodImpl(MethodImplOptions.InternalCall)]
		internal extern TextStreamClass();

		[DispId(10004)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.BStr)]
		public virtual extern string Read([In] int Characters);

		[DispId(10005)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.BStr)]
		public virtual extern string ReadLine();

		[DispId(10006)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.BStr)]
		public virtual extern string ReadAll();

		[DispId(10007)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern void Write([MarshalAs(UnmanagedType.BStr)] [In] string Text);

		[DispId(10008)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern void WriteLine([MarshalAs(UnmanagedType.BStr)] [In] string Text = "");

		[DispId(10009)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern void WriteBlankLines([In] int Lines);

		[DispId(10010)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern void Skip([In] int Characters);

		[DispId(10011)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern void SkipLine();

		[DispId(10012)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern void Close();
	}
}
