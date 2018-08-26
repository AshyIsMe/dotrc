export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# API Keys are exported in this script that is not commited to the public repo obviously...
source ~/.bash_apikeys

export PATH=$PATH:~/bin
#export PATH=/usr/local/bin:$PATH #Only needed on osx?
source ~/.fzf.bash
if command -v fzf-share >/dev/null; then
  source "$(fzf-share)/key-bindings.bash"
fi

#set -o vi
export EDITOR=vim
export CLICOLOR="xterm-color"

export FZF_DEFUALT_OPS="--sort 10000"

# Clear the terminal title so it doesn't spam the default (hostname) in tmux pane titles
# AA TODO: Set this to cwd?
PROMPT_COMMAND='echo -ne "\033]0;\007"'


# AA TODO On OSX only...
#if [ -f $(brew --prefix)/etc/bash_completion ]; then
  #. $(brew --prefix)/etc/bash_completion
#fi

# No idea where this came from or why I needed it...
first ()
{
    newest=;
    for filename in "$@";
    do
        [[ -z $newest || $filename -nt $newest ]] && newest=$filename;
    done;
    [[ -n $newest ]] && printf "%s\n" $newest;
    return 0
}

#Aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias lha='ls -lha'

#alias fixcoronasdk='launchctl setenv ANDROID_SDK /Users/aaron/Downloads/adt-bundle-mac-x86_64-20131030/sdk'
alias vimtohtml='vim -c ":argdo set eventignore-=Syntax | if &filetype != \"\" | TOhtml | endif | wq" -c "wqa"'

#Remote munin setup
remotemunin() {
  #$1 is name@host.com
  #ssh "$1" -L 8088:localhost:8088 'cd /var/cache/munin/www && python -mSimpleHTTPServer 8088; trap "trap - SIGTERM && kill -- -$$" SIGINT SIGTERM EXIT'
  ssh "$1" -L 8088:localhost:8088 'cd /var/cache/munin/www && python -mSimpleHTTPServer 8088'
  open http://localhost:8088
}
alias rmunin=remotemunin

#export PS1="\n\u@\h:\w \$(git branch --color 2> /dev/null) \n\$ "
export PS1="\n\u@\h:\w \$(git branch --color 2> /dev/null | tr -d '\n') \n\$ "

#haskell stack binaries path
export PATH=~/.local/bin:$PATH

#source ~/CodeBases/fzf_browser/fzf_browser.sh

# Crappy extended dmenu style thing
#source ~/CodeBases/fzfOS/fzfOS.sh

#source ~/bin/z-repos/z.sh
source ~/bin/z/z.sh
