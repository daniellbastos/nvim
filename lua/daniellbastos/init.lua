-- Set leader key
vim.api.nvim_set_keymap('n', ',', '', { noremap = true, silent = true })
vim.g.mapleader = ','

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}

require("lazy").setup("daniellbastos.plugins", opts)

require("mason").setup()
require("mason-lspconfig").setup({
   automatic_installation = true
})

-- keymaps
require("daniellbastos.keymaps")

-- options
require("daniellbastos.options")
