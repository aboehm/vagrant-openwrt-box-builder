# OpenWRT Image for Vagrant 

Unattended build of OpenWRT vagrant boxes.

## Usage

To create the Box run

```
./build-virtualbox
```

The box will be export into **OpenWRT-&lt;VERSION>.box**.

To select the OpenWRT version export set the variable **OPENWRT_VERSION** to the corresponding release. The default version is **19.07.7**. To build version *18.06.9* run

```
OPENWRT_VERSION=18.06.9 ./build-virtualbox
```

## Use of the box

Import into vagrant

```
vagrant box add --name openwrt --provider=virtualbox OpenWRT-<VERSION>.box
```

Create a new VM based on the OpenWRT box

```
vagrant up
```

There are some customizations to ensure vagrant will work properly, see [Vagrantfile](Vagrantfile)

## Procedure

1. At first the OpenWRT combined image will be downloaded and converted into a VirtualBox.
2. A VirtualBox Maschine will be set up an prepare with the converted disk image and a serial port, which listen on port **22023**.
3. The maschine starts.
4. After 30 seconds the **setup-box.sh** script will be sent to the serial port. The script stops the machine after it has finished.
5. When the VM stops, vagrant will export the box into the file **OpenWRT-&lt;VERSION>.box**.
6. Remove the VM and the disk image.


## Requirements

* VirtualBox
* socat
* wget
