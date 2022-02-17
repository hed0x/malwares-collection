using System;
using System.Runtime.InteropServices;
using System.Runtime.Serialization;

namespace Ionic.Zip
{
	[Guid("ebc25cf6-9120-4283-b972-0e5520d00009")]
	[Serializable]
	public sealed class BadCrcException : ZipException
	{
		public BadCrcException()
		{
		}

		public BadCrcException(string string_0) : base(string_0)
		{
		}

		protected BadCrcException(SerializationInfo serializationInfo_0, StreamingContext streamingContext_0) : base(serializationInfo_0, streamingContext_0)
		{
		}
	}
}
