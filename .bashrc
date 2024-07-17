# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
HISTIGNORE="pwd:ls:cd"

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
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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
force_color_prompt=yes

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

# Bash Prompt Customization
if [ "$color_prompt" = yes ]; then
    base_PS1="\n\[\033[1;31m\] ╭─\[\033[0m\]\[\033[1;41m\]  \h \[\033[0m\]\[\033[1;31m\]\[\033[1;44m\]\[\033[0m\]\[\033[1;44m\]   \W \[\033[0m\]"
else 
    base_PS1="\n\[\033[1;31m\] ╭─\[\033[0m\]\[\033[1;41m\]  \h \[\033[0m\]\[\033[1;31m\]\[\033[1;44m\]\[\033[0m\]\[\033[1;44m\]   \W \[\033[0m\]"
fi

PROMPT_COMMAND=find_git

find_git() {
    git_dir=$(git rev-parse --git-dir 2> /dev/null)
    branch_name=""
    if [ -n "$git_dir" ]; then
        branch_name=$(git symbolic-ref --short HEAD 2> /dev/null)
    fi

    if [ -n "$branch_name" ]; then
        PS1="$base_PS1\[\033[1;46m\]\[\033[1;34m\]\[\033[0m\]\[\033[1;46m\]\[\033[1;30m\]    $branch_name \[\033[0m\]\[\033[1;36m\]\[\033[0m\]\[\033[1;31m\]\n ╰─ \[\033[0m\]"
    else
        PS1="$base_PS1\[\033[1;34m\]\[\033[0m\]\[\033[1;31m\]\n ╰─ \[\033[0m\]"
    fi
}

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
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'
alias l='ls -la'

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

. "$HOME/.cargo/env"

unset FZF_DEFAULT_OPTS
#export FZF_DEFAULT_OPTS="--preview 'batcat --style=numbers --color=always --line-range :500 {}' --height=40% --layout=reverse --info=inline --border --margin=1 --padding=1"

# autocomplete config
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
eval "$(fzf --bash)"
eval "$(zoxide init bash)"

export PATH="$PATH:/home/zuxroy/balenaEtcher-linux-x64"
export LC_ALL=en_IN.UTF-8
export LANG=en_IN.UTF-8

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export OPENSSL_ROOT_DIR=/usr/include/openssl


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/zuxroy/.opam/opam-init/init.sh' && . '/home/zuxroy/.opam/opam-init/init.sh' > /dev/null 2> /dev/null || true
# END opam configuration

[ -f "/home/zuxroy/.ghcup/env" ] && . "/home/zuxroy/.ghcup/env" # ghcup-env
