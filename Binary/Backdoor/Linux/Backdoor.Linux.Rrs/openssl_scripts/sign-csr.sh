#!/bin/bash

. openssl_scripts.conf || exit 1

function check_existence {
    if [ -e $dir/$ca/$outbase.crt ]; then
        cat <<EOF
$dir/$ca/$outbase.crt already exists!
As a precaution, this script will exit immediately, you have to manually
remove that file to create the certificate.
EOF
        exit 1
    fi
}

if [ "$1" = "" -o "$2" = "" ]; then
    echo "this script will sign a Certificate Signing Request (csr) with a CA"
    echo "usage: $0 prefix_of_ca full_path_to_csr_file"
    echo "certificate will be created under the \"$dir/prefix_of_ca/\" directory"
    echo "example usage: $0 ca /path/to/user01.csr"
    exit 1
fi

ca="$1"
csr="$2"
outbase=`echo "$2" | rev | cut -d/ -f1 | cut -d. -f2- | rev`

if [ ! -f $dir/$ca/$ca.crt -o ! -f $dir/$ca/$ca.key ]; then
    echo "$dir/$ca/$ca.crt or $dir/$ca/$ca.key does not exist or is not a file!"
    exit 1
fi

check_existence

openssl req -noout -text -in $csr
echo -n "Continue signing? [y/n] "
read input
if [ "$input" -ne "y" -o "$input" -ne "Y" ]; then
    echo "ok, quitting."
    exit 1
fi

openssl x509 -req -days $usrdays -CA $dir/$ca/$ca.crt -CAkey $dir/$ca/$ca.key \
    -CAserial $dir/$ca/$ca.srl -CAcreateserial \
    -in $csr -out $dir/$ca/$outbase.crt &&
echo "$dir/$ca/$outbase.crt created"
openssl x509 -noout -subject -issuer -purpose -in $dir/$ca/$outbase.crt

