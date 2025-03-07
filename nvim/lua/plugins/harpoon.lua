return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = function()
        local harpoon = require("harpoon")
        -- Правильная инициализация для Harpoon 2
        harpoon.setup({
            settings = {
                save_on_toggle = true,
                save_on_change = true,
            }
        })

        -- Базовые маппинги Harpoon
        vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        -- Функции для установки маппингов harpoon
        local function setup_harpoon_maps()
            vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
        end

        -- Функция для установки маппингов tmux
        local function setup_tmux_maps()
            vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>")
            vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>")
            vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>")
            vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>")
        end

        -- Автокоманда для переключения маппингов
        vim.api.nvim_create_autocmd("WinEnter", {
            callback = function()
                if #vim.api.nvim_list_wins() > 1 then
                    setup_tmux_maps()
                else
                    setup_harpoon_maps()
                end
            end
        })

        -- Начальная установка маппингов
        if #vim.api.nvim_list_wins() > 1 then
            setup_tmux_maps()
        else
            setup_harpoon_maps()
        end
    end,
}
