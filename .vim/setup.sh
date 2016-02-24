#!/bin/bash

plugins="syntastic auto-pairs nerdtree supertab ultisnips vim-snippets"

# installation dir's
PLUGIN_DIR=~/.vim/bundle

op_cmd=$1 # optional arg 1
dir=(pwd) # get current dir to cd back to after update

# optional command to update plugins
if [ "-u" = "$op_cmd" ]; then
    for i in $plugins; do
        cd ~/.vim/bundle/$i
        git pull
    done
    cd $(dir) # cd back to working dir
    exit 0
fi

# Seting up plugin dir's
if [ -e ~/.vim/autoload ] && [ -e ~/.vim/bundle ]; then
    echo "Plugin folders already made"
    sleep 1
else
    echo "Seting up plugin folders"
    mkdir -p ~/.vim/autoload ~/.vim/bundle
fi

# install pathogen
if [ -e ~/.vim/autoload/pathogen.vim ]; then
    echo "Pathogen already installed"
    sleep 1
else
    echo "Installing Pathogen"
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

# install all plugins
for i in $plugins; do
    if [ "$(ls -A ~/.vim/bundle/$i/)" ]; then
        echo "$i is already installed"  
        sleep 1
    else
        case $i in
             supertab)
                git clone https://github.com/ervandew/supertab.git $PLUGIN_DIR/supertab
                echo ""
                echo "Source SUPERTAB with :so % command"
                echo ""
                sleep 2
                vim $PLUGIN_DIR/supertab/plugin/supertab.vim;;
           auto-pairs)
                git clone git://github.com/jiangmiao/auto-pairs.git $PLUGIN_DIR/auto-pairs;;
             nerdtree)
                git clone https://github.com/scrooloose/nerdtree.git $PLUGIN_DIR/nerdtree;;
            syntastic)
                git clone https://github.com/scrooloose/syntastic.git $PLUGIN_DIR/syntastic;;
            ultisnips)
                git clone https://github.com/sirver/ultisnips $PLUGIN_DIR/ultisnips;;
         vim-snippets)
                git clone https://github.com/honza/vim-snippets.git $PLUGIN_DIR/vim-snippets;;
        esac
    fi
done

exit 0
