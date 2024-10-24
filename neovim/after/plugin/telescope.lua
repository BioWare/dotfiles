local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pS', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.keymap.set('n', '<leader>ps', function()
    builtin.live_grep({
        word_match = "-w",
        only_sort_text = true,
        search_dirs = {"."},
    })
end)

-- Map <leader>fb to find buffers
vim.api.nvim_set_keymap('n', '<leader>pb', ':lua require("telescope.builtin").buffers()<CR>', { noremap = true, silent = true })
