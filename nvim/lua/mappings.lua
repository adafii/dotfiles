vim.g.mapleader = " "

-- Misc
vim.keymap.set('n', '<esc>', '<esc>:noh<cr>', { silent = true})
vim.keymap.set('n', '<a-o>', 'o<esc>0"_D')
vim.keymap.set('n', '<a-O>', 'O<esc>0"_D')

-- LSP
vim.keymap.set('n', '<leader>k', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>h', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>l', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>j', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>d', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
