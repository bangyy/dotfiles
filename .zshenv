path=(
  /usr/local/heroku/bin(N-/)
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
  $path
  /sbin
  /usr/sbin
  $HOME/local/bin(N-/)
  $HOME/.npm/bin(N-/)
  $HOME/.npm/man(N-/)
  $HOME/lib/android-sdks/tools(N-/)
  /usr/local/Cellar/git/1.8.3.4/share/git-core/contrib/diff-highlight(N-/)
)

#export LSCOLORS=gxfxcxdxbxegedabagacad
#export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export LANG=ja_JP.UTF-8
export SCREENDIR=${HOME}/.screen

# phpenv
if [ -f ${HOME}/.phpenv/bin/phpenv ]; then
    export PATH=${PATH}:${HOME}/.phpenv/bin
    eval "$(phpenv init -)"
fi

[[ -s "/Users/bang/.rvm/scripts/rvm" ]] && source "/Users/bang/.rvm/scripts/rvm"
export NODE_PATH=/Users/bang/.npm/libraries:$NODE_PATH

#http://d.hatena.ne.jp/yuroyoro/20101104/1288879591
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
