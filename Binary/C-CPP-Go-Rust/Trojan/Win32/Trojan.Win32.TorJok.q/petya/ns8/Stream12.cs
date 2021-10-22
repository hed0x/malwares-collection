using ns0;
using ns11;
using ns12;
using ns15;
using ns2;
using ns9;
using System;
using System.IO;

namespace ns8
{
	internal sealed class Stream12 : Stream
	{
		internal enum Enum24
		{
			const_0,
			const_1,
			const_2
		}

		protected internal GClass2 gclass2_0;

		protected internal Stream12.Enum24 enum24_0 = Stream12.Enum24.const_2;

		protected internal Enum19 enum19_0;

		protected internal Enum23 enum23_0;

		protected internal Enum22 enum22_0;

		protected internal Enum20 enum20_0;

		protected internal bool bool_0;

		protected internal byte[] byte_0;

		protected internal int int_0 = 16384;

		protected internal byte[] byte_1 = new byte[1];

		protected internal Stream stream_0;

		protected internal Enum21 enum21_0;

		internal GClass3 gclass3_0;

		protected internal string string_0;

		protected internal string string_1;

		protected internal DateTime dateTime_0;

		protected internal int int_1;

		private bool bool_1;

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
				throw new NotImplementedException();
			}
			set
			{
				throw new NotImplementedException();
			}
		}

		public Stream12(Stream stream_1, Enum22 enum22_1, Enum20 enum20_1, Enum23 enum23_1, bool bool_2)
		{
			this.enum19_0 = Enum19.const_0;
			this.stream_0 = stream_1;
			this.bool_0 = bool_2;
			this.enum22_0 = enum22_1;
			this.enum23_0 = enum23_1;
			this.enum20_0 = enum20_1;
			if (enum23_1 == Enum23.const_2)
			{
				this.gclass3_0 = new GClass3();
			}
		}

		public override void Write(byte[] buffer, int offset, int count)
		{
			if (this.gclass3_0 != null)
			{
				Class16.smethod_507(this.gclass3_0, buffer, offset, count);
			}
			if (this.enum24_0 == Stream12.Enum24.const_2)
			{
				this.enum24_0 = Stream12.Enum24.const_0;
			}
			else if (this.enum24_0 != Stream12.Enum24.const_0)
			{
				throw new GException0("Cannot Write after Reading.");
			}
			if (count == 0)
			{
				return;
			}
			Class16.smethod_610(this).byte_0 = buffer;
			this.gclass2_0.int_0 = offset;
			this.gclass2_0.int_1 = count;
			while (true)
			{
				this.gclass2_0.byte_1 = Class16.smethod_127(this);
				this.gclass2_0.int_2 = 0;
				this.gclass2_0.int_3 = this.byte_0.Length;
				int num = (this.enum22_0 == Enum22.const_0) ? Class16.smethod_675(this.gclass2_0, this.enum19_0) : Class16.smethod_202(this.gclass2_0, this.enum19_0);
				if (num != 0 && num != 1)
				{
					break;
				}
				this.stream_0.Write(this.byte_0, 0, this.byte_0.Length - this.gclass2_0.int_3);
				bool flag = this.gclass2_0.int_1 == 0 && this.gclass2_0.int_3 != 0;
				if (this.enum23_0 == Enum23.const_2 && this.enum22_0 != Enum22.const_0)
				{
					flag = (this.gclass2_0.int_1 == 8 && this.gclass2_0.int_3 != 0);
				}
				if (flag)
				{
					return;
				}
			}
			throw new GException0(((this.enum22_0 == Enum22.const_0) ? "de" : "in") + "flating: " + this.gclass2_0.string_0);
		}

		public override void Close()
		{
			if (this.stream_0 == null)
			{
				return;
			}
			try
			{
				Class16.smethod_73(this);
			}
			finally
			{
				Class16.smethod_35(this);
				if (!this.bool_0)
				{
					this.stream_0.Close();
				}
				this.stream_0 = null;
			}
		}

		public override void Flush()
		{
			this.stream_0.Flush();
		}

		public override long Seek(long offset, SeekOrigin origin)
		{
			throw new NotImplementedException();
		}

		public override void SetLength(long value)
		{
			this.stream_0.SetLength(value);
		}

		public override int Read(byte[] buffer, int offset, int count)
		{
			if (this.enum24_0 == Stream12.Enum24.const_2)
			{
				if (!this.stream_0.CanRead)
				{
					throw new GException0("The stream is not readable.");
				}
				this.enum24_0 = Stream12.Enum24.const_1;
				Class16.smethod_610(this).int_1 = 0;
				if (this.enum23_0 == Enum23.const_2)
				{
					this.int_1 = Class16.smethod_268(this);
					if (this.int_1 == 0)
					{
						return 0;
					}
				}
			}
			if (this.enum24_0 != Stream12.Enum24.const_1)
			{
				throw new GException0("Cannot Read after Writing.");
			}
			if (count == 0)
			{
				return 0;
			}
			if (this.bool_1 && this.enum22_0 == Enum22.const_0)
			{
				return 0;
			}
			if (buffer == null)
			{
				throw new ArgumentNullException("buffer");
			}
			if (count < 0)
			{
				throw new ArgumentOutOfRangeException("count");
			}
			if (offset < buffer.GetLowerBound(0))
			{
				throw new ArgumentOutOfRangeException("offset");
			}
			if (offset + count > buffer.GetLength(0))
			{
				throw new ArgumentOutOfRangeException("count");
			}
			this.gclass2_0.byte_1 = buffer;
			this.gclass2_0.int_2 = offset;
			this.gclass2_0.int_3 = count;
			this.gclass2_0.byte_0 = Class16.smethod_127(this);
			int num;
			while (true)
			{
				if (this.gclass2_0.int_1 == 0 && !this.bool_1)
				{
					this.gclass2_0.int_0 = 0;
					this.gclass2_0.int_1 = this.stream_0.Read(this.byte_0, 0, this.byte_0.Length);
					if (this.gclass2_0.int_1 == 0)
					{
						this.bool_1 = true;
					}
				}
				num = ((this.enum22_0 == Enum22.const_0) ? Class16.smethod_675(this.gclass2_0, this.enum19_0) : Class16.smethod_202(this.gclass2_0, this.enum19_0));
				if (this.bool_1 && num == -5)
				{
					break;
				}
				if (num != 0 && num != 1)
				{
					goto Block_17;
				}
				if (((this.bool_1 || num == 1) && this.gclass2_0.int_3 == count) || this.gclass2_0.int_3 <= 0 || this.bool_1)
				{
					goto IL_23D;
				}
				if (num != 0)
				{
					goto Block_21;
				}
			}
			return 0;
			Block_17:
			throw new GException0(string.Format("{0}flating:  rc={1}  msg={2}", (this.enum22_0 == Enum22.const_0) ? "de" : "in", num, this.gclass2_0.string_0));
			Block_21:
			IL_23D:
			if (this.gclass2_0.int_3 > 0)
			{
				if (num != 0)
				{
				}
				if (this.bool_1 && this.enum22_0 == Enum22.const_0)
				{
					num = Class16.smethod_675(this.gclass2_0, Enum19.const_4);
					if (num != 0 && num != 1)
					{
						throw new GException0(string.Format("Deflating:  rc={0}  msg={1}", num, this.gclass2_0.string_0));
					}
				}
			}
			num = count - this.gclass2_0.int_3;
			if (this.gclass3_0 != null)
			{
				Class16.smethod_507(this.gclass3_0, buffer, offset, num);
			}
			return num;
		}
	}
}
