#!/bin/sh

set -u

# 実行場所のディレクトリを取得
THIS_DIR=$(cd $(dirname $0); pwd)

# dotfilesディレクトリにある、ドットから始まり2文字以上の名前のファイルに対して
filelist=.??*
echo "filelist:${filelist}"
for file in ${filelist}; do
    f=$(basename ${file})
# 無視するファイルたち
    [ $f = ".git" ] && echo "${f} will not be done." && continue
    [ $f = ".gitconfig.local.template" ] && echo "${f} will not be done." && continue
    [ $f = ".gitmodules" ] && echo "${f} will not be done." && continue
    [ $f = ".gitignore" ] && echo "${f} will not be done." && continue
    [ $f = ".DS_Store" ] && echo "${f} will not be done." && continue
    [ $f = ".tmux" ] && echo "${f} will not be done." && continue
    [ $f = ".vim_old" ] && echo "${f} will not be done." && continue
    
# もしもそのファイルが既に
    if [ -e "${HOME}/${f}" ] || [ -L "${HOME}/${f}" ]; then
        #ホームディレクトリにファイルもしくはシンボリックリンクが存在する場合
        echo "The \"${HOME}/${f}\" already exists! Replace ${f}? (Y/N):"
        read reply
        if [ ${reply} = "Y" ]; then
            mv "${HOME}/${f}" "${THIS_DIR}/${f}_old"
        else
            echo "That file (${f}) will not be set!"
            continue
        fi
    fi

# シンボリックリンクを貼る
    ln -snfv "${HOME}/dotfiles/$f" ${HOME}
done

cat << END

*************************
DOTFILES SETUP FINISHED!
Please do "ls -lA ~/".
*************************
  ____             _ 
 | __ ) _   _  ___| |
 |  _ \| | | |/ _ \ |
 | |_) | |_| |  __/_|
 |____/ \__, |\___(_)
        |___/        
