using System.Collections.Generic;

namespace OnyxLocker
{
    internal interface IDriveExplorer
    {
        List<string> GetStartingFolders();
    }
}