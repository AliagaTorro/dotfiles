require("lazy").setup({
	-- THEME
	"ellisonleao/gruvbox.nvim",
	{
		"folke/tokyonight.nvim",
		lazy = false
	},
			{
				"kyazdani42/nvim-web-devicons",
				event = 'BufRead'
			},
			-- STATUSLINE
			{
				"nvim-lualine/lualine.nvim",
				event = "VeryLazy",
				dependencies = { 'kyazdani42/nvim-web-devicons' },
			},
			"ThePrimeagen/harpoon",
			'phaazon/mind.nvim',
			-- DEPENDENCES
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"kevinhwang91/promise-async",

			-- KEEP UNDO HISTORTY 
			"mbbill/undotree",

			-- TREESITTER AND CONTEXT FOLLOW WITH LSP
			{
				"nvim-treesitter/nvim-treesitter", 
				build = ":TSUpdate",
				event = "VeryLazy",
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
			-- {
				--     "iamcco/markdown-preview.nvim",
				--     build = "cd app && npm install",
				--     ft = "markdown",
				--     config = function() vim.g.mkdp_filetypes = { "markdown" } end,
				-- },
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

				"williamboman/mason.nvim",
				"williamboman/mason-lspconfig.nvim",
				{
					"j-hui/fidget.nvim",
					tag = "legacy",
				},

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
				{
					"hrsh7th/nvim-cmp",
					dependencies = {
						"hrsh7th/cmp-buffer",
						"hrsh7th/cmp-nvim-lsp",
						"hrsh7th/cmp-path",
						"hrsh7th/cmp-nvim-lsp-signature-help",
						"saadparwaiz1/cmp_luasnip",
					},
				},
				"L3MON4D3/LuaSnip",

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
					},
				},


{
  "max397574/better-escape.nvim",
  event = "InsertEnter",
  config = function()
    require("better_escape").setup {
      -- Make the chord intentional: must be fairly quick but not twitchy.
      timeout = 180,                 -- or use vim.o.timeoutlen
      default_mappings = false,      -- we’ll define only the safe ones

      mappings = {
        -- Insert / Visual / Select: leave to Normal
        i = {
          f = { d = "<Esc>" },
          [";"] = { [";"] = "<Esc>" },
        },
        v = {
          f = { d = "<Esc>" },
          [";"] = { [";"] = "<Esc>" },
        },
        s = {
          f = { d = "<Esc>" },
          [";"] = { [";"] = "<Esc>" },
        },

        -- Command-line: cancel
        c = {
          f = { d = "<C-c>" },
          [";"] = { [";"] = "<C-c>" },
        },

        -- Terminal: go to Normal
        t = {
          f = { d = "<C-\\><C-n>" },
          [";"] = { [";"] = "<C-\\><C-n>" },
        },
      },
    }
  end,
},


				-- CONTEXT AND CHARACTERS
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {}},
    -- LSP SYMBOLS OF THE DOC
    "simrat39/symbols-outline.nvim",
    "danymat/neogen",

    -- DEBUGGER
    "nvim-neotest/nvim-nio",
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",

    -- LANG SPECIFIC

    -- FLUTTER
    "akinsho/flutter-tools.nvim",
})
