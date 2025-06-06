# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

## don't put duplicate lines or lines starting with space in the history.
## See bash(1) for more options
HISTCONTROL=ignoreboth

## for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# sudo hint
if [ ! -e "$HOME/.sudo_as_admin_successful" ] && [ ! -e "$HOME/.hushlogin" ]; then
	case " $(groups) " in *\ admin\ * | *\ sudo\ *)
		if [ -x /usr/bin/sudo ]; then
			cat <<-EOF
				To run a command as administrator (user "root"), use "sudo <command>".
				See "man sudo_root" for details.

			EOF
		fi
		;;
	esac
fi

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found/command-not-found ]; then
	function command_not_found_handle {
		# check because c-n-f could've been removed in the meantime
		if [ -x /usr/lib/command-not-found ]; then
			/usr/lib/command-not-found -- "$1"
			return $?
		elif [ -x /usr/share/command-not-found/command-not-found ]; then
			/usr/share/command-not-found/command-not-found -- "$1"
			return $?
		else
			printf "%s: command not found\n" "$1" >&2
			return 127
		fi
	}
fi

# LS
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# MISC
set -o ignoreeof # DISABLE CTRL-D
set -o functrace # If set, any traps on DEBUG and RETURN are inherited by shell functions, command substitutions, and commands executed in a subshell environment. The DEBUG and RETURN traps are normally not inherited in such cases.

color_prompt=yes
force_color_prompt=yes
usercol="\[\033[38;5;2m\]";
hostcol="\[\033[38;5;3m\]"
hashcol="\[\033[38;5;1m\]";
PS1="${debian_chroot:+($debian_chroot)}${usercol}\u\[\033[m\]@\[\033[m\]${hostcol}${sshbg}\h\[\033[m\]:\[\033[m\]\[\033[38;5;6m\]\w\[\033[m\]${hashcol}\\$ \[\033[m\]"

function settitle () {
  export PREV_COMMAND=${PREV_COMMAND}${@}
  printf "\033]0;%s\007" "${USER}@${HOSTNAME%%.*}:${PWD}:${BASH_COMMAND//[^[:print:]]/}"
  export PREV_COMMAND=${PREV_COMMAND}' | '
}
export PROMPT_COMMAND=${PROMPT_COMMAND}
trap 'settitle "$BASH_COMMAND"' DEBUG

# PATH DEFINITIONS
MY=/home/x240

## LOCAL BIN
LBIN=$MY/.local/bin
export PATH=$LBIN:$PATH

## NPM
PATH="$HOME/.node/bin:$PATH"  
NODE_PATH="$HOME/.node/lib/node_modules:$NODE_PATH"
MANPATH="$HOME/.node/share/man:$MANPATH"

## BUN
export BUN_INSTALL=$MY/.bun
export PATH=$BUN_INSTALL/bin:$PATH
[ -s ~/.bun/_bun ] && source ~/.bun/_bun

## PNPM
#export PNPM_HOME=$MY/.local/share/pnpm
#case ":$PATH:" in
  #*":$PNPM_HOME:"*) ;;
  #*) export PATH="$PNPM_HOME:$PATH" ;;
#esac

## YARN
export YARN_INSTALL=$MY/.config/yarn/global/node_modules
export PATH=$YARN_INSTALL/.bin:$PATH

# ALIASES
alias nvi="$LBIN/nvim-12.appimage"
alias lvi="$LBIN/lvim.appimage"
alias vi=vim

# GLOBALS
export EDITOR='vi'

#eval "$(starship init bash)"

