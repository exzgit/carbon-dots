#
# ~/.bash_profile
#

export PATH="$HOME/.local/bin:$PATH"
export BROWSER="firefox"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

[[ -f ~/.bashrc ]] && . ~/.bashrc
