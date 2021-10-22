using System;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[CoClass(typeof(FileSystemObjectClass)), Guid("2A0B9D10-4B87-11D3-A97A-00104B365C9F")]
	[ComImport]
	public interface FileSystemObject : IFileSystem3
	{
	}
}
