using System;

namespace ns1
{
	[AttributeUsage(AttributeTargets.Class | AttributeTargets.Struct | AttributeTargets.Constructor | AttributeTargets.Method)]
	internal sealed class Attribute1 : Attribute
	{
	}
}
