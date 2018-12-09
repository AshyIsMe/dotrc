# My dotrc repo

The idea of this repo is to make it really easy for me to get my vim/bash setup really quickly on a new machine.

Using gnu-stow with the workflow described here: 
[http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html)

# TODO
- consolidate window management hotkeys for tmux, screen, vim and OSX

#Install
``` bash
git clone --recursive https://github.com/AshyIsMe/dotrc
cd dotrc

stow bash
stow ghc
stow git
stow plasma
stow i3
stow i3status
stow screen
stow spacemacs
stow tmux
stow vim
stow xorg
```


##Vim
Plugins managed with pathogen and git submodules in this repo.

### I can never remember the horrible git submodule commands:
``` bash
cd dotrc/vim/.vim/bundle
git submodule add http://github.com/AshyIsMe/some-vim-plugin
git commit -m "Added some vim plugin"

# Removing old plugins
git rm ./vim/.vim/bundle/SomeOldPlugin
git commit -m "Aaaand it's gone."
```
