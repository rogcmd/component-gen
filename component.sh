#!/bin/bash

echo ""
gum style \
--background "#cba6f7" \
--foreground "#1e1e2e" \
--padding "0 1" \
--bold \
"components"\

echo ""

CURRENT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
escolha=$(gum choose "astro component" "reset.css" --header "What do you want to do?")
case $escolha in
    "astro component")
      ComponentName=$(gum input --header "what component u wanna make?")
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
      "file created at src/componente"
      else 
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
      else 
        gum style \
        --foreground "#f38ba8" \
        "failed to create file"
      fi
      ;;
esac