using ns12;
using ns2;
using ns3;
using ns5;
using ns9;
using System;
using System.Net;
using System.Net.Sockets;
using System.Runtime.CompilerServices;
using System.Text;

namespace ns6
{
	internal sealed class Class63 : Class62
	{
		[CompilerGenerated]
		private Class84 class84_0;

		[CompilerGenerated]
		private Class84 method_12()
		{
			return this.class84_0;
		}

		[CompilerGenerated]
		private void method_13(Class84 class84_1)
		{
			this.class84_0 = class84_1;
		}

		public Class63(Class84 class84_1, Socket socket_2, Delegate7 delegate7_1) : base(socket_2, delegate7_1)
		{
			this.method_13(class84_1);
		}

		protected override void vmethod_1(string string_5)
		{
			this.stringDictionary_0 = Class16.smethod_536(this, string_5);
			if (Class16.smethod_465(this) == null || !Class16.smethod_465(this).ContainsKey("Host"))
			{
				base.method_5();
			}
			else
			{
				string string_6;
				int int_;
				if (Class16.smethod_604(this).ToUpper().Equals("CONNECT"))
				{
					int num = Class16.smethod_208(this).IndexOf(":");
					if (num >= 0)
					{
						string_6 = Class16.smethod_208(this).Substring(0, num);
						if (Class16.smethod_208(this).Length > num + 1)
						{
							int_ = int.Parse(Class16.smethod_208(this).Substring(num + 1));
						}
						else
						{
							int_ = 443;
						}
					}
					else
					{
						string_6 = Class16.smethod_208(this);
						int_ = 443;
					}
				}
				else
				{
					int num = Class16.smethod_465(this)["Host"].IndexOf(":");
					if (num > 0)
					{
						string_6 = Class16.smethod_465(this)["Host"].Substring(0, num);
						int_ = int.Parse(Class16.smethod_465(this)["Host"].Substring(num + 1));
					}
					else
					{
						string_6 = Class16.smethod_465(this)["Host"];
						int_ = 80;
					}
					if (Class16.smethod_604(this).ToUpper().Equals("POST"))
					{
						int num2 = string_5.IndexOf("\r\n\r\n");
						this.string_4 = string_5.Substring(num2 + 4);
					}
				}
				try
				{
					Class16.smethod_595(new Class54(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp), this);
					((Class54)Class16.smethod_261(this)).ipendPoint_0 = new IPEndPoint(this.method_12().method_6(), this.method_12().method_4());
					Class54 class54_ = (Class54)Class16.smethod_261(this);
					string string_7 = "username";
					Class16.smethod_561(string_7, class54_);
					Class16.smethod_292((Class54)Class16.smethod_261(this), "password");
					((Class54)Class16.smethod_261(this)).enum25_0 = Class16.smethod_622(this.method_12());
					if (Class16.smethod_465(this).ContainsKey("Proxy-Connection") && Class16.smethod_465(this)["Proxy-Connection"].ToLower().Equals("keep-alive"))
					{
						((Class54)Class16.smethod_261(this)).SetSocketOption(SocketOptionLevel.Socket, SocketOptionName.KeepAlive, 1);
					}
					Class16.smethod_211((Class54)Class16.smethod_261(this), string_6, int_, new AsyncCallback(this.method_14), Class16.smethod_261(this));
				}
				catch
				{
					base.method_5();
				}
			}
		}

		private void method_14(IAsyncResult iasyncResult_0)
		{
			try
			{
				Class16.smethod_197((Class54)Class16.smethod_261(this), iasyncResult_0);
				if (Class16.smethod_604(this).ToUpper().Equals("CONNECT"))
				{
					string text = Class16.smethod_674(this) + " 200 Connection established\r\nProxy-Agent: SocksWebProxy\r\n\r\n";
					Class16.smethod_607(this).BeginSend(Encoding.ASCII.GetBytes(text), 0, text.Length, SocketFlags.None, new AsyncCallback(base.method_11), Class16.smethod_607(this));
				}
				else
				{
					string text = Class16.smethod_333(this);
					Class16.smethod_261(this).BeginSend(Encoding.ASCII.GetBytes(text), 0, text.Length, SocketFlags.None, new AsyncCallback(base.method_10), Class16.smethod_261(this));
				}
			}
			catch
			{
				base.System.IDisposable.Dispose();
			}
		}
	}
}
