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
export PATH="/home/deboost/.mybin:$PATH"
unsetopt correct_all

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/deboost/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/home/deboost/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/home/deboost/anaconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/home/deboost/anaconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
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
alias j='jupyter qtconsole --style=dracula &'
alias pb='fg %+'
alias pm='python ./main.py'
alias to_csv='python ~/d/xlsx.py'
alias yt='youtube-dl -x --audio-format mp3'
alias td='vim ~/todo.txt'
alias dr='docker run --rm -it --entrypoint bash'

#cd ~/d/unknown_name_classification
#source ~/python_venv/fine_tuning/bin/activate
