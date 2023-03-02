# Fixing paths
export ZDOTDIR=$HOME/.config/zsh
export PATH=$HOME/.local/bin:$PATH

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
