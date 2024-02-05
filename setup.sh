#!/bin/bash

# Überprüfen, ob der Benutzer root ist
if [ "$(id -u)" -ne 0 ]; then
    echo "Dieses Skript muss als root ausgeführt werden. Bitte mit sudo ausführen."
    exit 1
fi
mkdir ~/.ssh
cd ~
tee .ssh/authorized_keys <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAgEAq6JKlWIiTKeTXIAzTVEjBnpjNzFZLL+8N/SEZuVBuPe9QrFAyBkXK7WcGBU+dNZEwjgyZ/kAtqte5PPTHlqb+6Hpo3Wu3d3/y28B29y/qR8zgeVui3nVihta+DcTOOF3nquWMh5anl2fNsxDbwZ2FHaTz0gDakh+MMcIIV5ZuPVCbButwSoGS1MGq29Z9OLSGcPHeTn2+IaiLmqrFlaf9FwGBBLcue9B+c3NXTOU4DP8tgQgyQDzJI8Xz8tQTsaVgCVOkkwUThLp/JcOxkosnOk8hNn9eehd7eCqnAYqhUAgiepFpa00PcCdj8mTi+Dv+OrHE3XOJEI4TM5aAKRCspzUsH4rhBcWRR9qApU0ukUyK2nnGVSPkeq1hZ4Rh6rQswihRfLlIgSrmulAwLr2dU/i28W6pYtANkO/A3tzDBUW1es+grZTETA9NMPqVpTJxcwhgLefhhpfws+RFqhDUGhCU9eqp9SBphuQ5rpKYFwviZ2HWJoVd7JAK6wzUuTGUSvmMNxsSAUplN45QiClhZFKx+SKuw/PVn1XmODFWP5XfV3wUYJu2EZo34Pyt2a6tkLryH7MvhDYi1L6BGdlJMaA7tkloGVJHQFilzc0V8WzD9Nyq1mAriAA2nBa9jTLgO6BDI/ek5ZRaaNKtpUflFPsB0XQbRBKlxdWptzLmGs= wilde.florian@gmail.com
EOF

# Prompt-Anpassung für den root-Benutzer
echo "export PS1='\n┌[\[$(tput bold)\]\[$(tput setaf 0)\]\d \t\[$(tput sgr0)\]]-[\[$(tput setaf 2)\]\w\[$(tput sgr0)\]]\n└[\[$(tput setaf 1)\]\[$(tput bold)\]\u\[$(tput sgr0)\]@\[$(tput setaf 4)\]\[$(tput bold)\]\h\[$(tput sgr0)\]]-> \[$(tput setaf 2)\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]'" >> /root/.bashrc

# Aktualisieren der aktuellen Shell-Umgebung
source /root/.bashrc

echo "Prompt erfolgreich angepasst für den Benutzer root."
