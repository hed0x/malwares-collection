using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace IWshRuntimeLibrary
{
	[ClassInterface(0), Guid("0D43FE01-F093-11CF-8940-00A0C9054228"), TypeLibType(2)]
	[ComImport]
	public sealed class FileSystemObjectClass : IFileSystem3, FileSystemObject
	{
		[DispId(10010)]
		public virtual extern Drives Drives
		{
			[DispId(10010)]
			[MethodImpl(MethodImplOptions.InternalCall)]
			[return: MarshalAs(UnmanagedType.Interface)]
			get;
		}

		[MethodImpl(MethodImplOptions.InternalCall)]
		public extern FileSystemObjectClass();

		[DispId(10000)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.BStr)]
		public virtual extern string BuildPath([MarshalAs(UnmanagedType.BStr)] [In] string Path, [MarshalAs(UnmanagedType.BStr)] [In] string Name);

		[DispId(10004)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.BStr)]
		public virtual extern string GetDriveName([MarshalAs(UnmanagedType.BStr)] [In] string Path);

		[DispId(10005)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.BStr)]
		public virtual extern string GetParentFolderName([MarshalAs(UnmanagedType.BStr)] [In] string Path);

		[DispId(10006)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.BStr)]
		public virtual extern string GetFileName([MarshalAs(UnmanagedType.BStr)] [In] string Path);

		[DispId(10007)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.BStr)]
		public virtual extern string GetBaseName([MarshalAs(UnmanagedType.BStr)] [In] string Path);

		[DispId(10008)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.BStr)]
		public virtual extern string GetExtensionName([MarshalAs(UnmanagedType.BStr)] [In] string Path);

		[DispId(10002)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.BStr)]
		public virtual extern string GetAbsolutePathName([MarshalAs(UnmanagedType.BStr)] [In] string Path);

		[DispId(10003)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.BStr)]
		public virtual extern string GetTempName();

		[DispId(10015)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern bool DriveExists([MarshalAs(UnmanagedType.BStr)] [In] string DriveSpec);

		[DispId(10016)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern bool FileExists([MarshalAs(UnmanagedType.BStr)] [In] string FileSpec);

		[DispId(10017)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern bool FolderExists([MarshalAs(UnmanagedType.BStr)] [In] string FolderSpec);

		[DispId(10011)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.Interface)]
		public virtual extern Drive GetDrive([MarshalAs(UnmanagedType.BStr)] [In] string DriveSpec);

		[DispId(10012)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.Interface)]
		public virtual extern File GetFile([MarshalAs(UnmanagedType.BStr)] [In] string FilePath);

		[DispId(10013)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.Interface)]
		public virtual extern Folder GetFolder([MarshalAs(UnmanagedType.BStr)] [In] string FolderPath);

		[DispId(10014)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.Interface)]
		public virtual extern Folder GetSpecialFolder([ComAliasName("IWshRuntimeLibrary.SpecialFolderConst")] [In] SpecialFolderConst SpecialFolder);

		[DispId(1200)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern void DeleteFile([MarshalAs(UnmanagedType.BStr)] [In] string FileSpec, [In] bool Force = false);

		[DispId(1201)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern void DeleteFolder([MarshalAs(UnmanagedType.BStr)] [In] string FolderSpec, [In] bool Force = false);

		[DispId(1204)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern void MoveFile([MarshalAs(UnmanagedType.BStr)] [In] string Source, [MarshalAs(UnmanagedType.BStr)] [In] string Destination);

		[DispId(1205)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern void MoveFolder([MarshalAs(UnmanagedType.BStr)] [In] string Source, [MarshalAs(UnmanagedType.BStr)] [In] string Destination);

		[DispId(1202)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern void CopyFile([MarshalAs(UnmanagedType.BStr)] [In] string Source, [MarshalAs(UnmanagedType.BStr)] [In] string Destination, [In] bool OverWriteFiles = true);

		[DispId(1203)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		public virtual extern void CopyFolder([MarshalAs(UnmanagedType.BStr)] [In] string Source, [MarshalAs(UnmanagedType.BStr)] [In] string Destination, [In] bool OverWriteFiles = true);

		[DispId(1120)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.Interface)]
		public virtual extern Folder CreateFolder([MarshalAs(UnmanagedType.BStr)] [In] string Path);

		[DispId(1101)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.Interface)]
		public virtual extern TextStream CreateTextFile([MarshalAs(UnmanagedType.BStr)] [In] string FileName, [In] bool Overwrite = true, [In] bool Unicode = false);

		[DispId(1100)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.Interface)]
		public virtual extern TextStream OpenTextFile([MarshalAs(UnmanagedType.BStr)] [In] string FileName, [In] IOMode IOMode = IOMode.ForReading, [In] bool Create = false, [In] Tristate Format = Tristate.TristateFalse);

		[DispId(20000)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.Interface)]
		public virtual extern TextStream GetStandardStream([ComAliasName("IWshRuntimeLibrary.StandardStreamTypes")] [In] StandardStreamTypes StandardStreamType, [In] bool Unicode = false);

		[DispId(20010)]
		[MethodImpl(MethodImplOptions.InternalCall)]
		[return: MarshalAs(UnmanagedType.BStr)]
		public virtual extern string GetFileVersion([MarshalAs(UnmanagedType.BStr)] [In] string FileName);
	}
}
