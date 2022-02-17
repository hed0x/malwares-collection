using ns0;
using ns12;
using System;
using System.IO;

namespace ns10
{
	internal sealed class Stream13 : Stream, IDisposable
	{
		private static readonly long long_0 = -99L;

		internal Stream stream_0;

		internal GClass3 gclass3_0;

		private long long_1 = -99L;

		private bool bool_0;

		public override bool CanRead
		{
			get
			{
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
				return this.stream_0.CanWrite;
			}
		}

		public override long Length
		{
			get
			{
				if (this.long_1 == Stream13.long_0)
				{
					return this.stream_0.Length;
				}
				return this.long_1;
			}
		}

		public override long Position
		{
			get
			{
				return this.gclass3_0.long_0;
			}
			set
			{
				throw new NotSupportedException();
			}
		}

		public Stream13(Stream stream_1) : this(true, Stream13.long_0, stream_1, null)
		{
		}

		public Stream13(Stream stream_1, bool bool_1) : this(bool_1, Stream13.long_0, stream_1, null)
		{
		}

		public Stream13(Stream stream_1, long long_2) : this(true, long_2, stream_1, null)
		{
			if (long_2 < 0L)
			{
				throw new ArgumentException("length");
			}
		}

		private Stream13(bool bool_1, long long_2, Stream stream_1, GClass3 gclass3_1)
		{
			this.stream_0 = stream_1;
			this.gclass3_0 = (gclass3_1 ?? new GClass3());
			this.long_1 = long_2;
			this.bool_0 = bool_1;
		}

		public override int Read(byte[] buffer, int offset, int count)
		{
			int count2 = count;
			if (this.long_1 != Stream13.long_0)
			{
				if (this.gclass3_0.long_0 >= this.long_1)
				{
					return 0;
				}
				long num = this.long_1 - this.gclass3_0.long_0;
				if (num < (long)count)
				{
					count2 = (int)num;
				}
			}
			int num2 = this.stream_0.Read(buffer, offset, count2);
			if (num2 > 0)
			{
				Class16.smethod_507(this.gclass3_0, buffer, offset, num2);
			}
			return num2;
		}

		public override void Write(byte[] buffer, int offset, int count)
		{
			if (count > 0)
			{
				Class16.smethod_507(this.gclass3_0, buffer, offset, count);
			}
			this.stream_0.Write(buffer, offset, count);
		}

		public override void Flush()
		{
			this.stream_0.Flush();
		}

		public override long Seek(long offset, SeekOrigin origin)
		{
			throw new NotSupportedException();
		}

		public override void SetLength(long value)
		{
			throw new NotSupportedException();
		}

		void IDisposable.Dispose()
		{
			this.Close();
		}

		public override void Close()
		{
			base.Close();
			if (!this.bool_0)
			{
				this.stream_0.Close();
			}
		}
	}
}
