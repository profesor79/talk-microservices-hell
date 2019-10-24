#!/usr/bin/env bash


  mkdir -p /mnt/nekubetalkinfradiag
if [ ! -d "/etc/smbcredentials" ]; then
  mkdir -p /etc/smbcredentials
fi
if [ ! -f "/etc/smbcredentials/nekubetalkinfradiag.cred" ]; then
      bash -c 'echo "username=nekubetalkinfradiag" >> /etc/smbcredentials/nekubetalkinfradiag.cred'
      bash -c 'echo "password=E4Jnugb2MW/aJAblqM7UVCUT1BKvgZWeSOOjT16HoQjW9ATMgf76/j+5VFYEYW/xeKuJUy6hG3AHWrwBkLuiBQ==" >> /etc/smbcredentials/nekubetalkinfradiag.cred'
fi
#  chmod 600 /etc/smbcredentials/nekubetalkinfradiag.cred

  bash -c 'echo "//nekubetalkinfradiag.file.core.windows.net/kube-data /mnt/nekubetalkinfradiag cifs nofail,vers=3.0,credentials=/etc/smbcredentials/nekubetalkinfradiag.cred,dir_mode=0777,file_mode=0777,serverino" >> /etc/fstab'
  mount -t cifs //nekubetalkinfradiag.file.core.windows.net/kube-data /mnt/nekubetalkinfradiag -o vers=3.0,credentials=/etc/smbcredentials/nekubetalkinfradiag.cred,dir_mode=0777,file_mode=0777,serverino