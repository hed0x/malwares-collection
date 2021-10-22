using System;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[Guid("F935DC1F-1CF0-11D0-ADB9-00C04FD58A0B")]
	public enum WshWindowStyle
	{
		WshHide,
		WshNormalFocus,
		WshMinimizedFocus,
		WshMaximizedFocus,
		WshNormalNoFocus,
		WshMinimizedNoFocus = 6
	}
}
