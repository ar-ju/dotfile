# ---------------------------
# Lang
# ---------------------------
export LANG=ja_JP.UTF-8
#export LESSCHARSET=utf-8

# ---------------------------
# General
# ---------------------------
# 色を使用
autoload -Uz colors 
colors

# cdした際のディレクトリをディレクトリ スタックへ自動追加
setopt auto_pushd

# ディレクトリスタックへの追加の際に重複させない
setopt pushd_ignore_dups

# ファイル名の展開でディレクトリにマッチした場合、末尾に / を付加
setopt mark_dirs

# パスの最後の / を削除しない
setopt noautoremoveslash

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# 同時に起動したzshの中でヒストリを共有する
setopt share_history

# 直前と同じコマンドの場合はヒストリに追加しない
setopt hist_ignore_dups

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# timeコマンドを使用したときの出力
TIMEFMT=$'\n\n========================\nProgram : %J\nCPU     : %P\nuser    : %*Us\nsystem  : %*Ss\ntotal   : %*Es\n========================\n'

# 補完機能を使用できるようにする(Tabボタンで)
autoload -U compinit
compinit

# コマンドのスペルを訂正する
setopt correct

# brew fileを使用するための準備
if [ -f $(brew --prefix)/etc/brew-wrap ];then
    source $(brew --prefix)/etc/brew-wrap
fi

# ---------------------------
# エイリアス
# --------------------------

#export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# ls色付け
alias ls="ls -GF"
alias gls="gls --color"

# rmコマンド確認
alias rm="rm -iv"

#zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
# tmuxを256色表示で立ち上げる
#alias tmux="tmux -2"

# tmuxをutf-8で起動
alias tmux="tmux -u"

# ---------------------------
# Prompt
# ---------------------------
# %M : ホスト名 
# %m : ホスト名 
# %d :  カレントディレクトリ(フルパス) 
# %~ : カレントディレクトリ(フルパス2)
# %C : カレントディレクトリ(相対パス) 
# %c : カレントディレクトリ(相対パス)
# %n : ユーザ名 
# %# : ユーザ種別
# %? : 直前のコマンドの戻り値
# %D : 日付(yy-mm-dd)
# %W : 日付(yy/mm/dd)
# %w : 日付(day dd)
# %* : 時間(hh:flag_mm:ss)
# %T : 時間(hh:mm)
# %t : 時間(hh:mm(am/pm))
PROMPT='[%D(%*)]@%F{blue}%~%f '
#PROMPT='%F{black}%n%f[%D(%*)]@%F{blue}%~/%f '

export PATH="/usr/local/sbin:$PATH"

# ---------------------------
# ---------------------------
