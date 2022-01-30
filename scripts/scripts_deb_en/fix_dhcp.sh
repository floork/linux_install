sudo touch  /etc/NetworkManager/conf.d/dhcpclient.conf

echo "[main]" | sudo tee /etc/NetworkManager/conf.d/dhcpclient.conf
echo "dhcp=dhclient" | sudo tee -a /etc/NetworkManager/conf.d/dhcpclient.conf
