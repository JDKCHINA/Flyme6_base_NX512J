#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 21035008 86a2fa0c009618e07903b923b6b2fa48ef23d1b3 18507776 2d0765e24a94d9adc77ae123d3ece494ce7b4b33
fi

if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:21035008:86a2fa0c009618e07903b923b6b2fa48ef23d1b3; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:18507776:2d0765e24a94d9adc77ae123d3ece494ce7b4b33 EMMC:/dev/block/bootdevice/by-name/recovery 86a2fa0c009618e07903b923b6b2fa48ef23d1b3 21035008 2d0765e24a94d9adc77ae123d3ece494ce7b4b33:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
