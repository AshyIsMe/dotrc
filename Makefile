

default:

install: install-vim install-tmux install-screen install-ghci

VIMRC=$(HOME)/.vimrc
DOTVIM=$(HOME)/.vim

backup-vim:
	if [ -a "$(VIMRC)" ]; then mv $(HOME)/.vimrc $(HOME)/.vimrc.old ; fi
	if [ -a "$(DOTVIM)" ]; then mv $(DOTVIM) $(DOTVIM).old ; fi

install-vim: backup-vim
	ln -s $(CURDIR)/vimrc $(HOME)/.vimrc
	ln -s $(CURDIR)/dotvim $(HOME)/.vim

uninstall-vim:
	if [ -a "$(VIMRC).old" ]; then mv $(VIMRC).old $(VIMRC) ; fi
	if [ -a "$(DOTVIM).old" ]; then mv $(DOTVIM).old $(DOTVIM) ; fi


TMUXCONF=$(HOME)/.tmux.conf
backup-tmux:
	if [ -a "$(TMUXCONF)" ]; then mv $(TMUXCONF) $(TMUXCONF).old ; fi

install-tmux: backup-tmux
	ln -s $(CURDIR)/tmux.conf $(TMUXCONF)

uninstall-tmux:
	if [ -a "$(TMUXCONF).old" ]; then mv $(TMUXCONF).old $(TMUXCONF) ; fi


SCREENRC=$(HOME)/.screenrc
backup-screen:
	if [ -a "$(SCREENRC)" ]; then mv $(SCREENRC) $(SCREENRC).old ; fi

install-screen: backup-screen
	ln -s $(CURDIR)/screenrc $(SCREENRC)

uninstall-screen:
	if [ -a "$(SCREENRC).old" ]; then mv $(SCREENRC).old $(SCREENRC) ; fi


GHCCONF=$(HOME)/.ghc/.ghci.conf
backup-ghci:
	if [ -a "$(GHCCONF)" ]; then mv $(GHCCONF) $(GHCCONF).old ; fi

install-ghci: backup-ghci
	ln -s $(CURDIR)/ghci.conf $(GHCCONF)

uninstall-ghci:
	if [ -a "$(GHCCONF).old" ]; then mv $(GHCCONF).old $(GHCCONF) ; fi


uninstall: uninstall-vim \
					 uninstall-vim \
					 uninstall-tmux \
					 uninstall-screen \
					 uninstall-ghci
