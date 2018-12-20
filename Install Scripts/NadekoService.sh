#!/bin/bash

root=$(pwd)
unitcfg="/etc/systemd/system/nadeko.service"
runfile="NadekoARU_Latest.sh"
regrunfile="NadekoARN.sh"

# Prompt warning if service file exists. Give option to quit.
if [ -e $unitcfg ]
then
    echo -e "$unitcfg already exists.\nPress [Y] to replace it or [N] to exit."
    while true; do
        read -p "[Y/N]: " yn
        case $yn in
            [Yy]* ) break;;
            [Nn]* ) echo "Exiting..."; exit;;
            * ) echo "Please enter only Y or N.";;
        esac
    done
fi

echo -e "Do you want to automatically update the bot?\nPress [Y] for yes or [N] to run normally."
while true; do
    read -p "[YN]: " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) runfile="$regrunfile"; break;;
        * ) echo "Please enter only Y or N.";;
    esac
done

wget "https://raw.githubusercontent.com/Kwoth/NadekoBot-BashScript/1.9/$runfile" -O "$runfile"

echo "[Unit]
Description=NadekoBot

[Service]
WorkingDirectory=$root
User=$USER
Type=forking
ExecStart=/usr/bin/tmux new-session -s Nadeko -d 'bash $root/$runfile'
ExecStop=/bin/sleep 2

[Install]
WantedBy=multi-user.target" > $unitcfg

sudo systemctl daemon-reload
sudo systemctl enable nadeko
sudo systemctl start nadeko

echo "Finished installing NadekoBot as a service."
echo "To show information about Nadeko, run 'sudo systemctl status nadeko'."
echo "To stop/start/restart Nadeko, run 'sudo systemctl [stop/start/restart] nadeko'."
echo "You can view Nadeko's logs with 'sudo tmux a -t Nadeko'. Exit from these logs by pressing ctrl+B and then D."


exit