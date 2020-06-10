#!/bin/bash

apt-get --yes update
apt-get --yes install git wget curl qttools5-dev libyaml-cpp-dev libpolkit-qt5-1-dev

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
