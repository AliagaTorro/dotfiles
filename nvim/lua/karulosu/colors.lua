require("tokyonight").setup({
    style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    transparent = false, -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
    styles = {
        comments = { italic = true },
        keywords = { },
        functions = { bold = true },
        variables = {},
        sidebars = "dark",--"transparent", -- style for sidebars, see below
        floats = "dark",--"transparent", -- style for floating windows
    },
    sidebars = { "qf", "vista_kind", "terminal", "packer" },
    lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
    on_colors = function(colors)
        colors.hint = colors.orange
        colors.error = "#ff0000"
    end,

    -- on_highlights = function(highlights, colors) end,
})

vim.cmd("colorscheme tokyonight")

local hl = function(thing, opts)
    vim.api.nvim_set_hl(0, thing, opts)
end

hl("SignColumn", {
    bg = "none",
})

hl("ColorColumn", {
    ctermbg = 0,
    bg = "#2B79A0",
})

hl("CursorLineNR", {
    bg = "None"
})

hl("Normal", {
    bg = "none"
})

hl("LineNr", {
    fg = "#5eacd3"
})

hl("netrwDir", {
    fg = "#5eacd3"
})

vim.cmd([[
   hi FloatBorder guibg=NONE
   hi DiagnosticVirtualTextError guibg=NONE
   hi DiagnosticVirtualTextWarn guibg=NONE
   hi DiagnosticVirtualTextInfo guibg=NONE
   hi DiagnosticVirtualTextHint guibg=NONE
]])

