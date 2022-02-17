using ns0;
using ns12;
using ns8;
using System;
using System.IO;
using System.Text;

namespace ns10
{
	internal sealed class Stream10 : Stream
	{
		public DateTime? nullable_0;

		private int int_0;

		internal Stream12 stream12_0;

		internal bool bool_0;

		private bool bool_1;

		internal string string_0;

		internal string string_1;

		private int int_1;

		internal static readonly DateTime dateTime_0 = new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc);

		internal static readonly Encoding encoding_0 = Encoding.GetEncoding("iso-8859-1");

		public override bool CanRead
		{
			get
			{
				if (this.bool_0)
				{
					throw new ObjectDisposedException("GZipStream");
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
					throw new ObjectDisposedException("GZipStream");
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
					return this.stream12_0.gclass2_0.long_1 + (long)this.int_0;
				}
				if (this.stream12_0.enum24_0 == Stream12.Enum24.const_1)
				{
					return this.stream12_0.gclass2_0.long_0 + (long)this.stream12_0.int_1;
				}
				return 0L;
			}
			set
			{
				throw new NotImplementedException();
			}
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
						this.int_1 = Class16.smethod_672(this.stream12_0);
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
				throw new ObjectDisposedException("GZipStream");
			}
			this.stream12_0.Flush();
		}

		public override int Read(byte[] buffer, int offset, int count)
		{
			if (this.bool_0)
			{
				throw new ObjectDisposedException("GZipStream");
			}
			int result = this.stream12_0.Read(buffer, offset, count);
			if (!this.bool_1)
			{
				this.bool_1 = true;
				Class16.smethod_424(this.stream12_0.string_0, this);
				Class16.smethod_160(this, this.stream12_0.string_1);
			}
			return result;
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
				throw new ObjectDisposedException("GZipStream");
			}
			if (this.stream12_0.enum24_0 == Stream12.Enum24.const_2)
			{
				if (this.stream12_0.enum22_0 != Enum22.const_0)
				{
					throw new InvalidOperationException();
				}
				this.int_0 = Class16.smethod_307(this);
			}
			this.stream12_0.Write(buffer, offset, count);
		}
	}
}
