return {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
        { "<leader>g", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    },
    config = function()
        vim.g.lazygit_floating_window_use_plenary = 0
        vim.env.GIT_EDITOR =
        "nvim --cmd 'let g:lazygit_opener = 1' -c 'autocmd BufEnter * if g:lazygit_opener | let g:lazygit_opener = 0 | wincmd o | endif'"
    end
}
