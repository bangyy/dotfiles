#zshmisc(1)参照
	#   %B %b ボールドにする。終了する。
	#   %{...%} エスケープ文字列として読み込む。(あやしげな訳。原文はzshmisc(1)のvisual effectsの段落)
	#   %/ 現在のディレクトリ。
	#   ${fg[color]}文字色の設定。fgの部分をbgにすると背景色の設定。エスケープシークエンスで設定することもできる。

#export SCREENDIR=${HOME}/.screen
export SCREENDIR=${HOME}/screen
export LSCOLORS=gxfxcxdxbxegedabagacad
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:$PATH:/sbin:/usr/sbin:$HOME/.npm/bin:$HOME/.npm/man
export LANG=ja_JP.UTF-8

autoload colors
colors
case ${UID} in
0)
    PROMPT="%B%{${fg[red]}%}%/#%{${reset_color}%}%b "
    PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
    SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
    ;;
*)
    PROMPT="%{${fg[red]}%}%/%%%{${reset_color}%} "
    PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
    SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
    ;;
esac

###############こまごまとした設定###############

#ディレクトリ名を入力するとそのディレクトリに移動
setopt auto_cd

#cd時に-[tab]で過去の移動先を補完
setopt auto_pushd

#typoを修正
setopt correct

#補完候補を詰めて表示する
setopt list_packed

#スラッシュを削除しない
setopt noautoremoveslash

#beepを鳴らさない
setopt nolistbeep


#キーバインド。vi。emacs風にするなら-e
bindkey -v

#エディタ機能を有効にする
autoload zed

##############履歴と補完###############

#コマンド履歴関係のキーマップ
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end


#履歴の保持数と履歴ファイルの設定
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
#setopt hist_ignore_dups     # 同じコマンドを重複して記録しない
setopt share_history        # 履歴の共有


#補完設定ファイルのパスと補完機能の初期化
fpath=(~/.zsh/functions/Completion ${fpath})
autoload -U compinit
compinit

#タブを押さなくても補完候補を表示する
#autoload predict-on
#predict-off
#function ssh_screen(){}

PROMPT=$'%B%{\e[32m%}[%n@%M: %~]'$'\n$%b%{\e[m%} ' ;
RPROMPT="[%t]"
SPROMPT="correct: %R -> %r ? " 

setopt complete_aliases     #エイリアスを設定したコマンドでも補完機能を使えるようにする
alias mysqlcon='mysql -u bangyy -p -h mysql102.db.sakura.ne.jp'
alias ll='ls -laoG'
alias mv='mv -vi'
alias rm='rm -v'
alias cp='cp -vi'
alias cdd='cd ..'
alias vi='vim -p'
#alias ssh='ssh_screen'

if [ $SHLVL = 1 ];then
    screen -xR
fi

#http://d.hatena.ne.jp/mollifier/20110221/p1
# nvm と指定されたバージョンの Node.js がインストール済みの場合だけ
# # 設定を有効にする
if [[ -f ~/.nvm/nvm.sh ]]; then
    source ~/.nvm/nvm.sh

    if which nvm >/dev/null 2>&1 ;then
        _nodejs_use_version="latest"
        if nvm ls | grep -F -e "${_nodejs_use_version}" >/dev/null 2>&1 ;then
            nvm use "${_nodejs_use_version}" >/dev/null
        fi
        unset _nodejs_use_version
    fi
fi
