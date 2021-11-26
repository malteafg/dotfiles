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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\[\033[00m\]\[\033[01;34m\]\w\[\033[00m\] \$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\w \$ '
fi
unset color_prompt force_color_prompt

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
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export EDITOR='nvim'
export VISUAL='nvim'
export BROWSER="/usr/bin/google-chrome-stable"

# aliases
#alias ll='ls -alF'
#alias la='ls -A'
#alias l='ls -CF'

alias vim='nvim'
alias ls='exa --color=always --group-directories-first'
alias la='exa -a --color=always --group-directories-first'
alias ll='exa -alF --color=always --group-directories-first'
alias l.='exa -a | egrep "^\."'
#alias lt='exa -aT --color=always --group-directories-first'
lt() {
    level=""
    if [ ! -z "$1" ]; then
        level="-L $1"
    fi
    exa -aT $level --color=always --group-directories-first $2
}

alias grep='grep --color=auto'

alias ..='cd ..'
alias ~='cd ~'
alias rb='source ~/.bashrc'

#alias sxiv='swallow sxiv'
#alias vlc='swallow vlc'
#alias arandr='swallow arandr'
#alias zathura='swallow zathura'

alias sshs='eval `ssh-agent` && ssh-add'
alias sshq='kill $SSH_AGENT_PID'

#alias cp='cp -i'
alias mv='mv -i'
#alias rm='rm -I'

alias auconnect='/opt/cisco/anyconnect/bin/vpn -s connect remote.au.dk/AU-ACCESS'
alias audisconnect='/opt/cisco/anyconnect/bin/vpn -s disconnect remote.au.dk/AU-ACCESS'
alias ciscostate='/opt/cisco/anyconnect/bin/vpn state'
ciscovpn() { /opt/cisco/anyconnect/bin/vpn "$@"; }

alias config='/usr/bin/git --git-dir=/home/malte/.dotfiles/ --work-tree=/home/malte'

alaopa() {
	sed -i "s~background_opacity.*~background_opacity: $@~g" .config/alacritty/alacritty.yml
}

alias mon2cam="~/.deno/bin/deno run --unstable -A -r -q https://raw.githubusercontent.com/ShayBox/Mon2Cam/master/src/mod.ts"
alias mon2cam="deno run --unstable -A -r -q https://raw.githubusercontent.com/ShayBox/Mon2Cam/master/src/mod.ts"

bind '"\C-f":"of -h -E\n"'
alias godir='source godir'
bind '"\C-t":"source godir -h -E\n"'

pac() {
    PACS=$(pacman -Ssq | fzf -m --preview="pacman -Si {}")
    (($?)) || sudo pacman -Syy $PACS
}

cdn() {
    mkdir -p -- "$1" && cd -P -- "$1"
}

mvr() {
    unset -v latest
    for file in ~/{Downloads,Pictures}/*; do
      [[ $file -nt $latest ]] && latest=$file
    done
    mv -i "$latest" $([[ "${1##*/}" == *.* ]] && echo "$1" || echo "$1.${latest##*.}")
}

commit() {
    config commit -a
    mu commit -a
}

pull() {
    eval `ssh-agent` && ssh-add
    config pull
    mu pull
    kill $SSH_AGENT_PID
}

push() {
    eval `ssh-agent` && ssh-add
    config push
    mu push
    kill $SSH_AGENT_PID
}

st () {
    config status
    mu st
}

copy() {
    xclip -sel c < "$1"
}

paste() {
    xclip -o > "$1"
}
