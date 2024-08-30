vim.g.lazygit_floating_window_use_plenary = 0

vim.env.GIT_EDITOR = "nvim --cmd 'let g:lazygit_opener = 1' -c 'autocmd BufEnter * if g:lazygit_opener | let g:lazygit_opener = 0 | wincmd o | endif'"
