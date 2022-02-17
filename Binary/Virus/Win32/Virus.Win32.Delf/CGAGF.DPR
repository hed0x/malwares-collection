program CGAGF;

// WhiteHead's cyclic groups and generator finder.


{$O+,V+,X+,P+,H+,I+,D+}

uses
  Windows, Messages;

{$R cgagf.res}
{$I cgagf.inc}

//{$DEFINE DEBUG}

type
 TSize = array [1..4] of integer;
const
 ButtonsNumber    = 5;
 LabelsNumber     = 7;
 EditsNumber      = 5;
 ListBoxesNumber  = 3;
//-------[ Buttons ]---------------------------------------------------------------------------------------------------
 ButtonPos : array [1..ButtonsNumber] of TSize=(
  (142, 8, 80, 14),(8, 60, 140, 128),(150, 60, 280, 128),(142, 36, 80, 14),(142, 22, 80, 14));

 ButtonType : array [1..ButtonsNumber] of Integer=(
  WS_VISIBLE or WS_CHILD or BS_PUSHLIKE or BS_TEXT,
  WS_VISIBLE or WS_CHILD or BS_GROUPBOX,
  WS_VISIBLE or WS_CHILD or BS_GROUPBOX,
  WS_VISIBLE or WS_CHILD or BS_PUSHLIKE or BS_TEXT,
  WS_VISIBLE or WS_CHILD or BS_PUSHLIKE or BS_TEXT);

 ButtonCaption : array [1..ButtonsNumber] of PChar =(
  'Find', 'Group generators', 'Powers of generator', 'Exit', 'About');

//-------[ Labels ]---------------------------------------------------------------------------------------------------

 LabelPos : array [1..LabelsNumber] of TSize=(
  (8, 12, 76, 16),(8, 34, 76, 16),(22, 165, 16, 16),(164, 165, 16, 16),(306, 165, 16, 16),(245, 11, 95, 54),
  (365, 14, 95, 14));

  LabelCaption : array [1..LabelsNumber] of PChar=('Code size:', 'Prime number:', 'All:', 'All:','All:',
  '    Cyclic groups'+#10+'       and their'+#10' generators finder','');


//-------[ Edits ]---------------------------------------------------------------------------------------------------
 EditPos : array [1..EditsNumber] of TSize=(
 (88, 8, 50, 21),(88, 30, 50, 21),(43, 161, 99, 21),(185, 161, 99, 21),(327, 161, 99, 21));

 EditType : array [1..EditsNumber] of Integer=(
  WS_CHILD or WS_VISIBLE or WS_BORDER or ES_AUTOHSCROLL,
  WS_CHILD or WS_VISIBLE or WS_BORDER or ES_READONLY or ES_AUTOHSCROLL,
  WS_CHILD or WS_VISIBLE or WS_BORDER or ES_READONLY or ES_AUTOHSCROLL,
  WS_CHILD or WS_VISIBLE or WS_BORDER or ES_READONLY or ES_AUTOHSCROLL,
  WS_CHILD or WS_VISIBLE or WS_BORDER or ES_READONLY or ES_AUTOHSCROLL);

//-------[ ListBoxes ]---------------------------------------------------------------------------------------------------

  ListBoxPos : array [1..ListBoxesNumber] of TSize=(
   (12, 74, 130, 101),(154, 74, 130, 101), (296, 74, 130, 101));

  ListBoxType : array [1..ListBoxesNumber] of Integer=(
   WS_CHILD or WS_BORDER or WS_VISIBLE or LBS_HASSTRINGS or  WS_VSCROLL or LBS_STANDARD and not LBS_SORT,
   WS_CHILD or WS_BORDER or WS_VISIBLE or LBS_HASSTRINGS or  WS_VSCROLL and not LBS_SORT,
   WS_CHILD or WS_BORDER or WS_VISIBLE or LBS_HASSTRINGS or  WS_VSCROLL and not LBS_SORT);


var
  WinClass: TWndClassA;

  Inst, Handle, iGroup, hFont, x, y :  LongWord;

  Button     : array [1..ButtonsNumber]   of integer;
  Label_     : array [1..LabelsNumber]    of integer;
  Edit       : array [1..EditsNumber]     of integer;
  ListBox    : array [1..ListBoxesNumber] of integer;
  Generators : array of LongWord;
  Msg        : TMsg;

  //-----------------------------------------------------------------------------------------------------------------------
Procedure Power(a, b, n :DWORD);assembler; pascal ;
asm
    push    ecx
    push    ebx
    mov     edx,1
    xor     ebx,ebx
    bsr     ecx,b
@@1:
    shl     ebx,1         // c = 2*c

    mov     eax,edx
    mul     edx           // eax =  d*d
    xor     edx,edx
    div     n             // edx = (d*d) mod n
    bt      b,ecx
    jnc     @@Zero

    inc     ebx
    mov     eax,edx       // eax = d
    mul     a             // eax = d*a
    xor     edx,edx
    div     n             // edx = (d*a) mod n

@@Zero:
    dec     ecx
    cmp     ecx,0
    jge     @@1
    mov     eax,edx
    pop     ebx
    pop     ecx
end;
//-----------------------------------------------------------------------------------------------------------------------
Procedure Witness (a,n :integer);assembler; PASCAL;
asm
    push    ecx
    push    ebx

    mov     edx,1

    mov     eax,n
    dec     eax
    bsr     ecx,eax

@@1:
    mov     ebx,edx
    mov     eax,edx
    mul     edx           // eax =  d*d
    xor     edx,edx
    div     n             // edx = (d*d) mod n

    cmp     edx,1
    jne     @@2
    cmp     ebx,1
    je      @@2
    inc     ebx
    cmp     ebx,n
    jne     @@CompositeNumber

@@2:
    mov     eax,n
    dec     eax
    bt      eax,ecx
    jnc     @@Zero

    mov     eax,edx       // eax = d
    mul     a             // eax = d*a
    xor     edx,edx
    div     n             // edx = (d*a) mod n

@@Zero:
    dec     ecx
    cmp     ecx,0
    jge     @@1

    dec     edx
    jnz     @@CompositeNumber

    mov     eax,FALSE
    jmp     @@End

@@CompositeNumber:
    mov     eax,TRUE

@@End:
    pop     ebx
    pop     ecx
end;
//-----------------------------------------------------------------------------------------------------------------------
Procedure MillersRabinsTest;assembler;
asm
    push    ebx
    mov     ecx,20

@@Test:
    push    ecx
    push    ebx
    call    Witness
    test    eax,eax
    jnz     @@CompositeNumber
    loop    @@Test

    pop     ebx
    mov     eax,TRUE
    ret
@@CompositeNumber:
    pop     ebx
    mov     eax,FALSE
end;
//-----------------------------------------------------------------------------------------------------------------------
function FindGenerators (n :integer):integer;PASCAL
var
 n1, n2 : integer;
asm
    push    edi
    push    esi

    mov     esi,n
    dec     esi
    mov     n1,esi
    dec     esi
    mov     n2,esi
    mov     edx,1
    inc     esi
//   ecx = n-2
@@1:
    inc     edx
    mov     ebx,edx
    mov     ecx,esi
@@2:
    mov     eax,edx
    mul     ebx
    xor     edx,edx
    div     n
    cmp     edx,ebx
    je      @@CheckGenerator
    loop    @@2
@@CheckGenerator:
    dec     ecx
    jecxz   @@ThisIsGenerator
    cmp     ebx,n1
    jne     @@1
@@ThisIsGenerator:
//  ebx = generator

    mov     edi,Generators
    mov     ecx,-1
@@FindCoprime:

    add     ecx,2
    mov     eax,n1
    mov     esi,ecx

//--- GCD ---------- ->
@@3:
    xor     edx,edx
    div     ecx
    mov     eax,ecx
    mov     ecx,edx
    jecxz   @@4
    jmp     @@3
@@4:
// <- ------- GCD -----
    mov     ecx,esi
    cmp     eax,1
    jne     @@FindCoprime
    push    ebx
    push    ecx
    push    n
    call    Power
    stosd
    cmp     ecx,n2
    jne     @@FindCoprime
    sub     edi,Generators
    shr     edi,2
    mov     eax,edi
    pop     esi
    pop     edi
end;

//-----------------------------------------------------------------------------------------------------------------------
Function FindPrimeGreater (n :integer):integer;assembler;PASCAL;
asm
    mov     ebx,n
    or      ebx,1 
@@Search:
    call    MillersRabinsTest
    add     ebx,2
    test    eax,eax
    jz      @@Search
    lea     eax,[ebx-2]
end;
//-----------------------------------------------------------------------------------------------------------------------
procedure PrimeNumbers;
var
 Textlength, l, k, r : Integer;
 Text : PChar;
 S,s1 : String;
begin

for l := 1 to ListBoxesNumber do SendMessage(ListBox[l], LB_RESETCONTENT,0,0);
for l := 3 to 4 do SetWindowText(Edit[l],'');

TextLength := GetWindowTextLength(Edit[1]);
if TextLength <>0 then
 begin
 GetMem(Text, TextLength + 1);
 GetWindowText(Edit[1], Text, TextLength + 1);
 val(Text, k, l);
 iGroup := FindPrimeGreater(k);
 str(iGroup, s);
 SetWindowText(Edit[2],PChar(s));
 SetLength(Generators ,iGroup);
 k := FindGenerators(iGroup);

 SendMessage(ListBox[1], WM_SETREDRAW , 0, 0);

 for l := 0 to k-1 do
 begin
  str(Generators[l], s);
  str(l+1, s1);
  s :=s1+', '+s;
  r := SendMessage(ListBox[1], LB_ADDSTRING,0,LPARAM(PChar(s)));

  if r < 0 then
  begin
   SendMessage(ListBox[1], LB_DELETESTRING, l-2, 0);
   SendMessage(ListBox[1], LB_INSERTSTRING, l-2, LongWord(PChar('...')));
   break;
  end;

 end;

 SendMessage(ListBox[1], WM_SETREDRAW , 1, 0);
 str(k, s);
 SetWindowText(Edit[3],PChar(s));
 FreeMem(Text, TextLength + 1);
 exit;
end;

SetWindowText(Edit[2],'');
end;

function WindowProc(hWnd, uMsg,	wParam,	lParam: Integer): Integer; stdcall;
var
 iIndex, iLength, i, g : LongWord;
 pText,pText1 : PChar;
 s,s1,s2,gs : string;
 r : Integer;
 Powers : array of LongWord;
begin
Result := DefWindowProc(hWnd, uMsg, wParam, lParam);

case uMsg of

 WM_COMMAND:
 begin
  If lParam = Button[4] then begin  ExitProcess(1);end;
  If lParam = Button[1] then PrimeNumbers;
  If lParam = Button[5] then MessageBox(0,PChar
  ('            This prog finds cyclic groups and their generators, but: '+#10#10
  +'1) 25 < code size < 65520, and you have to use decimal numbers.'+#10
  +'2) We search prime number using Miller-Rabin probabilistic test, so...'+#10
  +'3) This is version 1.0 ß, bugs and... : whead@box43.gnet.pl  '+#10#10
  +'                                    (c) 2002 WhiteHead'),PChar('Info'), MB_OK);
  If (lParam = Edit[1]) and (HiWord(wParam) = EN_UPDATE) then
  begin
   iLength := GetWindowTextLength(Edit[1]);
   GetMem(pText, iLength + 1);
   GetWindowText(Edit[1], pText, iLength + 1);
   val(pText, i, g);
   if (g <>0) or (i>65520) or (i<25) then EnableWindow(Button[1], FALSE)
                                     else EnableWindow(Button[1], TRUE);
   FreeMem(pText, iLength + 1);
  end;

  If (lParam = ListBox[1]) and (HiWord(wParam) = LBN_SELCHANGE) then
  begin

   iIndex  := SendMessage(ListBox[1], LB_GETCURSEL, 0, 0);
   iLength := SendMessage(ListBox[1], LB_GETTEXTLEN, iIndex, 0) + 1;

   GetMem(pText,iLength);

   SendMessage(ListBox[1], LB_GETTEXT, iIndex, Integer(pText));

   pText1 := pText;
   repeat Inc(pText1) until pText1[0] = ' ';
   inc(pText1);

   s := String(pText1);

   FreeMem(pText,iLength);

   val(s, g, i);

   SendMessage(ListBox[2], LB_RESETCONTENT,0,0);
   SendMessage(ListBox[2], WM_SETREDRAW , 0, 0);
   SendMessage(ListBox[3], LB_RESETCONTENT,0,0);
   SendMessage(ListBox[3], WM_SETREDRAW , 0, 0);

   SetLength(Generators, iGroup);
   SetLength(Powers,     iGroup);

   asm
   pushad
   mov    ebx,g
   mov    ecx,iGroup
   dec    ecx
   mov    eax,1
   mov    edi,Generators
   mov    esi,Powers
   sub    esi,4
   @@1:
   mul    ebx
   xor    edx,edx
   div    iGroup
   mov    eax,edx
   stosd
   shl    edx,2
   add    edx,esi
   mov    [edx],ecx
   loop   @@1
   popad
   end;

   str(g, gs);

   for i:=0 to iGroup-2 do
   begin
    str(i+1, s);
    str(iGroup-Powers[i], s1);
    s := s+'='+gs+'^'+s1;
    SendMessage(ListBox[3], LB_ADDSTRING, 0, LongWord(PChar(s)));

    str(Generators[i], s2);
    Generators[i] := 0;
    str(i+1, s1);
    s := gs+'^'+s1+'='+s2;

    r := SendMessage(ListBox[2], LB_ADDSTRING, 0, LongWord(PChar(s)));
    if r < 0 then
    begin
     SendMessage(ListBox[2], LB_DELETESTRING, i-1, 0);
     SendMessage(ListBox[2], LB_INSERTSTRING, i-1, LongWord(PChar('...')));
     SendMessage(ListBox[3], LB_DELETESTRING, i-1, 0);
     SendMessage(ListBox[3], LB_INSERTSTRING, i-1, LongWord(PChar('...')));
     break;
    end;
   end;
{$IFDEF DEBUG}
   for i:=0 to iGroup-2 do if Generators[i] <> 0 then asm int 3;end;
{$ENDIF}
   SendMessage(ListBox[2], WM_SETREDRAW , 1, 0);
   SendMessage(ListBox[3], WM_SETREDRAW , 1, 0);

   str(iGroup-1,  s1);

   SetWindowText(Edit[4],PChar(s1));
   SetWindowText(Edit[5],PChar(s1));

  end;
 end;

 WM_DESTROY: ExitProcess(1)

end;
end;

begin
Inst := hInstance;
with WinClass do
begin
 style              := CS_CLASSDC or CS_PARENTDC;
 lpfnWndProc        := @WindowProc;
 hInstance          := Inst;
 hbrBackground      := color_btnface + 1;
 lpszClassname      := 'WHEADS_GENERATOR';
 hIcon              := LoadIconA (Inst, MakeIntResource(ICON_1) );
 hCursor            := LoadCursor(Inst, IDC_ARROW);
end;
RegisterClass(WinClass);

x:=GetSystemMetrics(SM_CXSCREEN)  div 2-447 div 2;
y:=GetSystemMetrics(SM_CYSCREEN)  div 2-214 div 2;

Handle := CreateWindowEx(WS_EX_APPWINDOW, 'WHEADS_GENERATOR', 'CGAGF',
                         WS_CAPTION or WS_SYSMENU and not WS_VISIBLE,
                         x,y, 447, 214, 0, 0, Inst, nil);

for x:=1 to ButtonsNumber do
 Button[x] := CreateWindow('Button', ButtonCaption[x], ButtonType[x],
                            ButtonPos[x][1], ButtonPos[x][2], ButtonPos[x][3], ButtonPos[x][4],
                            handle, 0, Inst, nil);

for x:=1 to LabelsNumber-1 do
begin
 Label_[x] := Createwindow('Static', '', WS_VISIBLE or WS_CHILD or SS_LEFT,
                           LabelPos[x][1], LabelPos[x][2], LabelPos[x][3], LabelPos[x][4], Handle, 0, Inst, nil);
 SetWindowText(Label_[x], LabelCaption[x]);
end;

Label_[LabelsNumber] := CreatewindowEx(WS_EX_CLIENTEDGE,'Static', '', WS_VISIBLE or WS_CHILD or SS_LEFT or SS_ICON,
                                       LabelPos[LabelsNumber][1], LabelPos[LabelsNumber][2], LabelPos[LabelsNumber][3],
                                       LabelPos[LabelsNumber][4], Handle,0, Inst, nil);

SendMessage(Label_[LabelsNumber], STM_SETIMAGE, IMAGE_ICON, LoadIconA(Inst, MakeIntResource(ICON_1)));

for x:=1 to EditsNumber do
 Edit[x] := CreateWindowEx(WS_EX_CLIENTEDGE, 'Edit', '', EditType[x],
                           EditPos[x][1], EditPos[x][2], EditPos[x][3], EditPos[x][4],
                           Handle, 0, Inst, nil);

for x:=1 to ListBoxesNumber do
 ListBox[x] := CreateWindowEx(WS_EX_CLIENTEDGE,'ListBox', '',ListBoxType[x],
                              ListBoxPos[x][1], ListBoxPos[x][2], ListBoxPos[x][3], ListBoxPos[x][4],
                              Handle, 0, Inst, nil);

hFont := CreateFont(1, 0, 0, 0, 400, 0, 0, 0, DEFAULT_CHARSET,
                    OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS, DEFAULT_QUALITY,
                    DEFAULT_PITCH or FF_DONTCARE, 'MS Sans Serif');

if hFont <> 0 then
begin
 for x:=1 to ButtonsNumber   do SendMessage(Button[x] , WM_SETFONT, hFont, 0);
 for x:=1 to LabelsNumber    do SendMessage(Label_[x] , WM_SETFONT, hFont, 0);
 for x:=1 to EditsNumber     do SendMessage(Edit[x]   , WM_SETFONT, hFont, 0);
 for x:=1 to ListBoxesNumber do SendMessage(ListBox[x], WM_SETFONT, hFont, 0);
end;

ShowWindow(Handle,SW_SHOW);
EnableWindow(Button[1], FALSE);
SetFocus(Edit[1]);

UpdateWindow(Handle);

while(GetMessage(Msg, Handle, 0, 0)) do
begin
 TranslateMessage(msg);
 DispatchMessage(msg);
end; 
end.
