# Command completion
autoload -Uz compinit
compinit
setopt globdots

# Keyboard driven autocompletion
zstyle ':completion:*' menu select
# Ignore Case
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Prompt
autoload -U promptinit;
promptinit

# Set prompt
# PROMPT="%F{red}%B[%b%F{magenta}%n%f%B%F{green}@%b%F{cyan}%m%f%F{magenta}%B%F{red}]%b%f%B%F{yellow}╾╼%b%f%B%F{red}[%f%F{green}%~%F{red}]%b%f
# %F{green}%B "

# # Render a new line before the prompt
# precmd() {
#     precmd() {
#         echo
#     }
# }

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[2 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[6 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    echo -ne "\e[6 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[6 q' ;} # Use beam shape cursor for each new prompt.

# Aliases
alias ls='exa -lah --group-directories-first --icons'
alias cat='bat'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias mk='rm -f config.h && sudo make clean install'
alias mk2='rm -f blocks.h && sudo make clean install'
alias rm='rm -i'
alias mv='mv -i'
alias df='df -h | awk "(NR==1) || /^\/dev/"'
alias zathura='zathura --fork'
alias startx='exec sh -c "startx ; sudo prime-switch"'

# Spaceship prompt order
SPACESHIP_PROMPT_ORDER=(
  venv
  dir
  git
  line_sep
  char
)

# Spaceship venv configuration
SPACESHIP_VENV_COLOR="green"

# Spaceship prompt character configuration
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=false
prompt spaceship

# Source plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
