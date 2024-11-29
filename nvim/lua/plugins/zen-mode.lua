return {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
        require("zen-mode").setup {
            window = {
                width = 90,
                height = 30,
                options = {
                    signcolumn = "no",
                    number = false,
                    relativenumber = false,
                    cursorline = false,
                    cursorcolumn = false,
                    foldcolumn = "0",
                    list = false,
                },
            },
        }
    end,
}
