#!/usr/sh

set -u

# 実行場所のディレクトリを取得
THIS_DIR=$(cd $(dirname $0); pwd)
# 実行場所のディレクトリに移動
cd $THIS_DIR

# dotfilesディレクトリにある、ドットから始まり2文字以上の名前のファイルに対して
for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitconfig.local.template" ] && continue
    [ "$f" = ".gitmodules" ] && continue

# もしもそのファイルが既に
    if [ -e ~/"$f" ]; then
#存在する場合
    print "The \"~/$f\" already exists!"
    print "Replace $f? (Y/N):"
    read reply
    if []; then

    else

    fi

    fi

# シンボリックリンクを貼る
    ln -snfv ~/dotfiles/"$f" ~/
done

cat << END

*************************
DOTFILES SETUP FINISHED!
Please do "ls -la".
*************************
  ____             _ 
 | __ ) _   _  ___| |
 |  _ \| | | |/ _ \ |
 | |_) | |_| |  __/_|
 |____/ \__, |\___(_)
        |___/        
