using ns10;
using ns12;
using ns15;
using ns2;
using ns5;
using ns8;
using System;
using System.Collections.Generic;
using System.IO;
using System.Runtime.CompilerServices;
using System.Text;

namespace ns7
{
	internal sealed class Stream0 : Stream
	{
		internal string string_0;

		internal string string_1;

		internal Stream stream_0;

		internal GClass0 gclass0_0;

		internal Enum8 enum8_0;

		internal Dictionary<string, GClass0> dictionary_0;

		internal int int_0;

		internal Enum9 enum9_0;

		internal Encoding encoding_0;

		private bool bool_0;

		private bool bool_1;

		internal bool bool_2;

		internal bool bool_3;

		private bool bool_4;

		internal Stream4 stream4_0;

		internal Stream stream_1;

		internal Stream stream_2;

		internal Stream13 stream13_0;

		internal bool bool_5;

		private string string_2;

		internal Stream11 stream11_0;

		internal long long_0;

		internal int int_1;

		[CompilerGenerated]
		private int int_2;

		[CompilerGenerated]
		private Enum21 enum21_0;

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
				return true;
			}
		}

		public override long Length
		{
			get
			{
				throw new NotSupportedException();
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
				throw new NotSupportedException();
			}
		}

		public override string ToString()
		{
			return string.Format("ZipOutputStream::{0}(leaveOpen({1})))", this.string_2, this.bool_0);
		}

		[CompilerGenerated]
		public int method_0()
		{
			return this.int_2;
		}

		[CompilerGenerated]
		public Enum21 method_1()
		{
			return this.enum21_0;
		}

		public override void Write(byte[] buffer, int offset, int count)
		{
			if (this.bool_1)
			{
				this.bool_2 = true;
				throw new InvalidOperationException("The stream has been closed.");
			}
			if (buffer == null)
			{
				this.bool_2 = true;
				throw new ArgumentNullException("buffer");
			}
			if (this.gclass0_0 == null)
			{
				this.bool_2 = true;
				throw new InvalidOperationException("You must call PutNextEntry() before calling Write().");
			}
			if (this.gclass0_0.bool_4)
			{
				this.bool_2 = true;
				throw new InvalidOperationException("You cannot Write() data for an entry that is a directory.");
			}
			if (this.bool_5)
			{
				Class16.smethod_15(false, this);
			}
			if (count != 0)
			{
				this.stream13_0.Write(buffer, offset, count);
			}
		}

		protected override void Dispose(bool disposing)
		{
			if (this.bool_1)
			{
				return;
			}
			if (disposing && !this.bool_2)
			{
				Class16.smethod_621(this);
				Stream stream = this.stream_0;
				ICollection<GClass0> values = this.dictionary_0.Values;
				Enum8 @enum = this.enum8_0;
				string text = this.string_1;
				Class8 class8_ = new Class8(this);
				this.bool_4 = Class16.smethod_173(text, values, class8_, stream, 1u, @enum);
				Stream4 stream2 = this.stream_0 as Stream4;
				Stream stream3;
				if (stream2 != null)
				{
					stream3 = stream2.stream_0;
					stream2.Dispose();
				}
				else
				{
					stream3 = this.stream_0;
				}
				if (!this.bool_0)
				{
					stream3.Dispose();
				}
				this.stream_0 = null;
			}
			this.bool_1 = true;
		}

		public override void Flush()
		{
		}

		public override int Read(byte[] buffer, int offset, int count)
		{
			throw new NotSupportedException("Read");
		}

		public override long Seek(long offset, SeekOrigin origin)
		{
			throw new NotSupportedException("Seek");
		}

		public override void SetLength(long value)
		{
			throw new NotSupportedException();
		}
	}
}
