export ZDOTDIR=~/.config/zsh
export LANG=en_US.UTF-8

if [[ -v fpath ]]; then
    fpath+=($ZDOTDIR/.zfuncs)
else
    fpath=($ZDOTDIR/.zfuncs)
fi

if [[ -e $HOME/.cargo/env ]]; then
    . "$HOME/.cargo/env"
fi
