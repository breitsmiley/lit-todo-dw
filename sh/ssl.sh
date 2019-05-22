#!/usr/bin/env bash

certdir="tls"
#host="lit-todo.loc"
#host="api.lit-todo.loc"
#host="proxy.lit-todo.loc"

#host="lit-todo.pepelaz.in.ua"
#host="api-lit-todo.pepelaz.in.ua"
host="proxy-lit-todo.pepelaz.in.ua"

# setup a CA key
if [ ! -f "$certdir/ca-key.pem" ]; then
  openssl genrsa -out "${certdir}/ca-key.pem" 4096
fi

# setup a CA cert
openssl req -new -x509 -days 730 \
  -subj "/CN=Local CA" \
  -key "${certdir}/ca-key.pem" \
  -sha256 -out "${certdir}/ca.pem"

# setup a host key
if [ ! -f "${certdir}/key.pem" ]; then
  openssl genrsa -out "${certdir}/key.pem" 2048
fi

# create a signing request
extfile="${certdir}/extfile"
openssl req -subj "/CN=${host}" -new -key "${certdir}/key.pem" \
   -out "${certdir}/${host}.csr"
#echo "subjectAltName = IP:127.0.0.1,DNS:localhost" > ${extfile}
echo "subjectAltName = DNS:${host}" > ${extfile}

# create the host cert
openssl x509 -req -days 365 \
   -in "${certdir}/${host}.csr" -extfile "${certdir}/extfile" \
   -CA "${certdir}/ca.pem" -CAkey "${certdir}/ca-key.pem" -CAcreateserial \
   -out "${certdir}/cert.pem"

mv ${certdir}/key.pem ${certdir}/${host}.key.pem
mv ${certdir}/cert.pem ${certdir}/${host}.cert.pem

# cleanup
if [ -f "${certdir}/${host}.csr" ]; then
        rm -f -- "${certdir}/${host}.csr"
fi
if [ -f "${extfile}" ]; then
        rm -f -- "${extfile}"
fi