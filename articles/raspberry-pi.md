# Raspberry Pi

Getting setup with the Raspberry Pi can be tricky if you don't have a keyboard and mouse hanging around. The following tutorial  makes it reasonably easy. Here's how to do it.

### Install and setup Unix on the SD Card

1. Insert your SD Card into your mac.
2. Open up Disk Utility on your mac.
3. Select the SD Card in the list at left.
4. Then click Erase.
5. Make sure the format is MS-DOS, give it a name, and then click Erase. Confirm that you want to Erase. 

Cool, now open up terminal and run the following commands.

```
wget http://downloads.raspberrypi.org/raspbian_latest
tar -xzvf raspbian_latest # hit enter after this twice
diskutil list
diskutil unmountdisk /dev/disk2  # this needs to be the correct disk to your SD Card
sudo dd if=2014-01-07-wheezy-raspbian.img of=/dev/disk2 bs=2m # this needs to be the correct disk to your SD Card that you just unmounted
```

This can take up to 30 minutes. The dd command does not have a verbose mode to show you progress. Be patient. On completion, you will get a confirmation. Raspbian is debian based OS designed for use on the Raspberry Pi.

### Connect and Configure the Raspberry Pi's Wifi

Next, using an ethernet cable, plug your Raspberry Pi into your Wireless router.

Find the Ip address of the Pi.

```
nmap -sn 192.168.1.1/24
```

Note the IP Address of the Raspberry Pi. We will use this with a default Ansible script to setup Wifi.

```
git clone https://github.com/scottmotte/ansible-pi.git
cd ansible-pi
cp hosts.example hosts
cp wpa_supplicant.conf.example wpa_supplicant.conf
```

Edit the wpa_supplicant.conf and hosts files with your credentials.

Finally, push your changes up to your Raspberry Pi.

```
ansible-playbook playbook.yml -i hosts --ask-pass --sudo -c paramiko
```

Finally, run, sudo reboot.

```
sudo reboot
```

That's it. Now you can unplug the ethernet cord and the Raspberry Pi will work over Wifi. Give it some time to make the connection.
