using ns12;
using ns5;
using ns7;
using System;
using System.IO;

namespace ns13
{
	internal sealed class Stream5 : Stream
	{
		private Class22 class22_0;

		private Stream stream_0;

		private Enum5 enum5_0;

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
				throw new NotSupportedException();
			}
		}

		public override long Position
		{
			get
			{
				throw new NotSupportedException();
			}
			set
			{
				throw new NotSupportedException();
			}
		}

		public Stream5(Stream stream_1, Class22 class22_1, Enum5 enum5_1)
		{
			this.class22_0 = class22_1;
			this.stream_0 = stream_1;
			this.enum5_0 = enum5_1;
		}

		public override int Read(byte[] buffer, int offset, int count)
		{
			if (this.enum5_0 == Enum5.const_0)
			{
				throw new NotSupportedException("This stream does not encrypt via Read()");
			}
			if (buffer == null)
			{
				throw new ArgumentNullException("buffer");
			}
			byte[] array = new byte[count];
			int num = this.stream_0.Read(array, 0, count);
			byte[] array2 = Class16.smethod_77(array, num, this.class22_0);
			for (int i = 0; i < num; i++)
			{
				buffer[offset + i] = array2[i];
			}
			return num;
		}

		public override void Write(byte[] buffer, int offset, int count)
		{
			if (this.enum5_0 == Enum5.const_1)
			{
				throw new NotSupportedException("This stream does not Decrypt via Write()");
			}
			if (buffer == null)
			{
				throw new ArgumentNullException("buffer");
			}
			if (count == 0)
			{
				return;
			}
			byte[] array;
			if (offset != 0)
			{
				array = new byte[count];
				for (int i = 0; i < count; i++)
				{
					array[i] = buffer[offset + i];
				}
			}
			else
			{
				array = buffer;
			}
			byte[] array2 = Class16.smethod_419(this.class22_0, array, count);
			this.stream_0.Write(array2, 0, array2.Length);
		}

		public override void Flush()
		{
		}

		public override long Seek(long offset, SeekOrigin origin)
		{
			throw new NotSupportedException();
		}

		public override void SetLength(long value)
		{
			throw new NotSupportedException();
		}
	}
}
