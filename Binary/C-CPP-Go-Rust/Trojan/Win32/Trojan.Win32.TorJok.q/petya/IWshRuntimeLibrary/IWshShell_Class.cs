using System;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[CoClass(typeof(IWshShell_ClassClass)), Guid("41904400-BE18-11D3-A28B-00104BD35090")]
	[ComImport]
	public interface IWshShell_Class : IWshShell3
	{
	}
}
