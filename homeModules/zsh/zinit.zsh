

#╔═════════════╗
#║ Instalación ║
#╚═════════════╝
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

zinit ice silent wait'!0'
zinit light zdharma-continuum/fast-syntax-highlighting
zinit ice silent wait'!1'
zinit light Aloxaf/fzf-tab

zinit ice silent wait'!1'
zinit light zsh-users/zsh-autosuggestions


