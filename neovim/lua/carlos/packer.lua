-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.3',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  --use ('nvim-treesitter/nvim-treesitter', {run  = ':TSUpdate'})
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
    }
  use ('theprimeagen/harpoon')
  use ('mbbill/undotree')
  use ('tpope/vim-fugitive')
  --git modification
  --use ('airblade/vim-gitgutter')
  use ('lewis6991/gitsigns.nvim')
  use ('kdheepak/lazygit.nvim')
  --indents
  use ('lukas-reineke/indent-blankline.nvim')

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {'williamboman/mason.nvim'},           -- Optional
		  {'williamboman/mason-lspconfig.nvim'}, -- Optional

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},         -- Required
		  {'hrsh7th/cmp-nvim-lsp'},     -- Required
		  {'hrsh7th/cmp-buffer'},       -- Optional
		  {'hrsh7th/cmp-path'},         -- Optional
		  {'saadparwaiz1/cmp_luasnip'}, -- Optional
		  {'hrsh7th/cmp-nvim-lua'},     -- Optional

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},             -- Required
		  {'rafamadriz/friendly-snippets'}, -- Optional
	  }
    }

    --db
    use {
        "tpope/vim-dadbod",
        requires = {
         "kristijanhusak/vim-dadbod-ui",
         "kristijanhusak/vim-dadbod-completion",
         "pbogut/vim-dadbod-ssh"
        },
    }

    --colorschemes
    --use {"yorik1984/newpaper.nvim"}
    -- Install without configuration
    use ({ 'projekt0n/github-nvim-theme' })
    use { 'bluz71/vim-moonfly-colors', as = 'moonfly'}

    --obsidian
    use({
        "epwalsh/obsidian.nvim",
        tag = "*",
        requires = {
          "nvim-lua/plenary.nvim",
        },
        config = function()
        end,
    })
    --markdown-preview
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })


    --ufo folding
    use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

    --kanban
    use 'arakkkkk/kanban.nvim'

    --test
    use({
        'BioWare/obsidian-view',
        requires = {
            'epwalsh/obsidian.nvim',
            'nvim-lua/plenary.nvim',
        },
        config = function()
            require('obsidian-view').setup({
                -- By default it will show all notes
                -- Optional: exclude specific folders
                exclude_folders = {"templates", "Daily"},
                -- Optional: include only specific folders
                include_folders = {},  -- Empty means include all except excluded
                preview_lines = 3,
            })
        end,
    })

    -- Zen Mode
    use {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {
                window = {
                    width = 90,
                    height = 30,
                    options = {
                        signcolumn = "no", -- disable signcolumn
                        number = false, -- disable number column
                        relativenumber = false, -- disable relative numbers
                        cursorline = false, -- disable cursorline
                        cursorcolumn = false, -- disable cursor column
                        foldcolumn = "0", -- disable fold column
                        list = false, -- disable whitespace characters
                    },
                },
            }
        end
    }




end)
