local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require "karulosu.plugins"
require "karulosu.set"


-- Plugin Config
require "karulosu.statusline"
require "karulosu.telescope"
require "karulosu.colors"
require "karulosu.debugger"

-- THEMES
-- *** karulosu.lsp *** 
-- Diagnostics and doc
-- *** karulosu.snipets ***
-- Auto-completation
-- *** Init ***
-- wildmenu
