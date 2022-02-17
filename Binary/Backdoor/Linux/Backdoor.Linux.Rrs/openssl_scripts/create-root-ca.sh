#!/bin/bash

. openssl_scripts.conf || exit 1

function check_existence {
    if [ -e $dir/$ca/$ca.crt -o -e $dir/$ca/$ca.key ]; then
        cat <<EOF
$dir/$ca/$ca.crt or $dir/$ca/$ca.key already exists!
As a precaution, this script will exit immediately, you have to manually
remove those files to create the certificate.
EOF
        exit 1
    fi
}

if [ "$1" = "" ]; then
    echo "this script generates a root CA"
    echo "usage: $0 file_prefix"
    echo "certificate will be created under the \"$dir/file_prefix/\" directory"
    echo "example usage: $0 ca"
    exit 1
fi

ca="$1"

check_existence

if [ ! -d $dir/$ca ]; then
    mkdir -p $dir/$ca || exit 1
fi

cat <<EOF

You are about the create a root Certificate Authority (self-signed certificate
able to sign certificate requests). A root CA and subordinate CA(s) should
always have full Distinguished Name information (the contact information you
need to fill in later). Organizational Unit (OU) and Common Name (CN) are very
important.

Press return to continue or Ctrl+C to quit...
EOF

read junk

openssl genrsa -${enc} -out $dir/$ca/$ca.key $cabits &&
openssl req -new -key $dir/$ca/$ca.key -out $dir/$ca/$ca.csr &&
openssl x509 -req -days $cadays -extfile $opensslcnf -extensions v3_ca \
    -in $dir/$ca/$ca.csr -signkey $dir/$ca/$ca.key -out $dir/$ca/$ca.crt &&
echo "00" > $dir/$ca/$ca.srl
