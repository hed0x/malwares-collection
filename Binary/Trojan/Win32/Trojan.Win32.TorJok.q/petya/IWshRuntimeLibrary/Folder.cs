using System;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[CoClass(typeof(FolderClass)), Guid("C7C3F5A2-88A3-11D0-ABCB-00A0C90FFFC0")]
	[ComImport]
	public interface Folder : IFolder
	{
	}
}
