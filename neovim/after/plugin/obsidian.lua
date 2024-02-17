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
    },
    -- Optional, if you keep notes in a specific subdirectory of your vault.
    notes_subdir = "notes",

    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "~/Sync/obsidian/jesusrag/Daily/",
      -- Optional, if you want to change the date format for the ID of daily notes.
      date_format = "%Y-%m-%d",
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = nil
    },
      mappings = {
        -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
        ["gf"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        -- Toggle check-boxes.
        ["<leader>ch"] = {
          action = function()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },
    },
      -- Optional, for templates (see below).
    templates = {
      subdir = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
    },
})
