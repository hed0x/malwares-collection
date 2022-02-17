using System;
using System.Runtime.InteropServices;
using System.Runtime.Serialization;

namespace Ionic.Zip
{
	[Guid("ebc25cf6-9120-4283-b972-0e5520d00007")]
	[Serializable]
	public sealed class BadStateException : ZipException
	{
		public BadStateException()
		{
		}

		public BadStateException(string string_0) : base(string_0)
		{
		}

		public BadStateException(string string_0, Exception exception_0) : base(string_0, exception_0)
		{
		}

		protected BadStateException(SerializationInfo serializationInfo_0, StreamingContext streamingContext_0) : base(serializationInfo_0, streamingContext_0)
		{
		}
	}
}
