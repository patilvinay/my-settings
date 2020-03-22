#!/bin/bash


repo_0=(
  "http://github.com/ohmyzsh/ohmyzsh.git" 
  "$PWD/oh-my-zsh")
repo_1=(
  "http://github.com/romkatv/powerlevel10k.git" 
  "$PWD/powerlevel10k")
repo_2=(
  "http://github.com/tmux-plugins/tpm.git" 
  "$PWD/tpm")

MAIN_ARRAY=(
  repo_0[@]
  repo_1[@]
  repo_2[@]
)





TS=$(date "+%Y-%m-%d-%H-%M-%S")

user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}
success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}
info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

git_pull()
{
  # settings / change this to your config
  #git_pull repo local_folder
  
repo=$1
local_folder=$2
cloneCmd="git clone"
cloneCmd="$cloneCmd $repo $local_folder"
strr="Cloning git $repo to $local_folder"
info "$strr"

if [[ -d $local_folder ]]
then
 user "Folder $localfolder already exist,backup and continue?\n\
        [y]Yes, [n]No?"
    read -n 1 action

     case "$action" in
          y )
            
            mv $local_folder "${local_folder}.$TS"
             eval $($cloneCmd  2>/dev/null)
            success "git clone $repo sucess"
            ;;
          Y )
            mv $local_folder "${local_folder}.$TS"
             eval $($cloneCmd  2>/dev/null)
            success "git clone $repo sucess"
            ;;
          * )
            info "Skiping;"
            ;;
        esac
 else
  eval $($cloneCmd  2>/dev/null)
  success "git clone $repo sucess"
 fi       

  
}








# Loop and print it.  Using offset and length to extract values




clone_repos()
{
COUNT=${#MAIN_ARRAY[@]}
for ((i=0; i<$COUNT; i++))
do
  _repo=${!MAIN_ARRAY[i]:0:1}
  _local_folder=${!MAIN_ARRAY[i]:1:1}
   git_pull $_repo  $_local_folder
 # echo $_repo $_local_folder
done

}

get_fonts(){
wget "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"  -P  ~/.local/share/fonts/Hack-Regular.ttf

}

clone_repos
get_fonts

  #git_pull git@github.com:tmux-plugins/tpm.git
 



#git_pull 