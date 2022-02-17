#!/bin/bash

. openssl_scripts.conf || exit 1

function check_existence {
    if [ -e $dir/$ca/$pkcs.p12 ]; then
        cat <<EOF
$dir/$ca/$pkcs.p12 already exists!
As a precaution, this script will exit immediately, you have to manually
remove that file to create the PKCS#12 file.
EOF
        exit 1
    fi
}

if [ "$1" = "" -o "$2" = "" -o "$3" = "" ]; then
    echo "this script creates a PKCS#12 file out of a private key and certificate"
    echo "usage: $0 prefix_to_ca prefix_of_previously_created_cert out_name"
    echo "the PKCS#12 file (prefix.p12) will be created under the \"$dir/prefix_to_ca/\" directory"
    echo "example usage: $0 ca user01 \"My certificate\""
    echo "(will create $dir/ca/user01.p12 out of user01.key and user01.crt)"
    exit 1
fi

ca="$1"
pkcs="$2"
outname="$3"

if [ ! -f $dir/$ca/$pkcs.crt -o ! -f $dir/$ca/$pkcs.key ]; then
    echo "$dir/$ca/$pkcs.crt or $dir/$ca/$pkcs.key does not exist!"
    exit 1
fi

check_existence

cat <<EOF

You are about to create a PKCS#12 file from one private key and certificate
pair.

Press return to continue or Ctrl+C to quit...
EOF

read junk

openssl pkcs12 -export -name "$outname" -clcerts -in $dir/$ca/$pkcs.crt \
    -inkey $dir/$ca/$pkcs.key -out $dir/$ca/$pkcs.p12

