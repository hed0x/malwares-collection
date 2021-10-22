using Ionic.Zip;
using ns12;
using ns2;
using ns5;
using System;
using System.IO;
using System.Security.Cryptography;

namespace ns11
{
	internal sealed class Stream3 : Stream
	{
		private Class20 class20_0;

		private Stream stream_0;

		private Enum5 enum5_0;

		internal int int_0;

		internal bool bool_0;

		internal HMACSHA1 hmacsha1_0;

		internal RijndaelManaged rijndaelManaged_0;

		internal ICryptoTransform icryptoTransform_0;

		internal byte[] byte_0 = new byte[16];

		internal byte[] byte_1 = new byte[16];

		internal long long_0;

		internal long long_1;

		internal byte[] byte_2;

		internal int int_1;

		private byte[] byte_3;

		private object object_0 = new object();

		public override bool CanRead
		{
			get
			{
				return this.enum5_0 == Enum5.const_1;
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
				return this.enum5_0 == Enum5.const_0;
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
				throw new NotImplementedException();
			}
			set
			{
				throw new NotImplementedException();
			}
		}

		internal Stream3(Stream stream_1, Class20 class20_1, long long_2, Enum5 enum5_1) : this(stream_1, class20_1, enum5_1)
		{
			this.long_0 = long_2;
		}

		internal Stream3(Stream stream_1, Class20 class20_1, Enum5 enum5_1)
		{
			this.class20_0 = class20_1;
			this.stream_0 = stream_1;
			this.enum5_0 = enum5_1;
			this.int_0 = 1;
			if (this.class20_0 == null)
			{
				throw new BadPasswordException("Supply a password to use AES encryption.");
			}
			int num = Class16.smethod_66(this.class20_0).Length * 8;
			if (num != 256 && num != 128 && num != 192)
			{
				throw new ArgumentOutOfRangeException("keysize", "size of key must be 128, 192, or 256");
			}
			this.hmacsha1_0 = new HMACSHA1(Class16.smethod_194(this.class20_0));
			this.rijndaelManaged_0 = new RijndaelManaged();
			this.rijndaelManaged_0.BlockSize = 128;
			this.rijndaelManaged_0.KeySize = num;
			this.rijndaelManaged_0.Mode = CipherMode.ECB;
			this.rijndaelManaged_0.Padding = PaddingMode.None;
			byte[] rgbIV = new byte[16];
			this.icryptoTransform_0 = this.rijndaelManaged_0.CreateEncryptor(Class16.smethod_66(this.class20_0), rgbIV);
			if (this.enum5_0 == Enum5.const_0)
			{
				this.byte_3 = new byte[2048];
				this.byte_2 = new byte[16];
			}
		}

		public override int Read(byte[] buffer, int offset, int count)
		{
			if (this.enum5_0 == Enum5.const_0)
			{
				throw new NotSupportedException();
			}
			if (buffer == null)
			{
				throw new ArgumentNullException("buffer");
			}
			if (offset < 0)
			{
				throw new ArgumentOutOfRangeException("offset", "Must not be less than zero.");
			}
			if (count < 0)
			{
				throw new ArgumentOutOfRangeException("count", "Must not be less than zero.");
			}
			if (buffer.Length < offset + count)
			{
				throw new ArgumentException("The buffer is too small");
			}
			int count2 = count;
			if (this.long_1 >= this.long_0)
			{
				return 0;
			}
			long num = this.long_0 - this.long_1;
			if (num < (long)count)
			{
				count2 = (int)num;
			}
			int num2 = this.stream_0.Read(buffer, offset, count2);
			Class16.smethod_67(count2, this, buffer, offset);
			this.long_1 += (long)num2;
			return num2;
		}

		public override void Write(byte[] buffer, int offset, int count)
		{
			if (this.bool_0)
			{
				throw new InvalidOperationException("The final block has already been transformed.");
			}
			if (this.enum5_0 == Enum5.const_1)
			{
				throw new NotSupportedException();
			}
			if (buffer == null)
			{
				throw new ArgumentNullException("buffer");
			}
			if (offset < 0)
			{
				throw new ArgumentOutOfRangeException("offset", "Must not be less than zero.");
			}
			if (count < 0)
			{
				throw new ArgumentOutOfRangeException("count", "Must not be less than zero.");
			}
			if (buffer.Length < offset + count)
			{
				throw new ArgumentException("The offset and count are too large");
			}
			if (count == 0)
			{
				return;
			}
			if (count + this.int_1 <= 16)
			{
				Buffer.BlockCopy(buffer, offset, this.byte_2, this.int_1, count);
				this.int_1 += count;
				return;
			}
			int num = count;
			int num2 = offset;
			if (this.int_1 != 0)
			{
				int num3 = 16 - this.int_1;
				if (num3 > 0)
				{
					Buffer.BlockCopy(buffer, offset, this.byte_2, this.int_1, num3);
					num -= num3;
					num2 += num3;
				}
				Class16.smethod_555(this, this.byte_2, 0);
				this.stream_0.Write(this.byte_2, 0, 16);
				this.long_1 += 16L;
				this.int_1 = 0;
			}
			int num4 = (num - 1) / 16;
			this.int_1 = num - num4 * 16;
			Buffer.BlockCopy(buffer, num2 + num - this.int_1, this.byte_2, 0, this.int_1);
			num -= this.int_1;
			this.long_1 += (long)num;
			if (num4 > 0)
			{
				do
				{
					int num5 = this.byte_3.Length;
					if (num5 > num)
					{
						num5 = num;
					}
					Buffer.BlockCopy(buffer, num2, this.byte_3, 0, num5);
					Class16.smethod_447(num5, this.byte_3, this, 0);
					this.stream_0.Write(this.byte_3, 0, num5);
					num -= num5;
					num2 += num5;
				}
				while (num > 0);
			}
		}

		public override void Close()
		{
			if (this.int_1 > 0)
			{
				Class16.smethod_572(this);
				this.stream_0.Write(this.byte_2, 0, this.int_1);
				this.long_1 += (long)this.int_1;
				this.int_1 = 0;
			}
			this.stream_0.Close();
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
			throw new NotImplementedException();
		}
	}
}
