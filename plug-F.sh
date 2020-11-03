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
	echo "I        D" > 1
	echo "n        a" > 2
	echo "s        n" > 3
	echo "t        d" > 4
	echo "a        e" > 5
	echo "l        r" > 6
	echo "l        F" > 7
	echo "i        u" > 8
	echo "n        z" > 9
	echo "g        z" > 10

	lolcat 1
	rm 1
	sleep 1
	lolcat 2
	rm 2
	sleep 1
	lolcat 3
	rm 3
	sleep 1
	lolcat 4
	rm 4
	sleep 1
	lolcat 5
	rm 5
	sleep 1
	lolcat 6
	rm 6
	sleep 1
	lolcat 7
	rm 7
	sleep 1
	lolcat 8
	rm 8
	sleep 1
	lolcat 9
	rm 9
	sleep 1
	lolcat 10
	rm 10
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
      	LOLpause
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
    ASTAT=$(cat /home/$USER/.config/.anon_status)
	echo -e "${EXC} ${BIGreen}Anonymous: ${BIYellow}${ASTAT}${NC}"
	echo -e " ${W}==================================================\n ${ORNG}Which tool would you like to use?\n ${W}==================================================${NC}"
	echo -e "\n ${ORNG}1.${W} FuzzBunch          ${ORNG}3.${W} Both ${NC}"
	echo -e " ${ORNG}2.${W} DanderSpritz		  ${ORNG}4.${W} Quit ${NC}"
    	echo -e " ${W}"
    	echo -n " =============================#?: "
	read FDF
	if [[ ${FDF} == "1" ]]; then
		fbc &
	elif [[ ${FDF} == "2" ]]; then
		dander &
	elif [[ ${FDF} == "3" ]]; then
		fbc &
		dander &
	elif [[ ${FDF} == "4" ]]; then
		exit 1
	elif [[ ${CMM} == "info" ]]; then
        	xterm -e bash /opt/sifter/info/info.sh &
		fuzzyspritz
	else
		echo -e "${ORNG}[${RED}!${ORNG}] ${YLW}Invalid option selected, please choose\nthe corresponding module number${NC}"
        	echo -e "[${LP}*${NC}] ${RED}Hint: ${ORNG}Type info into any menu to open the Info Screen${NC}"
		fuzzyspritz
	fi
}
# Runtime
install
cd /root/.wine/drive_c/fuzzbunch/windows
fuzzyspritz
echo " ================================================================================="
cd /opt/sifter

######################               VGhlIERlYWQgQnVubnkgQ2x1Yg==             ########################

