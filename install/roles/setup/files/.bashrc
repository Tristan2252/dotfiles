# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples


###### Powerline Colors ######
A_BACKGROUND='227:231:232'
A_FORGROUND='36:33:26'
B_BACKGROUND='36:33:26'
B_FORGROUND='227:231:232'

prompt() {
    bold=$(tput bold)
    a_color="\033[38:2:${A_FORGROUND}m\033[48:2:${A_BACKGROUND}m"
    a_end="\033[38:2:${A_BACKGROUND}m\033[48:2:${B_BACKGROUND}m"
    b_color="\033[38:2:${B_FORGROUND}m\033[48:2:${B_BACKGROUND}m"
    b_end="\033[38:2:${B_BACKGROUND}m"
    re_color=$(tput sgr0)

    local pmt='\[$bold\]\[%s\] $USER \[%s\]\[%s\] $(pwd | sed "s/\/home\/$USER/~/g; s/\//  /g") \[$re_color\]\[%s\]\[$re_color\]\[$re_color\] '
    
    PS1=$(printf "$pmt" "$a_color" "$a_end" "$b_color" "$b_end")
}

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PROMPT_COMMAND=prompt
    
    #if [ $(expr length $(pwd)) -gt 50 ]; then 
    #    PS1='\[$bold\]\[$a_color\] \u \[$a_end\]\[$b_color\]  ...  \W \[\033[00m\]\[$b_end\] \[\033[00m\]'
    #fi
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$'
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ tristan '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

alias cse='cd /Users/tristan/Documents/CSE/122/Notes'
alias cse-l='cd /Users/tristan/Documents/CSE/122/Labs'
alias lc='ls --color=none'
alias feh='feh --scale '
alias tetris='quadrapassel'

export MANPAGER=less
export PAGER=less
export LESS_TERMCAP_mb=$(printf '\E[01;31m')       # begin blinking
export LESS_TERMCAP_md=$(printf '\E[01;38;5;74m')  # begin bold
export LESS_TERMCAP_me=$(printf '\E[0m')           # end mode
export LESS_TERMCAP_se=$(printf '\E[0m')           # end standout-mode
export LESS_TERMCAP_so=$(printf '\E[38;5;246m')    # begin standout-mode - info box
export LESS_TERMCAP_ue=$(printf '\E[0m')           # end underline
export LESS_TERMCAP_us=$(printf '\E[04;38;5;146m') # begin underline

