#! /bin/bash

docker pull mauikit/ubuntu-18.04-amd64
docker run --rm -v $(pwd)/:/build/ -w /build/ mauikit/ubuntu-18.04-amd64 /bin/bash docker-build.sh

du -H ./calamares/build/*.deb

curl --upload-file ./calamares/build/*.deb https://transfersh.com/
