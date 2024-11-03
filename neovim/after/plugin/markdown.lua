local augroup = vim.api.nvim_create_augroup("MarkdownSettings", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    group = augroup,
    pattern = "markdown",
    callback = function()
        -- Отключаем определенные плагины для markdown
        -- Например, отключаем indent-blankline
        require("ibl").setup_buffer(0, { enabled = false })
        
        -- Отключаем ufo для markdown
        require('ufo').detach()
        vim.opt_local.foldenable = false
        vim.opt_local.foldcolumn = '0'

        -- Переопределяем маппинги специфично для markdown буфера
        -- Буферные маппинги имеют приоритет над глобальными
        vim.keymap.set('n', '<leader>pf', ':ObsidianTags<CR>', { 
            buffer = 0,  -- 0 означает текущий буфер
            silent = true,
            desc = "Search Obsidian Tags" 
        })
    end
})
