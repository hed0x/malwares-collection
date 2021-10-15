#!/bin/bash

. openssl_scripts.conf || exit 1

function check_existence {
    if [ -e $dir/$ca/$cert.crt -o -e $dir/$ca/$cert.key ]; then
        cat <<EOF
$dir/$ca/$cert.crt or $dir/$ca/$cert.key already exists!
As a precaution, this script will exit immediately, you have to manually
remove those files to create the certificate.
EOF
        exit 1
    fi
}

if [ "$1" = "" -o "$2" = "" ]; then
    echo "this script generates a certificate request and signs it with a CA"
    echo "the private key will be unencrypted (without a passphrase)"
    echo "usage: $0 prefix_of_ca certificate_out_prefix"
    echo "private key and certificate will be created under the \"$dir/prefix_of_ca/\" directory"
    echo "example usage: $0 ca user01"
    exit 1
fi

ca="$1"
cert="$2"

if [ ! -f $dir/$ca/$ca.crt -o ! -f $dir/$ca/$ca.key ]; then
    echo "$dir/$ca/$ca.crt or $dir/$ca/$ca.key does not exist or is not a file!"
    exit 1
fi

check_existence

cat <<EOF

You are about to create a certificate request and sign it with a CA. The
private key will be unencrypted (without a passphrase).
This script will create $dir/$ca/$cert.{key,csr,crt}
The CA ($dir/$ca/$ca.crt) will sign the certificate request (csr).

Please note that if you are signing the certificate request with a subordinate
CA, both the root CA certificate and the sub CA certificate must be trusted by
peer (server or whatever).

Press return to continue or Ctrl+C to quit...
EOF

read junk

#openssl genrsa -aes256 -out $dir/$ca/$cert.key $usrbits &&
openssl genrsa -out $dir/$ca/$cert.key $usrbits &&
openssl req -new -key $dir/$ca/$cert.key -out $dir/$ca/$cert.csr &&
openssl x509 -req -days $usrdays -CA $dir/$ca/$ca.crt -CAkey $dir/$ca/$ca.key \
    -CAserial $dir/$ca/$ca.srl -CAcreateserial \
    -in $dir/$ca/$cert.csr -out $dir/$ca/$cert.crt &&
openssl x509 -noout -subject -issuer -purpose -in $dir/$ca/$cert.crt

