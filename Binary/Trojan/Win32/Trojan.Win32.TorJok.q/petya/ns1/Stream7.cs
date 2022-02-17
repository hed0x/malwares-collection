using ns12;
using ns6;
using ns7;
using System;
using System.IO;

namespace ns1
{
	internal sealed class Stream7 : Stream
	{
		[Flags]
		private enum Enum12 : uint
		{
			flag_0 = 0u,
			flag_1 = 1u,
			flag_2 = 2u,
			flag_3 = 4294967295u
		}

		private int int_0;

		private bool bool_0;

		internal Class33 class33_0;

		internal uint uint_0;

		internal Stream stream_0;

		internal Class32 class32_0;

		internal int int_1;

		private Stream7.Enum12 enum12_0 = Stream7.Enum12.flag_1 | Stream7.Enum12.flag_2;

		public override bool CanRead
		{
			get
			{
				return false;
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
				if (this.stream_0 == null)
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
				return (long)this.int_0;
			}
			set
			{
				throw new NotImplementedException();
			}
		}

		public Stream7(Stream stream_1, bool bool_1) : this(stream_1, Class36.int_2, bool_1)
		{
		}

		public Stream7(Stream stream_1, int int_2, bool bool_1)
		{
			if (int_2 < Class36.int_1 || int_2 > Class36.int_2)
			{
				string message = string.Format("blockSize={0} is out of range; must be between {1} and {2}", int_2, Class36.int_1, Class36.int_2);
				throw new ArgumentException(message, "blockSize");
			}
			this.stream_0 = stream_1;
			if (!this.stream_0.CanWrite)
			{
				throw new ArgumentException("The stream is not writable.", "output");
			}
			this.class32_0 = new Class32(this.stream_0);
			this.int_1 = int_2;
			this.class33_0 = new Class33(this.class32_0, int_2);
			this.bool_0 = bool_1;
			this.uint_0 = 0u;
			Class16.smethod_237(this);
		}

		public override void Close()
		{
			if (this.stream_0 != null)
			{
				Stream stream = this.stream_0;
				Class16.smethod_285(this);
				if (!this.bool_0)
				{
					stream.Close();
				}
			}
		}

		public override void Flush()
		{
			if (this.stream_0 != null)
			{
				Class16.smethod_442(this.class32_0);
				this.stream_0.Flush();
			}
		}

		public override void Write(byte[] buffer, int offset, int count)
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
			if (count == 0)
			{
				return;
			}
			int num = 0;
			int num2 = count;
			do
			{
				int num3 = Class16.smethod_399(this.class33_0, buffer, offset, num2);
				if (num3 != num2)
				{
					Class16.smethod_589(this.class33_0);
					this.uint_0 = (this.uint_0 << 1 | this.uint_0 >> 31);
					this.uint_0 ^= this.class33_0.method_0();
					offset += num3;
				}
				num2 -= num3;
				num += num3;
			}
			while (num2 > 0);
			this.int_0 += num;
		}

		public override long Seek(long offset, SeekOrigin origin)
		{
			throw new NotImplementedException();
		}

		public override void SetLength(long value)
		{
			throw new NotImplementedException();
		}

		public override int Read(byte[] buffer, int offset, int count)
		{
			throw new NotImplementedException();
		}
	}
}
