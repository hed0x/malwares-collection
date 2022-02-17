using System;

namespace IWshRuntimeLibrary
{
	public enum FileAttribute
	{
		Normal,
		ReadOnly,
		Hidden,
		System = 4,
		Volume = 8,
		Directory = 16,
		Archive = 32,
		Alias = 1024,
		Compressed = 2048
	}
}
