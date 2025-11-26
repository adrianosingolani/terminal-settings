#!/bin/bash

echo "🚀 Iniciando configuração do Terminal Settings..."

# 1. Instalar Homebrew (se não tiver)
if ! command -v brew &> /dev/null; then
    echo "🍺 Instalando Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        else
            echo "✅ Homebrew já instalado."
            fi

            # 2. Instalar Ferramentas (Starship, Eza, Bat, Micro, Zoxide, Plugins Zsh)
            echo "📦 Instalando ferramentas..."
            brew install starship eza bat micro zoxide zsh-autosuggestions zsh-syntax-highlighting git

            # 3. Configurar Fontes (Opcional - avisa o usuário)
            echo "⚠️  Lembre-se de instalar a 'FiraCode Nerd Font' manualmente se ainda não tiver."

            # 4. Preparar pastas de configuração
            mkdir -p ~/.config/micro/colorschemes

            # 5. Criar Links Simbólicos (O Pulo do Gato)
            # Isso faz com que o sistema use os arquivos DESTA pasta.
            # Se você editar o ~/.zshrc, estará editando o arquivo do repo automaticamente.

            echo "🔗 Linkando arquivos de configuração..."

            # Remove arquivos antigos para não dar erro
            rm -rf ~/.zshrc ~/.config/starship.toml ~/.config/micro/settings.json ~/.config/micro/bindings.json ~/.config/micro/colorschemes/catppuccin-mocha.micro

            # Cria os links (simlinks)
            ln -sf "$PWD/zshrc" "$HOME/.zshrc"
            ln -sf "$PWD/config/starship.toml" "$HOME/.config/starship.toml"
            ln -sf "$PWD/config/micro/settings.json" "$HOME/.config/micro/settings.json"
            ln -sf "$PWD/config/micro/bindings.json" "$HOME/.config/micro/bindings.json"
            ln -sf "$PWD/config/micro/colorschemes/catppuccin-mocha.micro" "$HOME/.config/micro/colorschemes/catppuccin-mocha.micro"

            # 6. Configurar Git para baixar o plugin do Autosuggestions
            # O syntax highlighting instalamos via brew, mas o autosuggestions no zshrc aponta para pasta oculta
            if [ ! -d "$HOME/.zsh/zsh-autosuggestions" ]; then
                echo "🔌 Clonando zsh-autosuggestions..."
                    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
                    fi

                    echo "✅ Instalação concluída! Reinicie o terminal."
