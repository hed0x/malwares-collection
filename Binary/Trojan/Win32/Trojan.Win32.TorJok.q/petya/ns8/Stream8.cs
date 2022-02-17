using ns11;
using ns12;
using ns7;
using System;
using System.Collections.Generic;
using System.IO;
using System.Threading;

namespace ns8
{
	internal sealed class Stream8 : Stream
	{
		[Flags]
		private enum Enum13 : uint
		{
			flag_0 = 0u,
			flag_1 = 1u,
			flag_2 = 2u,
			flag_3 = 4294967295u
		}

		internal static readonly int int_0 = 4;

		internal int int_1;

		private bool bool_0;

		internal int int_2;

		internal int int_3;

		internal int int_4;

		internal int int_5;

		private volatile Exception exception_0;

		private bool bool_1;

		internal bool bool_2;

		internal Queue<int> queue_0;

		internal Queue<int> queue_1;

		internal List<Class37> list_0;

		private object object_0 = new object();

		private object object_1 = new object();

		private object object_2 = new object();

		internal AutoResetEvent autoResetEvent_0;

		private long long_0;

		internal long long_1;

		private bool bool_3;

		internal uint uint_0;

		internal Stream stream_0;

		internal Class32 class32_0;

		internal int int_6;

		private Stream8.Enum13 enum13_0 = Stream8.Enum13.flag_1 | Stream8.Enum13.flag_2;

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
				if (this.stream_0 == null)
				{
					throw new ObjectDisposedException("BZip2Stream");
				}
				return this.stream_0.CanWrite;
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
				return this.long_0;
			}
			set
			{
				throw new NotImplementedException();
			}
		}

		public Stream8(Stream stream_1, bool bool_4) : this(stream_1, Class36.int_2, bool_4)
		{
		}

		public Stream8(Stream stream_1, int int_7, bool bool_4)
		{
			if (int_7 < Class36.int_1 || int_7 > Class36.int_2)
			{
				string message = string.Format("blockSize={0} is out of range; must be between {1} and {2}", int_7, Class36.int_1, Class36.int_2);
				throw new ArgumentException(message, "blockSize");
			}
			this.stream_0 = stream_1;
			if (!this.stream_0.CanWrite)
			{
				throw new ArgumentException("The stream is not writable.", "output");
			}
			this.class32_0 = new Class32(this.stream_0);
			this.int_6 = int_7;
			this.bool_3 = bool_4;
			this.uint_0 = 0u;
			Class16.smethod_467(this, 16);
			Class16.smethod_376(this);
		}

		public override void Close()
		{
			if (this.exception_0 != null)
			{
				this.bool_1 = true;
				Exception ex = this.exception_0;
				this.exception_0 = null;
				throw ex;
			}
			if (this.bool_1)
			{
				return;
			}
			if (this.stream_0 == null)
			{
				return;
			}
			Stream stream = this.stream_0;
			try
			{
				Class16.smethod_328(this, true);
			}
			finally
			{
				this.stream_0 = null;
				this.class32_0 = null;
			}
			if (!this.bool_3)
			{
				stream.Close();
			}
		}

		public override void Flush()
		{
			if (this.stream_0 != null)
			{
				Class16.smethod_328(this, false);
				Class16.smethod_442(this.class32_0);
				this.stream_0.Flush();
			}
		}

		public override void Write(byte[] buffer, int offset, int count)
		{
			bool flag = false;
			if (this.stream_0 == null)
			{
				throw new IOException("the stream is not open");
			}
			if (this.exception_0 != null)
			{
				this.bool_1 = true;
				Exception ex = this.exception_0;
				this.exception_0 = null;
				throw ex;
			}
			if (offset < 0)
			{
				throw new IndexOutOfRangeException(string.Format("offset ({0}) must be > 0", offset));
			}
			if (count < 0)
			{
				throw new IndexOutOfRangeException(string.Format("count ({0}) must be > 0", count));
			}
			if (offset + count > buffer.Length)
			{
				throw new IndexOutOfRangeException(string.Format("offset({0}) count({1}) bLength({2})", offset, count, buffer.Length));
			}
			if (count == 0)
			{
				return;
			}
			if (!this.bool_0)
			{
				Class16.smethod_120(this);
				this.bool_0 = true;
			}
			int num = 0;
			int num2 = count;
			while (true)
			{
				Class16.smethod_602(this, false, flag);
				flag = false;
				int index;
				if (this.int_5 >= 0)
				{
					index = this.int_5;
					goto IL_EB;
				}
				if (this.queue_1.Count != 0)
				{
					index = this.queue_1.Dequeue();
					this.int_2++;
					goto IL_EB;
				}
				flag = true;
				IL_153:
				if (num2 <= 0)
				{
					break;
				}
				continue;
				IL_EB:
				Class37 @class = this.list_0[index];
				@class.int_1 = this.int_2;
				int num3 = Class16.smethod_399(@class.method_0(), buffer, offset, num2);
				if (num3 != num2)
				{
					if (!ThreadPool.QueueUserWorkItem(new WaitCallback(this.method_0), @class))
					{
						goto IL_17E;
					}
					this.int_5 = -1;
					offset += num3;
				}
				else
				{
					this.int_5 = index;
				}
				num2 -= num3;
				num += num3;
				goto IL_153;
			}
			this.long_0 += (long)num;
			return;
			IL_17E:
			throw new Exception("Cannot enqueue workitem");
		}

		internal void method_0(object object_3)
		{
			Class37 @class = (Class37)object_3;
			try
			{
				Class16.smethod_589(@class.method_0());
				lock (this.object_0)
				{
					if (@class.int_1 > this.int_4)
					{
						this.int_4 = @class.int_1;
					}
				}
				lock (this.queue_0)
				{
					this.queue_0.Enqueue(@class.int_0);
				}
				this.autoResetEvent_0.Set();
			}
			catch (Exception ex)
			{
				lock (this.object_1)
				{
					if (this.exception_0 != null)
					{
						this.exception_0 = ex;
					}
				}
			}
		}

		public override long Seek(long offset, SeekOrigin origin)
		{
			throw new NotImplementedException();
		}

		public override void SetLength(long value)
		{
			throw new NotImplementedException();
		}

		public override int Read(byte[] buffer, int offset, int count)
		{
			throw new NotImplementedException();
		}
	}
}
