require('neogen').setup ({ snippet_engine = "luasnip" })
require('better_escape').setup()
require('Comment').setup({
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
    ---Function to call after (un)comment
})
require('nvim-web-devicons').setup()
require('gitsigns').setup()
require("fidget").setup({
    window = {
        relative = "win",         -- where to anchor, either "win" or "editor"
        blend = 0,              -- &winblend for the window
        zindex = nil,             -- the zindex value for the window
        border = "none",          -- style of border for the fidget window
    },
})
require("harpoon").setup()

require("colorizer").setup {
    filetypes = { "*" },
    user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = false, -- "Name" codes like Blue or blue
        RRGGBBAA = false, -- #RRGGBBAA hex codes
        AARRGGBB = false, -- 0xAARRGGBB hex codes
        rgb_fn = false, -- CSS rgb() and rgba() functions
        hsl_fn = false, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes for `mode`: foreground, background,  virtualtext
        mode = "background", -- Set the display mode.
        -- Available methods are false / true / "normal" / "lsp" / "both"
        -- True is same as normal
        tailwind = false, -- Enable tailwind colors
        -- parsers can contain values used in |user_default_options|
        sass = { enable = false, parsers = { css }, }, -- Enable sass colors
        virtualtext = "■",
    },
    -- all the sub-options of filetypes apply to buftypes
    buftypes = {},
}

require("nvim-surround").setup()

