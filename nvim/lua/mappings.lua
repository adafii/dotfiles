vim.g.mapleader = " "

-- Telescope
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fp', builtin.git_files)
vim.keymap.set('n', '<leader>fg', builtin.live_grep)
vim.keymap.set('n', '<leader>b', builtin.buffers)

-- Misc
vim.keymap.set('n', '<esc>', '<esc>:noh<cr>', { silent = true})
vim.keymap.set('n', '<a-o>', 'o<esc>0"_D')
vim.keymap.set('n', '<a-O>', 'O<esc>0"_D')
vim.keymap.set('n', '<a-u>', vim.cmd.UndotreeToggle)
vim.keymap.set('n', '<a-;>', function()
    if vim.api.nvim_get_current_line():sub(-1) ~= ';' then 
        return 'A;<esc>0' 
    end
    return '$x0'
end, { expr = true })

-- NerdTree
vim.keymap.set('n', '<C-e>', '<cmd>NERDTreeToggle<cr>')

-- Git
vim.keymap.set('n', '<leader>gst', '<cmd>Git status -sb<cr>')
vim.keymap.set('n', '<leader>gco', '<cmd>Git checkout')

-- LuaSnip
local ls = require('luasnip')
local opts = { silent = true }
vim.keymap.set({'i', 's'}, '<c-j>', function() ls.jump(1) end, opts)
vim.keymap.set({'i', 's'}, '<c-k>', function() ls.jump(-1) end, opts)

-- LSP
vim.keymap.set('n', '<leader>k', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>h', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>l', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>j', vim.diagnostic.setloclist)

vim.keymap.set('n', '<leader>r', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>i', builtin.lsp_incoming_calls, {})
vim.keymap.set('n', '<leader>s', builtin.lsp_document_symbols, {})


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
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>f', function()
          vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
