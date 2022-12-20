return require("packer").startup {
    function(use, use_rocks)
        -- THEME
        use { "folke/tokyonight.nvim" }
        use { "catppuccin/nvim", as = "catppuccin" }
        -- STATUSLINE
        
        use {
            "nvim-lualine/lualine.nvim",
            requires = { "kyazdani42/nvim-web-devicons", opt = true } 
        }

        -- use({
        --     "glepnir/lspsaga.nvim",
        --     branch = "main",
        --     config = function()
        --         local saga = require("lspsaga")
        --
        --         saga.init_lsp_saga({
        --             -- your configuration
        --         })
        --     end,
        -- })

        use { "j-hui/fidget.nvim" }
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
        use { "williamboman/mason.nvim" }
        use { "williamboman/mason-lspconfig.nvim" }
        use { "onsails/lspkind-nvim" }
        use { "jose-elias-alvarez/null-ls.nvim" }

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
        -- use {
        --     'nvim-tree/nvim-tree.lua',
        --     requires = {
        --         'nvim-tree/nvim-web-devicons', -- optional, for file icons
        --     },
        -- }

        -- Unless you are still migrating, remove the deprecated commands from v1.x
        vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

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

        -- use {
        --     "someone-stole-my-name/yaml-companion.nvim",
        --     requires = {
        --         { "neovim/nvim-lspconfig" },
        --         { "nvim-lua/plenary.nvim" },
        --         { "nvim-telescope/telescope.nvim" },
        --     },
        --     config = function()
        --         require("telescope").load_extension("yaml_schema")
        --     end,
        -- }

       -- KEYMAPS
        -- use {
        --     "folke/which-key.nvim",
        --     config = function()
        --         require("which-key").setup {
        --         }
        --     end
        -- }
    end,
}
