# My dotrc repo

The idea of this repo is to make it really easy for me to get my vim/bash setup really quickly on a new machine.

# TODO
- consolidate window management hotkeys for tmux, screen, vim and OSX

#Install
``` bash
git clone --recursive https://github.com/AshyIsMe/dotrc
cd dotrc
bash install.sh
```


##Vim
Plugins managed with pathogen and git submodules in this repo.

### I can never remember the horrible git submodule commands:
``` bash
cd dotrc/dotvim/bundle
git submodule add http://github.com/AshyIsMe/some-vim-plugin
git commit -m "Added some vim plugin"
```
