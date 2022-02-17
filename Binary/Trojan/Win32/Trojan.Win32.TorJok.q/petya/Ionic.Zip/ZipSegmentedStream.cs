using ns12;
using System;
using System.IO;
using System.Runtime.CompilerServices;

namespace Ionic.Zip
{
	internal sealed class ZipSegmentedStream : Stream
	{
		internal enum RwMode
		{
			None,
			ReadOnly,
			Write
		}

		internal ZipSegmentedStream.RwMode rwMode_0;

		internal bool bool_0;

		internal string string_0;

		internal string string_1;

		internal string string_2;

		internal string string_3;

		internal uint uint_0;

		internal uint uint_1;

		internal int int_0;

		internal Stream stream_0;

		[CompilerGenerated]
		private bool bool_1;

		public override bool CanRead
		{
			get
			{
				return this.rwMode_0 == ZipSegmentedStream.RwMode.ReadOnly && this.stream_0 != null && this.stream_0.CanRead;
			}
		}

		public override bool CanSeek
		{
			get
			{
				return this.stream_0 != null && this.stream_0.CanSeek;
			}
		}

		public override bool CanWrite
		{
			get
			{
				return this.rwMode_0 == ZipSegmentedStream.RwMode.Write && this.stream_0 != null && this.stream_0.CanWrite;
			}
		}

		public override long Length
		{
			get
			{
				return this.stream_0.Length;
			}
		}

		public override long Position
		{
			get
			{
				return this.stream_0.Position;
			}
			set
			{
				this.stream_0.Position = value;
			}
		}

		internal ZipSegmentedStream()
		{
			this.bool_0 = false;
		}

		[CompilerGenerated]
		public bool method_0()
		{
			return this.bool_1;
		}

		[CompilerGenerated]
		public void method_1(bool bool_2)
		{
			this.bool_1 = bool_2;
		}

		public override string ToString()
		{
			return string.Format("{0}[{1}][{2}], pos=0x{3:X})", new object[]
			{
				"ZipSegmentedStream",
				Class16.smethod_455(this),
				this.rwMode_0.ToString(),
				this.Position
			});
		}

		public override int Read(byte[] buffer, int offset, int count)
		{
			if (this.rwMode_0 != ZipSegmentedStream.RwMode.ReadOnly)
			{
				this.bool_0 = true;
				throw new InvalidOperationException("Stream Error: Cannot Read.");
			}
			int num = this.stream_0.Read(buffer, offset, count);
			int num2 = num;
			while (num2 != count)
			{
				if (this.stream_0.Position != this.stream_0.Length)
				{
					this.bool_0 = true;
					throw new ZipException(string.Format("Read error in file {0}", Class16.smethod_455(this)));
				}
				if (this.uint_0 + 1u == this.uint_1)
				{
					return num;
				}
				Class16.smethod_472(this, this.uint_0 + 1u);
				Class16.smethod_38(this);
				offset += num2;
				count -= num2;
				num2 = this.stream_0.Read(buffer, offset, count);
				num += num2;
			}
			return num;
		}

		public override void Write(byte[] buffer, int offset, int count)
		{
			if (this.rwMode_0 != ZipSegmentedStream.RwMode.Write)
			{
				this.bool_0 = true;
				throw new InvalidOperationException("Stream Error: Cannot Write.");
			}
			if (this.method_0())
			{
				if (this.stream_0.Position + (long)count > (long)this.int_0)
				{
					Class16.smethod_8(this, 1u);
				}
			}
			else
			{
				while (this.stream_0.Position + (long)count > (long)this.int_0)
				{
					int num = this.int_0 - (int)this.stream_0.Position;
					this.stream_0.Write(buffer, offset, num);
					Class16.smethod_8(this, 1u);
					count -= num;
					offset += num;
				}
			}
			this.stream_0.Write(buffer, offset, count);
		}

		public override void Flush()
		{
			this.stream_0.Flush();
		}

		public override long Seek(long offset, SeekOrigin origin)
		{
			return this.stream_0.Seek(offset, origin);
		}

		public override void SetLength(long value)
		{
			if (this.rwMode_0 != ZipSegmentedStream.RwMode.Write)
			{
				this.bool_0 = true;
				throw new InvalidOperationException();
			}
			this.stream_0.SetLength(value);
		}

		protected override void Dispose(bool disposing)
		{
			try
			{
				if (this.stream_0 != null)
				{
					this.stream_0.Dispose();
					if (this.rwMode_0 == ZipSegmentedStream.RwMode.Write)
					{
					}
				}
			}
			finally
			{
				base.Dispose(disposing);
			}
		}
	}
}
