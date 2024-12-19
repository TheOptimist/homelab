# Love XDG, and "clean" home directory
# Probably overkill for the NAS tbh...
export XDG_HOME="$HOME/.local"
export XDG_CONFIG_HOME="$XDG_HOME/config"
export XDG_DATA_HOME="$XDG_HOME/share"
export XDG_STATE_HOME="$XDG_HOME/state"
export XDG_CACHE_HOME="$XDG_HOME/cache"
export XDG_BINARY_DIR="$XDG_HOME/bin"

# Locally installed binaries should take precedence
export PATH="$XDG_BINARY_DIR:$PATH"

# Kitty has specific terminfo (installed separately)
export TERMINFO="$XDG_CONFIG_HOME/terminfo"

# Make docker comply with XDG spec
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

# Frustratingly, starship doesn't seem to do XDG _properly_
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship.toml"
export STARSHIP_CACHE="$XDG_CACHE_HOME/starship"

# Ya, dumb, but I don't like the `_` in `bash_history`
export HISTFILE=".history"

# Make the prompt useful...and look nice
eval "$(starship init bash)"

alias ls="eza --long --group --icons=always --ignore-glob=@Recycle"
alias la="ls -a"