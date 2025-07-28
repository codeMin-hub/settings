# install
# Raspberry Pi
wget https://downloads.realvnc.com/download/file/vnc.files/VNC-Server-7.14.0-Linux-ARM64.deb
sudo apt install ./VNC-Server-7.14.0-Linux-ARM64.deb xserver-xorg-video-dummy
# Other
wget https://downloads.realvnc.com/download/file/vnc.files/VNC-Server-7.14.0-Linux-x64.deb
sudo apt install ./VNC-Server-7.14.0-Linux-x64.deb xserver-xorg-video-dummy

# command
sudo systemctl enable vncserver-x11-serviced.service
sudo systemctl start vncserver-virtuald.service
sudo cp /etc/X11/vncserver-virtual-dummy.conf /etc/X11/xorg.conf

# command
sudo nano /etc/gdm3/custom.conf
# add value
WaylandEnable=false

# command
sudo reboot
