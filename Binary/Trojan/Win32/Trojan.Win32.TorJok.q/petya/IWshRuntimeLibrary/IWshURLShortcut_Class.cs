using System;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[CoClass(typeof(IWshURLShortcut_ClassClass)), Guid("F935DC2B-1CF0-11D0-ADB9-00C04FD58A0B")]
	[ComImport]
	public interface IWshURLShortcut_Class : IWshURLShortcut
	{
	}
}
