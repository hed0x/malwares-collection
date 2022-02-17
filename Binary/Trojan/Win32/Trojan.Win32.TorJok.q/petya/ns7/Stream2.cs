using System;
using System.IO;

namespace ns7
{
	internal sealed class Stream2 : Stream, IDisposable
	{
		private long long_0;

		private Stream stream_0;

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
				return false;
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
				return this.stream_0.Position - this.long_0;
			}
			set
			{
				this.stream_0.Position = this.long_0 + value;
			}
		}

		public Stream2(Stream stream_1)
		{
			this.long_0 = stream_1.Position;
			this.stream_0 = stream_1;
		}

		public override int Read(byte[] buffer, int offset, int count)
		{
			return this.stream_0.Read(buffer, offset, count);
		}

		public override void Write(byte[] buffer, int offset, int count)
		{
			throw new NotImplementedException();
		}

		public override void Flush()
		{
			this.stream_0.Flush();
		}

		public override long Seek(long offset, SeekOrigin origin)
		{
			return this.stream_0.Seek(this.long_0 + offset, origin) - this.long_0;
		}

		public override void SetLength(long value)
		{
			throw new NotImplementedException();
		}

		void IDisposable.Dispose()
		{
			this.Close();
		}

		public override void Close()
		{
			base.Close();
		}
	}
}
