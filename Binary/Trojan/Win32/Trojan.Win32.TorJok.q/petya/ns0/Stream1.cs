using ns10;
using ns12;
using ns15;
using System;
using System.IO;
using System.Runtime.CompilerServices;

namespace ns0
{
	internal sealed class Stream1 : Stream
	{
		internal Stream stream_0;

		internal GClass0 gclass0_0;

		internal bool bool_0;

		internal Stream13 stream13_0;

		internal long long_0;

		internal string string_0;

		private long long_1;

		private string string_1;

		private bool bool_1;

		private bool bool_2;

		private bool bool_3;

		private bool bool_4;

		[CompilerGenerated]
		private int int_0;

		public override bool CanRead
		{
			get
			{
				return true;
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
				return this.stream_0.Position;
			}
			set
			{
				this.Seek(value, SeekOrigin.Begin);
			}
		}

		public override string ToString()
		{
			return string.Format("ZipInputStream::{0}(leaveOpen({1})))", this.string_1, this.bool_1);
		}

		[CompilerGenerated]
		public int method_0()
		{
			return this.int_0;
		}

		public override int Read(byte[] buffer, int offset, int count)
		{
			if (this.bool_2)
			{
				this.bool_4 = true;
				throw new InvalidOperationException("The stream has been closed.");
			}
			if (this.bool_0)
			{
				Class16.smethod_109(this);
			}
			if (this.long_0 == 0L)
			{
				return 0;
			}
			int count2 = (this.long_0 > (long)count) ? count : ((int)this.long_0);
			int num = this.stream13_0.Read(buffer, offset, count2);
			this.long_0 -= (long)num;
			if (this.long_0 == 0L)
			{
				int num2 = Class16.smethod_4(this.stream13_0);
				Class16.smethod_125(this.gclass0_0, num2);
				this.stream_0.Seek(this.long_1, SeekOrigin.Begin);
			}
			return num;
		}

		protected override void Dispose(bool disposing)
		{
			if (this.bool_2)
			{
				return;
			}
			if (disposing)
			{
				if (this.bool_4)
				{
					return;
				}
				if (!this.bool_1)
				{
					this.stream_0.Dispose();
				}
			}
			this.bool_2 = true;
		}

		public override void Flush()
		{
			throw new NotSupportedException("Flush");
		}

		public override void Write(byte[] buffer, int offset, int count)
		{
			throw new NotSupportedException("Write");
		}

		public override long Seek(long offset, SeekOrigin origin)
		{
			this.bool_3 = true;
			return this.stream_0.Seek(offset, origin);
		}

		public override void SetLength(long value)
		{
			throw new NotSupportedException();
		}
	}
}
