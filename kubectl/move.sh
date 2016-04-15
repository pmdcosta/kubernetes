sudo cp ./kubectl /usr/local/bin/kubectl

rm -f ./*.pem
cp ../ansible/roles/master/files/* .
cp ../ansible/roles/node/files/* .
