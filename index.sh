#!/bin/bash


TS=$(date "+%Y-%m-%d-%H-%M-%S")
echo $TS
HOME=~


# copy new files to replace existing files
VIMRC=$HOME/.vimrc
ZSHRC=$HOME/.zshrc
TMUX_CONF=$HOME/.tmux.conf
OH_MY_ZSH=$HOME/.oh-my-zsh
TMUX=$HOME/.tmux
P10K=$HOME/.p10k.zsh

  cp $VIMRC $HOME/.vimrc.$TS
  cp $TMUX_CONF $HOME/.tmux.conf.$TS
  cp $ZSHRC $HOME/.zshrc.$TS
  cp $P10K $HOME/.p10k.zsh.$TS
  mv $OH_MY_ZSH $OH_MY_ZSH-$TS
  mv $TMUX $TMUX-$TS

  rm $VIMRC
  rm $TMUX_CONF
  rm $ZSHRC
  rm $TMUX
  rm $P10K
  
  ln -s $PWD/vimrc $VIMRC
  ln -s $PWD/tmux.conf $TMUX_CONF
  ln -s $PWD/zshrc $ZSHRC
  ln -s $PWD/.p10k.zsh $P10K
  ln -s $PWD/oh-my-zsh $OH_MY_ZSH 
  ln -s $PWD/tmux $TMUX 
  ln -s $PWD/powerlevel10k ~/powerline10k 
  chsh -s /bin/zsh


