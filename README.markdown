# gitcommitmsg.vim

Save time on typing same commit message accross different package for same features

## Installation

Install pagothen first 

    https://github.com/tpope/vim-pathogen

Install gitcommitmsg.vim

    cd ~/.vim/bundle
    git clone https://github.com/nghiank/gitcommitmsg.git

## How to use

Add a default git commit message file at `~/.vim/amazonsnippets/commitmsg` as example:

    name:
    desc:
    test:
    cr:
    qa:
    qa-results:
    deps:

Start commiting your changes by using

    git commit -a

The default commit message will be loaded and when you save your commit, it will be remember next time when you do `git commit -a`. 

If you want to load default message again, type `Ctrl-l`

