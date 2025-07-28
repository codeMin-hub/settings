# install
sudo apt install dnsmasq hostapd
sudo apt install iw


# setting

# command
sudo nano /etc/hostapd/hostapd.conf
# add value
interface=ap0
ssid=ssid # set ssid
hw_mode=g
channel=6
ieee80211n=1
wmm_enabled=1
macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
wpa=2
wpa_key_mgmt=WPA-PSK
wpa_passphrase=password # set password
rsn_pairwise=CCMP

# command
sudo nano /etc/default/hostapd
# add value
DAEMON_CONF="/etc/hostapd/hostapd.conf"

# command
sudo nano /etc/dnsmasq.conf
# add value
port=5353
interface=ap0
dhcp-range=192.168.3.2,192.168.3.20,255.255.255.0,24H # set dhcp range

# command
sudo nano /etc/sysctl.conf
# add value
net.ipv4.ip_forward=1

# command
sudo nano /etc/systemd/system/ap-mode.service
# add value
[Unit]
Description=AP Network Setup # set dhcp range in ExecStart
After=network.target

[Service]
Type=oneshot
ExecStart=/bin/bash -c "/usr/bin/sudo /sbin/iw dev wlan0 interface add ap0 type __ap && \
    /bin/sleep 3 && \
    /usr/bin/sudo /sbin/ifconfig ap0 192.168.3.1/24 netmask 255.255.255.0 && \
    /usr/bin/sudo /sbin/ifconfig ap0 up && \
    /usr/bin/sudo /sbin/iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE"
RemainAfterExit=true

[Install]
WantedBy=multi-user.target

# command
sudo systemctl enable ap-mode.service

# command
sudo reboot
