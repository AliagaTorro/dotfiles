require("lazy").setup({
    "wbthomason/packer.nvim",
    -- THEME
    "ellisonleao/gruvbox.nvim",
    "folke/tokyonight.nvim",
    -- STATUSLINE
    "nvim-lualine/lualine.nvim",
    "ThePrimeagen/harpoon",
    'phaazon/mind.nvim',
        -- DEPENDENCES
    "kyazdani42/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "kevinhwang91/promise-async",

        -- KEEP UNDO HISTORTY 
        "mbbill/undotree",

-- TREESITTER AND CONTEXT FOLLOW WITH LSP
{
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
},
"nvim-treesitter/nvim-treesitter-context",
-- Additional text objects via treesitter
{
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = 'nvim-treesitter',
    -- "nvim-treesitter/playground",
},
        -- LOAD CONFIG FILE
        "gpanders/editorconfig.nvim",

        -- TELESCOPE
{
            "nvim-telescope/telescope.nvim",
            dependencies = {"nvim-lua/plenary.nvim"}
},

        -- TELESCOPE EXTENSIONS
        "nvim-telescope/telescope-project.nvim",
        {
            "folke/trouble.nvim",
    },
{
        "nvim-telescope/telescope-fzf-native.nvim", 
        build = "make",
    },

        -- LSP
        "neovim/nvim-lspconfig",
        "onsails/lspkind-nvim",
        "jose-elias-alvarez/null-ls.nvim",

        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "j-hui/fidget.nvim",

        -- GIT
        "lewis6991/gitsigns.nvim",
        "sindrets/diffview.nvim",

        -- COLORS
        'NvChad/nvim-colorizer.lua',
        -- TODO COMMENTS
{
            "folke/todo-comments.nvim", 
            dependencies = "nvim-lua/plenary.nvim",
    },

        -- AUTOCOMPLETION
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
{
        "hrsh7th/cmp-buffer", dependencies="nvim-cmp",
    },
{
        "hrsh7th/cmp-path", dependencies="nvim-cmp",
    },
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",

        -- Snipets
        "rafamadriz/friendly-snippets",
        -- Surronding
        "kylechui/nvim-surround",

        -- Comments
        "numToStr/Comment.nvim",
        'JoosepAlviste/nvim-ts-context-commentstring',
        -- Improve ui
        "stevearc/dressing.nvim",
        -- Tree
        {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v2.x",
            dependencies = { 
                "nvim-lua/plenary.nvim",
                "MunifTanjim/nui.nvim",
        }
    },

        -- REMOVE WAITING TIME
        "max397574/better-escape.nvim",
        -- CONTEXT AND CHARACTERS
        "lukas-reineke/indent-blankline.nvim",
        -- LSP SYMBOLS OF THE DOC
        "simrat39/symbols-outline.nvim",
        "danymat/neogen",

        -- DEBUGGER
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",

        -- LANG SPECIFIC

        -- FLUTTER
        "akinsho/flutter-tools.nvim",
})
