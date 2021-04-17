#!/bin/sh

# create a vagrant user and group
echo 'vagrant:x:1000:1000:vagrant:/home/vagrant:/bin/ash' >>/etc/passwd
echo 'vagrant:x:1000:vagrant' >>/etc/group

# set root and vagrant user password to vagrant
echo 'root:$1$tXZVUAly$lFK729hna.V6SGc/G8mq./:0:0:99999:7:::' >>/etc/shadow.new
echo 'vagrant:$1$tXZVUAly$lFK729hna.V6SGc/G8mq./:0:0:99999:7:::' >>/etc/shadow.new
grep -v root /etc/shadow >>/etc/shadow.new
mv /etc/shadow.new /etc/shadow
chmod 660 /etc/shadow

# create a vagrant home directory and place vagrant ssh key
mkdir -p /home/vagrant/.ssh
cat >/home/vagrant/.ssh/authorized_keys <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key
EOF
chmod 775 /home
chmod 700 /home/vagrant
chmod 700 /home/vagrant/.ssh
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R 1000:1000 /home/vagrant

# create a shutdown command (compatibility for vagrant)
cat >/sbin/shutdown <<EOF
#!/bin/sh
halt
EOF
chmod 755 /sbin/shutdown

# rewrite network configuration for one ethernet port (vagrant management port)
cat >/etc/config/network <<EOF
config interface 'loopback'
	option ifname 'lo'
	option proto 'static'
	option ipaddr '127.0.0.1'
	option netmask '255.0.0.0'

config globals 'globals'
	option ula_prefix 'fdec:4589:e690::/48'

config interface 'vagrant'
	option ifname 'eth0'
	option proto 'dhcp'
EOF

# apply network configuration and restart network
uci commit
/etc/init.d/network restart

# wait some time for the network
sleep 5

# update package list and wait some time
opkg update

# install sudo and give vagrant passwordless access
opkg install sudo
echo 'vagrant ALL=(ALL) NOPASSWD: ALL' >/etc/sudoers.d/vagrant
chmod 664 /etc/sudoers.d/vagrant

# install python v3 for ansible provision
opkg install python3

# finished
halt
#!/bin/sh

# create a vagrant user and group
echo 'vagrant:x:1000:1000:vagrant:/home/vagrant:/bin/ash' >>/etc/passwd
echo 'vagrant:x:1000:vagrant' >>/etc/group

# set root and vagrant user password to vagrant
echo 'root:$1$tXZVUAly$lFK729hna.V6SGc/G8mq./:0:0:99999:7:::' >>/etc/shadow.new
echo 'vagrant:$1$tXZVUAly$lFK729hna.V6SGc/G8mq./:0:0:99999:7:::' >>/etc/shadow.new
grep -v root /etc/shadow >>/etc/shadow.new
mv /etc/shadow.new /etc/shadow
chmod 660 /etc/shadow

# create a vagrant home directory and place vagrant ssh key
mkdir -p /home/vagrant/.ssh
cat >/home/vagrant/.ssh/authorized_keys <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key
EOF
chmod 775 /home
chmod 700 /home/vagrant
chmod 700 /home/vagrant/.ssh
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R 1000:1000 /home/vagrant

# create a shutdown command (compatibility for vagrant)
cat >/sbin/shutdown <<EOF
#!/bin/sh
halt
EOF
chmod 755 /sbin/shutdown

# rewrite network configuration for one ethernet port (vagrant management port)
cat >/etc/config/network <<EOF
config interface 'loopback'
	option ifname 'lo'
	option proto 'static'
	option ipaddr '127.0.0.1'
	option netmask '255.0.0.0'

config globals 'globals'
	option ula_prefix 'fdec:4589:e690::/48'

config interface 'vagrant'
	option ifname 'eth0'
	option proto 'dhcp'
EOF

# apply network configuration and restart network
uci commit
/etc/init.d/network restart

# wait some time for the network
sleep 5

# update package list and wait some time
opkg update

# install sudo and give vagrant passwordless access
opkg install sudo
echo 'vagrant ALL=(ALL) NOPASSWD: ALL' >/etc/sudoers.d/vagrant
chmod 664 /etc/sudoers.d/vagrant

# install python v3 for ansible provision
opkg install python3

# finished
halt
#!/bin/sh

# create a vagrant user and group
echo 'vagrant:x:1000:1000:vagrant:/home/vagrant:/bin/ash' >>/etc/passwd
echo 'vagrant:x:1000:vagrant' >>/etc/group

# set root and vagrant user password to vagrant
echo 'root:$1$tXZVUAly$lFK729hna.V6SGc/G8mq./:0:0:99999:7:::' >>/etc/shadow.new
echo 'vagrant:$1$tXZVUAly$lFK729hna.V6SGc/G8mq./:0:0:99999:7:::' >>/etc/shadow.new
grep -v root /etc/shadow >>/etc/shadow.new
mv /etc/shadow.new /etc/shadow
chmod 660 /etc/shadow

# create a vagrant home directory and place vagrant ssh key
mkdir -p /home/vagrant/.ssh
cat >/home/vagrant/.ssh/authorized_keys <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key
EOF
chmod 775 /home
chmod 700 /home/vagrant
chmod 700 /home/vagrant/.ssh
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R 1000:1000 /home/vagrant

# create a shutdown command (compatibility for vagrant)
cat >/sbin/shutdown <<EOF
#!/bin/sh
halt
EOF
chmod 755 /sbin/shutdown

# rewrite network configuration for one ethernet port (vagrant management port)
cat >/etc/config/network <<EOF
config interface 'loopback'
	option ifname 'lo'
	option proto 'static'
	option ipaddr '127.0.0.1'
	option netmask '255.0.0.0'

config globals 'globals'
	option ula_prefix 'fdec:4589:e690::/48'

config interface 'vagrant'
	option ifname 'eth0'
	option proto 'dhcp'
EOF

# apply network configuration and restart network
uci commit
/etc/init.d/network restart

# wait some time for the network
sleep 5

# update package list and wait some time
opkg update

# install sudo and give vagrant passwordless access
opkg install sudo
echo 'vagrant ALL=(ALL) NOPASSWD: ALL' >/etc/sudoers.d/vagrant
chmod 664 /etc/sudoers.d/vagrant

# install python v3 for ansible provision
opkg install python3

# finished
halt
#!/bin/sh

# create a vagrant user and group
echo 'vagrant:x:1000:1000:vagrant:/home/vagrant:/bin/ash' >>/etc/passwd
echo 'vagrant:x:1000:vagrant' >>/etc/group

# set root and vagrant user password to vagrant
echo 'root:$1$tXZVUAly$lFK729hna.V6SGc/G8mq./:0:0:99999:7:::' >>/etc/shadow.new
echo 'vagrant:$1$tXZVUAly$lFK729hna.V6SGc/G8mq./:0:0:99999:7:::' >>/etc/shadow.new
grep -v root /etc/shadow >>/etc/shadow.new
mv /etc/shadow.new /etc/shadow
chmod 660 /etc/shadow

# create a vagrant home directory and place vagrant ssh key
mkdir -p /home/vagrant/.ssh
cat >/home/vagrant/.ssh/authorized_keys <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key
EOF
chmod 775 /home
chmod 700 /home/vagrant
chmod 700 /home/vagrant/.ssh
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R 1000:1000 /home/vagrant

# create a shutdown command (compatibility for vagrant)
cat >/sbin/shutdown <<EOF
#!/bin/sh
halt
EOF
chmod 755 /sbin/shutdown

# rewrite network configuration for one ethernet port (vagrant management port)
cat >/etc/config/network <<EOF
config interface 'loopback'
	option ifname 'lo'
	option proto 'static'
	option ipaddr '127.0.0.1'
	option netmask '255.0.0.0'

config globals 'globals'
	option ula_prefix 'fdec:4589:e690::/48'

config interface 'vagrant'
	option ifname 'eth0'
	option proto 'dhcp'
EOF

# apply network configuration and restart network
uci commit
/etc/init.d/network restart

# wait some time for the network
sleep 5

# update package list and wait some time
opkg update

# install sudo and give vagrant passwordless access
opkg install sudo
echo 'vagrant ALL=(ALL) NOPASSWD: ALL' >/etc/sudoers.d/vagrant
chmod 664 /etc/sudoers.d/vagrant

# install python v3 for ansible provision
opkg install python3

# finished
halt

