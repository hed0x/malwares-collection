   {************************************************************************}
   {  SMTP Engine 0.96 by Positron                                          }
   {  URL: http://www.virustrading.com/positron                             }
   {                                                                        }
   {  Send email without Internet SMTP server (connects direcly to the      }
   {  recipient's server)                                                   }
   {                                                                        }
   {  Tested on Windows XP. Write me if you find any error in the code!     }
   {                                                                        }
   {  IF you use this source then you must credit Positron. You can freely  }
   {  use this source in NON-Commercial applications.                       }
   {                                                                        }
   {  Notice:                                                               }
   {    You can use ACLUnits and KOL System replacement units if you want   }
   {    to make its compiled size smaller.                                  }
   {    You have to remove "$DEFINE Debug"  from all units if you want to   }
   {    run it in GUI mode.                                                 }
   {************************************************************************}
   {  History:                                                              }
   {     v0.8    - First working version.                                   }
   {     v0.9    - First public version.                                    }
   {     v0.92   - Some bug fixed.                                          }
   {     v0.93   - Some optimalisations.                                    }
   {     v0.94   - Fixed DNS problems under W95/NT,                         }
   {             - Debug mode added.                                        }
   {     v0.95   - Fixed a bug in MXResolver.                               }
   {     v0.96   - Added asm version of Base-64 encoding,                   }
   {             - Smaller and faster code.                                 }
   {************************************************************************}

   {$DEFINE Debug}

   UNIT Email;

   INTERFACE

   USES
     Windows, MXResolver, WinSock, StrList;

   TYPE
     TSMTPEngine = CLASS(TObject)
     PRIVATE
       Sock    : TSocket;
       FileBuf : AnsiString;
       FUNCTION MySend(STR:STRING) : Boolean;
       FUNCTION MyRecv(Code:STRING) : Boolean;
       FUNCTION NameToIP(HostName:STRING) : STRING;
       FUNCTION ExtractFileName(CONST FileName:ShortString) : ShortString;
     PUBLIC
       Recip, Body, From, Subject, Attachment : AnsiString;
       FUNCTION SendEmail : Boolean;
   END;

   PROCEDURE Base64Encode(CONST InBuffer;InSize:Cardinal;VAR OutBuffer); OVERLOAD; REGISTER;
   PROCEDURE Base64Encode(CONST InText:AnsiString;VAR OutText:AnsiString); OVERLOAD;

   IMPLEMENTATION

   FUNCTION TSMTPEngine.NameToIP(HostName:STRING) : STRING;
   TYPE
     TAPInAddr = ARRAY [0..100] OF PInAddr;
     PAPInAddr =^TAPInAddr;
   VAR
     I          : Integer;
     WSAData    : TWSAData;
     HostEntPtr : PHostEnt;
     pptr       : PAPInAddr;
   BEGIN
     Result:='';
     WSAStartUp($101,WSAData);
     TRY
       HostEntPtr:=GetHostByName(pChar(HostName));
       IF HostEntPtr<>NIL THEN BEGIN
         pptr:=PAPInAddr(HostEntPtr^.h_addr_list);
         I:=0;
         WHILE pptr^[I]<>NIL DO BEGIN
           Result:=(inet_ntoa(pptr^[I]^));
           Inc(I);
         END;
       END;
     EXCEPT
     END;
     WSACleanUp();
   END;

   PROCEDURE Base64Encode(CONST InBuffer;InSize:Cardinal;VAR OutBuffer); REGISTER;
   CONST
     cBase64Codec : ARRAY [0..63] OF AnsiChar = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
   VAR
     ByThrees : Cardinal;
     LeftOver : Cardinal;
     Line     : Word;
   ASM
     mov ESI,[EAX]
     mov EDI,[ECX]
     mov EAX,EBX
     mov ECX,$03
     xor EDX,EDX
     div ECX
     mov ByThrees,EAX
     mov LeftOver,EDX
     lea ECX,cBase64Codec[0]
     xor EAX,EAX
     xor EBX,EBX
     xor EDX,EDX
     cmp ByThrees,0
     jz  @@LeftOver
     mov Line,0
     @@LoopStart:
     inc Line
     LODSW
     mov BL,AL
     shr BL,2
     mov DL,BYTE PTR [ECX+EBX]
     mov BH,AH
     and BH,$0F
     rol AX,4
     and AX,$3F
     mov DH,BYTE PTR [ECX+EAX]
     mov AX,DX
     STOSW
     LODSB
     mov BL,AL
     shr BX,6
     mov DL,BYTE PTR [ECX+EBX]
     and AL,$3F
     xor AH,AH
     mov DH,BYTE PTR [ECX+EAX]
     mov AX,DX
     STOSW
     cmp Line,19
     jnz @@ugor
     mov AX,$0A0D
     STOSW
     mov Line,0
     @@ugor:
     dec ByThrees
     jnz @@LoopStart
     @@LeftOver:
     cmp LeftOver, 0
     jz  @@Done
     xor EAX,EAX
     xor EBX,EBX
     xor EDX,EDX
     LODSB
     shl AX,6
     mov BL,AH
     mov DL,BYTE PTR [ECX+EBX]
     dec LeftOver
     jz  @@SaveOne
     shl AX,2
     and AH,$03
     LODSB
     shl AX,4
     mov BL,AH
     mov DH,BYTE PTR [ECX+EBX]
     shl EDX,16
     shr AL,2
     mov BL,AL
     mov DL,BYTE PTR [ECX+EBX]
     mov DH,'='
     jmp @@WriteLast4
     @@SaveOne:
     shr AL,2
     mov BL,AL
     mov DH,BYTE PTR [ECX+EBX]
     shl EDX,16
     mov DH,'='
     mov DL,'='
     @@WriteLast4:
     mov EAX,EDX
     ror EAX,16
     STOSD
     @@Done:
   END;

   PROCEDURE Base64Encode(CONST InText:AnsiString;VAR OutText:AnsiString); OVERLOAD;
   VAR
     PIn     : Pointer;
     POut    : Pointer;
     InSize  : Cardinal;
     OutSize : Cardinal;
   BEGIN
     InSize:=Length(InText);
     OutSize:=(InSize DIV 3) SHL 2;
     IF InSize MOD 3>0 THEN Inc(OutSize,4);
     Outsize:=Outsize+Outsize DIV 20;
     SetLength(OutText,OutSize);
     PIn:=@InText[1];
     POut:=@OutText[1];
     Base64Encode(PIn,InSize,POut);
   END;

   FUNCTION TSMTPEngine.MySend(STR:STRING) : Boolean;
   BEGIN
     IF Send(Sock,STR[1],Length(STR),0)=SOCKET_ERROR THEN Result:=True ELSE Result:=False;
   END;

   FUNCTION TSMTPEngine.ExtractFileName(CONST FileName:ShortString) : ShortString;
   VAR
     I : Integer;
   BEGIN
     I:=Length(FileName);
     WHILE (I>=1)AND NOT(FileName[I] IN ['\', ':']) DO Dec(I);
     Result:=Copy(FileName,I+1,255);
   END;

   FUNCTION TSMTPEngine.MyRecv(Code:STRING) : Boolean;
   VAR
     Buf : ARRAY [0..2048] OF Char;
   BEGIN
     ZeroMemory(@Buf[0],SizeOf(Buf));
     IF(Recv(Sock,Buf,SizeOf(Buf),0)=SOCKET_ERROR)OR(Copy(Buf,1,3)<>Code) THEN Result:=False ELSE Result:=True;
     {$IFDEF Debug}
       Write(Buf);
     {$ENDIF}
   END;

   FUNCTION TSMTPEngine.SendEmail : Boolean;
   VAR
     I          : Byte;
     F          : FILE;
     WSAData    : TWSAData;
     P          : AnsiString;
     MXResolver : TMXResolver;
     SockAddrIn : TSockAddrIn;
   BEGIN
     Result:=False;
     MXResolver:=TMXResolver.Create(Copy(Recip,Pos('@',Recip)+1,Length(Recip)));
     IF MXResolver.ListOfSMTPServers.Count=0 THEN Exit;
     FOR I:=0 TO MXResolver.ListOfSMTPServers.Count-1 DO BEGIN
       IF MXResolver.ListOfSMTPServers.Strings(I)<>'' THEN BEGIN
         {$IFDEF Debug}
           Writeln('Send mail:'#13#10);
         {$ENDIF}
         WSAStartUp(257,WSAData);
         Sock:=Socket(AF_INET,SOCK_STREAM,IPPROTO_IP);
         SockAddrIn.sin_family:=AF_INET;
         SockAddrIn.sin_port:=htons(25);
         SockAddrIn.sin_addr.S_addr:=inet_addr(pChar(NameToIP(MXResolver.ListOfSMTPServers.Strings(I))));
         Connect(Sock,SockAddrIn,SizeOf(SockAddrIn));
         IF NOT MyRecv('220') THEN Break;
         MySend('HELO net.com'#13#10);
         IF NOT MyRecv('250') THEN Break;
         MySend('MAIL FROM: <'+From+'>'#13#10);
         IF NOT MyRecv('250') THEN Break;
         MySend('RCPT TO: <'+Recip+'>'#13#10);
         IF NOT MyRecv('250') THEN Break;
         MySend('DATA'#13#10);
         IF NOT MyRecv('354') THEN Break;
         MySend('From: '+From+#13#10+
                'To: '+Recip+#13#10+
                'Subject: '+Subject+#13#10+
                'MIME-Version: 1.0'#13#10+
                'Content-Type: multipart/mixed; boundary="bla"'#13#10#13#10+
                '--bla'#13#10+
                'Content-Type: text/plain; charset:us-ascii'#13#10#13#10+
                Body+#13#10#13#10+
                '--bla'+#13#10+
                'Content-Type: application/x-shockwave-flash;'#13#10+
                '    name="'+ExtractFileName(Attachment)+'"'#13#10+
                'Content-Transfer-Encoding: base64'#13#10#13#10);
         AssignFile(F,Attachment);
         FileMode:=0;
         {$I-}
         Reset(F,1);
         IF IOResult=0 THEN BEGIN
           SetLength(FileBuf,FileSize(F));
           BlockRead(F,FileBuf[1],FileSize(F));
           Base64Encode(FileBuf,P);
           MySend(P);
           CloseFile(F);
         END;
         {$I+}
         MySend(#13#10'--bla--'#13#10'.'#13#10);
         IF NOT MyRecv('250') THEN Break;
         MySend('QUIT'#13#10);
         Result:=True;
         WSACleanup();
         Exit;
       END;
     END;
   END;

   END.
