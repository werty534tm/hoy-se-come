# Load Zsh modules
# zmodload zsh/zle
# zmodload zsh/zpty
# zmodload zsh/complist

# Initialize colors
autoload -Uz colors
colors

# Initialize completion system
# autoload -U compinit
# compinit
_comp_options+=(globdots)

# Load edit-command-line for ZLE
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^e" edit-command-line

# General completion behavior
zstyle ':completion:*' completer _extensions _complete _approximate

# Use cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

# Complete the alias
zstyle ':completion:*' complete true

# Autocomplete options
zstyle ':completion:*' complete-options true

# Completion matching control
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' keep-prefix true

# Group matches and describe
zstyle ':completion:*' menu select
zstyle ':completion:*' list-grouped false
zstyle ':completion:*' list-separator '->'
zstyle ':completion:*' group-name '->'
zstyle ':completion:*' verbose yes
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:warnings' format '%F{red}%B-- No match for: %d --%b%f'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*:descriptions' format '[%d]'

# Colors
zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}

# Directories
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' squeeze-slashes true

# Sort
zstyle ':completion:*' sort false
zstyle ":completion:*:git-checkout:*" sort false
zstyle ':completion:*' file-sort modification
zstyle ':completion:*:eza' sort false
zstyle ':completion:complete:*:options' sort false
zstyle ':completion:files' sort false

