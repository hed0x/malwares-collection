using Ionic.Zip;
using Microsoft.CSharp;
using ns0;
using ns1;
using ns10;
using ns13;
using ns14;
using ns15;
using ns3;
using ns5;
using ns6;
using ns8;
using ns9;
using System;
using System.CodeDom.Compiler;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading;

namespace ns12
{
	[ClassInterface(ClassInterfaceType.AutoDispatch), ComVisible(true), Guid("ebc25cf6-9120-4283-b972-0e5520d00005")]
	public sealed class GClass1 : IEnumerable<GClass0>, IEnumerable, IDisposable
	{
		private sealed class Class26
		{
			public SelfExtractorFlavor selfExtractorFlavor_0;

			public List<string> list_0;

			public List<string> list_1;

			public List<string> list_2;
		}

		[CompilerGenerated]
		private sealed class Class27
		{
			public StringComparison stringComparison_0;

			public int method_0(GClass0 gclass0_0, GClass0 gclass0_1)
			{
				return string.Compare(gclass0_0.string_1, gclass0_1.string_1, this.stringComparison_0);
			}
		}

		internal TextWriter textWriter_0;

		internal bool bool_0;

		internal Stream stream_0;

		internal Stream stream_1;

		internal ushort ushort_0;

		internal ushort ushort_1;

		internal uint uint_0;

		internal int int_0;

		internal uint uint_1;

		private Enum1 enum1_0;

		private bool bool_1;

		internal Dictionary<string, GClass0> dictionary_0;

		internal List<GClass0> list_0;

		internal string string_0;

		internal string string_1;

		internal string string_2;

		internal string string_3;

		internal bool bool_2 = true;

		internal bool bool_3;

		internal Enum21 enum21_0;

		internal CompressionMethod compressionMethod_0 = CompressionMethod.Deflate;

		internal bool bool_4;

		internal string string_4;

		internal bool bool_5;

		internal bool bool_6;

		internal string string_5;

		internal bool bool_7 = true;

		internal object object_0 = new object();

		internal bool bool_8;

		internal bool bool_9;

		internal bool bool_10;

		internal Enum2 enum2_0;

		internal bool bool_11;

		internal long long_0 = -1L;

		internal uint uint_2;

		internal long long_1;

		internal bool? nullable_0;

		internal bool bool_12;

		internal Encoding encoding_0 = Encoding.GetEncoding("IBM437");

		internal Enum9 enum9_0;

		internal static Encoding encoding_1 = Encoding.GetEncoding("IBM437");

		internal int int_1 = GClass1.int_3;

		internal Stream11 stream11_0;

		internal long long_2;

		internal int int_2 = 16;

		internal Enum8 enum8_0;

		internal bool bool_13;

		public static readonly int int_3 = 32768;

		internal EventHandler<EventArgs3> eventHandler_0;

		internal EventHandler<EventArgs1> eventHandler_1;

		private long long_3 = -99L;

		internal EventHandler<EventArgs4> eventHandler_2;

		internal EventHandler<EventArgs2> eventHandler_3;

		internal EventHandler<EventArgs5> eventHandler_4;

		private static GClass1.Class26[] class26_0 = new GClass1.Class26[]
		{
			new GClass1.Class26
			{
				selfExtractorFlavor_0 = SelfExtractorFlavor.WinFormsApplication,
				list_0 = new List<string>
				{
					"System.dll",
					"System.Windows.Forms.dll",
					"System.Drawing.dll"
				},
				list_1 = new List<string>
				{
					"Ionic.Zip.WinFormsSelfExtractorStub.resources",
					"Ionic.Zip.Forms.PasswordDialog.resources",
					"Ionic.Zip.Forms.ZipContentsDialog.resources"
				},
				list_2 = new List<string>
				{
					"WinFormsSelfExtractorStub.cs",
					"WinFormsSelfExtractorStub.Designer.cs",
					"PasswordDialog.cs",
					"PasswordDialog.Designer.cs",
					"ZipContentsDialog.cs",
					"ZipContentsDialog.Designer.cs",
					"FolderBrowserDialogEx.cs"
				}
			},
			new GClass1.Class26
			{
				selfExtractorFlavor_0 = SelfExtractorFlavor.ConsoleApplication,
				list_0 = new List<string>
				{
					"System.dll"
				},
				list_1 = null,
				list_2 = new List<string>
				{
					"CommandLineSelfExtractorStub.cs"
				}
			}
		};

		[CompilerGenerated]
		private bool bool_14;

		[CompilerGenerated]
		private bool bool_15;

		[CompilerGenerated]
		private bool bool_16;

		[CompilerGenerated]
		private int int_4;

		[CompilerGenerated]
		private bool bool_17;

		[CompilerGenerated]
		private Enum20 enum20_0;

		[CompilerGenerated]
		private Enum3 enum3_0;

		[CompilerGenerated]
		private Delegate3 delegate3_0;

		public event EventHandler<EventArgs3> SaveProgress
		{
			add
			{
				EventHandler<EventArgs3> eventHandler = this.eventHandler_0;
				EventHandler<EventArgs3> eventHandler2;
				do
				{
					eventHandler2 = eventHandler;
					EventHandler<EventArgs3> value2 = (EventHandler<EventArgs3>)Delegate.Combine(eventHandler2, value);
					eventHandler = Interlocked.CompareExchange<EventHandler<EventArgs3>>(ref this.eventHandler_0, value2, eventHandler2);
				}
				while (eventHandler != eventHandler2);
			}
			remove
			{
				EventHandler<EventArgs3> eventHandler = this.eventHandler_0;
				EventHandler<EventArgs3> eventHandler2;
				do
				{
					eventHandler2 = eventHandler;
					EventHandler<EventArgs3> value2 = (EventHandler<EventArgs3>)Delegate.Remove(eventHandler2, value);
					eventHandler = Interlocked.CompareExchange<EventHandler<EventArgs3>>(ref this.eventHandler_0, value2, eventHandler2);
				}
				while (eventHandler != eventHandler2);
			}
		}

		public event EventHandler<EventArgs1> ReadProgress
		{
			add
			{
				EventHandler<EventArgs1> eventHandler = this.eventHandler_1;
				EventHandler<EventArgs1> eventHandler2;
				do
				{
					eventHandler2 = eventHandler;
					EventHandler<EventArgs1> value2 = (EventHandler<EventArgs1>)Delegate.Combine(eventHandler2, value);
					eventHandler = Interlocked.CompareExchange<EventHandler<EventArgs1>>(ref this.eventHandler_1, value2, eventHandler2);
				}
				while (eventHandler != eventHandler2);
			}
			remove
			{
				EventHandler<EventArgs1> eventHandler = this.eventHandler_1;
				EventHandler<EventArgs1> eventHandler2;
				do
				{
					eventHandler2 = eventHandler;
					EventHandler<EventArgs1> value2 = (EventHandler<EventArgs1>)Delegate.Remove(eventHandler2, value);
					eventHandler = Interlocked.CompareExchange<EventHandler<EventArgs1>>(ref this.eventHandler_1, value2, eventHandler2);
				}
				while (eventHandler != eventHandler2);
			}
		}

		public event EventHandler<EventArgs4> ExtractProgress
		{
			add
			{
				EventHandler<EventArgs4> eventHandler = this.eventHandler_2;
				EventHandler<EventArgs4> eventHandler2;
				do
				{
					eventHandler2 = eventHandler;
					EventHandler<EventArgs4> value2 = (EventHandler<EventArgs4>)Delegate.Combine(eventHandler2, value);
					eventHandler = Interlocked.CompareExchange<EventHandler<EventArgs4>>(ref this.eventHandler_2, value2, eventHandler2);
				}
				while (eventHandler != eventHandler2);
			}
			remove
			{
				EventHandler<EventArgs4> eventHandler = this.eventHandler_2;
				EventHandler<EventArgs4> eventHandler2;
				do
				{
					eventHandler2 = eventHandler;
					EventHandler<EventArgs4> value2 = (EventHandler<EventArgs4>)Delegate.Remove(eventHandler2, value);
					eventHandler = Interlocked.CompareExchange<EventHandler<EventArgs4>>(ref this.eventHandler_2, value2, eventHandler2);
				}
				while (eventHandler != eventHandler2);
			}
		}

		public event EventHandler<EventArgs2> AddProgress
		{
			add
			{
				EventHandler<EventArgs2> eventHandler = this.eventHandler_3;
				EventHandler<EventArgs2> eventHandler2;
				do
				{
					eventHandler2 = eventHandler;
					EventHandler<EventArgs2> value2 = (EventHandler<EventArgs2>)Delegate.Combine(eventHandler2, value);
					eventHandler = Interlocked.CompareExchange<EventHandler<EventArgs2>>(ref this.eventHandler_3, value2, eventHandler2);
				}
				while (eventHandler != eventHandler2);
			}
			remove
			{
				EventHandler<EventArgs2> eventHandler = this.eventHandler_3;
				EventHandler<EventArgs2> eventHandler2;
				do
				{
					eventHandler2 = eventHandler;
					EventHandler<EventArgs2> value2 = (EventHandler<EventArgs2>)Delegate.Remove(eventHandler2, value);
					eventHandler = Interlocked.CompareExchange<EventHandler<EventArgs2>>(ref this.eventHandler_3, value2, eventHandler2);
				}
				while (eventHandler != eventHandler2);
			}
		}

		public event EventHandler<EventArgs5> ZipError
		{
			add
			{
				EventHandler<EventArgs5> eventHandler = this.eventHandler_4;
				EventHandler<EventArgs5> eventHandler2;
				do
				{
					eventHandler2 = eventHandler;
					EventHandler<EventArgs5> value2 = (EventHandler<EventArgs5>)Delegate.Combine(eventHandler2, value);
					eventHandler = Interlocked.CompareExchange<EventHandler<EventArgs5>>(ref this.eventHandler_4, value2, eventHandler2);
				}
				while (eventHandler != eventHandler2);
			}
			remove
			{
				EventHandler<EventArgs5> eventHandler = this.eventHandler_4;
				EventHandler<EventArgs5> eventHandler2;
				do
				{
					eventHandler2 = eventHandler;
					EventHandler<EventArgs5> value2 = (EventHandler<EventArgs5>)Delegate.Remove(eventHandler2, value);
					eventHandler = Interlocked.CompareExchange<EventHandler<EventArgs5>>(ref this.eventHandler_4, value2, eventHandler2);
				}
				while (eventHandler != eventHandler2);
			}
		}

		public string Info
		{
			get
			{
				StringBuilder stringBuilder = new StringBuilder();
				stringBuilder.Append(string.Format("          ZipFile: {0}\n", this.string_0));
				if (!string.IsNullOrEmpty(this.string_2))
				{
					stringBuilder.Append(string.Format("          Comment: {0}\n", this.string_2));
				}
				if (this.ushort_0 != 0)
				{
					stringBuilder.Append(string.Format("  version made by: 0x{0:X4}\n", this.ushort_0));
				}
				if (this.ushort_1 != 0)
				{
					stringBuilder.Append(string.Format("needed to extract: 0x{0:X4}\n", this.ushort_1));
				}
				stringBuilder.Append(string.Format("       uses ZIP64: {0}\n", this.InputUsesZip64));
				stringBuilder.Append(string.Format("     disk with CD: {0}\n", this.uint_0));
				if (this.uint_2 == 4294967295u)
				{
					stringBuilder.Append(string.Format("      CD64 offset: 0x{0:X16}\n", this.long_1));
				}
				else
				{
					stringBuilder.Append(string.Format("        CD offset: 0x{0:X8}\n", this.uint_2));
				}
				stringBuilder.Append("\n");
				foreach (GClass0 current in this.dictionary_0.Values)
				{
					stringBuilder.Append(current.Info);
				}
				return stringBuilder.ToString();
			}
		}

		public bool FullScan
		{
			get;
			set;
		}

		public bool SortEntriesBeforeSaving
		{
			get;
			set;
		}

		public bool AddDirectoryWillTraverseReparsePoints
		{
			get;
			set;
		}

		public int BufferSize
		{
			get
			{
				return this.int_1;
			}
			set
			{
				this.int_1 = value;
			}
		}

		public int CodecBufferSize
		{
			get;
			set;
		}

		public bool FlattenFoldersOnExtract
		{
			get;
			set;
		}

		public Enum21 Strategy
		{
			get
			{
				return this.enum21_0;
			}
			set
			{
				this.enum21_0 = value;
			}
		}

		public string Name
		{
			get
			{
				return this.string_0;
			}
			set
			{
				this.string_0 = value;
			}
		}

		public Enum20 CompressionLevel
		{
			get;
			set;
		}

		public CompressionMethod CompressionMethod
		{
			get
			{
				return this.compressionMethod_0;
			}
			set
			{
				this.compressionMethod_0 = value;
			}
		}

		public string Comment
		{
			get
			{
				return this.string_2;
			}
			set
			{
				this.string_2 = value;
				this.bool_5 = true;
			}
		}

		public bool EmitTimesInWindowsFormatWhenSaving
		{
			get
			{
				return this.bool_2;
			}
			set
			{
				this.bool_2 = value;
			}
		}

		public bool EmitTimesInUnixFormatWhenSaving
		{
			get
			{
				return this.bool_3;
			}
			set
			{
				this.bool_3 = value;
			}
		}

		internal bool Verbose
		{
			get
			{
				return this.textWriter_0 != null;
			}
		}

		public bool CaseSensitiveRetrieval
		{
			get
			{
				return this.bool_0;
			}
			set
			{
				if (value != this.bool_0)
				{
					this.bool_0 = value;
					Class16.smethod_569(this);
				}
			}
		}

		public bool UseUnicodeAsNecessary
		{
			get
			{
				return this.encoding_0 == Encoding.GetEncoding("UTF-8") && this.enum9_0 == Enum9.const_2;
			}
			set
			{
				if (value)
				{
					this.encoding_0 = Encoding.GetEncoding("UTF-8");
					this.enum9_0 = Enum9.const_2;
					return;
				}
				this.encoding_0 = GClass1.encoding_1;
				this.enum9_0 = Enum9.const_0;
			}
		}

		public Enum8 UseZip64WhenSaving
		{
			get
			{
				return this.enum8_0;
			}
			set
			{
				this.enum8_0 = value;
			}
		}

		public bool? RequiresZip64
		{
			get
			{
				if (this.dictionary_0.Count > 65534)
				{
					return new bool?(true);
				}
				if (this.bool_6 && !this.bool_5)
				{
					foreach (GClass0 current in this.dictionary_0.Values)
					{
						bool? nullable_ = current.nullable_1;
						if (nullable_.Value)
						{
							return new bool?(true);
						}
					}
					return new bool?(false);
				}
				return null;
			}
		}

		public bool? OutputUsedZip64
		{
			get
			{
				return this.nullable_0;
			}
		}

		public bool? InputUsesZip64
		{
			get
			{
				if (this.dictionary_0.Count > 65534)
				{
					return new bool?(true);
				}
				using (IEnumerator<GClass0> enumerator = this.System.Collections.Generic.IEnumerable<ns15.GClass0>.GetEnumerator())
				{
					while (enumerator.MoveNext())
					{
						GClass0 current = enumerator.Current;
						if (current.enum0_0 != Enum0.const_3)
						{
							bool? result = null;
							return result;
						}
						if (current.bool_10)
						{
							bool? result = new bool?(true);
							return result;
						}
					}
				}
				return new bool?(false);
			}
		}

		public Encoding ProvisionalAlternateEncoding
		{
			get
			{
				if (this.enum9_0 == Enum9.const_2)
				{
					return this.encoding_0;
				}
				return null;
			}
			set
			{
				this.encoding_0 = value;
				this.enum9_0 = Enum9.const_2;
			}
		}

		public Encoding AlternateEncoding
		{
			get
			{
				return this.encoding_0;
			}
			set
			{
				this.encoding_0 = value;
			}
		}

		public Enum9 AlternateEncodingUsage
		{
			get
			{
				return this.enum9_0;
			}
			set
			{
				this.enum9_0 = value;
			}
		}

		public static Encoding DefaultEncoding
		{
			get
			{
				return GClass1.encoding_1;
			}
		}

		public TextWriter StatusMessageTextWriter
		{
			get
			{
				return this.textWriter_0;
			}
			set
			{
				this.textWriter_0 = value;
			}
		}

		public string TempFileFolder
		{
			get
			{
				return this.string_5;
			}
			set
			{
				this.string_5 = value;
				if (value == null)
				{
					return;
				}
				if (!Directory.Exists(value))
				{
					throw new FileNotFoundException(string.Format("That directory ({0}) does not exist.", value));
				}
			}
		}

		public string Password
		{
			private get
			{
				return this.string_3;
			}
			set
			{
				this.string_3 = value;
				if (this.string_3 == null)
				{
					this.Encryption = Enum2.const_0;
					return;
				}
				if (this.enum2_0 == Enum2.const_0)
				{
					this.Encryption = Enum2.const_1;
				}
			}
		}

		public Enum3 ExtractExistingFile
		{
			get;
			set;
		}

		public Enum1 ZipErrorAction
		{
			get
			{
				if (this.eventHandler_4 != null)
				{
					this.enum1_0 = Enum1.const_3;
				}
				return this.enum1_0;
			}
			set
			{
				this.enum1_0 = value;
				if (this.enum1_0 != Enum1.const_3 && this.eventHandler_4 != null)
				{
					this.eventHandler_4 = null;
				}
			}
		}

		public Enum2 Encryption
		{
			get
			{
				return this.enum2_0;
			}
			set
			{
				if (value == Enum2.const_4)
				{
					throw new InvalidOperationException("You may not set Encryption to that value.");
				}
				this.enum2_0 = value;
			}
		}

		public Delegate3 SetCompression
		{
			get;
			set;
		}

		public int MaxOutputSegmentSize
		{
			get
			{
				return this.int_0;
			}
			set
			{
				if (value < 65536 && value != 0)
				{
					throw new ZipException("The minimum acceptable segment size is 65536.");
				}
				this.int_0 = value;
			}
		}

		public int NumberOfSegmentsForMostRecentSave
		{
			get
			{
				return (int)(this.uint_1 + 1u);
			}
		}

		public long ParallelDeflateThreshold
		{
			get
			{
				return this.long_2;
			}
			set
			{
				if (value != 0L && value != -1L && value < 65536L)
				{
					throw new ArgumentOutOfRangeException("ParallelDeflateThreshold should be -1, 0, or > 65536");
				}
				this.long_2 = value;
			}
		}

		public int ParallelDeflateMaxBufferPairs
		{
			get
			{
				return this.int_2;
			}
			set
			{
				if (value < 4)
				{
					throw new ArgumentOutOfRangeException("ParallelDeflateMaxBufferPairs", "Value must be 4 or greater.");
				}
				this.int_2 = value;
			}
		}

		public static Version LibraryVersion
		{
			get
			{
				return Assembly.GetExecutingAssembly().GetName().Version;
			}
		}

		private List<GClass0> ZipEntriesAsList
		{
			get
			{
				if (this.list_0 == null)
				{
					this.list_0 = new List<GClass0>(this.dictionary_0.Values);
				}
				return this.list_0;
			}
		}

		public GClass0 this[int int_5]
		{
			get
			{
				return this.ZipEntriesAsList[int_5];
			}
		}

		public GClass0 this[string string_6]
		{
			get
			{
				string text = Class16.smethod_11(string_6);
				if (this.dictionary_0.ContainsKey(text))
				{
					return this.dictionary_0[text];
				}
				text = text.Replace("/", "\\");
				if (this.dictionary_0.ContainsKey(text))
				{
					return this.dictionary_0[text];
				}
				return null;
			}
		}

		public ICollection<string> EntryFileNames
		{
			get
			{
				return this.dictionary_0.Keys;
			}
		}

		public ICollection<GClass0> Entries
		{
			get
			{
				return this.dictionary_0.Values;
			}
		}

		public ICollection<GClass0> EntriesSorted
		{
			get
			{
				GClass1.Class27 @class = new GClass1.Class27();
				List<GClass0> list = new List<GClass0>();
				foreach (GClass0 current in this.Entries)
				{
					list.Add(current);
				}
				@class.stringComparison_0 = (this.bool_0 ? StringComparison.Ordinal : StringComparison.OrdinalIgnoreCase);
				list.Sort(new Comparison<GClass0>(@class.method_0));
				return list.AsReadOnly();
			}
		}

		public int Count
		{
			get
			{
				return this.dictionary_0.Count;
			}
		}

		internal Stream ReadStream
		{
			get
			{
				if (this.stream_0 == null && (this.string_1 != null || this.string_0 != null))
				{
					this.stream_0 = File.Open(this.string_1 ?? this.string_0, FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
					this.bool_7 = true;
				}
				return this.stream_0;
			}
		}

		internal Stream WriteStream
		{
			get
			{
				if (this.stream_1 != null)
				{
					return this.stream_1;
				}
				if (this.string_0 == null)
				{
					return this.stream_1;
				}
				if (this.int_0 != 0)
				{
					string text = this.string_0;
					int num = this.int_0;
					this.stream_1 = Class16.smethod_119(num, text);
					return this.stream_1;
				}
				Class16.smethod_354(this.string_5 ?? Path.GetDirectoryName(this.string_0), out this.stream_1, out this.string_4);
				return this.stream_1;
			}
			private set
			{
				if (value != null)
				{
					throw new ZipException("Cannot set the stream to a non-null value.");
				}
				this.stream_1 = null;
			}
		}

		internal string ArchiveNameForEvent
		{
			get
			{
				if (this.string_0 == null)
				{
					return "(stream)";
				}
				return this.string_0;
			}
		}

		internal long LengthOfReadStream
		{
			get
			{
				if (this.long_3 == -99L)
				{
					this.long_3 = (this.bool_7 ? Class16.smethod_552(this.string_0) : -1L);
				}
				return this.long_3;
			}
		}

		public override string ToString()
		{
			return string.Format("ZipFile::{0}", this.string_0);
		}

		internal void method_0(bool bool_18)
		{
			if (this.bool_11)
			{
				using (GClass1 gClass = new GClass1())
				{
					gClass.string_1 = (gClass.string_0 = (bool_18 ? (this.string_1 ?? this.string_0) : this.string_0));
					gClass.encoding_0 = this.encoding_0;
					gClass.enum9_0 = this.enum9_0;
					Class16.smethod_435(gClass);
					using (IEnumerator<GClass0> enumerator = gClass.System.Collections.Generic.IEnumerable<ns15.GClass0>.GetEnumerator())
					{
						while (enumerator.MoveNext())
						{
							GClass0 current = enumerator.Current;
							using (IEnumerator<GClass0> enumerator2 = this.System.Collections.Generic.IEnumerable<ns15.GClass0>.GetEnumerator())
							{
								while (enumerator2.MoveNext())
								{
									GClass0 current2 = enumerator2.Current;
									if (current.string_1 == current2.string_1)
									{
										Class16.smethod_596(current2, current);
										break;
									}
								}
							}
						}
					}
				}
				this.bool_11 = false;
			}
		}

		public GClass1(string string_6)
		{
			try
			{
				Class16.smethod_502(null, string_6, this);
			}
			catch (Exception exception_)
			{
				throw new ZipException(string.Format("Could not read {0} as a zip file", string_6), exception_);
			}
		}

		public GClass1(string string_6, Encoding encoding_2)
		{
			try
			{
				this.encoding_0 = encoding_2;
				this.enum9_0 = Enum9.const_3;
				Class16.smethod_502(null, string_6, this);
			}
			catch (Exception exception_)
			{
				throw new ZipException(string.Format("{0} is not a valid zip file", string_6), exception_);
			}
		}

		public GClass1()
		{
			Class16.smethod_502(null, null, this);
		}

		public GClass1(Encoding encoding_2)
		{
			this.encoding_0 = encoding_2;
			this.enum9_0 = Enum9.const_3;
			Class16.smethod_502(null, null, this);
		}

		public GClass1(string string_6, TextWriter textWriter_1)
		{
			try
			{
				Class16.smethod_502(textWriter_1, string_6, this);
			}
			catch (Exception exception_)
			{
				throw new ZipException(string.Format("{0} is not a valid zip file", string_6), exception_);
			}
		}

		public GClass1(string string_6, TextWriter textWriter_1, Encoding encoding_2)
		{
			try
			{
				this.encoding_0 = encoding_2;
				this.enum9_0 = Enum9.const_3;
				Class16.smethod_502(textWriter_1, string_6, this);
			}
			catch (Exception exception_)
			{
				throw new ZipException(string.Format("{0} is not a valid zip file", string_6), exception_);
			}
		}

		public void Dispose()
		{
			this.vmethod_0(true);
			GC.SuppressFinalize(this);
		}

		protected virtual void vmethod_0(bool bool_18)
		{
			if (!this.bool_1)
			{
				if (bool_18)
				{
					if (this.bool_7 && this.stream_0 != null)
					{
						this.stream_0.Dispose();
						this.stream_0 = null;
					}
					if (this.string_4 != null && this.string_0 != null && this.stream_1 != null)
					{
						this.stream_1.Dispose();
						this.stream_1 = null;
					}
					if (this.stream11_0 != null)
					{
						this.stream11_0.method_2();
						this.stream11_0 = null;
					}
				}
				this.bool_1 = true;
			}
		}

		internal void method_1(string string_6, bool bool_18)
		{
			bool flag = this.textWriter_0 != null;
			this.bool_12 = true;
			try
			{
				Class16.smethod_163(this, string_6);
				int num = 0;
				foreach (GClass0 current in this.dictionary_0.Values)
				{
					if (flag)
					{
						this.textWriter_0.WriteLine("\n{1,-22} {2,-8} {3,4}   {4,-8}  {0}", new object[]
						{
							"Name",
							"Modified",
							"Size",
							"Ratio",
							"Packed"
						});
						this.textWriter_0.WriteLine(new string('-', 72));
						flag = false;
					}
					if (this.textWriter_0 != null)
					{
						this.textWriter_0.WriteLine("{1,-22} {2,-8} {3,4:F0}%   {4,-8} {0}", new object[]
						{
							current.string_1,
							current.LastModified.ToString("yyyy-MM-dd HH:mm:ss"),
							current.long_2,
							current.CompressionRatio,
							current.long_0
						});
						if (!string.IsNullOrEmpty(current.string_2))
						{
							this.textWriter_0.WriteLine("  Comment: {0}", current.string_2);
						}
					}
					current.Password = this.string_3;
					Class16.smethod_86(current, string_6, true, this, num);
					if (bool_18)
					{
						current.ExtractExistingFile = this.ExtractExistingFile;
					}
					Class16.smethod_107(current, string_6);
					num++;
					Class16.smethod_86(current, string_6, false, this, num);
					if (this.bool_9)
					{
						break;
					}
				}
				if (!this.bool_9)
				{
					foreach (GClass0 current2 in this.dictionary_0.Values)
					{
						if (current2.bool_4 || current2.string_1.EndsWith("/"))
						{
							string text = current2.string_1.StartsWith("/") ? Path.Combine(string_6, current2.string_1.Substring(1)) : Path.Combine(string_6, current2.string_1);
							Class16.smethod_590(false, current2, text);
						}
					}
					Class16.smethod_167(this, string_6);
				}
			}
			finally
			{
				this.bool_12 = false;
			}
		}

		internal void method_2(string string_6, Class31 class31_0)
		{
			string text = null;
			string text2 = null;
			string text3 = null;
			try
			{
				if (File.Exists(string_6) && this.textWriter_0 != null)
				{
					this.textWriter_0.WriteLine("The existing file ({0}) will be overwritten.", string_6);
				}
				if (!string_6.EndsWith(".exe") && this.textWriter_0 != null)
				{
					this.textWriter_0.WriteLine("Warning: The generated self-extracting file will not have an .exe extension.");
				}
				text3 = (this.string_5 ?? Path.GetDirectoryName(string_6));
				text = Class16.smethod_327("exe", text3);
				Assembly assembly = typeof(GClass1).Assembly;
				using (CSharpCodeProvider cSharpCodeProvider = new CSharpCodeProvider())
				{
					GClass1.Class26 @class = null;
					GClass1.Class26[] array = GClass1.class26_0;
					int i = 0;
					while (i < array.Length)
					{
						GClass1.Class26 class2 = array[i];
						if (class2.selfExtractorFlavor_0 == class31_0.method_0())
						{
							@class = class2;
							IL_CA:
							if (@class == null)
							{
								throw new BadStateException(string.Format("While saving a Self-Extracting Zip, Cannot find that flavor ({0})?", class31_0.method_0()));
							}
							CompilerParameters compilerParameters = new CompilerParameters();
							compilerParameters.ReferencedAssemblies.Add(assembly.Location);
							if (@class.list_0 != null)
							{
								foreach (string current in @class.list_0)
								{
									compilerParameters.ReferencedAssemblies.Add(current);
								}
							}
							compilerParameters.GenerateInMemory = false;
							compilerParameters.GenerateExecutable = true;
							compilerParameters.IncludeDebugInformation = false;
							compilerParameters.CompilerOptions = "";
							Assembly executingAssembly = Assembly.GetExecutingAssembly();
							StringBuilder stringBuilder = new StringBuilder();
							string text4 = Class16.smethod_327("cs", text3);
							using (GClass1 gClass = Class16.smethod_56(executingAssembly.GetManifestResourceStream("Ionic.Zip.Resources.ZippedResources.zip")))
							{
								text2 = Class16.smethod_327("tmp", text3);
								if (string.IsNullOrEmpty(class31_0.method_4()))
								{
									Directory.CreateDirectory(text2);
									GClass0 gClass2 = gClass["zippedFile.ico"];
									if ((gClass2.int_0 & 1) == 1)
									{
										GClass0 expr_1DD = gClass2;
										expr_1DD.Attributes = (FileAttributes)(expr_1DD.int_0 ^ 1);
									}
									Class16.smethod_107(gClass2, text2);
									string arg = Path.Combine(text2, "zippedFile.ico");
									CompilerParameters expr_200 = compilerParameters;
									expr_200.CompilerOptions += string.Format("/win32icon:\"{0}\"", arg);
								}
								else
								{
									CompilerParameters expr_21F = compilerParameters;
									expr_21F.CompilerOptions += string.Format("/win32icon:\"{0}\"", class31_0.method_4());
								}
								compilerParameters.OutputAssembly = text;
								if (class31_0.method_0() == SelfExtractorFlavor.WinFormsApplication)
								{
									CompilerParameters expr_252 = compilerParameters;
									expr_252.CompilerOptions += " /target:winexe";
								}
								if (!string.IsNullOrEmpty(class31_0.method_14()))
								{
									CompilerParameters expr_276 = compilerParameters;
									expr_276.CompilerOptions = expr_276.CompilerOptions + " " + class31_0.method_14();
								}
								if (string.IsNullOrEmpty(compilerParameters.CompilerOptions))
								{
									compilerParameters.CompilerOptions = null;
								}
								if (@class.list_1 != null && @class.list_1.Count != 0)
								{
									if (!Directory.Exists(text2))
									{
										Directory.CreateDirectory(text2);
									}
									foreach (string current2 in @class.list_1)
									{
										string value = Path.Combine(text2, current2);
										Class16.smethod_132(value, executingAssembly, current2);
										compilerParameters.EmbeddedResources.Add(value);
									}
								}
								compilerParameters.EmbeddedResources.Add(assembly.Location);
								stringBuilder.Append("// " + Path.GetFileName(text4) + "\n").Append("// --------------------------------------------\n//\n").Append("// This SFX source file was generated by DotNetZip ").Append(GClass1.LibraryVersion.ToString()).Append("\n//         at ").Append(DateTime.Now.ToString("yyyy MMMM dd  HH:mm:ss")).Append("\n//\n// --------------------------------------------\n\n\n");
								if (!string.IsNullOrEmpty(class31_0.method_11()))
								{
									stringBuilder.Append("[assembly: System.Reflection.AssemblyTitle(\"" + class31_0.method_11().Replace("\"", "") + "\")]\n");
								}
								else
								{
									stringBuilder.Append("[assembly: System.Reflection.AssemblyTitle(\"DotNetZip SFX Archive\")]\n");
								}
								if (!string.IsNullOrEmpty(class31_0.method_9()))
								{
									stringBuilder.Append("[assembly: System.Reflection.AssemblyInformationalVersion(\"" + class31_0.method_9().Replace("\"", "") + "\")]\n");
								}
								string str = string.IsNullOrEmpty(class31_0.method_10()) ? "Extractor: Copyright © Dino Chiesa 2008-2011" : class31_0.method_10().Replace("\"", "");
								if (!string.IsNullOrEmpty(class31_0.method_12()))
								{
									stringBuilder.Append("[assembly: System.Reflection.AssemblyProduct(\"").Append(class31_0.method_12().Replace("\"", "")).Append("\")]\n");
								}
								else
								{
									stringBuilder.Append("[assembly: System.Reflection.AssemblyProduct(\"DotNetZip\")]\n");
								}
								stringBuilder.Append("[assembly: System.Reflection.AssemblyCopyright(\"" + str + "\")]\n").Append(string.Format("[assembly: System.Reflection.AssemblyVersion(\"{0}\")]\n", GClass1.LibraryVersion.ToString()));
								if (class31_0.method_8() != null)
								{
									stringBuilder.Append(string.Format("[assembly: System.Reflection.AssemblyFileVersion(\"{0}\")]\n", class31_0.method_8().ToString()));
								}
								stringBuilder.Append("\n\n\n");
								string text5 = class31_0.method_3();
								if (text5 != null)
								{
									text5 = text5.Replace("\"", "").Replace("\\", "\\\\");
								}
								string text6 = class31_0.method_2();
								if (text6 != null)
								{
									text6 = text6.Replace("\\", "\\\\");
									text6 = text6.Replace("\"", "\\\"");
								}
								foreach (string current3 in @class.list_2)
								{
									using (Stream stream = Class16.smethod_519(gClass[current3]))
									{
										if (stream == null)
										{
											throw new ZipException(string.Format("missing resource '{0}'", current3));
										}
										using (StreamReader streamReader = new StreamReader(stream))
										{
											while (streamReader.Peek() >= 0)
											{
												string text7 = streamReader.ReadLine();
												if (text5 != null)
												{
													text7 = text7.Replace("@@EXTRACTLOCATION", text5);
												}
												text7 = text7.Replace("@@REMOVE_AFTER_EXECUTE", class31_0.method_7().ToString());
												text7 = text7.Replace("@@QUIET", class31_0.method_5().ToString());
												if (!string.IsNullOrEmpty(class31_0.method_13()))
												{
													text7 = text7.Replace("@@SFX_EXE_WINDOW_TITLE", class31_0.method_13());
												}
												text7 = text7.Replace("@@EXTRACT_EXISTING_FILE", ((int)class31_0.method_6()).ToString());
												if (text6 != null)
												{
													text7 = text7.Replace("@@POST_UNPACK_CMD_LINE", text6);
												}
												stringBuilder.Append(text7).Append("\n");
											}
										}
										stringBuilder.Append("\n\n");
									}
								}
							}
							string text8 = stringBuilder.ToString();
							CompilerResults compilerResults = cSharpCodeProvider.CompileAssemblyFromSource(compilerParameters, new string[]
							{
								text8
							});
							if (compilerResults == null)
							{
								throw new SfxGenerationException("Cannot compile the extraction logic!");
							}
							if (this.textWriter_0 != null)
							{
								foreach (string current4 in compilerResults.Output)
								{
									this.textWriter_0.WriteLine(current4);
								}
							}
							if (compilerResults.Errors.Count != 0)
							{
								using (TextWriter textWriter = new StreamWriter(text4))
								{
									textWriter.Write(text8);
									textWriter.Write("\n\n\n// ------------------------------------------------------------------\n");
									textWriter.Write("// Errors during compilation: \n//\n");
									string fileName = Path.GetFileName(text4);
									foreach (CompilerError compilerError in compilerResults.Errors)
									{
										textWriter.Write(string.Format("//   {0}({1},{2}): {3} {4}: {5}\n//\n", new object[]
										{
											fileName,
											compilerError.Line,
											compilerError.Column,
											compilerError.IsWarning ? "Warning" : "error",
											compilerError.ErrorNumber,
											compilerError.ErrorText
										}));
									}
								}
								throw new SfxGenerationException(string.Format("Errors compiling the extraction logic!  {0}", text4));
							}
							Class16.smethod_308(this, Enum6.const_15);
							using (Stream stream2 = File.OpenRead(text))
							{
								byte[] array2 = new byte[4000];
								int num = 1;
								while (num != 0)
								{
									num = stream2.Read(array2, 0, array2.Length);
									if (num != 0)
									{
										this.WriteStream.Write(array2, 0, num);
									}
								}
							}
							goto IL_8DA;
						}
						else
						{
							i++;
						}
					}
					goto IL_CA;
				}
				IL_8DA:
				Class16.smethod_308(this, Enum6.const_12);
			}
			finally
			{
				try
				{
					if (Directory.Exists(text2))
					{
						try
						{
							Directory.Delete(text2, true);
						}
						catch (IOException arg2)
						{
							this.textWriter_0.WriteLine("Warning: Exception: {0}", arg2);
						}
					}
					if (File.Exists(text))
					{
						try
						{
							File.Delete(text);
						}
						catch (IOException arg3)
						{
							this.textWriter_0.WriteLine("Warning: Exception: {0}", arg3);
						}
					}
				}
				catch (IOException)
				{
				}
			}
		}

		public IEnumerator<GClass0> GetEnumerator()
		{
			GClass1.Class28 @class = new GClass1.Class28(0);
			@class.gclass1_0 = this;
			return @class;
		}

		IEnumerator IEnumerable.GetEnumerator()
		{
			return this.System.Collections.Generic.IEnumerable<ns15.GClass0>.GetEnumerator();
		}

		[DispId(-4)]
		public IEnumerator method_3()
		{
			return this.System.Collections.Generic.IEnumerable<ns15.GClass0>.GetEnumerator();
		}
	}
}
