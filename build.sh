#! /bin/bash

docker pull mauikit/ubuntu-18.04-amd64
docker run --rm -v $(pwd)/:/build/ -w /build/ mauikit/ubuntu-18.04-amd64 /bin/bash docker-build.sh

mv ./calamares/build/*.deb ./
du -H ./*.deb

curl --upload-file ./*.deb https://transfersh.com/
