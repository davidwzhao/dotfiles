#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

# Set colours
BLACK=$(tput setaf 0)
WHITE=$(tput setaf 7)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
ORANGE=$(tput setaf 9)
BLUE=$(tput setaf 4)
VIOLET=$(tput setaf 5)
MAGENTA=$(tput setaf 13)
CYAN=$(tput setaf 12)
PINK=$(tput setaf 201)
GREY=$(tput setaf 8)
BOLD=$(tput bold)
UNDERLINE=$(tput smul)
NORMAL=$(tput sgr0)


if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
else
	color_prompt=
fi

if [ -n "$SSH_CLIENT" ]; then
    PS1="[\u@\h] "
else
    PS1=""
fi

if [ "$color_prompt" = yes ] && [ "$TERM" != linux ]; then
    PS1="\[${BLUE}\]$PS1\[${GREY}\][\w] \[${RED}\]\$ \[${NORMAL}\]"
else
    PS1="$PS1${debian_chroot:+($debian_chroot)}[\w] \$ "
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}[\u@\h] [\w]\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
DIRCOLORS="$HOME/.bashrc.d/gruvbox.dircolors"
# if [ -x /usr/bin/dircolors ]; then
#     test -r "$DIRCOLORS" && eval "$(dircolors -b $DIRCOLORS)" || eval "$(dircolors -b)"
# 
#     alias ls='ls --color=auto'
# 
#     alias grep='grep --color=auto'
#     alias fgrep='fgrep --color=auto'
#     alias egrep='egrep --color=auto'
# fi

# macOS doesn't support dircolors, but we can use auto coloring anyway
alias ls='ls --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# aliases
# alias mega-status='mega-transfers --show-syncs --summary'

# set default text editor
export VISUAL=vim
export EDITOR=vim
export PAGER=less

# enable mouse support in less
export LESS='--mouse -R -F -X'

# enable tab completion for sudo
complete -cf sudo

# add julia to path
# export PATH=$PATH:/home/david/docs/julia-1.6.1/bin

alias jj='export JULIA_PROJECT=$PWD && julia'
alias ag='ag --color-match "1;31"'

# Enable bash-completion
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

# Enable git-completion
[[ -r "/Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash" ]] && . "/Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash"

# for terminals, load pywal colorscheme
# if [[ "$TERM" != linux ]] && [[ -f "$HOME/.cache/wal/sequences" ]]; then
#     (cat "$HOME/.cache/wal/sequences" &)
# fi

# start xorg on login
# if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
#     startx
# fi

export BASH_SILENCE_DEPRECATION_WARNING=1

# add Homebrew to path
export PATH="/opt/homebrew/bin:$PATH"
