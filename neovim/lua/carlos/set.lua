vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

local supports_document_highlight = vim.lsp.buf_request_sync(0, "textDocument/documentHighlight", nil, 1000) ~= nil

if supports_document_highlight then
    -- Регистрируем autocmd для подсветки документа
    vim.api.nvim_exec([[
        autocmd CursorHold * lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved * lua vim.lsp.buf.clear_references()
    ]], false)
end

--obsidian
vim.opt.conceallevel = 2
