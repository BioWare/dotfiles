return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile", "VeryLazy" },
    lazy = vim.fn.argc(-1) == 0,
    init = function(plugin)
        require("lazy.core.loader").add_to_rtp(plugin)
        require("nvim-treesitter.query_predicates")
    end,
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    dependencies = {
        { 'nvim-treesitter/playground', cmd = "TSPlaygroundToggle" },
        {
            'JoosepAlviste/nvim-ts-context-commentstring',
            opts = {
                languages = {
                    php_only = '// %s',
                    php = '// %s',
                },
                custom_calculation = function(node, language_tree)
                    if vim.bo.filetype == 'blade' then
                        if language_tree._lang == 'html' then
                            return '{{-- %s --}}'
                        else
                            return '// %s'
                        end
                    end
                end,
            },
        },
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    keys = {
        { "<c-space>", desc = "Increment Selection" },
        { "<bs>",      desc = "Decrement Selection", mode = "x" },
    },
    opts = {
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
            disable = { "yaml" }
        },
        sync_install = true,
        auto_install = true,
        rainbow = {
            enable = true,
        },
        ensure_installed = {
            -- PHP экосистема
            'php',
            'php_only',
            'phpdoc', -- нужен для полной подсветки PHP документации
            'blade', -- Laravel blade templates

            -- Web стандарты
            'html',
            'css',
            'javascript',
            'typescript',
            'vue',

            -- Данные и конфигурация
            'json',
            'jsonc', -- JSON с комментариями
            'sql',

            -- Документация
            'markdown',
            'markdown_inline',

            -- Служебные файлы
            'comment', -- для корректной работы комментариев
            'diff', -- для git diff
            'gitignore', -- для .gitignore файлов
            'yaml', -- для docker-compose и других конфигураций
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<C-space>",
                node_incremental = "<C-space>",
                scope_incremental = false,
                node_decremental = "<bs>",
            },
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ['if'] = '@function.inner',
                    ['af'] = '@function.outer',
                    ['ia'] = '@parameter.inner',
                    ['aa'] = '@parameter.outer',
                },
            },
            move = {
                enable = true,
                goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
                goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
                goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
                goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
            },
        },
    },
    config = function(_, opts)
        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        parser_config.blade = {
            install_info = {
                url = "https://github.com/EmranMR/tree-sitter-blade",
                files = { "src/parser.c" },
                branch = "main",
            },
            filetype = "blade"
        }

        vim.filetype.add({
            pattern = {
                ['.*%.blade%.php'] = 'blade',
            },
        })

        if type(opts.ensure_installed) == "table" then
            local ensure_installed = {}
            for _, lang in ipairs(opts.ensure_installed) do
                ensure_installed[lang] = true
            end
            opts.ensure_installed = vim.tbl_keys(ensure_installed)
        end

        require('nvim-treesitter.configs').setup(opts)
    end,
}
