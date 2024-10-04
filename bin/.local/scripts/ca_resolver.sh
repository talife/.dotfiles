#!/bin/sh
sudo mkdir -p /usr/local/share/ca-certificates/extra
true | openssl s_client -connect $1:443 2>/dev/null | openssl x509 > $1.pem
mv $1.pem $1.crt
sudo mv $1.crt /usr/local/share/ca-certificates/extra/$1.crt
sudo update-ca-certificates

