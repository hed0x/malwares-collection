using System;
using System.Runtime.InteropServices;
using System.Runtime.Serialization;

namespace Ionic.Zip
{
	[Guid("ebc25cf6-9120-4283-b972-0e5520d0000A")]
	[Serializable]
	public sealed class BadReadException : ZipException
	{
		public BadReadException()
		{
		}

		public BadReadException(string string_0) : base(string_0)
		{
		}

		public BadReadException(string string_0, Exception exception_0) : base(string_0, exception_0)
		{
		}

		protected BadReadException(SerializationInfo serializationInfo_0, StreamingContext streamingContext_0) : base(serializationInfo_0, streamingContext_0)
		{
		}
	}
}
