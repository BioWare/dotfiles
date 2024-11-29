return {
    "AndrewRadev/splitjoin.vim",
    keys = {
        { "gJ", desc = "Join the line under cursor" },
        { "gS", desc = "Split the line under cursor" }
    },
    config = function()
        -- Основные настройки
        vim.g.splitjoin_split_mapping = '' -- отключаем дефолтный маппинг
        vim.g.splitjoin_join_mapping = ''  -- отключаем дефолтный маппинг

        -- Настройки для разных языков
        vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
        vim.g.splitjoin_php_method_chain_full = 1 -- полное разделение цепочек методов PHP
        vim.g.splitjoin_trailing_comma = 1        -- добавлять запятую в конце при split
        vim.g.splitjoin_php_arrays_wrapped = 0    -- не оборачивать PHP массивы в скобки
        vim.g.splitjoin_quiet = 1                 -- убрать сообщения о том, что нечего split/join
        vim.g.splitjoin_normalize_whitespace = 1  -- нормализовать пробелы
        vim.g.splitjoin_align = 1                 -- выравнивать элементы при split

        -- Собственные маппинги
        vim.keymap.set('n', 'gJ', ':SplitjoinJoin<CR>', { silent = true })
        vim.keymap.set('n', 'gS', ':SplitjoinSplit<CR>', { silent = true })
    end,
}
