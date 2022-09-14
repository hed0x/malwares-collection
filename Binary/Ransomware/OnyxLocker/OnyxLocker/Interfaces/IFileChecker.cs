namespace OnyxLocker
{
    internal interface IFileChecker
    {
        string[] TargetFiles { get; }

        bool IsTargetFile(string filePath);
    }
}