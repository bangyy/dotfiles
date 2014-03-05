#zshmisc(1)参照
	#   %B %b ボールドにする。終了する。
	#   %{...%} エスケープ文字列として読み込む。(あやしげな訳。原文はzshmisc(1)のvisual effectsの段落)
	#   %/ 現在のディレクトリ。
	#   ${fg[color]}文字色の設定。fgの部分をbgにすると背景色の設定。エスケープシークエンスで設定することもできる。


autoload colors

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

#http://shibayu36.hatenablog.com/entry/20120130/1327937835
#http://d.hatena.ne.jp/syohex/20121219/1355925874
#cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 5000
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert both

#zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34' menu select=1


source ~/.zsh/zaw/zaw.zsh
zstyle ':filter-select' case-insensitive yes # 絞り込みをcase-insensitiveに
bindkey '^f' zaw-cdr # zaw-cdrをbindkey
bindkey '^h' zaw-history
bindkey '^g' zaw-gitdir

# use online help
unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/helpfiles

#http://d.hatena.ne.jp/naoya/20130108/1357630895
# z
. `brew --prefix`/etc/profile.d/z.sh
function precmd () {
    z --add "$(pwd -P)"
}


#履歴の保持数と履歴ファイルの設定
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # 同じコマンドを重複して記録しない
setopt hist_ignore_space
setopt share_history        # 履歴の共有


#補完設定ファイルのパスと補完機能の初期化
fpath=(~/.zsh/functions/Completion ${fpath})
autoload -U compinit
compinit

#タブを押さなくても補完候補を表示する
#autoload predict-on
#predict-on
#function ssh_screen(){}

#http://d.hatena.ne.jp/mollifier/20090814/p1
#http://d.hatena.ne.jp/NeoCat/20120822/1345657535
autoload -Uz vcs_info
#zstyle ':vcs_info:*' formats '(%s)-[%b]'
#zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
zstyle ':vcs_info:*' formats '%b@%s'
zstyle ':vcs_info:*' actionformats '%b(%a)@%s'

function _precmd_vcs_info () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# add-zsh-hook
autoload -Uz add-zsh-hook
add-zsh-hook precmd _precmd_vcs_info


#PROMPT=%(?.%F{cyan}.%F{red})[%n@%M\:' '%~]$'\n'$%f' '
#PROMPT=%(?.%F{cyan}.%F{red})'┃ _┃ '$%f' '
#PROMPT=%(?.%F{cyan}'┃ _┃ '.%F{red}'＞_＜')$%f' '
PROMPT=%(?.%F{cyan}'┃ _┃ '.%F{red}'＞_＜')\{%f' '
#PROMPT=%(?.%F{cyan}' | _ | '.%F{red}' > _ < ')$%f' '
#RPROMPT=[%1(v|%F{green}%1v%f - |)%(!.#.%T)]
#RPROMPT=[%M:%~' '%1(v|%F{green}%1v%f - |)%(!.#.%T)]
RPROMPT=%1(v|%F{green}'('%1v')'%f|)[%M:%~' '%(!.#.%T)]
SPROMPT="correct: %R -> %r ? " 

setopt complete_aliases     #エイリアスを設定したコマンドでも補完機能を使えるようにする
alias mysqlcon='mysql -u bangyy -p -h mysql102.db.sakura.ne.jp'
alias ls='ls -G'
alias ll='ls -laoG'
alias mv='mv -vi'
alias rm='rm -v'
alias cp='cp -vi'
alias cdd='cd ..'
alias grep='grep --color=auto'
#alias vi='vim'
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias screen='/usr/local/bin/screen'
#alias ssh='ssh_screen'

#if [ $SHLVL = 1 ];then
    #screen -xR
#fi
if [ -z "$TMUX" -a -z "$STY" ]; then
  if type tmuxx >/dev/null 2>&1; then
    tmuxx
  elif type tmux >/dev/null 2>&1; then
    if tmux has-session && tmux list-sessions | /usr/bin/grep -qE '.*]$'; then
      tmux attach && echo "tmux attached session "
    else
      tmux new-session && echo "tmux created new session"
    fi
  fi
fi

#http://d.hatena.ne.jp/mollifier/20110221/p1
# nvm と指定されたバージョンの Node.js がインストール済みの場合だけ
# # 設定を有効にする
if [[ -f ~/.nvm/nvm.sh ]]; then
    source ~/.nvm/nvm.sh

    if which nvm >/dev/null 2>&1 ;then
        _nodejs_use_version="stable"
        if nvm ls | grep -F -e "${_nodejs_use_version}" >/dev/null 2>&1 ;then
            nvm use "${_nodejs_use_version}" >/dev/null
        fi
        unset _nodejs_use_version
    fi
fi
