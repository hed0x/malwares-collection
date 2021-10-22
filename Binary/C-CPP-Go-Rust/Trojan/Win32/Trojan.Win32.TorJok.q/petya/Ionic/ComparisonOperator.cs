using System;
using System.ComponentModel;

namespace Ionic
{
	internal enum ComparisonOperator
	{
		[Description(">")]
		GreaterThan,
		[Description(">=")]
		GreaterThanOrEqualTo,
		[Description("<")]
		LesserThan,
		[Description("<=")]
		LesserThanOrEqualTo,
		[Description("=")]
		EqualTo,
		[Description("!=")]
		NotEqualTo
	}
}
