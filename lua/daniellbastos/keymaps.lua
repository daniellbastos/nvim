-- Abbreviations
vim.cmd 'cnoreabbrev W! w!'
vim.cmd 'cnoreabbrev Q! q!'
vim.cmd 'cnoreabbrev Wq wq'
vim.cmd 'cnoreabbrev Wa wa'
vim.cmd 'cnoreabbrev wQ wq'
vim.cmd 'cnoreabbrev WQ wq'
vim.cmd 'cnoreabbrev W w'
vim.cmd 'cnoreabbrev Q q'
vim.cmd 'cnoreabbrev E e'

-- Vertical/Horizontal split
vim.api.nvim_set_keymap('n', '<leader>v', ':vsplit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>h', ':split<CR>', { noremap = true, silent = true })

-- Tabs
vim.api.nvim_set_keymap('n', '<Tab>', 'gt', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', 'gT', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-t>', ':tabnew<CR>', { noremap = true, silent = true })

--Enable folding
vim.o.foldenable = true
vim.o.foldmethod = 'indent'
vim.o.foldnestmax = 5
vim.api.nvim_set_keymap('n', '<Space>', 'za', { noremap = true, silent = true })  -- Toggle fold
vim.api.nvim_set_keymap('n', 'zc', 'zM', { noremap = true, silent = true })      -- Close all folds
vim.api.nvim_set_keymap('n', 'zo', 'zR', { noremap = true, silent = true })      -- Open all folds

-- Vmap for maintaining Visual Mode after shifting > and <
vim.api.nvim_set_keymap('x', '<', '<gv', { noremap = true })
vim.api.nvim_set_keymap('x', '>', '>gv', { noremap = true })

-- Clean search (highlight)
vim.api.nvim_set_keymap('n', '<leader><space>', ':noh<CR>', { noremap = true, silent = true })
