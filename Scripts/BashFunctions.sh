#ALL NEW SCRIPTS 2023!
echo "loaded go_ helper script:$BASH_SOURCE"
# Various colours
RED="\033[0;31m"
YELLOW="\033[0;33m"
GREEN="\033[0;32m"
CYAN="\033[0;36m"
NC="\033[0m"
#Set this to the installed directory, if cloned to root of user will be ~/LinuxToolbox
export LINUXTOOLBOX=~/LinuxToolbox
LS_COLORS='rs=0:di=1;35:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS
if [ -z ${WSL_DISTRO_NAME} ]; then
    echo "Not running WSL"
    CUSTOM_NAME=${HOSTNAME}
else
    CUSTOM_NAME=${WSL_DISTRO_NAME}
    #Note WSL is in quiet mode, to disable remove /home/dsw12/.hushlogin
    echo "Running WSL: $WSL_DISTRO_NAME"
fi
#ONSERVER="False"
if ! pgrep -u $USER sshd >/dev/null; then
    echo "sshd is not running for user $USER, we are probably local"
    ONSERVER="False"
else
    echo "sshd is running for user $USER, we are probably on a remote server"
    ONSERVER="True"
fi
#Are we on a server?
if [ "$ONSERVER" == "True" ]; then
    #printf '%s\n' "on the right host"
    echo "Running on Server: $HOSTNAME"
    #On slab use default prompt, but backup as we need to restore post pythoon vert env
    PS1_CFG=$PS1
    ORIG=$PS1
    go_python_virtual_env()
    {
    #Setup virtual env by default
    #export PATH=$PATH:/opt/repo_flow/
    #export WORKON_HOME=/home/dswan
    #source ~/PythonVirtualEnv/bin/activate
    #export PATH=$PATH:~/local_progs/pypy3.7-v7.3.7-linux64/bin
    echo $PATH
    source ~/venv/bin/activate
    #source ./PythonCollection/venv/bin/activate
    echo #############
    echo Default Virtual Env Started
    echo #############
    #set the window title
    go_set_titlex Python
    cd ~/PythonCollection/MeshBuildScripts/mesh-pyhon-scripts-v2-ad-hoc/
    }
    go_shell_spk()
    {
    echo "Setting up python"
    go_python_virtual_env
    cd ~/PythonCollection/MeshBuildScripts/mesh-pyhon-scripts-v2-ad-hoc/
    #echo "cd to spk directory"
    python 0.3-cd-spk.py
    go_python_deactivate
    #the python file extracts the currect spk directory and writes it into a shell script
    source ~/env-spk.sh
    echo "set shell name"
    #restore PS after vert env deactivated
    #PS1=$PS1_CFG
    go_set_titlex SPK
    }

    go_python_deactivate()
    {
    echo #############
    echo Default Virtual Env deactivated
    echo #############
    deactivate
    #restore PS1
    PS1=$PS1_CFG
    }

    go_docker_env()
    {
    echo "Docker Env for MR"
    #sc docker run sky-q-in-life  /bin/bash
    #echo $PWD
    #sc docker run sky-q-in-life  '. $LOCAL_START_DIR/LinuxToolbox/go_docker_env.sh;'
    sc docker run sky-q-in-life $LINUXTOOLBOX/go_docker_env.sh
    }

else #NOT RUNNING ON SLAB
    #echo "Default env"
    export IP_TITAN="192.168.1.137"
    export IP_MR="192.168.1.160"
    export IP_MR=10.242.28.248
    export IP_PI=192.168.1.202
    export STB_SCRIPTS=$LINUXTOOLBOX/STB_Scripts/STR_Scripts
    #this is for symbolic links into Window, assuming this is WSL!
    export PATH=$PATH:~/WinApps
    #for example in WinApps
    #ln -s /mnt/c/Program\ Files\ \(x86\)/Meld/Meld.exe meld
    #C:\Users\d_r_s\AppData\Local\Microsoft\WindowsApps\python3.exe

    echo "Not on Server: $HOSTNAME"
    echo "Windows Linked apps go here:~/WinApps/"
    #echo "IP_TITAN:$IP_TITAN"
    #echo "IP_MR:$IP_MR"
    echo "IP_PI:$IP_PI"
    #DRSMOD custom prompt & palette
    PS1_CFG="\[\e]0;\u@($CUSTOM_NAME)\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@$CUSTOM_NAME\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$"
    #set Prompt
    PS1=$PS1_CFG

    go_python_virtual_env(){
    echo "setup local python virtual env"
    #echo "Localenvsetup" > myvertualenv.txt
    if ! command -v deactivate &> /dev/null; then
    echo "Virtualenv is not activated, continue."
    fi
    python3 -m venv ./venv
    source ./venv/bin/activate
    pip3 install -r requirements.txt
    }
    go_mrbox_ssh(){
    echo "sshpass -p 'themoose' ssh darwin@$IP_MR"
    echo 'for ifconfig: /sbin/ifconfig'
    sshpass -p 'themoose' ssh darwin@$IP_MR
    }

    go_mrbox_telnet(){
    echo "telnet $IP_MR"
    telnet $IP_MR
    }

    go_mrbox_scp_testscripts(){
    echo "sshpass -p 'themoose' scp -r $STB_SCRIPTS darwin@$IP_MR://"
    echo "Copying $STB_SCRIPTS to target:"
    ls "$STB_SCRIPTS"
    sshpass -p 'themoose' scp -r $STB_SCRIPTS darwin@$IP_MR://
    }

    go_ping_network(){
    echo 'ping network'
    for range in {0..255};
    do
    IPADDRESS="192.168.1.$range"
    if ping -q -c1 -w1 $IPADDRESS >/dev/null; then
      echo ""
      echo "$IPADDRESS:up"
    else
      echo -n "."
    fi
    done
    }

    go_pi_ssh(){
    echo "_ssh pi@$IP_PI"
    ssh pi@$IP_PI
    }

    go_oreo_ssh(){
    echo '_ssh dsw12@oreo'
    ssh dsw12@oreo
    }

    go_oreo_sshfs(){
    if [ -z "$1" ]
      then
        echo 'verbose example: sshfs -o allow_other dsw12@oreo:/home/dsw12/RDK_Downloads/ /home/dsw12/remote-mount/'
        echo 'sshfs -o allow_other dsw12@oreo:/home/dsw12/'$1 $2
        echo "add remote path, local will default to /home/dsw12/remote-mount/ if no path provide"
        return 1
    fi
    if [ $# -eq 1 ]; then
      echo 'One params passed'
      echo " "
      #echo 'Chosen mount path: sshfs -o allow_other dsw12@slab:/home/dsw12/'$1' /home/dsw12/remote-mount/'
      #SSHFS='sshfs -o allow_other dsw12@slab:/home/dsw12/'$1' /home/dsw12/remote-mount/'
      #MOUNTDIR="/home/dsw12/remote-mount"
      if [[ $1 == /* ]]; then STRINGPATH=$1; else STRINGPATH="/home/dsw12/$1"; fi
      SSHFS="sshfs -o allow_other dsw12@oreo:"$STRINGPATH" /home/dsw12/remote-mount/"
      #use home instead of ~ as we grep for path to see if we need to unmount first
      MOUNTSUBDIR="remote-mount"
      MOUNTDIR="$HOME/$MOUNTSUBDIR"
    fi
    if [ $# -eq 2 ]; then
      echo 'Two params passed'
      echo " "
      if [[ $1 == /* ]]; then STRINGPATH=$1; else STRINGPATH="/home/dsw12/$1"; fi
      if [[ $2 == /* ]]; then MOUNTDIR=$2; else MOUNTDIR="$HOME/$2"; fi
      SSHFS="sshfs -o allow_other dsw12@oreo:$STRINGPATH $MOUNTDIR"
      MOUNTSUBDIR="$2"
    fi
    echo "Chosen mount path: $SSHFS"
    echo "Looking good, y to accept:"
    read ContinueState

    if [ "$ContinueState" != "y" ]; then
    echo "bye!"
      return 1
    fi

    if grep -qs $MOUNTDIR /proc/mounts; then
    #if mount | grep $MOUNTDIR > /dev/null; then
        #we never want to unmount if we're in the mounted directory.
        #Belt and braces cd to home directory before umount then cd back to current directory to ensure it can't happen
        CURRENTDIR=$PWD
        cd ~/
        echo "It's mounted, unmounting $MOUNTDIR"; umount $MOUNTDIR;
        cd $CURRENTDIR
    fi
    #mount the directory
    echo "Mounting: $MOUNTDIR"
    $SSHFS
    mount | grep sshfs
    #go_set_title_bannerx "sshfs $MOUNTSUBDIR"
    go_set_titlex "sshfs: $MOUNTSUBDIR"
    }

    go_slab_ssh(){
    echo '_ssh dsw12@slab'
    ssh dsw12@slab
    }

    go_slab_sshfs(){
    if [ -z "$1" ]
      then
        echo 'verbose example: sshfs -o allow_other dsw12@slab:/home/dsw12/RDK_Downloads/ /home/dsw12/remote-mount/'
        echo 'sshfs -o allow_other dsw12@slab:/home/dsw12/'$1 $2
        echo "add remote path, local will default to /home/dsw12/remote-mount/ if no path provide"
        return 1
    fi
    if [ $# -eq 1 ]; then
      echo 'One params passed'
      echo " "
      #echo 'Chosen mount path: sshfs -o allow_other dsw12@slab:/home/dsw12/'$1' /home/dsw12/remote-mount/'
      #SSHFS='sshfs -o allow_other dsw12@slab:/home/dsw12/'$1' /home/dsw12/remote-mount/'
      #MOUNTDIR="/home/dsw12/remote-mount"
      if [[ $1 == /* ]]; then STRINGPATH=$1; else STRINGPATH="/home/dsw12/$1"; fi
      SSHFS="sshfs -o allow_other dsw12@slab:"$STRINGPATH" /home/dsw12/remote-mount/"
      #use home instead of ~ as we grep for path to see if we need to unmount first
      MOUNTSUBDIR="remote-mount"
      MOUNTDIR="$HOME/$MOUNTSUBDIR"
    fi
    if [ $# -eq 2 ]; then
      echo 'Two params passed'
      echo " "
      if [[ $1 == /* ]]; then STRINGPATH=$1; else STRINGPATH="/home/dsw12/$1"; fi
      if [[ $2 == /* ]]; then MOUNTDIR=$2; else MOUNTDIR="$HOME/$2"; fi
      SSHFS="sshfs -o allow_other dsw12@slab:$STRINGPATH $MOUNTDIR"
      MOUNTSUBDIR="$2"
    fi
    echo "Chosen mount path: $SSHFS"
    echo "Looking good, y to accept:"
    read ContinueState

    if [ "$ContinueState" != "y" ]; then
    echo "bye!"
      return 1
    fi

    if grep -qs $MOUNTDIR /proc/mounts; then
    #if mount | grep $MOUNTDIR > /dev/null; then
        #we never want to unmount if we're in the mounted directory.
        #Belt and braces cd to home directory before umount then cd back to current directory to ensure it can't happen
        CURRENTDIR=$PWD
        cd ~/
        echo "It's mounted, unmounting $MOUNTDIR"; umount $MOUNTDIR;
        cd $CURRENTDIR
    fi
    #mount the directory
    echo "Mounting: $MOUNTDIR"
    $SSHFS
    mount | grep sshfs
    #go_set_title_bannerx "sshfs $MOUNTSUBDIR"
    go_set_titlex "sshfs: $MOUNTSUBDIR"
    }

    go_scp_from_pi(){
    echo 'copy from pi, use . or path for destination'
    echo "pi@$IP_PI://home/pi/$1 $2"
    scp -r pi@$IP_PI://home/pi/$1 $2
    }
    go_scp_to_pi(){
    echo 'copy to pi'
    echo "scp -r $1 pi@$IP_PI://home/pi/$2"
    scp -r $1 pi@$IP_PI://home/pi/$2
    }

    go_pi_sshfs(){
    if [ -z "$1" ]
      then
        echo 'verbose example: sshfs -o allow_other dsw12@slab:/home/dsw12/RDK_Downloads/ /home/dsw12/remote-mount/'
        echo 'sshfs -o allow_other dsw12@slab:/home/dsw12/'$1 $2
        echo "add remote path, local will default to /home/dsw12/remote-mount/ if no path provide"
        return 1
    fi
    if [ $# -eq 1 ]; then
      echo 'One params passed'
      echo " "
      #echo 'Chosen mount path: sshfs -o allow_other dsw12@slab:/home/dsw12/'$1' /home/dsw12/remote-mount/'
      #SSHFS='sshfs -o allow_other dsw12@slab:/home/dsw12/'$1' /home/dsw12/remote-mount/'
      #MOUNTDIR="/home/dsw12/remote-mount"
      if [[ $1 == /* ]]; then STRINGPATH=$1; else STRINGPATH="/home/pi/$1"; fi
      SSHFS="sshfs -o allow_other pi@$IP_PI:"$STRINGPATH" /home/dsw12/remote-mount/"
      #use home instead of ~ as we grep for path to see if we need to unmount first
      MOUNTSUBDIR="remote-mount"
      MOUNTDIR="$HOME/$MOUNTSUBDIR"
    fi
    if [ $# -eq 2 ]; then
      echo 'Two params passed'
      echo " "
      if [[ $1 == /* ]]; then STRINGPATH=$1; else STRINGPATH="/home/pi/$1"; fi
      #if [[ $1 == /* ]]; then STRINGPATH=$1; else STRINGPATH="/home/dsw12/$1"; fi
      if [[ $2 == /* ]]; then MOUNTDIR=$2; else MOUNTDIR="$HOME/$2"; fi
      SSHFS="sshfs -o allow_other pi@$IP_PI:$STRINGPATH $MOUNTDIR"
      MOUNTSUBDIR="$2"
    fi
    echo "Chosen mount path: $SSHFS"
    echo "Looking good, y to accept:"
    read ContinueState

    if [ "$ContinueState" != "y" ]; then
    echo "bye!"
      return 1
    fi

    if grep -qs $MOUNTDIR /proc/mounts; then
    #if mount | grep $MOUNTDIR > /dev/null; then
        #we never want to unmount if we're in the mounted directory.
        #Belt and braces cd to home directory before umount then cd back to current directory to ensure it can't happen
        CURRENTDIR=$PWD
        cd ~/
        echo "It's mounted, unmounting $MOUNTDIR"; umount $MOUNTDIR;
        cd $CURRENTDIR
    fi
    #mount the directory
    echo "Mounting: $MOUNTDIR"
    $SSHFS
    mount | grep sshfs
    #go_set_title_bannerx "sshfs $MOUNTSUBDIR"
    go_set_titlex "sshfs: $MOUNTSUBDIR"
    }

    go_mobx_home (){
        echo "Mobaxterm home - WLS2 specific";
        cd /mnt/c/Users/DSW12/MobaXterm/home/
    }

    go_onedrive (){
      WIN_USER1=$(ls /mnt/c/Users | grep -i dsw12)
      WIN_USER2=$(ls /mnt/c/Users | grep -i d_r_s)
      if [ -n "$WIN_USER1" ]; then
        WIN_USER=$WIN_USER1
        #echo $WIN_USER
      fi
      if [ -n "$WIN_USER2" ]; then
        WIN_USER=$WIN_USER2
        #echo $WIN_USER
      fi
      echo "We found the windows user for dave: $WIN_USER"
      echo "trying to cd to directory:/mnt/c/Users/$WIN_USER/OneDrive"
      cd /mnt/c/Users/$WIN_USER/OneDrive
    }

    go_get_wifi (){
      WIFI_ID="BT-PJA6W2"
      echo -n "$WIFI_ID"
      netsh.exe wlan show profile "name=$WIFI_ID" key=clear | grep "Key"
    }

    go_apt_essentials(){
      #echo "$password"
      read -sp "Enter your password to install essential apps:" password
      echo "$password" | sudo -S apt install net-tools tree -y
    }

    go_apt_docker(){
      #read -sp "Enter your password to install essential apps:" password
      echo "$password" | sudo -S apt install docker.io
      echo "$password" | sudo -S groupadd docker
      echo "$password" | sudo -S usermod -aG docker $USER
      #newgrp docker #not nesessary as using usermod to add group...probably...
    }
    go_docker_create(){
      echo "create a generic docker instance in current directory"
      echo "to remove old images docker rmi id -f"
      mkdir -p ./docker/workspace
      script_dir="$(dirname -- "$BASH_SOURCE")"
      #echo $script_dir/../GenericFiles
      #cat $script_dir/../GenericFiles/Dockerfile
      cp $script_dir/../GenericFiles/Dockerfile ./docker/
      read -sp "Enter your password to install essential apps:" password
      echo "$password"
      echo "$password" | sudo -S service docker start
      #echo "service started"
      echo "$password" | sudo -S service docker status
      docker build -t mydockerimage ./docker
      docker image ls
      #mkdir ./workspace
      #run if forground
      #docker run -v ./workspace:/docker/workspace -it --rm mydockerimage
      #run if forground with persistant mapped storage
      docker run -v $PWD/docker/workspace:/workspace -it --rm mydockerimage
      #run in background needs work!
      #docker run -d --rm mydockerimage
      #docker ps # check the docker ps is actually running now
    }
    #go_docker_run

    go_foxyproxy_ssh(){
    #below is deprecated, can remove probably
    #echo 'ssh -D 9998 -C2Nn dev-jumphost'
    #echo 'FoxyProxy Host:localhost port:9998 SOCKS proxy AND Socks v5, 2 radio button, not one, no login authentication details needed'
    #echo 'URL pattern *bskyb*'
    echo 'to reset keys (~/.ssh) it is ssh-copy-id dswan@10.241.0.89'
    echo 'wait 2 seconds......'
    sleep 2
    #mytitle="Foxy Proxy"
    #echo -e '\033]2;'$mytitle'\007'
    go_set_title_bannerx "Foxy Proxy"
    for i in {1..50}
    do
    	pkill -9 ssh
    	echo "Welcome orcus $i times-Starting foxyproxy ssh"
      echo 'ssh -D 9998 orcus -C2Nn'
    	ssh -D 9998 orcus -C2Nn
      echo 'Connected'
      ifconfig
    	done
    }

    go_explorer(){
    if [ -z "$1" ]; then
      Directory="$PWD/."
      echo "open explorer in current directory: $Directory"
    else
      Directory=$1
      echo "open explorer in directory: $Directory"
    fi
    echo "Looking good, y to accept: explorer.exe ${Directory}"
    read ContinueState
    if [ "$ContinueState" != "y" ]; then
      echo "bye!"
      return 1
    fi
    explorer.exe `wslpath -w "$Directory"`
    #explorer.exe .
    }

    go_wsl(){
    #powershell.exe "wsl --list -v"
    echo "WSL command options"
    echo "l - wsl --list -v (LIST INSTALLED)"
    echo "o - wsl --list --online (LIST AVALIABLEON)"
    echo "x - wsl --shutdown (KILL)"
    echo "q - quit out"
    read ContinueState
    if [ "$ContinueState" == "l" ]; then
    runcmd="wsl --list -v"
    elif [ "$ContinueState" == "o" ]; then
    runcmd="wsl --list --online"
    elif [ "$ContinueState" == "x" ]; then
    runcmd="wsl --shutdown"
    else
    echo "bye!"
    return 1
    fi
    echo $runcmd
    powershell.exe $runcmd
    }

    go_network_check(){
    if (ifconfig | grep "eth0" > /dev/null); then
    MyNet="Network eth0"
    elif (ifconfig | grep "inet" > /dev/null); then
    MyNet="Network (but no eth0)"
    else
    echo -e "${RED}WARNING${NC}:Network down\n"
    return 1
    fi
    if wget -q --spider http://google.com ; then
    echo "$MyNet up & Online"
    else
    echo -e "$MyNet up & ${RED}Offline${NC}\n"
    fi
    }

    git_clone_sub ()
    {
    if [ -z "$2" ]
      then
        echo 'Insufficent, you need to know the subdirectory you are trying to clone'
        echo 'for example:'
        echo 'git clone-sub required-subdirectory https://repo-url/repo-name.git'
        return 1
    fi
        #git clone-sub dbus-example https://github.com/wware/stuff.git
        REPO_NAME="$(echo $2 | grep -oE '[^/]+$')";
        REPO_NAME2="${REPO_NAME%.*}"
        echo "here:"
        echo "repo:$REPO_NAME Directory:$REPO_NAME2"
        echo "repo:$2 Directory:$1"
        git clone --filter=blob:none --no-checkout $2
        cd $REPO_NAME2;
        #cd stuff
        git sparse-checkout set --no-cone "$1/*"
        if [ -n "$3" ]; then
            git pull origin $3;
            git checkout $3;
        else
            git fetch origin;
            git checkout main
            [[ $? != 0 ]] && git checkout master;
        fi
    }

    #Scripts to run by default on slab
    echo "ADDING git_clone_sub: allows git clone-sub via alias in .gitconfig"
    go_network_check
fi #NOT RUNNING ON SLAB
#common bash functions can go here
go_quotax()
{
du --max-depth=1 -h | sort -nr
}
go_clearx(){
echo "clearing scrollback"
printf '\033c\e[3J'
}
go_historyx()
{
history | cut -c 8-
}
go_lsx()
{
ls -l --time-style=+%Y
}
go_ag_shx(){
echo "Will search shell scripts for given string"
echo "find -iname \*.sh -exec grep -i '$1' {} \; -print"
find -iname \*.sh -exec grep -i $1 {} \; -print
}
go_listx(){
echo "last edited: 1 March 2018"
echo "declare -F | grep 'go_'"
echo "Local functions:"
declare -F | grep 'go_'
}
go_funcx(){
  declare -f $1
}
go_reloadx(){
echo "reloading bash script: (called via .bashrc)"
echo "by default bashrc should use: source $LINUXTOOLBOX/BashFunctions.sh"
echo "this can be changed by changing export LINUXTOOLBOX at top of file"
echo "source  ~/.bashrc"
source ~/.bashrc
}
go_set_titlex(){
if [[ -z "$ORIG" ]]; then
  ORIG=$PS1
fi
TITLE="\[\e]2;$*\a\]"
PS1=${ORIG}${TITLE}
if [[ -n "$VIRTUAL_ENV" ]]; then
  PS1="v"${ORIG}${TITLE}
fi
}
go_set_title_bannerx(){
#echo -e '\033]2;'$mytitle'\007'
echo -e '\033]2;'$*'\007'
}
return 0


#below just trash
go_names(){
echo "The Team"
echo -e "---------------------------------------------------------"
echo -e "|                \t|           \t|           \t|"
echo -e "|                \t|Praveen    \t|Ram        \t|"
echo -e "---------------------------------------------------------"
echo -e "|Syed Karimullah \t|David Swan \t|           \t|"
echo -e "|Sandeep Chandran\t|Vinod Jacob\t|Hari       \t|"
echo -e "---------------------------------------------------------"
echo -e "|Goncalo Gomes   \t|Santiago   \t|           \t|"
echo -e "---------------------------------------------------------"

}
go_ipconfig(){
echo 'ipconfig | grep "sky" -C 1'
ipconfig | grep "sky" -C 1
}
go_stdev_nfs_scp(){
echo "copy from stdev4 - call from inside jupiter"
echo "scp -r dswan@stdev4-linux:/home/dswan/NFSMount/Gemini ~/NFSMount/."
scp -r dswan@stdev4-linux:/home/dswan/NFSMount/Gemini ~/NFSMount/.
}
go_jupiter_ssh(){
echo '_ssh dswan@172.16.1.254 -p 22'
ssh dswan@172.16.1.254 -p 22
}
go_jupiter_ssh_tunnel(){
echo "ssh -Y dswan@skyswteam.com -p 2290"
ssh -Y dswan@skyswteam.com -p 2290
}
go_NAS_ssh(){
  echo "ssh -t hydra 'cd /var/www/html/shared/Projects/; bash'"
  ssh -t hydra "cd /var/www/html/shared/Projects/; bash"
}
go_stdev_ssh_tunnel(){
echo "ssh -A -t dswan@stdev4-linux"
ssh -A -t -Y dswan@skyswteam.com -p 2290 \
ssh -A -t dswan@stdev4-linux
}

go_git_diff(){
if [ -z "$1" ]
  then
    set '0'
fi 
if [ -z "$2" ]
  then
    echo "git diff HEAD~$1"     
  else
    echo "git diff HEAD~$1 HEAD~$2"
fi
echo "q to quit, w to ignore white-space-at-eol other options are --ignore-space-at-eol -b -w"
read ExitState
if [ "$ExitState" == "w" ]; then
  echo 'Running....'
  if [ -z "$2" ]
  then
    git diff --ignore-space-at-eol HEAD~$1
  else
    git diff --ignore-space-at-eol HEAD~$1 HEAD~$2
  fi
fi
if [ "$ExitState" == "q" ]; then
  echo 'Quiting....'
else
  echo 'Running2....'
  if [ -z "$2" ]
  then
    git diff HEAD~$1
  else
    git diff HEAD~$1 HEAD~$2
  fi
fi
}
go_git_difftool(){
if [ -z "$2" ]
  then
    echo "git difftool HEAD~$1 HEAD"     
  else
    echo "git difftool HEAD~$1 HEAD~$2"
fi
echo "q to quit"
read ExitState
if [ "$ExitState" == "q" ]; then
  echo 'Quiting....'
else
  echo 'Running2....'
  if [ -z "$2" ]
  then
    git difftool HEAD~$1 HEAD
  else
    git difftool HEAD~$1 HEAD~$2
  fi
fi
}
go_git_contains(){
if [ -z "$1" ]
  then
    echo "git tag --contains <commit id> Note: If nothing is returned then the commit id is not in a tag."
    echo "It also returns branch info for the commit id"
    return 1
  else
    echo "git tag --contains $1"
fi
echo "q to quit"
read ExitState
if [ "$ExitState" == "q" ]; then
  echo 'Quiting....'
else
  echo 'Running....'
  git tag --contains $1
fi
}


go_git_diff_staged(){
echo "git diff --cached"
git diff --cached
}
go_vi_keystrokes(){
echo "#v <enter visual mode>"
echo "#y <yank>"
echo "#p <paste> "
echo " "
echo "yiw  Yank Inner Word"
echo "viwp  paste Inner Word Paste"
echo " "
}

go_scp_from_jupiter(){
echo 'copy from devbuild'
echo "scp -P 2290 -r dswan@skyswteam.com:/home/dswan/$1 $2"
scp -P 2290 -r dswan@skyswteam.com:/home/dswan/$1 $2
}
go_scp_to_jupiter(){
echo 'copy from devbuild'
echo "scp -P 2290 -r $1 dswan@skyswteam.com:/home/dswan/$2"
scp -P 2290 -r $1 dswan@skyswteam.com:/home/dswan/$2
}
go_scp_from_mars(){
echo 'copy from devbuild'
echo "scp -r mars:/home/dswan/$1 $2"
scp -r mars:/home/dswan/$1 $2
}
go_scp_to_mars(){
echo 'copy from devbuild'
echo "scp -r $1 mars:/home/dswan/$2"
scp -r $1 mars:/home/dswan/$2
}
go_localhost_mars(){
echo "ssh -L 52698:localhost:22 mars"
ssh -L 52698:localhost:22 mars
}

# Get GIT branch (if any)
function parse_git_branch () {
git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
go_notes_repo(){
echo '#echo 'use this if you need to change things outside single driver scope''	
echo 'repo_flow feature start "6434_improve_support_mcu_no_xpower"'
echo "git checkout master"
echo 'git checkout develop'
echo 'git flow init -d'
echo 'git flow feature start "6434_improve_support_mcu_no_xpower"'
echo 'git branch'
echo 'git status'
echo 'git add Makefile include/support_mcu_test.h src/support_mcu_api.c src/support_mcu_init.c src/support_mcu_no_xpower.c'
echo 'git commit -m "improve support_mcu_no_xpower.c code"'
echo 'git branch'
echo 'git flow feature publish 6434_improve_support_mcu_no_xpower'
#echo 'git push feature/6434_improve_support_mcu_no_xpower'
echo 'git push sky_internal feature/6434_improve_support_mcu_no_xpower'
}
go_notes_stb(){
echo 'stb_nfs_bw(){'
echo 'echo "Load NFS - us dhcp"'
echo 'echo "mount -t nfs -o nolock 172.16.1.254:/home/dswan/NFSMount /mnt"'
echo 'udhcp'
echo 'mount -t nfs -o nolock 172.16.1.254:/home/dswan/NFSMount /mnt'
echo '}'
echo 'stb_nfs_bw'
echo 'bzcat /mnt/cdi-drivers-bskyb-ax2-64bit-debug.tar.bz2 | tar -x -C /'
echo '/etc/load-cdi-drivers.sh'

}

# Various colours
#RED="\[\033[0;31m\]"
#YELLOW="\[\033[0;33m\]"
#GREEN="\[\033[0;32m\]"
#CYAN="\[\033[0;36m\]"
#NO_COLOR="\[\033[0m\]"

#PS1="$GREEN\u@\h$NO_COLOR \W$CYAN\$(parse_git_branch)$NO_COLOR\$ "
#go_python_virtual_env
