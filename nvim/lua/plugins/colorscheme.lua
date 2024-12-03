return {
    {
        'bluz71/vim-moonfly-colors',
        name = 'moonfly',
        lazy = false,
        enabled = true,
        priority = 1000,
        config = function()
            vim.cmd [[colorscheme moonfly]]
        end
    },
    {
        'projekt0n/github-nvim-theme',
        lazy = true,
        priority = 1000,
        enabled = false,
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
        "craftzdog/solarized-osaka.nvim",
        lazy = true,
        priority = 1000,
        enabled = false,
        opts = function()
            return {
                transparent = true,
            }
        end,
    },
    {
        "xiyaowong/nvim-transparent",
        lazy = false,
        priority = 1000,
        enabled = true,
        config = function()
            require("transparent").setup({
                enable = true,
                extra_groups = {
                    "Normal",
                    "NormalFloat",
                    "NvimTreeNormal",
                    "TelescopeNormal",
                    "SignColumn",
                    "StatusLine",
                    "StatusLineNC",
                    "EndOfBuffer",
                    -- Группы для плагинов
                    "BufferLineTabClose",
                    "BufferlineBufferSelected",
                    "BufferLineFill",
                    "BufferLineBackground",
                    "BufferLineSeparator",
                    "BufferLineIndicatorSelected",
                    -- Поддержка LSP и диагностики
                    "DiagnosticVirtualTextError",
                    "DiagnosticVirtualTextWarn",
                    "DiagnosticVirtualTextInfo",
                    "DiagnosticVirtualTextHint",
                    -- Gitsigns
                    "GitSignsAdd",
                    "GitSignsChange",
                    "GitSignsDelete"
                },
                exclude_groups = {
                    "CursorLine",
                    "Folded",
                    "Visual",
                    "Search"
                }
            })

            -- Автоматически включаем прозрачность при старте
            vim.cmd("TransparentEnable")
        end
    }
}
