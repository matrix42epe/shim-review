#/bin/sh

# install packages
#apt-get install gnu-efi -y
#apt-get install pesign -y
#apt-get install efitools -y



# build shim

LOCAL_BUILD_PATH=$(pwd)/



make VENDOR_CERT_FILE=MX42_CERT/matrix42.der

if [ -f $LOCAL_BUILD_PATH/shim.efi ]; then
   echo renaming shim.efi to core.efi
   mv  $LOCAL_BUILD_PATH/shim.efi $LOCAL_BUILD_PATH/core.efi
else
   echo Build failed - Please check log for more information
   exit 1
fi




hostIP=$(ip route get 1 | awk '{print $NF;exit}')

echo ============================ copy your shim BootLoader via: ============================
echo pscp root@$hostIP:$LOCAL_BUILD_PATH/core.efi  C:{YOUR_LOCAL_PATH}
echo password: *
echo "this file has to be signed by Microsoft (to be trusted by standard efi in Secure boot mode)"
echo "and then be copied to M42EPE4 epe40/PACKAGEBUILD/M42_MARKETPLACE/BUILD/Empirum/AddOns/EPE40/binaries/static/boot/grub/x86_64-efi"
