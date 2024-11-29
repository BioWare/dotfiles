return {
    "epwalsh/obsidian.nvim",
    event = { "BufReadPre " .. vim.fn.expand "~" .. "/Sync/obsidian/**.md",
        "BufNewFile " .. vim.fn.expand "~" .. "/Sync/obsidian/**.md",
        "VeryLazy" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("obsidian").setup({
            workspaces = {
                {
                    name = "personal",
                    path = "~/Sync/obsidian/jesusrag/",
                },
                {
                    name = "work",
                    path = "~/Sync/obsidian/work",
                },
                {
                    name = "zettlekasten",
                    path = "~/Sync/obsidian/zettlekasten/",
                    overrides = {
                        notes_subdir = "Inbox",
                        new_notes_location = "Inbox",
                        daily_notes = {
                            folder = "Journal",
                            date_format = "%Y-%m-%d",
                            alias_format = "%B %-d, %Y",
                            default_tags = { "daily-notes" },
                            template = nil
                        },
                    },
                },
            },
            mappings = {
                ["gf"] = {
                    action = function()
                        return require("obsidian").util.gf_passthrough()
                    end,
                    opts = { noremap = false, expr = true, buffer = true },
                },
                ["<leader>ch"] = {
                    action = function()
                        return require("obsidian").util.toggle_checkbox()
                    end,
                    opts = { buffer = true },
                },
            },
            templates = {
                subdir = "templates",
                date_format = "%Y-%m-%d",
                time_format = "%H:%M",
            },
            follow_url_func = function(url)
                vim.fn.jobstart({ "open", url })
            end,
            use_advanced_uri = false,
            open_app_foreground = false,
            picker = {
                name = "telescope.nvim",
                mappings = {
                    new = "<C-x>",
                    insert_link = "<C-l>",
                },
            },
            sort_by = "modified",
            sort_reversed = true,
            open_notes_in = "current",
            ui = {
                enable = true,
                update_debounce = 200,
                checkboxes = {
                    [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
                    ["x"] = { char = "", hl_group = "ObsidianDone" },
                    [">"] = { char = "", hl_group = "ObsidianRightArrow" },
                    ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
                },
                bullets = { char = "•", hl_group = "ObsidianBullet" },
                external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
                reference_text = { hl_group = "ObsidianRefText" },
                highlight_text = { hl_group = "ObsidianHighlightText" },
                tags = { hl_group = "ObsidianTag" },
                hl_groups = {
                    ObsidianTodo = { bold = true, fg = "#f78c6c" },
                    ObsidianDone = { bold = true, fg = "#89ddff" },
                    ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
                    ObsidianTilde = { bold = true, fg = "#ff5370" },
                    ObsidianBullet = { bold = true, fg = "#89ddff" },
                    ObsidianRefText = { underline = true, fg = "#c792ea" },
                    ObsidianExtLinkIcon = { fg = "#c792ea" },
                    ObsidianTag = { italic = true, fg = "#89ddff" },
                    ObsidianHighlightText = { bg = "#75662e" },
                },
            },
            attachments = {
                img_folder = "assets/imgs",
                img_text_func = function(client, path)
                    local link_path
                    local vault_relative_path = client:vault_relative_path(path)
                    if vault_relative_path ~= nil then
                        link_path = vault_relative_path
                    else
                        link_path = tostring(path)
                    end
                    local display_name = vim.fs.basename(link_path)
                    return string.format("![%s](%s)", display_name, link_path)
                end,
            },
        })
    end,
    version = "*",
}
