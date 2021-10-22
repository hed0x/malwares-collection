using ns0;
using ns15;
using ns2;
using ns8;
using System;
using System.IO;

namespace ns12
{
	internal sealed class Stream9 : Stream
	{
		internal Stream12 stream12_0;

		internal Stream stream_0;

		internal bool bool_0;

		public override bool CanRead
		{
			get
			{
				if (this.bool_0)
				{
					throw new ObjectDisposedException("DeflateStream");
				}
				return this.stream12_0.stream_0.CanRead;
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
					throw new ObjectDisposedException("DeflateStream");
				}
				return this.stream12_0.stream_0.CanWrite;
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
				if (this.stream12_0.enum24_0 == Stream12.Enum24.const_0)
				{
					return this.stream12_0.gclass2_0.long_1;
				}
				if (this.stream12_0.enum24_0 == Stream12.Enum24.const_1)
				{
					return this.stream12_0.gclass2_0.long_0;
				}
				return 0L;
			}
			set
			{
				throw new NotImplementedException();
			}
		}

		public Stream9(Stream stream_1, Enum22 enum22_0, bool bool_1) : this(stream_1, enum22_0, Enum20.const_8, bool_1)
		{
		}

		public Stream9(Stream stream_1, Enum22 enum22_0, Enum20 enum20_0, bool bool_1)
		{
			this.stream_0 = stream_1;
			this.stream12_0 = new Stream12(stream_1, enum22_0, enum20_0, Enum23.const_1, bool_1);
		}

		protected override void Dispose(bool disposing)
		{
			try
			{
				if (!this.bool_0)
				{
					if (disposing && this.stream12_0 != null)
					{
						this.stream12_0.Close();
					}
					this.bool_0 = true;
				}
			}
			finally
			{
				base.Dispose(disposing);
			}
		}

		public override void Flush()
		{
			if (this.bool_0)
			{
				throw new ObjectDisposedException("DeflateStream");
			}
			this.stream12_0.Flush();
		}

		public override int Read(byte[] buffer, int offset, int count)
		{
			if (this.bool_0)
			{
				throw new ObjectDisposedException("DeflateStream");
			}
			return this.stream12_0.Read(buffer, offset, count);
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
			if (this.bool_0)
			{
				throw new ObjectDisposedException("DeflateStream");
			}
			this.stream12_0.Write(buffer, offset, count);
		}
	}
}
