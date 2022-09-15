namespace Shared
{
    public class EncryptedAES
    {
        public string? Key { get; set; }
        public string? IV { get; set; }
        public byte[]? KeyBytes { get; set; }
        public byte[]? IVBytes { get; set; }

        public EncryptedAES() { }

        public EncryptedAES(string? key, string? iv)
        {
            Key = key;
            IV = iv;
        }
    }
}