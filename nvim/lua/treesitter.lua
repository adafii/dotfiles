require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "cpp", "python", "javascript", "lua", "vim", "vimdoc"},

    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn", -- set to `false` to disable one of the mappings
            node_incremental = "gn+",
            node_decremental = "gn-",
            scope_incremental = false,
        },
    },

    require'nvim-treesitter.configs'.setup {
        indent = {
            enable = true
        }
    }
}

