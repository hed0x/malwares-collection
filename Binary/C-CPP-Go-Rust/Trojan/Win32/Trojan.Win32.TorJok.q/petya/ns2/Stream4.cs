using System;
using System.IO;

namespace ns2
{
	internal sealed class Stream4 : Stream
	{
		internal Stream stream_0;

		internal long long_0;

		internal long long_1;

		internal long long_2;

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
				return this.stream_0.CanSeek;
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
				this.stream_0.Seek(value, SeekOrigin.Begin);
			}
		}

		public Stream4(Stream stream_1)
		{
			this.stream_0 = stream_1;
			try
			{
				this.long_2 = this.stream_0.Position;
			}
			catch
			{
				this.long_2 = 0L;
			}
		}

		public override int Read(byte[] buffer, int offset, int count)
		{
			int num = this.stream_0.Read(buffer, offset, count);
			this.long_1 += (long)num;
			return num;
		}

		public override void Write(byte[] buffer, int offset, int count)
		{
			if (count == 0)
			{
				return;
			}
			this.stream_0.Write(buffer, offset, count);
			this.long_0 += (long)count;
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
			this.stream_0.SetLength(value);
		}
	}
}
