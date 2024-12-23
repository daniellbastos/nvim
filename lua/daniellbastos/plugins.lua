return {
    {
        "nvim-telescope/telescope.nvim",
        version="0.1.5",
		dependencies={"nvim-lua/plenary.nvim"}
	},
	-- themes
    {
        "ellisonleao/gruvbox.nvim"
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
        "nvim-treesitter/nvim-treesitter",
        build=":TSUpdate"
    },
    {"mbbill/undotree"},

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",

            { "j-hui/fidget.nvim", opts = {} },
        },
        config = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
                callback = function(event)
                local map = function(keys, func, desc)
                    vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end

                --  To jump back, press <C-t>.
                map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
                -- Find references for the word under your cursor.
                map("rf", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
                -- Jump to the implementation of the word under your cursor.
                --  Useful when your language has ways of declaring types without an actual implementation.
                map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
                -- Jump to the type of the word under your cursor.
                --  Useful when you"re not sure what type a variable is and you want to see
                --  the definition of its *type*, not where it was *defined*.
                map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
                -- Fuzzy find all the symbols in your current document.
                --  Symbols are things like variables, functions, types, etc.
                map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
                -- Fuzzy find all the symbols in your current workspace
                --  Similar to document symbols, except searches over your whole project.
                map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
                -- Rename the variable under your cursor
                --  Most Language Servers support renaming across files, etc.
                map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
                -- Execute a code action, usually your cursor needs to be on top of an error
                -- or a suggestion from your LSP for this to activate.
                map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
                -- Opens a popup that displays documentation about the word under your cursor
                --  See `:help K` for why this keymap
                map("K", vim.lsp.buf.hover, "Hover Documentation")
                -- WARN: This is not Goto Definition, this is Goto Declaration.
                --  For example, in C this would take you to the header
                map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
                end,
            })

            local servers = {
              tsserver = {},
              jedi_language_server = {},
              lua_ls = {
                    settings = {
                        Lua = {
                            runtime = { version = "LuaJIT" },
                            workspace = {
                                checkThirdParty = false,
                                library = {
                                    "${3rd}/luv/library",
                                    unpack(vim.api.nvim_get_runtime_file("", true)),
                                },
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                },
            }
            require("mason").setup()

            local ensure_installed = vim.tbl_keys(servers or {})
            vim.list_extend(ensure_installed, {
                "stylua",
            })
            require("mason-tool-installer").setup { ensure_installed = ensure_installed }

            require("mason-lspconfig").setup {
                handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    -- This handles overriding only values explicitly passed
                    -- by the server configuration above. Useful when disabling
                    -- certain features of an LSP (for example, turning off formatting for tsserver)
                    require("lspconfig")[server_name].setup(server)
                end,
                },
            }
            end,
    },

    {"neoclide/coc.nvim", branch="release"},
    {"ntpeters/vim-better-whitespace"},

    {"cappyzawa/trim.nvim"},
    {"mileszs/ack.vim"},

    -- javascript
    {"jelera/vim-javascript-syntax"},
    {"leafgarland/typescript-vim"},
    {"HerringtonDarkholme/yats.vim"},
    {"mxw/vim-jsx"},
}
