eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(/Users/adriano/.local/bin/mise activate zsh)"
eval "$(starship init zsh)"

# Início da configuração de busca no histórico
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "^[[A" up-line-or-beginning-search # Seta para Cima
bindkey "^[[B" down-line-or-beginning-search # Seta para Baixo
# Fim da configuração

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

export LS_COLORS="$(vivid generate catppuccin-mocha)"

# Alias para usar o eza no lugar do ls
# --icons: mostra os ícones
# -l: lista detalhada (long)
# -a: mostra arquivos ocultos (all)
# --group-directories-first: agrupa pastas no topo (opcional, mas recomendado)
alias ls="eza --icons -la --git --group-directories-first --header --time-style='+%Y-%m-%d %H:%M:%S'"
alias tree="eza --tree --icons"

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias cat="bat"
export BAT_THEME="Catppuccin Mocha"

export EDITOR="micro"
export VISUAL="micro"
export MICRO_TRUECOLOR=1
alias nano="micro"
