#!/bin/bash
# Bash Menu Script Example
chmod +x files/adblinux
chmod +x files/fastbootlinux
chmod a+x 3-Amazon-Fire-5th-gen-linux-mac.sh
# Amazon ad remover Utility for Linux and OSX
# RootJunky.com
# Lets check what platform we are running on
# We will check what we are running on and then set some variables for some funtimes
function platform
{       platform=`uname`
        if [ $(uname -p) = 'powerpc' ]; then
        echo "[-] PowerPC is not supported."
        exit 1
        fi
 
        if [ "$platform" = 'Darwin' ]; then
        ADB="adb/./adbosx"
        FASTBOOT="adb/./fastbootosx"
        version="OS X"
        else
        ADB="adb/./adblinux"
        FASTBOOT="adb/./fastbootlinux"
        version="Linux"
               
        fi
}

platform

echo   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
echo   "    ___  ____  ____  _____    ____  ___  ____ ____  __  ________  _  _    "
echo   "   / _ \/ _  \/ _  \/_  _/_  / / / / / \/ / //_/\ \/ / / __/ _  \/ \/ \   "
echo   "  / , _/ |_| / |_| / / / / // / /_/ /    /  <    \  /_/ /_/ |_| / ,  , \  "
echo   " /_/|_|\____/\____/ /_/  \___/\____/_/\_/_/\_/   /_/_/___/\____/_/ \/ \_\ "
echo   "                                                                          "
echo   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
echo "[*] RootJunkys"
echo "[*] Linux / OSX Version"
echo "[*] Remember to chmod +x this script"
echo "[*] NOTE Remember you may have to run the tool up to as many as 5 times"
echo "----------------------------------------------------------------------------"
PS3='Please enter your choice number: '
options=("Remove Amazon Ads 1" "Quit 2")
select opt in "${options[@]}"
do
    case $opt in
        "Remove Amazon Ads 1")
    		echo "--------------------------------------------------------------------------------"
			echo "[*] First you must turn on ADB DEBUGGING in your Amazon device in settings"
			echo "[*] go to about phone then click on build number 7 times to enable"
			echo "[*] developer options then in developer options turn on Enable adb option."
			echo "--------------------------------------------------------------------------------"
			echo "press enter to continue"
    		    read \n
			sudo $ADB kill-server
    		sudo $ADB start-server
    		sudo $ADB wait-for-device
			echo "[*] waiting for device to connect"
			echo "--------------------------------------------------------------------------------"
			echo "[*] Removing ads now 1"
			sudo $ADB shell pm uninstall -k --user 0 com.amazon.phoenix
			echo "--------------------------------------------------------------------------------"
			echo "[*] Removing ads now 2"
			sudo $ADB shell pm uninstall -k --user 0 com.amazon.widgets
			echo "--------------------------------------------------------------------------------"
			echo "[*] Ads have successfully been removed. Press any key to reboot the phone."
			echo "[*] NOTE: If ads are still on phone after reboot then run this script again."
			echo "--------------------------------------------------------------------------------"
			echo "[*] press enter to exit RootJunky OUT"
    		    read \n
    		sudo $ADB reboot
    		sudo $ADB kill-server
    		bash Run-Me-To-Remove-Ads-linux-mac.sh
     		exit
            ;;
        "Quit 2")
            exit
            ;;
        *) echo invalid option;;
    esac
done