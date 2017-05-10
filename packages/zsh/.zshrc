## Command history configuration
if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=10000
SAVEHIST=10000

# Show history
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data


# POWERLINE
POWERLINE_CONFIG_COMMAND="/usr/local/bin/powerline-config"

if [[ $(thefuck)  ]] ; then
  function command_not_found_handler() {
          eval $(thefuck $@); fc -R
  }
fi

alias ll="k --no-vcs -a"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

#if [ "$TMUX" != "" ]; then
	#ssh() {
       	#	tmux set-option allow-rename off 1>/dev/null
      	#	tmux rename-window "ssh/$*"
       	#	command ssh $@
 	#	  #tmux rename-window "$(hostname -s)"
       	#	tmux set-option allow-rename on 1>/dev/null
	#}
#fi

LANG="de_DE.UTF-8"
LC_ALL="de_DE.UTF-8"
LC_CTYPE="de_DE.UTF-8"

## Force TMUX
#if [ "$TMUX" = "" ]; then tmux new -A -s One; fi

if [ -e ~/.aliases ]; then source ~/.aliases; fi
#if [ -e ~/.env ]; then source ~/.env; fi
#if [ -e /opt/boxen/env.sh ]; then source /opt/boxen/env.sh ; fi
#if [ -e ~/motd ]; then cat ~/motd; fi

ssh-add -A &> /dev/null

source <(antibody init)

if [ -e ~/.antibody-plugins ]; then antibody bundle < ~/.antibody-plugins; fi

MINIMAL_USER_CHAR="$"

#test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"