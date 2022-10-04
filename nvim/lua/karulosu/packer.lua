return require("packer").startup {
    function(use, use_rocks)
        -- THEME
        -- use { "folke/tokyonight.nvim" }
        use { "catppuccin/nvim", as = "catppuccin" }
        -- use("gruvbox-community/gruvbox")
        -- STATUSLINE
        
        use {
            "someone-stole-my-name/yaml-companion.nvim",
            requires = {
                { "neovim/nvim-lspconfig" },
                { "nvim-lua/plenary.nvim" },
                { "nvim-telescope/telescope.nvim" },
            },
            config = function()
                require("telescope").load_extension("yaml_schema")
            end,
        }

        use {
            "nvim-lualine/lualine.nvim",
            requires = { "kyazdani42/nvim-web-devicons", opt = true }
        }

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

        -- TELESCOPE
        use {
            "nvim-telescope/telescope.nvim",
            requires = {"nvim-lua/plenary.nvim"}
        }

        -- TELESCOPE EXTENSIONS
        -- PROJECT
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
        use { "L3MON4D3/LuaSnip" }
        use { "saadparwaiz1/cmp_luasnip" }

        -- Snipets
        use { "rafamadriz/friendly-snippets" }
        -- Surronding
        use { "kylechui/nvim-surround" }

        -- Comments
        use { "numToStr/Comment.nvim" }

        -- Improve ui
        use { "stevearc/dressing.nvim" }
        -- Tree
        use { "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = { 
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons",
            "MunifTanjim/nui.nvim" 
        }}

        -- BETTER START
        -- use { "lewis6991/impatient.nvim" }
        -- use { "dstein64/vim-startuptime" }
        -- REMOVE WAITING TIME
        use { "max397574/better-escape.nvim" }
        -- CONTEXT AND CHARACTERS
        use { "lukas-reineke/indent-blankline.nvim" }
        -- use { "phaazon/hop.nvim" }
        -- LSP SYMBOLS OF THE DOC
        use { "simrat39/symbols-outline.nvim" }
        use { "danymat/neogen" }
        -- use { 'stevearc/aerial.nvim' }
        -- TABS

        -- LANG SPECIFIC

        -- use { "shuntaka9576/preview-swagger.nvim" }
        -- FLUTTER
        use { "akinsho/flutter-tools.nvim" }

        -- KEYMAPS
        use {
            "folke/which-key.nvim",
            config = function()
                require("which-key").setup {
                }
            end
        }
    end,
}
