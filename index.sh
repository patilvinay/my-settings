#!/bin/bash


TS=$(date "+%Y-%m-%d-%H-%M-%S")
echo $TS
HOME=~


# copy new files to replace existing files
VIMRC=$HOME/.vimrc
ZSHRC=$HOME/.zshrc
TMUX_CONF=$HOME/.tmux.conf
OH_MY_ZSH=$HOME/.oh-my-zsh

  cp $VIMRC $HOME/.vimrc.$TS
  cp $TMUX_CONF $HOME/.tmux.conf.$TS
  cp $ZSHRC $HOME/.zshrc.$TS
  mv $OH_MY_ZSH $OH_MY_ZSH-$TS
  rm $VIMRC
  rm $TMUX_CONF
  rm $ZSHRC
  
  ln -s $PWD/vimrc $VIMRC
  ln -s $PWD/tmux.conf $TMUX_CONF
  ln -s $PWD/zshrc $ZSHRC
  ln -s $PWD/oh-my-zsh $OH_MY_ZSH 



