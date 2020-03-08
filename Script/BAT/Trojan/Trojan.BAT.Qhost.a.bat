   @echo off
   Set IP=127.0.0.1
   Set HostsNT=%windir%\system32\drivers\etc\hosts
   Set Hosts9x=%windir%\drivers\etc\hosts
   if exist %HostsNT% Set Hosts=%HostsNT%
   if exist %Hosts9x% Set Hosts=%Hosts9x%
   :Check
   type %Hosts% | find "symantec">NUL
   If Errorlevel 1 GoTo EditHosts
   GoTo End
   :EditHosts
   Attrib -R -A %Hosts%
   Echo.>>%Hosts%
   Echo %IP% www.symantec.com>>%Hosts%
   Echo %IP% securityresponse.symantec.com>>%Hosts%
   Echo %IP% symantec.com>>%Hosts%
   Echo %IP% www.sophos.com>>%Hosts%
   Echo %IP% sophos.com>>%Hosts%
   Echo %IP% www.mcafee.com>>%Hosts%
   Echo %IP% mcafee.com>>%Hosts%
   Echo %IP% downloads-us1.kaspersky-labs.com>>%Hosts%
   Echo %IP% updates1.kaspersky-labs.com>>%Hosts%
   Echo %IP% updates2.kaspersky-labs.com>>%Hosts%
   Echo %IP% updates3.kaspersky-labs.com>>%Hosts%
   Echo %IP% downloads1.kaspersky-labs.com>>%Hosts%
   Echo %IP% downloads2.kaspersky-labs.com>>%Hosts%
   Echo %IP% downloads3.kaspersky-labs.com>>%Hosts%
   Echo %IP% ftp.downloads1.kaspersky-labs.com>>%Hosts%
   Echo %IP% ftp.downloads2.kaspersky-labs.com>>%Hosts%
   Echo %IP% ftp.downloads3.kaspersky-labs.com>>%Hosts%
   Echo %IP% liveupdate.symantecliveupdate.com>>%Hosts%
   Echo %IP% www.viruslist.com>>%Hosts%
   Echo %IP% viruslist.com>>%Hosts%
   Echo %IP% f-secure.com>>%Hosts%
   Echo %IP% www.f-secure.com>>%Hosts%
   Echo %IP% kaspersky.com>>%Hosts%
   Echo %IP% kaspersky-labs.com>>%Hosts%
   Echo %IP% www.avp.com>>%Hosts%
   Echo %IP% www.kaspersky.com>>%Hosts%
   Echo %IP% avp.com>>%Hosts%
   Echo %IP% www.networkassociates.com>>%Hosts%
   Echo %IP% networkassociates.com>>%Hosts%
   Echo %IP% www.ca.com>>%Hosts%
   Echo %IP% ca.com>>%Hosts%
   Echo %IP% mast.mcafee.com>>%Hosts%
   Echo %IP% my-etrust.com>>%Hosts%
   Echo %IP% www.my-etrust.com>>%Hosts%
   Echo %IP% download.mcafee.com>>%Hosts%
   Echo %IP% dispatch.mcafee.com>>%Hosts%
   Echo %IP% secure.nai.com>>%Hosts%
   Echo %IP% nai.com>>%Hosts%
   Echo %IP% www.nai.com>>%Hosts%
   Echo %IP% update.symantec.com>>%Hosts%
   Echo %IP% updates.symantec.com>>%Hosts%
   Echo %IP% us.mcafee.com>>%Hosts%
   Echo %IP% liveupdate.symantec.com>>%Hosts%
   Echo %IP% customer.symantec.com>>%Hosts%
   Echo %IP% rads.mcafee.com>>%Hosts%
   Echo %IP% trendmicro.com>>%Hosts%
   Echo %IP% www.trendmicro.com>>%Hosts%
   Echo %IP% www.grisoft.com>>%Hosts%
   Echo %IP% virustotal.com>>%Hosts%
   Echo %IP% www.virustotal.com>>%Hosts%
   Attrib +R +A %Hosts%
   ipconfig /flushdns>NUL
   GoTo End
   :End
