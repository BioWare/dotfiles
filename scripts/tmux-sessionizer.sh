#!/usr/bin/env bash

# Если аргумент передан, использовать его, иначе запускать fzf
if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/carlos ~/Sync/obsidian ~/PhpstormProjects ~/Projects/incubator/backend ~/ -mindepth 1 -maxdepth 1 -type d | fzf)
fi

# Если ничего не выбрано, выйти
if [[ -z $selected ]]; then
    exit 0
fi

# Преобразовать имя каталога в допустимое имя для tmux
selected_name=$(basename "$selected" | tr . _)

# Проверить, запущен ли tmux
if [[ -z $TMUX ]]; then
    echo "Запустите скрипт внутри tmux сессии."
    exit 1
fi

# Создать новое окно в текущей tmux сессии и перейти в выбранный каталог
tmux new-window -n $selected_name -c $selected
tmux select-window -t $selected_name
