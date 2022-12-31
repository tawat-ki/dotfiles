# Use powerline
USE_POWERLINE="false"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi
#eval "$(starship init zsh)"
export PATH="/home/deboost/.mybin:$PATH"
unsetopt correct_all

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/deboost/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/home/deboost/miniconda3/etc/profile.d/conda.sh" ]; then
#        . "/home/deboost/miniconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/home/deboost/miniconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
#
# <<< conda initialize <<<
#export WORKON_HOME=~/.virtualenvs
export EDITOR=nvim
#source ~/.local/bin/virtualenvwrapper.sh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
export PATH="$HOME/.poetry/bin:$PATH"
export FZF_DEFAULT_COMMAND='rg --hidden -l ""'
force_color_prompt=yes
alias vim="nvim"
alias j='jupyter qtconsole  --style=dracula &'
alias pb='fg %+'
alias pm='python ./main.py'
alias to_csv='libreoffice --headless --convert-to csv '
alias yt='youtube-dl -x --audio-format mp3'
alias td='vim ~/todo.txt'
alias dr='docker run --rm -it --entrypoint bash'

#cd ~/d/unknown_name_classification
#source ~/python_venv/fine_tuning/bin/activate
alias orange='python -m Orange.canvas'
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

