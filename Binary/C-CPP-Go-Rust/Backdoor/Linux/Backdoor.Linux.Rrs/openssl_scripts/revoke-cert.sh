#!/bin/bash

. openssl_scripts.conf || exit 1

function cleanup {
    rm -f .$ca.temp.cnf
    exit $1
}

if [ "$1" = "" -o "$2" = "" ]; then
    echo "this script revokes a certificate"
    echo "usage: $0 prefix_of_ca prefix_of_certificate_to_revoke"
    echo "the certificate to revoke must have been signed by the correct CA."
    echo "example usage: $0 subca1 john_ceo"
    exit 1
fi

ca="$1"
cert="$2"

if [ ! -f $dir/$ca/$ca.crt -o ! -f $dir/$ca/$ca.key -o ! -f $dir/$ca/$cert.crt ]; then
    echo "$dir/$ca/$ca.crt, $dir/$ca/$ca.key or $dir/$ca/$cert.crt does not exist or is not a file!"
    exit 1
fi

cat <<EOF > .$ca.temp.cnf
[ ca ]
default_ca = CA_default

[ CA_default ]
database = $dir/$ca/$ca.db.txt
unique_subject = no
crl = $dir/$ca/$ca.crl
default_crl_days = $crldays
EOF

if [ ! -e $dir/$ca/$ca.db.txt ]; then
    touch $dir/$ca/$ca.db.txt
fi

cat <<EOF

$dir/$ca/$cert.crt is going to be revoked.
The CRL file will be: $dir/$ca/$ca.crl
This CRL file will contain all certificates revoked by this CA.

Press return to continue or Ctrl+C to quit...
EOF

read junk

openssl ca -config .$ca.temp.cnf -revoke $dir/$ca/$cert.crt \
    -keyfile $dir/$ca/$ca.key -cert $dir/$ca/$ca.crt || cleanup 1
openssl ca -config .$ca.temp.cnf \
    -keyfile $dir/$ca/$ca.key -cert $dir/$ca/$ca.crt \
    -gencrl -out $dir/$ca/$ca.crl || cleanup 1
openssl crl -text -noout -in $dir/$ca/$ca.crl
echo "File $dir/$ca/$ca.crl is the \"$ca\" CA's revocation list."
echo "Files $dir/$ca/$ca.db.txt* contains the revocation DB."

cleanup 0

