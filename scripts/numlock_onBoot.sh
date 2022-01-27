#create numlock script
sudo touch /usr/local/bin/numlock.sh

echo '#!/bin/bash' | sudo tee /usr/local/bin/numlock.sh
echo '' | sudo tee -a /usr/local/bin/numlock.sh
echo 'for tty in /dev/tty{1..6}' | sudo tee -a /usr/local/bin/numlock.sh
echo 'do' | sudo tee -a /usr/local/bin/numlock.sh
echo '    /usr/bin/setleds -D +num < "$tty";' | sudo tee -a /usr/local/bin/numlock.sh
echo 'done' | sudo tee -a /usr/local/bin/numlock.sh

#make it executable
sudo chmod u+x /usr/local/bin/numlock.sh

#create service
sudo touch /etc/systemd/system/numlock.service

echo '[Unit]' | sudo tee /etc/systemd/system/numlock.service
echo 'Description=numlock' | sudo tee -a /etc/systemd/system/numlock.service
echo '' | sudo tee -a /etc/systemd/system/numlock.service
echo '[Service]' | sudo tee -a /etc/systemd/system/numlock.service
echo 'ExecStart=/usr/local/bin/numlock' | sudo tee -a /etc/systemd/system/numlock.service
echo 'StandardInput=tty' | sudo tee -a /etc/systemd/system/numlock.service
echo 'RemainAfterExit=yes' | sudo tee -a /etc/systemd/system/numlock.service
echo '' | sudo tee -a /etc/systemd/system/numlock.service
echo '[Install]' | sudo tee -a /etc/systemd/system/numlock.service
echo 'WantedBy=multi-user.target' | sudo tee -a /etc/systemd/system/numlock.service

#start service
sudo systemctl start numlock.service
