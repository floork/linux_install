mkdir -p ~/.icons/default
touch ~/.icons/default/index.theme
echo "[icon theme]" | sudo tee ~/.icons/default/index.theme
echo "Inherits=Nordzy-cursors" | sudo tee ~/.icons/default/index.theme
ln -s /usr/share/icons/Nordzy-cursors/cursors ~/.icons/default/cursors
