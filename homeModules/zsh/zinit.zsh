

#╔═══════════════╗
#║ Zinit install ║
#╚═══════════════╝
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Arreglo para tras el compinit
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

#╔═════════════╗
#║ Plugiiins :D║
#╚═════════════╝

zinit ice depth"1"
zinit light romkatv/powerlevel10k
source ~/.p10k.zsh

zinit light zdharma-continuum/fast-syntax-highlighting

zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit light zsh-users/zsh-autosuggestions
zinit ice silent
zinit light zsh-users/zsh-history-substring-search
zinit ice silent wait atload'_history_substring_search_config'

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=(none)
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=(none)

zinit ice silent wait'!1'
zinit light Aloxaf/fzf-tab

zinit ice silent wait'!2'
zinit light MichaelAquilina/zsh-you-should-use

unsetopt BEEP # <- Most important part of the config

unalias zi
eval "$(zoxide init zsh)"

