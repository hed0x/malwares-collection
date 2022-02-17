using System;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[CoClass(typeof(WshCollectionClass)), Guid("F935DC27-1CF0-11D0-ADB9-00C04FD58A0B")]
	[ComImport]
	public interface WshCollection : IWshCollection
	{
	}
}
