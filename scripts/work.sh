#!/bin/bash

# Название сессии tmux
SESSION_NAME="work_session"

# Базовый путь
BASE_PATH="~/Sync/obsidian/jesusrag"

# Пути к файлам относительно базового пути
KANBAN_FILE="$BASE_PATH/kanban/kanban.md"
PLAN_YEAR="$BASE_PATH/notes/plan.md"
PLAN_MONTH="$BASE_PATH/plans/May-2024.md"

# Проверка, существует ли сессия с таким названием
if tmux has-session -t $SESSION_NAME 2>/dev/null; then
    echo "Сессия $SESSION_NAME уже существует."
    tmux attach -t $SESSION_NAME
    exit 0
fi

# Создание новой сессии tmux
tmux new-session -d -s $SESSION_NAME

# Открытие первого окна с neovim и командой :KanbanOpen
tmux send-keys "cd $BASE_PATH && nvim +':KanbanOpen $KANBAN_FILE'" C-m

# Создание второго окна и открытие второго файла в neovim
tmux split-window -h
tmux send-keys "cd $BASE_PATH && nvim $PLAN_YEAR" C-m

# Переключение на первую панель и создание третьего окна внизу
tmux select-pane -t 0
tmux split-window -v
tmux send-keys "cd $BASE_PATH && nvim $PLAN_MONTH" C-m

# Установка фокуса на первое окно (верхнее)
tmux select-pane -t 0

# Подключение к сессии
tmux attach -t $SESSION_NAME

