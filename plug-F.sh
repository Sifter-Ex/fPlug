#!/bin/bash
# s1l3nt78
# 7heDeadBunnyCollective
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'
LOLpause(){
	D='1'
	sudo touch .numbers
	sudo chown $USER:$USER .numbers
	for i in `seq -s \  5`;
	do
		echo ${D}... > .numbers
		lolcat .numbers
		sleep 1
		D=$(( $D + 1 ))
	done
	rm .numbers
}
# FuzzyDander Install
install(){
    if [[ ! -d '/root/.wine/drive_c/fuzzbunch' ]]; then
    	if [[ $EUID -ne 0 ]]; then
   		echo -e "${RED}Initial install must be done as ${ORNG}root user${RED} - NOT just SUDO command${NC}"
   		exit 1
	fi
	FC=$(pwd)
	cp plug-F.sh /opt/sifter/modules/exmods/fuzzyd.sh	
      	echo -e "${LP}"
      	figlet -f mini "    Installing DanderFuzz...."
      	echo -e "${NC}"
      	LOLpause
	echo -e "${RED}[${LP}!${RED}]${W}::${ORNG}Pulling required files for the Framework ..${NC}"
	git clone https://github.com/Sifter-Ex/fPlug
      	dpkg --add-architecture i386
      	apt update
      	apt-get install xterm wine wine32 wine-development wine-binfmt winexe
      	if [[ ! -d '/root/.wine' ]]; then
		echo -e "${RED}Please map a new drive\n${YLW}Drive 'd:' to '/root/.wine/d_drive'${NC}"
        	sleep 10
      		winecfg
          	sleep 15
	else
		echo -e "${RED}Please map a new drive\n${YLW}Drive 'd:' to '/root/.wine/d_drive'${NC}"
      	fi
	sudo mv DFrame /root/.wine/drive_c/fuzzbunch
        sudo mkdir /root/.wine/d_drive
        sudo mkdir /root/.wine/d_drive/logs
        sleep 5
        echo -e "${RED}"
        echo "When registery opens, please copy 'C:\fuzzbunch;C:\fuzzbunch\windows;C:\Python26;C:\Python26\Scripts' to environment path" &
        echo -e "${NC}"
        sudo wine regedit
        sleep 5
        cd /root/.wine/drive_c/fuzzbunch/dependencies
        echo -e "${W}Will now install runtime dependancies${NC}"
        LOLpause
        echo -e "${W}Please accept all default options for install${NC}"
        sudo wine msiexec /i python-2.6.6.msi
        sudo wine jre-6-windows-i586.exe
        sudo wine pywin32-221.exe
        sleep 5
	    rm -rf ${FC}
        echo -e "${LP}Done${NC}"
    fi
}
# FuzzBunch
fbc(){
    echo -e "${RED}"
    figlet -f mini "FuzzBunch"
    echo -e "${ORNG}"
    sudo wine start python fb.py
}
# DanderSpritz
dander(){
    echo -e "${RED}"
    figlet -f mini "DanderSpritz"
    echo -e "${ORNG}"
    sudo wine start python start_lp.py
}
# FuzzBunch & DanderSpritz
fuzzyspritz(){
    echo -e "${RED}"
echo "		██▄   ██      ▄   ██▄   ▄███▄   █▄▄▄▄ ▄████     ▄▄▄▄▄▄   ▄▄▄▄▄▄ "  
echo "		█  █  █ █      █  █  █  █▀   ▀  █  ▄▀ █▀       ▀   ▄▄▀  ▀   ▄▄▀  " 
echo "		█   █ █▄▄█ ██   █ █   █ ██▄▄    █▀▀▌  █▀▀ █   █ ▄▀▀   ▄▀ ▄▀▀   ▄▀ "
echo "		█  █  █  █ █ █  █ █  █  █▄   ▄▀ █  █  █   █   █ ▀▀▀▀▀▀   ▀▀▀▀▀▀  " 
echo "		███▀     █ █  █ █ ███▀  ▀███▀     █    █  █▄ ▄█                  " 
echo "		        █  █   ██                ▀      ▀  ▀▀▀                   " 
echo "		       ▀                                                         " 
    echo -e "${ORNG}"
    PS3='Which tool would you like to deploy?'
        options=("FuzzBunch" "DanderSpritz" "Both" "Back" "Quit")
        select opt in "${options[@]}"
        do
                case $opt in
                    "FuzzBunch")
                        fbc
                        ;;

                    "DanderSpritz")
                        dander
                        ;;

                    "Both")
                        fbc 
                        dander
                        ;;

                    "Back")
                        cd /opt/sifter
                        ./sifter -e
                        ;;

                    "Quit")
                        exit 2
                        ;;

                esac
        done
    echo -e "${NC}"
}
# Runtime
install
cd /root/.wine/drive_c/fuzzbunch/windows
fuzzyspritz
echo " ================================================================================="
cd /opt/sifter

######################               VGhlIERlYWQgQnVubnkgQ2x1Yg==             ########################

