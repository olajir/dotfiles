#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "$XDG_RUNTIME_DIR" ]; then
    export XDG_RUNTIME_DIR=/run/user/$(id -u)
fi

# Tvinga grafikmotiorn att använda systemds login
#
export LIBSEAT_BACKEND=logind
export EDITOR="vim"
# Starta Sway automatiskt vid lokal inloggning på tty1
if [ -z "${DISPLAY}" ] && [ "$(tty)" = "/dev/tty1" ]; then
    export XDG_SESSION_TYPE=wayland
    export XDG_CURRENT_DESKTOP=sway
    exec sway
fi


. "$HOME/.local/bin/env"
