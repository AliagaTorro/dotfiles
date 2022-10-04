local remap = require("karulosu.keymap")
local nnoremap = remap.nnoremap

nnoremap("<leader>ps", ":lua require('telescope.builtin').grep_string({ search = vim.fn.input(\"Grep For > \")})<CR>")
nnoremap("<leader><leader>", ":lua require('telescope.builtin').find_files()<CR>")
nnoremap("<leader>pw", ":lua require('telescope.builtin').grep_string { search = vim.fn.expand(\"<cword>\") }<CR>")
nnoremap("<leader>pb", ":lua require('telescope.builtin').buffers()<CR>")
nnoremap("<leader>vh", ":lua require('telescope.builtin').help_tags()<CR>")
nnoremap("<leader>vrc", ":lua require('karulosu.telescope').search_dotfiles({ hidden = true })<CR>")
nnoremap("<leader>va", ":lua require('karulosu.telescope').anime_selector()<CR>")
nnoremap("<leader>vc", ":lua require('karulosu.telescope').chat_selector()<CR>")
nnoremap("<leader>td", ":lua require('karulosu.telescope').dev()<CR>")
nnoremap("<leader>pp", ":lua require'telescope'.extensions.project.project{ display_type = 'minimal'}<CR>")