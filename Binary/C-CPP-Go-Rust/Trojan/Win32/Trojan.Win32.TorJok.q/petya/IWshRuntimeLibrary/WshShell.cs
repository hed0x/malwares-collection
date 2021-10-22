using System;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[CoClass(typeof(WshShellClass)), Guid("41904400-BE18-11D3-A28B-00104BD35090")]
	[ComImport]
	public interface WshShell : IWshShell3
	{
	}
}
