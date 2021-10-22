using ns0;
using ns12;
using ns13;
using ns15;
using System;
using System.Collections.Generic;
using System.IO;
using System.Runtime.CompilerServices;
using System.Threading;

namespace ns5
{
	internal sealed class Stream11 : Stream
	{
		[Flags]
		private enum Enum18 : uint
		{
			flag_0 = 0u,
			flag_1 = 1u,
			flag_2 = 2u,
			flag_3 = 4u,
			flag_4 = 8u,
			flag_5 = 16u,
			flag_6 = 32u,
			flag_7 = 58u,
			flag_8 = 64u,
			flag_9 = 128u,
			flag_10 = 256u,
			flag_11 = 512u,
			flag_12 = 1024u,
			flag_13 = 2048u,
			flag_14 = 4096u,
			flag_15 = 8192u,
			flag_16 = 16384u,
			flag_17 = 4294967295u
		}

		private static readonly int int_0 = 65536;

		internal static readonly int int_1 = 4;

		internal List<Class46> list_0;

		private bool bool_0;

		internal bool bool_1;

		internal Stream stream_0;

		internal int int_2;

		internal int int_3 = Stream11.int_0;

		internal AutoResetEvent autoResetEvent_0;

		private object object_0 = new object();

		internal bool bool_2;

		private bool bool_3;

		internal int int_4;

		internal int int_5;

		internal int int_6;

		internal int int_7;

		internal int int_8;

		internal GClass3 gclass3_0;

		private object object_1 = new object();

		internal Queue<int> queue_0;

		internal Queue<int> queue_1;

		internal long long_0;

		internal Enum20 enum20_0;

		private volatile Exception exception_0;

		private bool bool_4;

		private object object_2 = new object();

		private Stream11.Enum18 enum18_0 = Stream11.Enum18.flag_2 | Stream11.Enum18.flag_3 | Stream11.Enum18.flag_4 | Stream11.Enum18.flag_5 | Stream11.Enum18.flag_6 | Stream11.Enum18.flag_10 | Stream11.Enum18.flag_13 | Stream11.Enum18.flag_15 | Stream11.Enum18.flag_16;

		[CompilerGenerated]
		private Enum21 enum21_0;

		public override bool CanSeek
		{
			get
			{
				return false;
			}
		}

		public override bool CanRead
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
				return this.stream_0.CanWrite;
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

		public Stream11(Stream stream_1, Enum20 enum20_1, Enum21 enum21_1, bool bool_5)
		{
			this.stream_0 = stream_1;
			this.enum20_0 = enum20_1;
			this.method_1(enum21_1);
			this.bool_0 = bool_5;
			Class16.smethod_137(this, 16);
		}

		[CompilerGenerated]
		public Enum21 method_0()
		{
			return this.enum21_0;
		}

		[CompilerGenerated]
		private void method_1(Enum21 enum21_1)
		{
			this.enum21_0 = enum21_1;
		}

		public override void Write(byte[] buffer, int offset, int count)
		{
			bool flag = false;
			if (this.bool_2)
			{
				throw new InvalidOperationException();
			}
			if (this.exception_0 != null)
			{
				this.bool_4 = true;
				Exception ex = this.exception_0;
				this.exception_0 = null;
				throw ex;
			}
			if (count == 0)
			{
				return;
			}
			if (!this.bool_3)
			{
				Class16.smethod_247(this);
				this.bool_3 = true;
			}
			while (true)
			{
				Class16.smethod_357(this, false, flag);
				flag = false;
				int index;
				if (this.int_4 >= 0)
				{
					index = this.int_4;
					goto IL_84;
				}
				if (this.queue_1.Count != 0)
				{
					index = this.queue_1.Dequeue();
					this.int_5++;
					goto IL_84;
				}
				flag = true;
				IL_127:
				if (count <= 0)
				{
					break;
				}
				continue;
				IL_84:
				Class46 @class = this.list_0[index];
				int num = (@class.byte_0.Length - @class.int_3 > count) ? count : (@class.byte_0.Length - @class.int_3);
				@class.int_2 = this.int_5;
				Buffer.BlockCopy(buffer, offset, @class.byte_0, @class.int_3, num);
				count -= num;
				offset += num;
				@class.int_3 += num;
				if (@class.int_3 != @class.byte_0.Length)
				{
					this.int_4 = index;
					goto IL_127;
				}
				if (ThreadPool.QueueUserWorkItem(new WaitCallback(this.method_4), @class))
				{
					this.int_4 = -1;
					goto IL_127;
				}
				goto IL_153;
			}
			return;
			IL_153:
			throw new Exception("Cannot enqueue workitem");
		}

		public override void Flush()
		{
			if (this.exception_0 != null)
			{
				this.bool_4 = true;
				Exception ex = this.exception_0;
				this.exception_0 = null;
				throw ex;
			}
			if (this.bool_4)
			{
				return;
			}
			Class16.smethod_448(this, false);
		}

		public override void Close()
		{
			if (this.exception_0 != null)
			{
				this.bool_4 = true;
				Exception ex = this.exception_0;
				this.exception_0 = null;
				throw ex;
			}
			if (this.bool_4)
			{
				return;
			}
			if (this.bool_2)
			{
				return;
			}
			Class16.smethod_448(this, true);
			if (!this.bool_0)
			{
				this.stream_0.Close();
			}
			this.bool_2 = true;
		}

		public void method_2()
		{
			this.Close();
			this.list_0 = null;
			this.Dispose(true);
		}

		protected override void Dispose(bool disposing)
		{
			base.Dispose(disposing);
		}

		public void method_3(Stream stream_1)
		{
			if (!this.bool_3)
			{
				return;
			}
			this.queue_0.Clear();
			this.queue_1.Clear();
			foreach (Class46 current in this.list_0)
			{
				this.queue_1.Enqueue(current.int_1);
				current.int_2 = -1;
			}
			this.bool_3 = false;
			this.long_0 = 0L;
			this.gclass3_0 = new GClass3();
			this.bool_2 = false;
			this.int_4 = -1;
			this.int_5 = -1;
			this.int_6 = -1;
			this.int_7 = -1;
			this.stream_0 = stream_1;
		}

		internal void method_4(object object_3)
		{
			Class46 @class = (Class46)object_3;
			try
			{
				GClass3 gClass = new GClass3();
				Class16.smethod_507(gClass, @class.byte_0, 0, @class.int_3);
				Class16.smethod_673(this, @class);
				@class.int_0 = (int)(~(int)gClass.uint_2);
				lock (this.object_1)
				{
					if (@class.int_2 > this.int_7)
					{
						this.int_7 = @class.int_2;
					}
				}
				lock (this.queue_0)
				{
					this.queue_0.Enqueue(@class.int_1);
				}
				this.autoResetEvent_0.Set();
			}
			catch (Exception ex)
			{
				lock (this.object_2)
				{
					if (this.exception_0 != null)
					{
						this.exception_0 = ex;
					}
				}
			}
		}

		public override int Read(byte[] buffer, int offset, int count)
		{
			throw new NotSupportedException();
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
