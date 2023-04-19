# XDG Paths
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}

# Fixing paths
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
# export VSCODE_PORTABLE="$XDG_DATA_HOME"/vscode # May Break
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export MYSQL_HISTFILE="$XDG_DATA_HOME"/mysql_history 
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc 
# export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java 

# Neovim as manpager
export MANPAGER='nvim +Man!'

# Hisotry
export SAVEHIST=10000
export HISTFILE=~/.config/zsh/.histfile

# Disable less history
export LESSHISTFILE=-

# Override VA-API & VDPAU drivers
export LIBVA_DRIVER_NAME=iHD
export VDPAU_DRIVER=nvidia

# JAVA GUI fix
export _JAVA_AWT_WM_NONREPARENTING=1

# Neovim as editor
export EDITOR=nvim
