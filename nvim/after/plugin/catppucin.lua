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
