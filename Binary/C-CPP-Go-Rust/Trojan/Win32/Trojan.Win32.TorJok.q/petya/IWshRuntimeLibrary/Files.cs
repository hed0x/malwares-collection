using System;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[CoClass(typeof(FilesClass)), Guid("C7C3F5A5-88A3-11D0-ABCB-00A0C90FFFC0")]
	[ComImport]
	public interface Files : IFileCollection
	{
	}
}
