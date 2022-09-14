using System;
using System.CodeDom.Compiler;
using System.ComponentModel;
using System.Diagnostics;
using System.Globalization;
using System.Resources;
using System.Runtime.CompilerServices;

namespace HogRansomware.Properties
{
	// Token: 0x02000005 RID: 5
	[GeneratedCode("System.Resources.Tools.StronglyTypedResourceBuilder", "16.0.0.0")]
	[DebuggerNonUserCode]
	[CompilerGenerated]
	internal class Resources
	{
		// Token: 0x0600000E RID: 14 RVA: 0x00002730 File Offset: 0x00000930
		internal Resources()
		{
		}

		// Token: 0x17000001 RID: 1
		// (get) Token: 0x0600000F RID: 15 RVA: 0x00002738 File Offset: 0x00000938
		[EditorBrowsable(EditorBrowsableState.Advanced)]
		internal static ResourceManager ResourceManager
		{
			get
			{
				if (Resources.resourceMan == null)
				{
					Resources.resourceMan = new ResourceManager("HogRansomware.Properties.Resources", typeof(Resources).Assembly);
				}
				return Resources.resourceMan;
			}
		}

		// Token: 0x17000002 RID: 2
		// (get) Token: 0x06000010 RID: 16 RVA: 0x00002764 File Offset: 0x00000964
		// (set) Token: 0x06000011 RID: 17 RVA: 0x0000276B File Offset: 0x0000096B
		[EditorBrowsable(EditorBrowsableState.Advanced)]
		internal static CultureInfo Culture
		{
			get
			{
				return Resources.resourceCulture;
			}
			set
			{
				Resources.resourceCulture = value;
			}
		}

		// Token: 0x17000003 RID: 3
		// (get) Token: 0x06000012 RID: 18 RVA: 0x00002773 File Offset: 0x00000973
		internal static byte[] Stub
		{
			get
			{
				return (byte[])Resources.ResourceManager.GetObject("Stub", Resources.resourceCulture);
			}
		}

		// Token: 0x04000008 RID: 8
		private static ResourceManager resourceMan;

		// Token: 0x04000009 RID: 9
		private static CultureInfo resourceCulture;
	}
}
