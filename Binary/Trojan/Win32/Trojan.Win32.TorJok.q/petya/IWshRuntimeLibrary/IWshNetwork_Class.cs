using System;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[CoClass(typeof(IWshNetwork_ClassClass)), Guid("24BE5A31-EDFE-11D2-B933-00104B365C9F")]
	[ComImport]
	public interface IWshNetwork_Class : IWshNetwork2
	{
	}
}
