#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# uv m.fl. installerar i ~/.local/bin (skriptet lägger bara till den en gång)
. "$HOME/.local/bin/env"

if [ -z "$XDG_RUNTIME_DIR" ]; then
    export XDG_RUNTIME_DIR=/run/user/$(id -u)
fi

# Tvinga grafikmotorn att använda systemds login
export LIBSEAT_BACKEND=logind
export EDITOR="vim"

# Starta Sway automatiskt vid lokal inloggning på tty1
if [ -z "${DISPLAY}" ] && [ "$(tty)" = "/dev/tty1" ]; then
    export XDG_SESSION_TYPE=wayland
    export XDG_CURRENT_DESKTOP=sway
    exec sway
fi
