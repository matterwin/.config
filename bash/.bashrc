#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

stty -ixon
set -o vi

# fastfetch

PS1='\[\e[38;2;191;85;236m\]\w\[\e[0m\]>> '

export TERMINFO=/usr/share/terminfo


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH=/opt/cuda/bin:$PATH
export LD_LIBRARY_PATH=/opt/cuda/lib64:$LD_LIBRARY_PATH

# export PATH=~/Downloads/NsightSystems-linux-public-2019.3.6.30-e2e891f/Target-x86_64/x86_64:$PATH
# export PATH=~/Downloads/NsightSystems-linux-public-2019.3.6.30-e2e891f/Target-x86_64/x86_64:$PATH

export PATH=/opt/nvidia/nsight-systems/2020.5.1/target-linux-x64:$PATH

export PATH="$HOME/.local/bin:$PATH"

alias cdrive='cd /mnt/c/Users/MERWIN'

msedge() {
	"/mnt/c/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" \
		"$(wslpath -w "$1")"
}

export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

alias ,date='date +%F'
alias wfe='explorer.exe'

datet() {
	touch "$(date +%F).txt"
}
