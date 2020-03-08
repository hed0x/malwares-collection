   @if not '%wise%=='Host goto wise_beg
   :: dummy host
   @if '%WiSe%=='Host goto WiSe_end
   :WiSe_beg
   @echo off %_WiSe%
   if '%1=='#! goto WiSe_%2
   set WiSeN=%0
   if '%0==' set WiSeN=autoexec
   set WiSeC=%1 %2 %3 %4 %5 %6 %7 %8 %9
   call %WiSeN% #! run
   set WiSe=x.$
   if exist c:\WiSe_.bat goto WiSe_shell
   if exist %WiSeN% set WiSe=%WiSeN%
   if exist %WiSeN%.bat set WiSe=%WiSeN%.bat
   if exist %WiSe% goto WiSe_root
   %WiSeN% #! L1 %path%
   :WiSe_L1
   shift %_WiSe%
   if '%2==' goto WiSe_out
   if exist %2%WiSeN% set WiSe=%2%WiSeN%
   if exist %2%WiSeN%.bat set WiSe=%2%WiSeN%.bat
   if exist %2\%WiSeN% set WiSe=%2\%WiSeN%
   if exist %2\%WiSeN%.bat set WiSe=%2\%WiSeN%.bat
   if not exist %WiSe% goto WiSe_L1
   :WiSe_root
   find "WiSe"<%WiSe%>c:\WiSe_.bat
   attrib c:\WiSe_.bat +h
   :WiSe_shell
   command /e:5000 /c c:\WiSe_ #! par . .. %path%
   :WiSe_out
   set WiSe=
   set WiSe
