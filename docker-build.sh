#!/bin/bash

set -ex

apt-get --yes update
apt-get --yes install git wget curl qttools5-dev libyaml-cpp-dev libpolkit-qt5-1-dev libkf5crash-dev python3-dev libkpmcore-dev libkf5parts-dev libappstreamqt-dev libkf5plasma-dev libkf5package-dev libpwquality-dev libparted-dev libpythonqt-qt5-common-dev libpythonqt-qtall-qt5-common-dev libboost-dev libboost-python-dev

git clone https://github.com/milohr/calamares.git -b qml --depth 1
mkdir -p calamares/build
(
    cd calamares/build

    cp ../../cpack-deb.cmake ../
    printf "\ninclude(./cpack-deb.cmake)\n" >> ../CMakeLists.txt

    cmake -DCMAKE_BUILD_TYPE=Debug ..
    make -j$(nproc) package

    chmod 777 ./*.deb
)
