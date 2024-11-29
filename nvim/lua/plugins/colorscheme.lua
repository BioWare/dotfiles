return {
    {
        'bluz71/vim-moonfly-colors',
        name = 'moonfly',
        lazy = true,
        enabled = false,
        priority = 1000,
        config = function()
            vim.cmd [[colorscheme moonfly]]
        end
    },
    {
        'projekt0n/github-nvim-theme',
        lazy = false,
        priority = 1000,
        enabled = true,
        config = function()
            require('github-theme').setup({
                disable_background = true
            })
            vim.cmd('colorscheme github_light_tritanopia')
            --vim.cmd('colorscheme github_light_high_contrast')
            --vim.cmd('colorscheme github_dark_high_contrast')
        end,
    },
    {
        "yorik1984/newpaper.nvim",
        lazy = true,
        priority = 1000,
        enabled = false,
        config = function()
            -- vim.g.newpaper_style = "light"
            -- require("newpaper").setup()
            vim.cmd([[
            highlight clear
            set background=dark
            ]])
        end,
    }
}
