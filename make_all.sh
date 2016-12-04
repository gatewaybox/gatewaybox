#build the kernel
cd karo-tx-linux* 
 ./make_me.sh
cd ..
# make modules
cd karo-tx-linux* 
./make_modules.sh
cd ..

# copy modules to buildroot fs, buildroot must be build at least one time before!
rm -R -f buildroot/output/target/lib/modules
cp -R karo-tx-linux*/my_modules/lib/* buildroot/output/target/lib/


echo "###########################################"
echo "# make buildroot to generate output/target"
echo "###########################################"
cd buildroot
cp ../buildroot.config .config
make
cd ..

# add files to ouput/target and recreate rootfs.cpio
#mkdir ./buildroot/output/target/lib/firmware
#mkdir ./buildroot/output/target/lib/firmware/brcm
#cp -R ./brcm/*  ./buildroot/output/target/lib/firmware/brcm

rm -f ./buildroot/output/target/etc/init.d/S99_gateway.sh
cp ./S99_gateway.sh  ./buildroot/output/target/etc/init.d/

rm -R -f ./buildroot/output/target/utils
mkdir ./buildroot/output/target/utils
cp -R ./utils/*  ./buildroot/output/target/utils/

rm -f ./buildroot/output/images/*
cd buildroot
make
cd ..

#build the kernel
cd karo-tx-linux* 
./make_me.sh
cd ..



