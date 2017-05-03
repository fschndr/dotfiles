# ensure antigen is present - if not clone latest version
if [ ! -e $HOME/antigen/antigen.zsh ]; then
  if [ -x /usr/bin/git ]; then
    /usr/bin/git clone https://github.com/zsh-users/antigen.git ~/antigen
  else
    # this is not the ideal way - selfupdate of antigen won't work this way!
    /usr/bin/curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/antigen/antigen.zsh
    echo "##!INSTALLED ANTIGEN WITHOUT GIT CLONE - ANTIGEN SELFUPDATE WON'T WORK THIS WAY!##"
  fi
fi

source ~/antigen/antigen.zsh

HIST_STAMPS="mm/dd/yyyy"

# POWERLINE
#PATH="/Library/Python/2.7/site-packages/:/User/fabianschneider/.powerline/scripts/:$PATH"

#POWERLINE_CONFIG_COMMAND="/Users/fabianschneider/.powerline/scripts/powerline-config"

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh):
antigen bundle git

antigen bundle osx
antigen bundle battery
antigen bundle thefuck
antigen bundle thor


antigen bundle common-aliases
antigen bundle wd

# some extra stuff:
antigen bundle rimraf/k

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load my theme.
antigen theme fschndr/dotfiles zsh-themes/fschndr

# Tell antigen that you're done.
antigen apply

if [[ $(thefuck)  ]] ; then
  function command_not_found_handler() {
          eval $(thefuck $@); fc -R
  }
fi

alias ll="k --no-vcs -a"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

alias 😁="ls -la"

if [ "$TMUX" != "" ]; then
	echo "Tmux Prefix is Control-a"

	ssh() {
       		tmux set-option allow-rename off 1>/dev/null
      		tmux rename-window "ssh/$*"
       		command ssh "$@"
 		      #tmux rename-window "$(hostname -s)"
       		tmux set-option allow-rename on 1>/dev/null
	}
fi

## Force TMUX
#if [ "$TMUX" = "" ]; then tmux; fi

if [ -e ~/.aliases ]; then source ~/.aliases; fi

if [ -e ~/.env ]; then source ~/.env; fi
if [ -e /opt/boxen/env.sh ]; then source /opt/boxen/env.sh ; fi

#if [ -e ~/motd ]; then cat ~/motd; fi


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
