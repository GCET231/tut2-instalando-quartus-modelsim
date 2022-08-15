# /bin/bash

touch /etc/profile.d/quartus.sh
touch /etc/profile.d/modelsim.sh

echo "export PATH=$PATH:/home/${USER}/intelFPGA/20.1.1/quartus/bin" >> /etc/profile.d/quartus.sh
echo "export PATH=$PATH:/home/${USER}/intelFPGA/20.1.1/modelsim_ase/bin" >> /etc/profile.d/modelsim.sh
chmod +x /etc/profile.d/quartus.sh
chmod +x /etc/profile.d/modelsim.sh

source /etc/profile.d/quartus.sh
source /etc/profile.d/modelsim.sh

touch /etc/udev/rules.d/51-altera-usb-blaster.rules

echo -e 'SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6001", MODE="0666"\nSUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6002", MODE="0666"\nSUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6003", MODE="0666"\nSUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6010", MODE="0666"\nSUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6810", MODE="0666"' >> /etc/udev/rules.d/51-altera-usb-blaster.rules

udevadm control --reload