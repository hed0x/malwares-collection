/************************************************************************************************************
 * This code is created and maintened only for a research proposal. Please do not use for other proposes.   *
 * Author: Th3 0bservator                                                                                   *
 * Source: https://github.com/guibacellar/BisquillaRansomware                                               *
 * Site: https://www.theobservator.net                                                                      *
 ************************************************************************************************************/

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;

namespace BisquillaRansomware
{
    /// <summary>
    /// Local File Manager
    /// </summary>
    public sealed class FileManager
    {
        private FileManager() { }

        /// <summary>
        /// Read File
        /// </summary>
        /// <param name="info"></param>
        /// <returns></returns>
        public static void ReadFile(FileInfo file, ref Byte[] fileData)
        {
            using (FileStream fs = File.OpenRead(file.FullName))
            {
                fileData = new Byte[fs.Length];
                fs.Read(fileData, 0, fileData.Length);
            }
        }
    }
}
