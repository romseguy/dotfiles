# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# set a fancy prompt (non-color, overwrite the one in /etc/profile)
# but only if not SUDOing and have SUDO_PS1 set; then assume smart user.
if ! [ -n "${SUDO_USER}" -a -n "${SUDO_PS1}" ]; then
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

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

# MISC
set -o ignoreeof # DISABLE CTRL-D

# PATH DEFINITIONS
## LOCAL BIN
LBIN="~/.local/bin"
export PATH=$LBIN:$PATH

## TJ/N
export N_PREFIX=$HOME/n
export PATH=$N_PREFIX/bin:$PATH
#export N_PREFIX="$HOME/n"
#[[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"

## BUN
export BUN_INSTALL=~/.bun
export PATH=$BUN_INSTALL/bin:$PATH
[ -s ~/.bun/_bun ] && source ~/.bun/_bun

## PNPM
export PNPM_HOME="/home/x240/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# ALIASES
alias nvi="$LBIN/nvim-12.appimage"
alias lvi="$LBIN/lvim.appimage"
alias vi=vim

# GLOBALS
export EDITOR='vi'

#eval "$(starship init bash)"

