#!/bin/bash

. openssl_scripts.conf || exit 1

function check_existence {
    if [ -e $dir/$subca/$subca.crt -o -e $dir/$subca/$subca.key ]; then
        cat <<EOF
$dir/$subca/$subca.crt or $dir/$subca/$subca.key already exists!
As a precaution, this script will exit immediately, you have to manually
remove those files to create the certificate.
EOF
        exit 1
    fi
}

if [ "$1" = "" -o "$2" = "" ]; then
    echo "this script generates a subordinate CA"
    echo "usage: $0 prefix_of_previously_created_ca subca_output_prefix"
    echo "private key and certificate will be created under the \"$dir/subca_output_prefix/\" directory"
    echo "example usage: $0 ca subca1"
    exit 1
fi

ca="$1"
subca="$2"

if [ ! -f $dir/$ca/$ca.crt ]; then
    echo "$dir/$ca/$ca.crt does not exist or is not a file!"
    exit 1
fi

check_existence

if [ ! -d $dir/$subca ]; then
    mkdir -p $dir/$subca || exit 1
fi

cat <<EOF

You are about to create a Subordinate Certificate Authority.
This script will create $dir/$subca/$subca.{key,csr,crt}
The root CA will sign the Sub-CA (to create the Sub-CA certificate).
The Sub-CA will then be able to sign certificate requests.

Press return to continue or Ctrl+C to quit...
EOF

read junk

openssl genrsa -${enc} -out $dir/$subca/$subca.key $subcabits &&
openssl req -new -key $dir/$subca/$subca.key -out $dir/$subca/$subca.csr &&
openssl x509 -req -days $subcadays -CA $dir/$ca/$ca.crt -CAkey $dir/$ca/$ca.key \
    -CAserial $dir/$ca/$ca.srl -CAcreateserial \
    -clrext \
    -extfile $opensslcnf -extensions v3_ca \
    -in $dir/$subca/$subca.csr -out $dir/$subca/$subca.crt &&
openssl x509 -noout -subject -issuer -purpose -in $dir/$subca/$subca.crt
