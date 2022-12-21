local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require("packer").startup {
    function(use, use_rocks)

        use 'wbthomason/packer.nvim'
        -- THEME
        use { "ellisonleao/gruvbox.nvim" }
        use { "folke/tokyonight.nvim" }
        -- STATUSLINE
        
        use {
            "nvim-lualine/lualine.nvim",
            requires = { "kyazdani42/nvim-web-devicons", opt = true } 
        }

        use { "ThePrimeagen/harpoon" }

        -- DEPENDENCES
        use { "kyazdani42/nvim-web-devicons" }
        use { "nvim-lua/plenary.nvim" }
        use { "MunifTanjim/nui.nvim" }
        use { "kevinhwang91/promise-async" }

        -- KEEP UNDO HISTORTY 
        use { "mbbill/undotree" }

        -- TREESITTER AND CONTEXT FOLLOW WITH LSP
        use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
        use { "nvim-treesitter/nvim-treesitter-context" }
        use { -- Additional text objects via treesitter
            'nvim-treesitter/nvim-treesitter-textobjects',
            after = 'nvim-treesitter',
        }
        -- use { "nvim-treesitter/playground" }

        -- LOAD CONFIG FILE
        use { "gpanders/editorconfig.nvim" }

        -- TELESCOPE
        use {
            "nvim-telescope/telescope.nvim",
            requires = {"nvim-lua/plenary.nvim"}
        }

        -- TELESCOPE EXTENSIONS
        use { "nvim-telescope/telescope-project.nvim" }
        use {
            "folke/trouble.nvim",
            requires = "kyazdani42/nvim-web-devicons",
        }
        use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

        -- LSP
        use { "neovim/nvim-lspconfig" }
        use { "onsails/lspkind-nvim" }
        use { "jose-elias-alvarez/null-ls.nvim" }

        use { "williamboman/mason.nvim" }
        use { "williamboman/mason-lspconfig.nvim" }
        use { "j-hui/fidget.nvim" }

        -- GIT
        use { "lewis6991/gitsigns.nvim" }
        use { "sindrets/diffview.nvim" }

        -- COLORS
        use { 'NvChad/nvim-colorizer.lua' }
        -- TODO COMMENTS
        use {
            "folke/todo-comments.nvim", 
            requires = "nvim-lua/plenary.nvim"
        }

        -- AUTOCOMPLETION
        use { "hrsh7th/nvim-cmp" }
        use { "hrsh7th/cmp-nvim-lsp" }
        use { "hrsh7th/cmp-buffer", after="nvim-cmp" }
        use { "hrsh7th/cmp-path", after="nvim-cmp" }
        use { "hrsh7th/cmp-nvim-lsp-signature-help" }
        use { "L3MON4D3/LuaSnip" }
        use { "saadparwaiz1/cmp_luasnip" }

        -- Snipets
        use { "rafamadriz/friendly-snippets" }
        -- Surronding
        use { "kylechui/nvim-surround" }

        -- Comments
        use { "numToStr/Comment.nvim" }
        use 'JoosepAlviste/nvim-ts-context-commentstring'
        -- Improve ui
        use { "stevearc/dressing.nvim" }
        -- Tree
        use {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v2.x",
            requires = { 
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
                "MunifTanjim/nui.nvim",
            }
        }

        -- REMOVE WAITING TIME
        use { "max397574/better-escape.nvim" }
        -- CONTEXT AND CHARACTERS
        use { "lukas-reineke/indent-blankline.nvim" }
        -- LSP SYMBOLS OF THE DOC
        use { "simrat39/symbols-outline.nvim" }
        use { "danymat/neogen" }

        -- DEBUGGER
        use("mfussenegger/nvim-dap")
        use("rcarriga/nvim-dap-ui")
        use("theHamsta/nvim-dap-virtual-text")

        -- LANG SPECIFIC

        -- FLUTTER
        use { "akinsho/flutter-tools.nvim" }

        if is_bootstrap then
            require('packer').sync()
        end
    end,
}
