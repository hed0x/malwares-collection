   dirent_ino    equ 0 ;dword
   dirent_off    equ 4 ;dword
   dirent_reclen equ 8 ;word
   dirent_name   equ 10    ;NAME_MAX
     sizeof_dirent equ 265

   stat_dev    equ 0h
   stat_pad1   equ 2h
   stat_ino    equ 4h
   stat_mode   equ 8h
   stat_nlink  equ 0ah
   stat_uid    equ 0ch
   stat_gid    equ 0eh
   stat_rdev   equ 10h
   stat_pad2   equ 12h
   stat_size   equ 14h
   stat_blksize    equ 18h
   stat_blocks equ 1ch
   stat_atime  equ 20h
   stat_unused1    equ 24h
   stat_mtime  equ 28h
   stat_unused2    equ 2ch
   stat_ctime  equ 30h
   stat_unused3    equ 34h
   stat_unused4    equ 38h
   stat_unused5    equ 3ch
     sizeof_stat equ 40h

   param1 equ 4
   param2 equ 8
   param3 equ 12
   param4 equ 16
   param5 equ 20

   _Push equ 4

   _Pushad equ 8*4

   _Pushad_eax equ 7*4
   _Pushad_ecx equ 6*4
   _Pushad_edx equ 5*4
   _Pushad_ebx equ 4*4
   _Pushad_esp equ 3*4
   _Pushad_ebp equ 2*4
   _Pushad_esi equ 1*4
   _Pushad_edi equ 0*4

   %define SEEK_SET    0
   %define SEEK_CUR    1
   %define SEEK_END    2

   %define O_RDONLY    0
   %define O_WRONLY    1
   %define O_RDWR      2
   %define O_ACCMODE   3
   %define O_CREAT     100q
   %define O_EXCL      200q
   %define O_NOCTTY    400q
   %define O_TRUNC     1000q
   %define O_APPEND    2000q
   %define O_NONBLOCK  4000q
   %define O_NDELAY    O_NONBLOCK
   %define O_SYNC       10000q
   %define FASYNC       20000q
   %define O_DIRECT     40000q
   %define O_LARGEFILE 100000q
   %define O_DIRECTORY 200000q
   %define O_NOFOLLOW  400000q

   %define F_DUPFD     0   ;Duplicate file descriptor
   %define F_GETFD     1   ;Get file descriptor flags
   %define F_SETFD     2   ;Set file descriptor flags
   %define F_GETFL     3   ;Get file status flags
   %define F_SETFL     4   ;Set file status flags
   %define F_GETLK     5   ;Get record locking info
   %define F_SETLK     6   ;Set record locking info (non-blocking)
   %define F_SETLKW    7   ;Set record locking info (blocking)


   ;
   ;unistd.h
   ;

   %define R_OK    4   ; read
   %define W_OK    2   ; write
   %define X_OK    1   ; execute
   %define F_OK    0   ; existence

   ;
   ;signal.h
   ;

   %define SIG_DFL     0
   %define SIG_IGN     1
   %define SIG_ERR     -1

   %define SIGHUP      1   ;Hangup (POSIX)
   %define SIGINT      2   ;Interrupt (ANSI)
   %define SIGQUIT     3   ;Quit (POSIX)
   %define SIGILL      4   ;Illegal instruction (ANSI)
   %define SIGTRAP     5   ;Trace trap (POSIX)
   %define SIGABRT     6   ;Abort (ANSI)
   %define SIGIOT      6   ;IOT trap (4.2 BSD)
   %define SIGBUS      7   ;BUS error (4.2 BSD)
   %define SIGFPE      8   ;Floating-point exception (ANSI)
   %define SIGKILL     9   ;Kill, unblockable (POSIX)
   %define SIGUSR1     10  ;User-defined signal 1 (POSIX)
   %define SIGSEGV     11  ;Segmentation violation (ANSI)
   %define SIGUSR2     12  ;User-defined signal 2 (POSIX)
   %define SIGPIPE     13  ;Broken pipe (POSIX)
   %define SIGALRM     14  ;Alarm clock (POSIX)
   %define SIGTERM     15  ;Termination (ANSI)
   %define SIGSTKFLT   16  ;Stack fault
   %define SIGCHLD     17  ;Child status has changed (POSIX)
   %define SIGCLD      SIGCHLD ;Same as SIGCHLD (System V)
   %define SIGCONT     18  ;Continue (POSIX)
   %define SIGSTOP     19  ;Stop, unblockable (POSIX)
   %define SIGTSTP     20  ;Keyboard stop (POSIX)
   %define SIGTTIN     21  ;Background read from tty (POSIX)
   %define SIGTTOU     22  ;Background write to tty (POSIX)
   %define SIGURG      23  ;Urgent condition on socket (4.2 BSD)
   %define SIGXCPU     24  ;CPU limit exceeded (4.2 BSD)
   %define SIGXFSZ     25  ;File size limit exceeded (4.2 BSD)
   %define SIGVTALRM   26  ;Virtual alarm clock (4.2 BSD)
   %define SIGPROF     27  ;Profiling alarm clock (4.2 BSD)
   %define SIGWINCH    28  ;Window size change (4.3 BSD, Sun)
   %define SIGIO       29  ;I/O now possible (4.2 BSD)
   %define SIGPOLL     SIGIO   ;Pollable event occurred (System V)
   %define SIGPWR      30  ;Power failure restart (System V)
   %define SIGUNUSED   31
   %define _NSIG       64  ;Biggest signal number + 1

   ;
   ;limits.h
   ;

   %define NAME_MAX    255
   %define PATH_MAX    4095

   ;
   ;wait.h
   ;

   %define WNOHANG     1
   %define WUNTRACED   2

   ;
   ;sys/ptrace.h
   ;

   %define PT_TRACEME 0
   %define PT_PEEKDATA 2
   %define PT_GETREGS 012
   %define PT_SETREGS 013
   %define PT_POKEDATA 5
   %define PT_CONT 7
   %define PT_KILL 8
   %define PT_DETACH 0x11
   %define PT_SINGLESTEP 9

   ;
   ;sys/socket.h
   ;

   %define AF_UNSPEC   0
   %define AF_UNIX     1   ; Unix domain sockets
   %define AF_LOCAL    1   ; POSIX name for AF_UNIX
   %define AF_INET     2   ; Internet IP Protocol
   %define AF_AX25     3   ; Amateur Radio AX.25
   %define AF_IPX      4   ; Novell IPX
   %define AF_APPLETALK    5   ; AppleTalk DDP
   %define AF_NETROM   6   ; Amateur Radio NET/ROM
   %define AF_BRIDGE   7   ; Multiprotocol bridge
   %define AF_ATMPVC   8   ; ATM PVCs
   %define AF_X25      9   ; Reserved for X.25 project
   %define AF_INET6    10  ; IP version 6
   %define AF_ROSE     11  ; Amateur Radio X.25 PLP
   %define AF_DECnet   12  ; Reserved for DECnet project
   %define AF_NETBEUI  13  ; Reserved for 802.2LLC project
   %define AF_SECURITY 14  ; Security callback pseudo AF
   %define AF_KEY      15  ; PF_KEY key management API
   %define AF_NETLINK  16
   %define AF_ROUTE    AF_NETLINK  ; Alias to emulate 4.4BSD
   %define AF_PACKET   17  ; Packet family
   %define AF_ASH      18  ; Ash
   %define AF_ECONET   19  ; Acorn Econet
   %define AF_ATMSVC   20  ; ATM SVCs
   %define AF_SNA      22  ; Linux SNA Project (nutters!)
   %define AF_IRDA     23  ; IRDA sockets
   %define AF_MAX      32  ; For now..

   %define PF_UNSPEC   AF_UNSPEC
   %define PF_UNIX     AF_UNIX
   %define PF_LOCAL    AF_LOCAL
   %define PF_INET     AF_INET
   %define PF_AX25     AF_AX25
   %define PF_IPX      AF_IPX
   %define PF_APPLETALK    AF_APPLETALK
   %define PF_NETROM   AF_NETROM
   %define PF_BRIDGE   AF_BRIDGE
   %define PF_ATMPVC   AF_ATMPVC
   %define PF_X25      AF_X25
   %define PF_INET6    AF_INET6
   %define PF_ROSE     AF_ROSE
   %define PF_DECnet   AF_DECnet
   %define PF_NETBEUI  AF_NETBEUI
   %define PF_SECURITY AF_SECURITY
   %define PF_KEY      AF_KEY
   %define PF_NETLINK  AF_NETLINK
   %define PF_ROUTE    AF_ROUTE
   %define PF_PACKET   AF_PACKET
   %define PF_ASH      AF_ASH
   %define PF_ECONET   AF_ECONET
   %define PF_ATMSVC   AF_ATMSVC
   %define PF_SNA      AF_SNA
   %define PF_IRDA     AF_IRDA
   %define PF_MAX      AF_MAX

   %define SOCK_STREAM    1    ;stream (connection) socket
   %define SOCK_DGRAM     2    ;datagram (conn.less) socket
   %define SOCK_RAW       3    ;raw socket
   %define SOCK_RDM       4    ;reliably-delivered message
   %define SOCK_SEQPACKET 5    ;sequential packet socket
   %define SOCK_PACKET    10   ;linux specific way of getting packets at the dev level

   %define IPPROTO_IP      0       ; Dummy protocol for TCP
   %define IPPROTO_HOPOPTS     0       ; IPv6 Hop-by-Hop options
   %define IPPROTO_ICMP        1       ; Internet Control Message Protocol
   %define IPPROTO_IGMP        2       ; Internet Group Management Protocol
   %define IPPROTO_IPIP        4       ; IPIP tunnels (older KA9Q tunnels use 94)
   %define IPPROTO_TCP     6       ; Transmission Control Protocol
   %define IPPROTO_EGP     8       ; Exterior Gateway Protocol
   %define IPPROTO_PUP     12      ; PUP protocol
   %define IPPROTO_UDP     17      ; User Datagram Protocol
   %define IPPROTO_IDP     22      ; XNS IDP protocol
   %define IPPROTO_TP      29      ; SO Transport Protocol Class 4
   %define IPPROTO_IPV6        41      ; IPv6 header
   %define IPPROTO_ROUTING     43      ; IPv6 routing header
   %define IPPROTO_FRAGMENT    44      ; IPv6 fragmentation header
   %define IPPROTO_RSVP        46      ; Reservation Protocol
   %define IPPROTO_GRE     47      ; General Routing Encapsulation
   %define IPPROTO_ESP     50      ; encapsulating security payload
   %define IPPROTO_AH      51      ; authentication header
   %define IPPROTO_ICMPV6      58      ; ICMPv6
   %define IPPROTO_NONE        59      ; IPv6 no next header
   %define IPPROTO_DSTOPTS     60      ; IPv6 destination options
   %define IPPROTO_MTP     92      ; Multicast Transport Protocol
   %define IPPROTO_ENCAP       98      ; Encapsulation Header
   %define IPPROTO_PIM     103     ; Protocol Independent Multicast
   %define IPPROTO_RAW     255     ; Raw IP packets

   ;
   ; netinet/ip_icmp.h
   ;

   %define ICMP_ECHOREPLY          0       ; Echo Reply
   %define ICMP_DEST_UNREACH       3       ; Destination Unreachable
   %define ICMP_SOURCE_QUENCH      4       ; Source Quench
   %define ICMP_REDIRECT           5       ; Redirect (change route)
   %define ICMP_ECHO               8       ; Echo Request
   %define ICMP_TIME_EXCEEDED      11      ; Time Exceeded
   %define ICMP_PARAMETERPROB      12      ; Parameter Problem
   %define ICMP_TIMESTAMP          13      ; Timestamp Request
   %define ICMP_TIMESTAMPREPLY     14      ; Timestamp Reply
   %define ICMP_INFO_REQUEST       15      ; Information Request
   %define ICMP_INFO_REPLY         16      ; Information Reply
   %define ICMP_ADDRESS            17      ; Address Mask Request
   %define ICMP_ADDRESSREPLY       18      ; Address Mask Reply
   %define NR_ICMP_TYPES           18

   ; Codes for UNREACH.
   %define ICMP_NET_UNREACH        0       ; Network Unreachable
   %define ICMP_HOST_UNREACH       1       ; Host Unreachable
   %define ICMP_PROT_UNREACH       2       ; Protocol Unreachable
   %define ICMP_PORT_UNREACH       3       ; Port Unreachable
   %define ICMP_FRAG_NEEDED        4       ; Fragmentation Needed/DF set
   %define ICMP_SR_FAILED          5       ; Source Route failed
   %define ICMP_NET_UNKNOWN        6
   %define ICMP_HOST_UNKNOWN       7
   %define ICMP_HOST_ISOLATED      8
   %define ICMP_NET_ANO            9
   %define ICMP_HOST_ANO           10
   %define ICMP_NET_UNR_TOS        11
   %define ICMP_HOST_UNR_TOS       12
   %define ICMP_PKT_FILTERED       13      ; Packet filtered
   %define ICMP_PREC_VIOLATION     14      ; Precedence violation
   %define ICMP_PREC_CUTOFF        15      ; Precedence cut off
   %define NR_ICMP_UNREACH         15      ; instead of hardcoding immediate value

   ; Codes for REDIRECT.
   %define ICMP_REDIR_NET          0       ; Redirect Net
   %define ICMP_REDIR_HOST         1       ; Redirect Host
   %define ICMP_REDIR_NETTOS       2       ; Redirect Net for TOS
   %define ICMP_REDIR_HOSTTOS      3       ; Redirect Host for TOS

   ; Codes for TIME_EXCEEDED.
   %define ICMP_EXC_TTL            0       ; TTL count exceeded
   %define ICMP_EXC_FRAGTIME       1       ; Fragment Reass time exceeded

   %define PROT_READ   0x1
   %define PROT_WRITE  0x2
   %define PROT_EXEC   0x4
   %define PROT_NONE   0x0

   %define MAP_SHARED  0x01
   %define MAP_PRIVATE 0x02
   %define MAP_TYPE    0x0f
   %define MAP_FIXED   0x10
   %define MAP_ANONYMOUS   0x20

   ;
   ;sys/stat.h
   ;

   %define S_ISUID 0004000q    ;set user id on execution
   %define S_ISGID 0002000q    ;set group id on execution
   %define S_ISTXT 0001000q    ;sticky bit

   %define S_IRWXU 0000700q    ;RWX mask for owner
   %define S_IRUSR 0000400q    ;R for owner
   %define S_IWUSR 0000200q    ;W for owner
   %define S_IXUSR 0000100q    ;X for owner

   %define S_IREAD     S_IRUSR
   %define S_IWRITE    S_IWUSR
   %define S_IEXEC     S_IXUSR

   %define S_IRWXG 0000070q    ;RWX mask for group
   %define S_IRGRP 0000040q    ;R for group
   %define S_IWGRP 0000020q    ;W for group
   %define S_IXGRP 0000010q    ;X for group

   %define S_IRWXO 0000007q    ;RWX mask for other
   %define S_IROTH 0000004q    ;R for other
   %define S_IWOTH 0000002q    ;W for other
   %define S_IXOTH 0000001q    ;X for other

   %define S_IFMT   0170000q   ;type of file mask
   %define S_IFIFO  0010000q   ;named pipe (fifo)
   %define S_IFCHR  0020000q   ;character special
   %define S_IFDIR  0040000q   ;directory
   %define S_IFBLK  0060000q   ;block special
   %define S_IFREG  0100000q   ;regular
   %define S_IFLNK  0120000q   ;symbolic link
   %define S_IFSOCK 0140000q   ;socket
   %define S_IFWHT  0160000q   ;whiteout
   %define S_ISVTX  0001000q   ;save swapped text even after use

   ;
   ;sys/poll.h
   ;

   %define POLLIN      0x0001   ;There is data to read
   %define POLLPRI     0x0002   ;There is urgent data to read
   %define POLLOUT     0x0004   ;Writing now will not block
   %define POLLERR     0x0008   ;Error condition
   %define POLLHUP     0x0010   ;Hung up
   %define POLLNVAL    0x0020   ;Invalid request: fd not open

   ;
   ;sys/resource.h
   ;

   %define PRIO_PROCESS    0
   %define PRIO_PGRP   1
   %define PRIO_USER   2
