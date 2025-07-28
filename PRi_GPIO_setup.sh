# install
sudo apt install python3-rpi.gpio
pip3 install rpi-lgpio

# command
sudo nano /etc/udev/rules.d/99-rpi_gpio.rules
# add value
SUBSYSTEM=="gpio", KERNEL=="gpiochip*", MODE="0666"

# command
sudo udevadm control --reload-rules
sudo udevadm trigger
