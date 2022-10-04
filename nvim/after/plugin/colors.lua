vim.g.tokyonight_style = "night"
vim.g.tokyonight_transparent = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

-- Load the colorscheme
-- vim.cmd[[colorscheme tokyonight]]
-- vim.cmd("colorscheme tokyonight")

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

-- require("catppuccin").setup()
require("catppuccin").setup({
	transparent_background = false,
	term_colors = true,
	compile = {
		enabled = true,
		path = vim.fn.stdpath("cache") .. "/catppuccin",
	},
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = { "bold" },
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
  integrations = {
    aerial = false,
    barbar = false,
    beacon = false,
    cmp = true,
    coc_nvim = false,
    dashboard = false,
    fern = false,
    fidget = false,
    gitgutter = false,
    gitsigns = true,
    hop = true,
    leap = false,
    lightspeed = false,
    lsp_saga = false,
    lsp_trouble = true,
    markdown = true,
    mini = false,
    neogit = false,
    notify = true,
    nvimtree = true,
    overseer = false,
    pounce = false,
    symbols_outline = true,
    telekasten = false,
    telescope = true,
    treesitter = true,
    treesitter_context = true,
    ts_rainbow = false,
    vim_sneak = false,
    vimwiki = false,
    which_key = true,

    neotree = {
      enabled = true,
      show_root = true, -- makes the root folder not transparent
      transparent_panel = false, -- make the panel transparent
    },	-- For various plugins integrations see https://github.com/catppuccin/nvim#integrations
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
  },
  color_overrides = {},
  highlight_overrides = {},
})

vim.cmd [[colorscheme catppuccin]]

local hl = function(thing, opts)
    vim.api.nvim_set_hl(0, thing, opts)
end

-- hl("SignColumn", {
--     bg = "none",
-- })
--
-- hl("ColorColumn", {
--     ctermbg = 0,
--     bg = "#555555",
-- })
--
-- hl("CursorLineNR", {
--     bg = "None"
-- })
--
-- hl("Normal", {
--     bg = "none"
-- })
--
-- hl("LineNr", {
--     fg = "#5eacd3"
-- })
--
-- hl("netrwDir", {
--     fg = "#5eacd3"
-- })

