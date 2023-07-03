#ALL NEW SCRIPTS 2023

#DRSMOD custom prompt & palette
LS_COLORS='rs=0:di=1;35:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS
if [ -z ${WSL_DISTRO_NAME} ]; then
    echo "Not running WLS"
    CUSTOM_NAME=${HOSTNAME}
else
    CUSTOM_NAME=${WSL_DISTRO_NAME}
    echo "Running WLS: $WSL_DISTRO_NAME"
fi
PS1="\[\e]0;\u@($CUSTOM_NAME)\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@$CUSTOM_NAME\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$"


#ALL BELOW VERY OLD AND COPIED FROM MOBAXTERM, CLEAN UP

#echo "GLOBAL EXPORTS"
#export AX2_I2C="Obj/project_build_aarch64/bskyb-ax2-64bit/linux-3.10.92/mstar2/drv/iic"
#export AX2_UIMAGE="Obj/binaries/bskyb-ax2-64bit/uImage"
#export AX2_64BIT_TOOLCHAIN_BASE="/opt/aarch64-linux-gcc_4.9.2_20170906_Sky_Eng01/"
#export SKY_MSTAR_BOX=1
#echo "SKY_MSTAR_BOX:$SKY_MSTAR_BOX"
#echo "AX2_64BIT_TOOLCHAIN_BASE:$AX2_64BIT_TOOLCHAIN_BASE"
#echo "AX2_I2C:$AX2_I2C"
#echo "AX2_UIMAGE:$AX2_UIMAGE"
go_clear(){
echo "clearing scrollback"
printf '\033c\e[3J'
}
go_ag_sh(){
echo "Will search shell scripts for given string"
echo "find -iname \*.sh -exec grep -i '$1' {} \; -print"
find -iname \*.sh -exec grep -i $1 {} \; -print
}
go_list(){
echo "last edited: 1 March 2018"
echo "declare -F | grep 'go_'"
echo "Local functions:"
declare -F | grep 'go_'
}
go_func(){
  declare -f $1
}
go_reload(){
echo "reloading bash script"
echo "source  ~/Scripts/BashFunctions.sh"
#source  ~/Scripts/BashFunctions.sh
source ~/.bashrc
}

go_mrbox_ssh(){
echo 'sshpass -p 'themoose' ssh darwin@192.168.1.140'
echo 'for ifconfig: /sbin/ifconfig'
sshpass -p 'themoose' ssh darwin@192.168.1.140
}

go_mrbox_telnet(){
echo 'telnet 192.168.1.140'
telnet 192.168.1.140
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
echo '_ssh pi@192.168.1.188'
ssh pi@192.168.1.188
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
  echo 'Chosen mount path: sshfs -o allow_other dsw12@slab:$STRINGPATH /home/dsw12/remote-mount/'
  SSHFS="sshfs -o allow_other dsw12@slab:"$STRINGPATH" /home/dsw12/remote-mount/"
  MOUNTDIR="/home/dsw12/remote-mount/"
fi
if [ $# -eq 2 ]; then
  echo 'Two params passed'
  echo " "
  if [[ $1 == /* ]]; then STRINGPATH=$1; else STRINGPATH="/home/dsw12/$1"; fi
  echo 'Chosen mount path: sshfs -o allow_other dsw12@slab:$STRINGPATH /home/dsw12/$2'
  SSHFS="sshfs -o allow_other dsw12@slab:"$STRINGPATH" /home/dsw12/$2"
  MOUNTDIR="/home/dsw12/$2"
fi

echo "Looking good, y to accept: ${SSHFS}"
read ContinueState

if [ "$ContinueState" != "y" ]; then
echo "bye!"
  return 1
fi

if grep -qs $MOUNTDIR /proc/mounts 
  then
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
}

go_scp_from_pi(){
echo 'copy from pi, use . or path for destination'
echo "pi@192.168.1.188://home/pi/$1 $2"
scp -r pi@192.168.1.188://home/pi/$1 $2
}
go_scp_to_pi(){
echo 'copy to pi'
echo "scp -r $1 pi@192.168.1.188://home/pi/$2"
scp -r $1 pi@192.168.1.188://home/pi/$2
}

go_set_title(){
  if [[ -z "$ORIG" ]]; then
    ORIG=$PS1
  fi
  TITLE="\[\e]2;$*\a\]"
  PS1=${ORIG}${TITLE}
}

go_mobx_home (){
    echo "Mobaxterm home - WLS2 specific";
    cd /mnt/c/Users/DSW12/MobaXterm/home/
}

go_get_wifi (){
  netsh.exe wlan show profile "name=BT-PJA6W2" key=clear | grep "Key"
}

go_foxyproxy_ssh(){
echo 'ssh -D 9998 -C2Nn dev-jumphost'
echo 'FoxyProxy Host:localhost port:9998 SOCKS proxy AND Socks v5, 2 radio button, not one, no login authentication details needed'
echo 'URL pattern *bskyb*'
echo 'to reset keys (~/.ssh) it is ssh-copy-id dswan@10.241.0.89'
echo 'wait 2 seconds......'
sleep 2
mytitle="Foxy Proxy"
echo -e '\033]2;'$mytitle'\007'
for i in {1..50}
do
	pkill -9 ssh
	echo "Welcome orcus $i times-Starting foxyproxy ssh"
	ssh -D 9998 orcus -C2Nn
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
go_foxyproxy_ssh(){
#echo 'ssh -D 9998 -C2Nn hydra'
#echo 'ssh -L 9997:localhost:9997 neptune'
echo 'ssh -D 9998 -C2Nn dev-jumphost'
echo 'FoxyProxy Host:localhost port:9998 SOCKS proxy AND Socks v5, 2 radio button, not one, no login authentication details needed'
echo 'URL pattern *bskyb*'
echo 'to reset keys (~/.ssh) it is ssh-copy-id dswan@10.241.0.89'
echo 'wait 2 seconds......'
sleep 2
for i in {1..5}
do
	pkill -9 ssh
	echo "Welcome hydra $i times-Starting foxyproxy ssh"
	#ssh -D 9998 -C2Nn dswan@hydra
	#ssh -L 9997:localhost:9997 neptune
	#ssh -D 9998 -C2Nn dev-jumphost
	ssh -D 9998 orcus -C2Nn
	done
}
go_foxyproxy_cisco_ssh(){
echo 'ssh -D 9998 -C2Nn hydra'
echo 'FoxyProxy Host:localhost port:9998 SOCKS proxy AND Socks v5, 2 radio button, not one, no login authentication details needed'
echo 'URL pattern *bskyb*'
echo 'to reset keys (~/.ssh) it is ssh-copy-id dswan@10.241.0.89'
echo 'wait 2 seconds......'
sleep 2
#for i in {1..5}
#do
	echo "Welcome ciscoi[mediawhatsiT] $i times-Starting foxyproxy ssh"
	#ssh -D 9998 -C2Nn dswan@hydraa
#ssh -L 9997:localhost:9997 neptune
ssh -L 9997:localhost:9997 neptune
#ssh -D 9997 -C2Nn dswan@neptune
	#done
#ssh -D 9998 -C2Nn dswan@hydra-sc
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
go_python_virtual_env()
{
	#Setup virtual env by default
	export PATH=$PATH:/opt/repo_flow/
	#export WORKON_HOME=/home/dswan
	source ~/PythonVirtualEnv/bin/activate
	echo #############
	echo Default Virtual Env Started
	echo #############
}
go_python_deactivate()
{
	echo #############
	echo Default Virtual Env deactivated
	echo #############
	deactivate
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
go_set_title(){
  if [[ -z "$ORIG" ]]; then
    ORIG=$PS1
  fi
  TITLE="\[\e]2;$*\a\]"
  PS1=${ORIG}${TITLE}
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
