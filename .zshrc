
# Use powerline
#eval "$(starship init zsh)"
USE_POWERLINE="false"
# Source manjaro-zsh-configuration
#if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
#  source /usr/share/zsh/manjaro-zsh-config
#fi
## Use manjaro zsh prompt
#if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
#  source /usr/share/zsh/manjaro-zsh-prompt
#fi
# Source manjaro-zsh-configuration
if [[ -e $HOME/dotfiles/zsh/manjaro-zsh-config ]]; then
  source $HOME/dotfiles/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e $HOME/dotfiles/zsh/manjaro-zsh-prompt ]]; then
  source $HOME/dotfiles/zsh/manjaro-zsh-prompt
fi

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH="/home/deboost/.mybin:$PATH"
export EDITOR=nvim
export FZF_DEFAULT_COMMAND='rg --hidden -l ""'
unsetopt correct_all
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
force_color_prompt=yes
alias vim="nvim"
alias j='jupyter qtconsole  --style=paraiso-light &'
alias pb='fg %+'
alias pm='python ./main.py'
alias to_csv='libreoffice --headless --convert-to csv'
alias yt='youtube-dl -x --audio-format mp3'
alias ytdlp='yt-dlp -x --audio-format mp3 --audio-quality 0'
alias td='vim ~/todo.md'
alias dr='docker run --rm -it --entrypoint bash'
alias getid='xprop _NET_WM_PID | cut -d' ' -f3'
#cd ~/d/unknown_name_classification
#source ~/python_venv/fine_tuning/bin/activate
alias orange='python -m Orange.canvas'
alias ja='python -m jupyter_ascending.scripts.make_pair --base'
alias set_work='jupyter notebook --no-browser &>/dev/null &'
alias dcc='docker compose rm -f && docker compose pull && docker compose up --build'
#source ~/python_venv/recruit/bin/activate 
#cd ~/d/recruit
alias confadd='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/awesome &&
/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/nvim &&
/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/qutebrowser &&
/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.themes &&
/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.jupyter &&
/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.icons &&
/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.moc &&
/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.bashrc &&
/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.zshrc &&
/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/picom &&
/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/rofi &&
/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/ksnip &&
/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/alacritty &&
/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/qt5ct &&
/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/ranger &&
/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/libreoffice &&
echo done'
precmd() { print "" }
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/deboost/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/deboost/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/deboost/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/deboost/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

alias DH='xrandr --output HDMI-0 --mode 1920x1080 --pos 1920x0 --rotate left --output DP-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --off --output DP-5 --off'
alias HD='xrandr --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate left --output DP-0 --primary --mode 1920x1080 --pos 1080x0 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --off --output DP-5 --off'
alias D='xrandr --output HDMI-0 --off --output DP-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --off --output DP-5 --off'
alias mv='mv -v'
alias mv='cp -v'

# Enable vi mode
bindkey -v
