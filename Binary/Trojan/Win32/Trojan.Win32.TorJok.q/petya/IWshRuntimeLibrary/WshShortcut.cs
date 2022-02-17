using System;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[CoClass(typeof(WshShortcutClass)), Guid("F935DC23-1CF0-11D0-ADB9-00C04FD58A0B")]
	[ComImport]
	public interface WshShortcut : IWshShortcut
	{
	}
}
