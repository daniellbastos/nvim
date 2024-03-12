return {
    {
        "nvim-telescope/telescope.nvim",
        version='0.1.5',
		dependencies={"nvim-lua/plenary.nvim"}
	},
	-- themes
    {
        'ellisonleao/gruvbox.nvim'
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build=':TSUpdate'
    },
    {'mbbill/undotree'},

    {"williamboman/mason.nvim"},
    {"williamboman/mason-lspconfig.nvim"},
    {"neovim/nvim-lspconfig"},

    {"neoclide/coc.nvim", branch="release"},
    {"ntpeters/vim-better-whitespace"},

    {"cappyzawa/trim.nvim"},
    {"mileszs/ack.vim"},
    {"leafgarland/typescript-vim"}
}
