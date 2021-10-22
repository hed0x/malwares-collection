using ns0;
using ns12;
using ns7;
using System;
using System.IO;

namespace ns6
{
	internal sealed class Stream6 : Stream
	{
		internal enum Enum11
		{
			const_0,
			const_1,
			const_2,
			const_3,
			const_4,
			const_5,
			const_6,
			const_7
		}

		internal sealed class Class35
		{
			public readonly bool[] bool_0 = new bool[256];

			public readonly byte[] byte_0 = new byte[256];

			public readonly byte[] byte_1 = new byte[Class36.int_8];

			public readonly byte[] byte_2 = new byte[Class36.int_8];

			public readonly int[] int_0;

			public readonly int[][] int_1;

			public readonly int[][] int_2;

			public readonly int[][] int_3;

			public readonly int[] int_4;

			public readonly int[] int_5;

			public readonly byte[] byte_3;

			public readonly char[][] char_0;

			public readonly byte[] byte_4;

			public int[] int_6;

			public byte[] byte_5;

			public Class35(int int_7)
			{
				this.int_0 = new int[256];
				this.int_1 = Class36.smethod_0<int>(Class36.int_5, Class36.int_3);
				this.int_2 = Class36.smethod_0<int>(Class36.int_5, Class36.int_3);
				this.int_3 = Class36.smethod_0<int>(Class36.int_5, Class36.int_3);
				this.int_4 = new int[Class36.int_5];
				this.int_5 = new int[257];
				this.byte_3 = new byte[256];
				this.char_0 = Class36.smethod_0<char>(Class36.int_5, Class36.int_3);
				this.byte_4 = new byte[Class36.int_5];
				this.byte_5 = new byte[int_7 * Class36.int_0];
			}
		}

		private bool bool_0;

		private bool bool_1;

		private long long_0;

		internal int int_0;

		internal int int_1;

		internal int int_2;

		internal bool bool_2;

		internal int int_3;

		internal int int_4;

		internal readonly GClass3 gclass3_0 = new GClass3(true);

		internal int int_5;

		internal Stream stream_0;

		internal int int_6 = -1;

		internal Stream6.Enum11 enum11_0 = Stream6.Enum11.const_1;

		internal uint uint_0;

		internal uint uint_1;

		internal uint uint_2;

		internal uint uint_3;

		internal int int_7;

		internal int int_8;

		internal int int_9;

		internal int int_10;

		internal int int_11;

		internal int int_12;

		internal int int_13;

		internal int int_14;

		internal char char_0;

		internal Stream6.Class35 class35_0;

		public override bool CanRead
		{
			get
			{
				if (this.bool_0)
				{
					throw new ObjectDisposedException("BZip2Stream");
				}
				return this.stream_0.CanRead;
			}
		}

		public override bool CanSeek
		{
			get
			{
				return false;
			}
		}

		public override bool CanWrite
		{
			get
			{
				if (this.bool_0)
				{
					throw new ObjectDisposedException("BZip2Stream");
				}
				return this.stream_0.CanWrite;
			}
		}

		public override long Length
		{
			get
			{
				throw new NotImplementedException();
			}
		}

		public override long Position
		{
			get
			{
				return this.long_0;
			}
			set
			{
				throw new NotImplementedException();
			}
		}

		public Stream6(Stream stream_1, bool bool_3)
		{
			this.stream_0 = stream_1;
			this.bool_1 = bool_3;
			Class16.smethod_243(this);
		}

		public override int Read(byte[] buffer, int offset, int count)
		{
			if (offset < 0)
			{
				throw new IndexOutOfRangeException(string.Format("offset ({0}) must be > 0", offset));
			}
			if (count < 0)
			{
				throw new IndexOutOfRangeException(string.Format("count ({0}) must be > 0", count));
			}
			if (offset + count > buffer.Length)
			{
				throw new IndexOutOfRangeException(string.Format("offset({0}) count({1}) bLength({2})", offset, count, buffer.Length));
			}
			if (this.stream_0 == null)
			{
				throw new IOException("the stream is not open");
			}
			int num = offset + count;
			int num2 = offset;
			int num3;
			while (num2 < num && (num3 = this.ReadByte()) >= 0)
			{
				buffer[num2++] = (byte)num3;
			}
			if (num2 != offset)
			{
				return num2 - offset;
			}
			return -1;
		}

		public override int ReadByte()
		{
			int result = this.int_6;
			this.long_0 += 1L;
			switch (this.enum11_0)
			{
			case Stream6.Enum11.const_0:
				return -1;
			case Stream6.Enum11.const_1:
				throw new IOException("bad state");
			case Stream6.Enum11.const_2:
				throw new IOException("bad state");
			case Stream6.Enum11.const_3:
				Class16.smethod_570(this);
				break;
			case Stream6.Enum11.const_4:
				Class16.smethod_486(this);
				break;
			case Stream6.Enum11.const_5:
				throw new IOException("bad state");
			case Stream6.Enum11.const_6:
				Class16.smethod_245(this);
				break;
			case Stream6.Enum11.const_7:
				Class16.smethod_252(this);
				break;
			default:
				throw new IOException("bad state");
			}
			return result;
		}

		public override void Flush()
		{
			if (this.bool_0)
			{
				throw new ObjectDisposedException("BZip2Stream");
			}
			this.stream_0.Flush();
		}

		public override long Seek(long offset, SeekOrigin origin)
		{
			throw new NotImplementedException();
		}

		public override void SetLength(long value)
		{
			throw new NotImplementedException();
		}

		public override void Write(byte[] buffer, int offset, int count)
		{
			throw new NotImplementedException();
		}

		protected override void Dispose(bool disposing)
		{
			try
			{
				if (!this.bool_0)
				{
					if (disposing && this.stream_0 != null)
					{
						this.stream_0.Close();
					}
					this.bool_0 = true;
				}
			}
			finally
			{
				base.Dispose(disposing);
			}
		}

		public override void Close()
		{
			Stream stream = this.stream_0;
			if (stream != null)
			{
				try
				{
					if (!this.bool_1)
					{
						stream.Close();
					}
				}
				finally
				{
					this.class35_0 = null;
					this.stream_0 = null;
				}
			}
		}
	}
}
