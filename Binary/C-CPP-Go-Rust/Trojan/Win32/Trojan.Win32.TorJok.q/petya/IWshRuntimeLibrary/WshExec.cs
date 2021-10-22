using System;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[CoClass(typeof(WshExecClass)), Guid("08FED190-BE19-11D3-A28B-00104BD35090")]
	[ComImport]
	public interface WshExec : IWshExec
	{
	}
}
