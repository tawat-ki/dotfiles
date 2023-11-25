# Use powerline
USE_POWERLINE="false"

# Source manjaro-zsh-configuration
if [[ -e $HOME/dotfiles/zsh/manjaro-zsh-config ]]; then
  source $HOME/dotfiles/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e $HOME/dotfiles/zsh/manjaro-zsh-prompt ]]; then
  source $HOME/dotfiles/zsh/manjaro-zsh-prompt
fi

export GOOGLE_APPLICATION_CREDENTIALS="/home/tawat-ki/.config/gcloud/application_default_credentials.json"
#export PYENV_ROOT="$HOME/.pyenv"
#command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"

export PATH="$HOME/.mybin:$PATH"
export EDITOR=nvim
export FZF_DEFAULT_COMMAND='rg --hidden -l ""'
unsetopt correct_all
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'
PYDEVD_DISABLE_FILE_VALIDATION=1
force_color_prompt=yes
#alias vim="nvim"
alias j='jupyter qtconsole  --style=paraiso-light &'
alias icat="kitty +kitten icat"
alias pb='fg %+'
alias pm='python ./main.py'
alias to_csv='libreoffice --headless --convert-to csv'
alias yt='youtube-dl -x --audio-format mp3'
alias ytdlp='yt-dlp -x --audio-format mp3 --audio-quality 0'
alias td='vim ~/todo.md'
alias dr='docker run --rm -it --entrypoint bash'
alias getid='xprop _NET_WM_PID | cut -d' ' -f3'
alias orange='python -m Orange.canvas'
#alias ja='python -m jupyter_ascending.scripts.make_pair --base'
alias ja='~/dotfiles/ja_make_pair.sh'

alias start_ja='JUPYTER_PORT=8888 JUPYTER_PORT_RETRIES=0 jupyter notebook --no-browser --NotebookApp.token="copium" &>/dev/null &'
alias dcc='docker compose rm -f && docker compose pull && docker compose up --build'
alias DH='xrandr --output HDMI-0 --mode 1920x1080 --pos 1920x0 --rotate left --output DP-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --off --output DP-5 --off'
alias HD='xrandr --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate left --output DP-0 --primary --mode 1920x1080 --pos 1080x0 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --off --output DP-5 --off'
alias D='xrandr --output HDMI-0 --off --output DP-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --off --output DP-5 --off'
alias mv='mv -v'
alias cp='cp -v'


# Enable vi mode
#bindkey -v
#function vi-yank-xclip {
#    zle vi-yank
#   echo -n "$BUFFER" | xclip -sel c
#}
#zle -N vi-yank-xclip
#bindkey -M vicmd 'y' vi-yank-xclip
#bindkey -M vicmd 'k' history-substring-search-up
#bindkey -M vicmd 'j' history-substring-search-down
#bindkey -r "^[OA" 
#bindkey -r "^[OB"
#bindkey -r "^[OC"
#bindkey -r "^[OD"
#bindkey -r "^[OF"
#bindkey -r "^[OH"
#bindkey -r "^[[200~"
#bindkey -r "^[[2~"
#bindkey -r "^[[3~"
#bindkey -r "^[[A" 
#bindkey -r "^[[B" 
#bindkey -r "^[[C" 
#bindkey -r "^[[D" 
#setopt IGNORE_EOF

#https://github.com/ihashacks/notifyosd.zsh/blob/e15624e3e9d618528b9118b4247e9e5a7aaebc97/notifyosd.zsh
# commands to ignore
cmdignore=(htop tmux top vim nvim ranger)

# set gt 0 to enable GNU units for time results
gnuunits=0

# end and compare timer, notify-send if needed
function notifyosd-precmd() {
	retval=$?
    if [[ ${cmdignore[(r)$cmd_basename]} == $cmd_basename ]]; then
        return
    else
        if [ ! -z "$cmd" ]; then
            cmd_end=`date +%s`
            ((cmd_secs=$cmd_end - $cmd_start))
        fi
        if [ $retval -gt 0 ]; then
			cmdstat="with warning"
			sndstat="/usr/share/sounds/gnome/default/alerts/sonar.ogg"
			urgency="critical"
		else
            cmdstat="successfully"
			sndstat="/usr/share/sounds/gnome/default/alerts/glass.ogg"
			urgency="normal"
        fi
        if [ ! -z "$cmd" -a $cmd_secs -gt 10 ]; then
			if [ $gnuunits -gt 0 ]; then
				cmd_time=$(units "$cmd_secs seconds" "centuries;years;months;weeks;days;hours;minutes;seconds" | \
						sed -e 's/\ +/\,/g' -e s'/\t//')
			else
				cmd_time="$cmd_secs seconds"
			fi
            if [ ! -z $SSH_TTY ] ; then
                notify-send -i utilities-terminal \
						-u $urgency "$cmd_basename on `hostname` completed $cmdstat" "\"$cmd\" took $cmd_time"; \
						mpg123 -q $sndstat
            else
                notify-send -i utilities-terminal -i /usr/share/icons/hicolor/256x256/apps/kitty.png \
						-u $urgency "$cmd_basename completed $cmdstat" "\"$cmd\" took $cmd_time"; \
						mpg123 -q $sndstat
            fi
        fi
        unset cmd
    fi
}

# make sure this plays nicely with any existing precmd
precmd_functions+=( notifyosd-precmd )

# get command name and start the timer
function notifyosd-preexec() {
    cmd=$1
    cmd_basename=${${cmd:s/sudo //}[(ws: :)1]} 
    cmd_start=`date +%s`
}

# make sure this plays nicely with any existing preexec
preexec_functions+=( notifyosd-preexec )
#LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=0;42:ow=103;30;01:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:'
#export LS_COLORS=

LS_COLORS="$LS_COLORS:ow=103;30;01"




# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/tawat-ki/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/tawat-ki/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/tawat-ki/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/tawat-ki/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

