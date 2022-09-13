// Decompiled with JetBrains decompiler
// Type: Complex.Shortcut
// Assembly: Client-2, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 10231E92-BCE6-4007-A463-67D77912E754
// Assembly location: C:\Users\WDAGUtilityAccount\Desktop\5d40615701c48a122e44f831e7c8643d07765629a83b15d090587f469c77693d

using System;
using System.Reflection;
using System.Runtime.InteropServices;

namespace Complex
{
  public class Shortcut
  {
    private static Type m_type = Type.GetTypeFromProgID(Program.Base64Decode("V1NjcmlwdC5TaGVsbA=="));
    private static object m_shell = Activator.CreateInstance(Shortcut.m_type);

    public static void Create(
      string fileName,
      string targetPath,
      string arguments,
      string workingDirectory,
      string description,
      string hotkey,
      string iconPath)
    {
      Shortcut.IWshShortcut wshShortcut = (Shortcut.IWshShortcut) Shortcut.m_type.InvokeMember(Program.Base64Decode("Q3JlYXRlU2hvcnRjdXQ="), BindingFlags.InvokeMethod, (Binder) null, Shortcut.m_shell, new object[1]
      {
        (object) fileName
      });
      wshShortcut.Description = description;
      wshShortcut.Hotkey = hotkey;
      wshShortcut.TargetPath = targetPath;
      wshShortcut.WorkingDirectory = workingDirectory;
      wshShortcut.Arguments = arguments;
      if (!string.IsNullOrEmpty(iconPath))
        wshShortcut.IconLocation = iconPath;
      wshShortcut.Save();
    }

    [Guid("F935DC23-1CF0-11D0-ADB9-00C04FD58A0B")]
    [TypeLibType(4160)]
    [ComImport]
    private interface IWshShortcut
    {
      [DispId(0)]
      string FullName { [DispId(0)] [return: MarshalAs(UnmanagedType.BStr)] get; }

      [DispId(1000)]
      string Arguments { [DispId(1000)] [return: MarshalAs(UnmanagedType.BStr)] get; [DispId(1000)] [param: MarshalAs(UnmanagedType.BStr), In] set; }

      [DispId(1001)]
      string Description { [DispId(1001)] [return: MarshalAs(UnmanagedType.BStr)] get; [DispId(1001)] [param: MarshalAs(UnmanagedType.BStr), In] set; }

      [DispId(1002)]
      string Hotkey { [DispId(1002)] [return: MarshalAs(UnmanagedType.BStr)] get; [DispId(1002)] [param: MarshalAs(UnmanagedType.BStr), In] set; }

      [DispId(1003)]
      string IconLocation { [DispId(1003)] [return: MarshalAs(UnmanagedType.BStr)] get; [DispId(1003)] [param: MarshalAs(UnmanagedType.BStr), In] set; }

      [DispId(1004)]
      string RelativePath { [DispId(1004)] [param: MarshalAs(UnmanagedType.BStr), In] set; }

      [DispId(1005)]
      string TargetPath { [DispId(1005)] [return: MarshalAs(UnmanagedType.BStr)] get; [DispId(1005)] [param: MarshalAs(UnmanagedType.BStr), In] set; }

      [DispId(1006)]
      int WindowStyle { [DispId(1006)] get; [DispId(1006)] [param: In] set; }

      [DispId(1007)]
      string WorkingDirectory { [DispId(1007)] [return: MarshalAs(UnmanagedType.BStr)] get; [DispId(1007)] [param: MarshalAs(UnmanagedType.BStr), In] set; }

      [DispId(2000)]
      [TypeLibFunc(64)]
      void Load([MarshalAs(UnmanagedType.BStr), In] string PathLink);

      [DispId(2001)]
      void Save();
    }
  }
}
