# OpenWRT Image for Vagrant 

Unattended build of OpenWRT vagrant boxes.

## Usage

To create the Box run it with the URL to the combined image

```
./build-virtualbox -u https://downloads.openwrt.org/releases/21.02.2/targets/x86/64/openwrt-21.02.2-x86-64-generic-ext4-combined.img.gz -b OpenWRT-21.02.2.box
```

The box will be export into **OpenWRT-&lt;VERSION>.box**.

## Use of the box

Import into vagrant

```
vagrant box add --name openwrt --provider=virtualbox OpenWRT-<VERSION>.box
```

Create a new VM based on the OpenWRT Box and start it

```
vagrant init openwrt
vagrant up
```

There are some customizations to ensure vagrant will work properly, see [Vagrantfile](Vagrantfile)

## Procedure

1. At first the OpenWRT combined image will be downloaded and converted into a VirtualBox.
2. A VirtualBox Maschine will be set up an prepare with the converted disk image and a serial port, which listen on port **22023**.
3. The maschine starts.
4. The expect script **setup-box.exp** wait for some key phrases on serial line and start the setup script **setup-box.sh**.
5. When the VM halts vagrant will export the box into the file **OpenWRT-&lt;VERSION>.box**.
6. Remove the VM and the disk image.

## Requirements

* sha256sum
* sha384sum
* sha512sum
* socat
* vagrant
* VirtualBox
* wget
