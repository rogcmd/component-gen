#!/usr/bin/env bash

gum=$(which gum)
if [ ! -n "$gum" ]; then
    echo ""
    echo -e "\e[31mThis program require Gum to load!\e[0m"
    echo -e "Check how to install Gum at: \e[34mhttps://github.com/charmbracelet/gum?tab=readme-ov-file#installation\e[0m"
  else
  gum style \
  --background "#cba6f7" \
  --foreground "#1e1e2e" \
  --padding "0 1" \
  --margin "1 0" \
  --bold \
  "components"\
  
  CURRENT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
  escolha=$(gum choose "astro component" "reset.css" --header "What you wanna create ?")
  case $escolha in
    "astro component")
      ComponentName=$(gum input --header "what component u wanna make?" --placeholder "button")

      while [ -z "$ComponentName" ]; do
      echo -e "\e[31mTitle cant be blank!\e[0m"
      TITLE=$(gum input --header "Title of the commit:" --placeholder "changes you made")
      done
      
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
      "File created at src/components"
      else 
        clear
        gum style \
        --foreground "#f38ba8" \
        "Operation canceled"
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
      "File created at src/styles"
      else 
        gum style \
        --foreground "#f38ba8" \
        "failed to create file"
      fi
      ;;
  esac
fi