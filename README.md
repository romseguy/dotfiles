# AppImage

mkdir ~/Applications
cd ~/Applications
wget https://github.com/TheAssassin/AppImageLauncher/releases/download/continuous/appimagelauncher-lite-2.2.0-gha111-d9d4c73-x86_64.AppImage
chmod +x appimagelauncher-lite-2.2.0-gha111-d9d4c73-x86_64.AppImage
./appimagelauncher-lite-2.2.0-gha111-d9d4c73-x86_64.AppImage install

After this install, when you run the first time an appimage it shows up in menu and from there you can add it to the panel by the right click menu
Depending from how the appimage has been packaged, from the menu you can also update the ones that allow update (right click menu on the appimage name).

# bun

bun pm ls
find : @([^@]+)@([^,]+)
replace : "@$1":"$2",

# dmenu

custom launchers as desktop files are located in ~/.local/share/applications

# git
git fetch && git reset origin/main --hard

# email
function offu(string) { return string.split('').map(char => `&#${char.charCodeAt(0)};`).join(''); }

# MongoDB

db.createUser({user:"username",pwd:"password", roles:[{role:"userAdminAnyDatabase",db:"admin"}],mechanisms:["SCRAM-SHA-1"]})
mongo -u username -p password --authenticationDatabase admin

# MySQL

ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'x';

## DROP all tables
  -- Increase the maximum length for GROUP_CONCAT
  SET SESSION GROUP_CONCAT_MAX_LEN = 32768;

  -- Generate and execute DROP statements for all tables in a specific database
  SELECT CONCAT('DROP TABLE IF EXISTS ', GROUP_CONCAT(table_name))
  FROM information_schema.tables
  WHERE table_schema = 'your_database_name';

# PWA
bunx pwa-asset-generator logo.png ./icons

# usb

sudo mount /dev/sdb1 /media/x240/usb
sudo mount /dev/sdc1 /media/x240/usb2

sudo umount -l /dev/sdb1
sudo umount -l /dev/sdc1

# Xterm

Since some programs still use the old gnome-terminal the best way to get around the problem is to symlink it to xterm:

mkdir ~/.local/bin
ln -s /usr/bin/xterm ~/.local/bin/gnome-terminal
