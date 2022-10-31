local dap = require("dap")
local dapui = require("dapui")
local daptext = require("nvim-dap-virtual-text")

local remap = require("karulosu.keymap")
local nnoremap = remap.nnoremap

daptext.setup()
dapui.setup({
    layouts = {
        {
            elements = {
                "console",
            },
            size = 7,
            position = "bottom",
        },
        {
            elements = {
                -- Elements can be strings or table with id and size keys.
                { id = "scopes", size = 0.25 },
                "watches",
            },
            size = 40,
            position = "left",
        }
    },
})

-- require("karulosu.debugger.node");
require("karulosu.debugger.cpp");

nnoremap("<F1>", function()
    dapui.toggle()
end)

nnoremap("<leader><leader>", function()
    dap.close()
end)

nnoremap("<F5>", function()
    dap.continue()
end)
nnoremap("<F3>", function()
    dap.step_over()
end)
nnoremap("<F2>", function()
    dap.step_into()
end)
nnoremap("<F12>", function()
    dap.step_out()
end)
nnoremap("<Leader>b", function()
    dap.toggle_breakpoint()
end)
nnoremap("<Leader>B", function()
    dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end)
nnoremap("<leader>rc", function()
    dap.run_to_cursor()
end)
