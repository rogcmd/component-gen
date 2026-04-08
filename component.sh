#!/usr/bin/env bash

echo ""
gum=$(which gum)
if [ ! -n "$gum" ]; then
    echo "this program require Gum to load!"
    echo "dowload Gum at: https://github.com/charmbracelet/gum?tab=readme-ov-file#installation"
else
  gum style \
  --background "#cba6f7" \
  --foreground "#1e1e2e" \
  --padding "0 1" \
  --bold \
  "components"\
  
  echo ""
  
  CURRENT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
  escolha=$(gum choose "astro component" "reset.css" --header "What you wanna create ?")
  case $escolha in
      "astro component")
        ComponentName=$(gum input --header "what component u wanna make?" --placeholder "button")
        Component="${ComponentName^}.astro"
          
        if gum confirm "generate $Component ?"; then
          if [ ! -d "./src/components" ]; then
            mkdir -p ./src/components
          fi
          cp $CURRENT_PATH/files/component.astro "./src/components/$Component"
        fi
        if [ -f "./src/components/$Component" ]; then
        gum style \
        --foreground "#94e2d5" \
        "file created at src/components"
        tree . -P "$Component" -L 3--prune
        else 
          clear
          gum style \
          --foreground "#f38ba8" \
          "failed to create file"
        fi
        ;;
        
      "reset.css")
        if [ ! -d "./src/styles" ]; then
          mkdir -p ./src/styles
        fi
        cp $CURRENT_PATH/files/reset.css ./src/styles/
        if [ -f "./src/styles/reset.css" ]; then
        gum style \
        --foreground "#94e2d5" \
        "file created at src/styles"
        tree . -P 'reset.css' -L 3 --prune
        else 
          gum style \
          --foreground "#f38ba8" \
          "failed to create file"
        fi
        ;;
  esac
fi