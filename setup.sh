echo "get linux kernel for karo from kernel concepts"
git clone git://git.kernelconcepts.de/karo-tx-linux.git
cd karo-tx-linux
git checkout remotes/origin/karo-tx6
git checkout 1fb9d67a03f46479d510028c4add72562bb34f2f
git am ../kernel_patch/*.patch

cd ..
git clone git://git.busybox.net/buildroot
