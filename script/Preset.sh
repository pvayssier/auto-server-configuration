#!/bin/bash

usage(){
        echo "Usage : Preset.sh [OPTION]
        Setup your machine 
        -h            Prints help message (this message)
        -u name       Create a new user and his directory.
        -n hostname   Change the name of your machine."
}

user(){
        groupadd dev &> /dev/null
        useradd -m -s /bin/bash $newuser 
        usermod -aG dev $newuser 
        usermod -aG sudo $newuser
        echo "User $newuser added."
}

pinger(){
    ping -q -c 4 1.1.1.1 &> /dev/null
    if [ $# != 0 ]
    then
        echo "No internet connexion."
    fi
    ping -q -c 4 google.com &> /dev/null
    if [ $# != 0 ]
    then
        echo "No resolution name in ping google.com"
    fi
}

namer(){
        hostname $newname
        lastname=$(cat /etc/hostname)
        sed -i "s/$lastname/$newname/g" /etc/hostname
        sed -i "s/localhost/$newname/g" /etc/hosts
}

if [[ "$(id -u)" != "0" ]] ; then
        echo "This script must be run as root."
        exit 1
fi

echo "Lancement de l'installation"

while getopts ":hu:n:" option; do
        case "${option}" in
                h)
                        usage
                        exit 0
                ;;
                u)
                        newuser=${OPTARG}
                        user
                ;;
                n)
                        newname=${OPTARG}
                        namer
                ;;
                *)
                        log error "Option ${option} not recognized." 
                        usage
                        exit 1
                        ;;
        esac
done

pinger
apt-get -qq update
apt-get install -y -qq sudo

while true; do
        read -p "Reboot to save all changes Y/N" yn
        case $yn in
                [Yy]* ) reboot; break;;
                [Nn]* ) exit;;
                * ) echo "Please answer yes or no.";;
        esac
done