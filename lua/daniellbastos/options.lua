vim.cmd([[colorscheme gruvbox]])
-- vim.cmd 'set background=dark'
-- vim.cmd.colorscheme 'catppuccin'
vim.cmd 'set background=light'
vim.cmd 'syntax enable'
vim.cmd 'set number'
vim.cmd 'set ruler'
vim.cmd 'set autoread'
vim.cmd 'set termguicolors'
vim.cmd 'set colorcolumn=80,110'
vim.cmd 'set t_Co=256'
vim.cmd 'set encoding=utf-8'
vim.cmd 'set showbreak=↪'
vim.cmd 'set cursorline!'
vim.cmd 'set guicursor=i:block'
vim.cmd 'set tags=tags'

-- List chars (whitespace, tab, ...)
vim.opt.listchars = {
    tab = '│ ',      -- |_
    eol = '↲',       -- ⏎
    nbsp = '␣',      -- Space character
    trail = '.',      -- Trailing whitespace
    extends = '⟩',    -- Indentation guides for wrapped lines (you might want to adjust these symbols)
    precedes = '⟨',   -- Indentation guides for wrapped lines (you might want to adjust these symbols)
}
vim.opt.list = true

-- Enable list
vim.cmd 'set clipboard=unnamedplus'
vim.cmd 'set nobackup'
vim.cmd 'set nowritebackup'
vim.cmd 'set noswapfile'
vim.cmd 'set expandtab'
vim.cmd 'set shiftround'
vim.cmd 'set copyindent'
vim.cmd 'set backspace=indent,eol,start'
vim.cmd 'set wildmode=list:longest,list:full'
vim.cmd 'set wildignore+=*.o,*.obj,.git,*.rbc,.pyc,__pycache__,*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite3,*/node_modules/*'

-- Scrolloff
vim.opt.scrolloff = 5

-- CoC selecting the suggestions with Enter
vim.cmd 'inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "<C-g>u<CR>"'

-- Auto strip whitespace
vim.g.strip_whitespace_on_save = 1
vim.g.strip_whitespace_confirm = 0
vim.api.nvim_create_autocmd("FileType", {
	pattern = "html",
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
	end
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.cmd 'set linespace=4'
        vim.cmd 'set tabstop=4'
        vim.cmd 'set softtabstop=4'
        vim.cmd 'set shiftwidth=4'
    end
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "javascript",
    callback = function()
        vim.cmd 'set linespace=2'
        vim.cmd 'set tabstop=2'
        vim.cmd 'set softtabstop=2'
        vim.cmd 'set shiftwidth=2'
    end
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "typescript",
    callback = function()
        vim.cmd 'set linespace=2'
        vim.cmd 'set tabstop=2'
        vim.cmd 'set softtabstop=2'
        vim.cmd 'set shiftwidth=2'
    end
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "typescriptreact",
    callback = function()
        vim.cmd 'set linespace=2'
        vim.cmd 'set tabstop=2'
        vim.cmd 'set softtabstop=2'
        vim.cmd 'set shiftwidth=2'
    end
})
