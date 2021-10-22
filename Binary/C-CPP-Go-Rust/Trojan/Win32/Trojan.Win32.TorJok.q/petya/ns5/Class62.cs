using ns0;
using ns12;
using ns3;
using System;
using System.Collections.Specialized;
using System.Net;
using System.Net.Sockets;
using System.Text;

namespace ns5
{
	internal class Class62 : Class61
	{
		protected internal string string_0 = "";

		protected internal string string_1 = null;

		protected internal StringDictionary stringDictionary_0 = null;

		protected internal string string_2 = "";

		protected internal string string_3 = "";

		protected internal string string_4 = null;

		public Class62(Socket socket_2, Delegate7 delegate7_1) : base(socket_2, delegate7_1)
		{
		}

		public override void vmethod_0()
		{
			try
			{
				Class16.smethod_607(this).BeginReceive(Class16.smethod_131(this), 0, Class16.smethod_131(this).Length, SocketFlags.None, new AsyncCallback(this.method_7), Class16.smethod_607(this));
			}
			catch
			{
				base.System.IDisposable.Dispose();
			}
		}

		protected virtual void vmethod_1(string string_5)
		{
			this.stringDictionary_0 = Class16.smethod_536(this, string_5);
			if (Class16.smethod_465(this) == null || !Class16.smethod_465(this).ContainsKey("Host"))
			{
				this.method_5();
			}
			else
			{
				string hostName;
				int port;
				if (Class16.smethod_604(this).ToUpper().Equals("CONNECT"))
				{
					int num = Class16.smethod_208(this).IndexOf(":");
					if (num >= 0)
					{
						hostName = Class16.smethod_208(this).Substring(0, num);
						if (Class16.smethod_208(this).Length > num + 1)
						{
							port = int.Parse(Class16.smethod_208(this).Substring(num + 1));
						}
						else
						{
							port = 443;
						}
					}
					else
					{
						hostName = Class16.smethod_208(this);
						port = 443;
					}
				}
				else
				{
					int num = Class16.smethod_465(this)["Host"].IndexOf(":");
					if (num > 0)
					{
						hostName = Class16.smethod_465(this)["Host"].Substring(0, num);
						port = int.Parse(Class16.smethod_465(this)["Host"].Substring(num + 1));
					}
					else
					{
						hostName = Class16.smethod_465(this)["Host"];
						port = 80;
					}
					if (Class16.smethod_604(this).ToUpper().Equals("POST"))
					{
						int num2 = string_5.IndexOf("\r\n\r\n");
						this.string_4 = string_5.Substring(num2 + 4);
					}
				}
				try
				{
					IPEndPoint iPEndPoint = new IPEndPoint(Dns.Resolve(hostName).AddressList[0], port);
					Class16.smethod_595(new Socket(iPEndPoint.AddressFamily, SocketType.Stream, ProtocolType.Tcp), this);
					if (Class16.smethod_465(this).ContainsKey("Proxy-Connection") && Class16.smethod_465(this)["Proxy-Connection"].ToLower().Equals("keep-alive"))
					{
						Class16.smethod_261(this).SetSocketOption(SocketOptionLevel.Socket, SocketOptionName.KeepAlive, 1);
					}
					Class16.smethod_261(this).BeginConnect(iPEndPoint, new AsyncCallback(this.method_9), Class16.smethod_261(this));
				}
				catch
				{
					this.method_5();
				}
			}
		}

		protected internal void method_5()
		{
			string text = "HTTP/1.1 400 Bad Request\r\nConnection: close\r\nContent-Type: text/html\r\n\r\n<html><head><title>400 Bad Request</title></head><body><div align=\"center\"><table border=\"0\" cellspacing=\"3\" cellpadding=\"3\" bgcolor=\"#C0C0C0\"><tr><td><table border=\"0\" width=\"500\" cellspacing=\"3\" cellpadding=\"3\"><tr><td bgcolor=\"#B2B2B2\"><p align=\"center\"><strong><font size=\"2\" face=\"Verdana\">400 Bad Request</font></strong></p></td></tr><tr><td bgcolor=\"#D1D1D1\"><font size=\"2\" face=\"Verdana\"> The proxy server could not understand the HTTP request!<br><br> Please contact your network administrator about this problem.</font></td></tr></table></center></td></tr></table></div></body></html>";
			try
			{
				Class16.smethod_607(this).BeginSend(Encoding.ASCII.GetBytes(text), 0, text.Length, SocketFlags.None, new AsyncCallback(this.method_8), Class16.smethod_607(this));
			}
			catch
			{
				base.System.IDisposable.Dispose();
			}
		}

		public override string ToString()
		{
			return this.method_6(false);
		}

		public string method_6(bool bool_0)
		{
			string text;
			try
			{
				if (Class16.smethod_261(this) == null || Class16.smethod_261(this).RemoteEndPoint == null)
				{
					text = "Incoming HTTP connection from " + ((IPEndPoint)Class16.smethod_607(this).RemoteEndPoint).Address.ToString();
				}
				else
				{
					text = string.Concat(new string[]
					{
						"HTTP connection from ",
						((IPEndPoint)Class16.smethod_607(this).RemoteEndPoint).Address.ToString(),
						" to ",
						((IPEndPoint)Class16.smethod_261(this).RemoteEndPoint).Address.ToString(),
						" on port ",
						((IPEndPoint)Class16.smethod_261(this).RemoteEndPoint).Port.ToString()
					});
				}
				if (Class16.smethod_465(this) != null && Class16.smethod_465(this).ContainsKey("Host") && Class16.smethod_208(this) != null)
				{
					text = text + "\r\n requested URL: http://" + Class16.smethod_465(this)["Host"] + Class16.smethod_208(this);
				}
			}
			catch
			{
				text = "HTTP Connection";
			}
			return text;
		}

		protected void method_7(IAsyncResult iasyncResult_0)
		{
			int num;
			try
			{
				num = Class16.smethod_607(this).EndReceive(iasyncResult_0);
			}
			catch
			{
				num = -1;
			}
			if (num <= 0)
			{
				base.System.IDisposable.Dispose();
			}
			else
			{
				Class16.smethod_207(this, Class16.smethod_625(this) + Encoding.ASCII.GetString(Class16.smethod_131(this), 0, num));
				if (Class16.smethod_1(Class16.smethod_625(this), this))
				{
					this.vmethod_1(Class16.smethod_625(this));
				}
				else
				{
					try
					{
						Class16.smethod_607(this).BeginReceive(Class16.smethod_131(this), 0, Class16.smethod_131(this).Length, SocketFlags.None, new AsyncCallback(this.method_7), Class16.smethod_607(this));
					}
					catch
					{
						base.System.IDisposable.Dispose();
					}
				}
			}
		}

		protected void method_8(IAsyncResult iasyncResult_0)
		{
			try
			{
				Class16.smethod_607(this).EndSend(iasyncResult_0);
			}
			catch
			{
			}
			base.System.IDisposable.Dispose();
		}

		protected void method_9(IAsyncResult iasyncResult_0)
		{
			try
			{
				Class16.smethod_261(this).EndConnect(iasyncResult_0);
				if (Class16.smethod_604(this).ToUpper().Equals("CONNECT"))
				{
					string text = Class16.smethod_674(this) + " 200 Connection established\r\nProxy-Agent: Mentalis Proxy Server\r\n\r\n";
					Class16.smethod_607(this).BeginSend(Encoding.ASCII.GetBytes(text), 0, text.Length, SocketFlags.None, new AsyncCallback(this.method_11), Class16.smethod_607(this));
				}
				else
				{
					string text = Class16.smethod_333(this);
					Class16.smethod_261(this).BeginSend(Encoding.ASCII.GetBytes(text), 0, text.Length, SocketFlags.None, new AsyncCallback(this.method_10), Class16.smethod_261(this));
				}
			}
			catch
			{
				base.System.IDisposable.Dispose();
			}
		}

		protected void method_10(IAsyncResult iasyncResult_0)
		{
			try
			{
				if (Class16.smethod_261(this).EndSend(iasyncResult_0) == -1)
				{
					base.System.IDisposable.Dispose();
				}
				else
				{
					base.method_0();
				}
			}
			catch
			{
				base.System.IDisposable.Dispose();
			}
		}

		protected void method_11(IAsyncResult iasyncResult_0)
		{
			try
			{
				if (Class16.smethod_607(this).EndSend(iasyncResult_0) == -1)
				{
					base.System.IDisposable.Dispose();
				}
				else
				{
					base.method_0();
				}
			}
			catch
			{
				base.System.IDisposable.Dispose();
			}
		}
	}
}
