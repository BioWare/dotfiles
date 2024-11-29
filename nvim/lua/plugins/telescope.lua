return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons'
    },
    keys = {
        "<leader>pf",
        "<C-p>",
        "<leader>pS",
        "<leader>ps",
        "<leader>pb",
    },
    config = function()
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')

        telescope.setup({
            defaults = {
                file_ignore_patterns = { "node_modules", ".git/" },
                path_display = { "truncate" },
            }
        })

        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>pS', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)

        vim.keymap.set('n', '<leader>ps', function()
            builtin.live_grep({
                word_match = "-w",
                only_sort_text = true,
                search_dirs = { "." },
            })
        end)

        vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
    end,
}
