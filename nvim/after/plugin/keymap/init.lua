local remap = require("karulosu.keymap") 
local nnoremap = remap.nnoremap
local inoremap = remap.inoremap
local vnoremap = remap.vnoremap
local xnoremap = remap.xnoremap
local nmap = remap.nmap

nnoremap("<leader>s", ":NeoTreeFocusToggle<CR>") 
nnoremap("<leader>u", ":UndotreeToggle<CR>") 
nnoremap("<esc>", ":noh<CR>")

nnoremap("<leader>pv", ":Ex<CR>")

vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

nnoremap("Y", "yg$")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("J", "mzJ`z")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- greatest remap ever
xnoremap("<leader>p", "\"_dP")

-- next greatest remap ever : asbjornHaland
nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")
nmap("<leader>Y", "\"+Y")

nnoremap("<leader>d", "\"_d")
vnoremap("<leader>d", "\"_d")

vnoremap("<leader>d", "\"_d")


-- This is going to get me cancelled
inoremap("<C-c>", "<Esc>")

nnoremap("Q", "<nop>")

-- nnoremap("f", ":HopWord<CR>")
nnoremap("<leader>f", function()
    vim.lsp.buf.format()
end)
