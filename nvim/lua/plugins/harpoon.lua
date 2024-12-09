return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

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
            vim.cmd [[
                noremap <silent> <c-h> :<C-U>TmuxNavigateLeft<cr>
                noremap <silent> <c-j> :<C-U>TmuxNavigateDown<cr>
                noremap <silent> <c-k> :<C-U>TmuxNavigateUp<cr>
                noremap <silent> <c-l> :<C-U>TmuxNavigateRight<cr>
            ]]
        end
        -- Создаем автокоманды для переключения маппингов
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
