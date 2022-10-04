local luasnip = require("luasnip")

local ls = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/karulosu/snips" })
require("luasnip").config.setup({ store_selection_keys = "<A-p>" })

-- Set Config

local types = require("luasnip.util.types")
ls.config.set_config({
    history = true, --keep around last snippet local to jump back
    enable_autosnippets = true,
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "●", "GruvboxOrange" } },
            },
        },
    },
})

-- Key Mapping --

vim.keymap.set({ "i", "s" }, "<c-u>", '<cmd>lua require("luasnip.extras.select_choice")()<cr><C-c><C-c>')

vim.keymap.set({ "i", "s" }, "<a-p>", function()
	if ls.expand_or_jumpable() then
		ls.expand()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
	if ls.jumpable(1) then
		ls.jump(1)
	end
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<c-k>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)
vim.keymap.set({ "i", "s" }, "<c-h>", function()
	if ls.choice_active() then
		ls.change_choice(-1)
	end
end)


