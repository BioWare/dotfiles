#!/bin/bash

# Название сессии tmux
SESSION_NAME="work_session"

# Пути к файлам
KANBAN_FILE="~/Sync/obsidian/jesusrag/kanban/kanban.md"
PLAN_YEAR="~/Sync/obsidian/jesusrag/notes/plan.md"
PLAN_MONTH="~/Sync/obsidian/jesusrag/plans/May-2024.md"

# Проверка, существует ли сессия с таким названием
if tmux has-session -t $SESSION_NAME 2>/dev/null; then
    echo "Сессия $SESSION_NAME уже существует."
    tmux attach -t $SESSION_NAME
    exit 0
fi

# Создание новой сессии tmux
tmux new-session -d -s $SESSION_NAME

# Открытие первого окна с neovim и командой :KanbanOpen
tmux send-keys "nvim +':KanbanOpen $KANBAN_FILE'" C-m

# Создание второго окна и открытие второго файла в neovim
tmux split-window -h
tmux send-keys "nvim $PLAN_YEAR" C-m

# Переключение на первую панель и создание третьего окна внизу
tmux select-pane -t 0
tmux split-window -v
tmux send-keys "nvim $PLAN_MONTH" C-m

# Установка фокуса на первое окно (верхнее)
tmux select-pane -t 0

# Подключение к сессии
tmux attach -t $SESSION_NAME

