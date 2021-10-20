function set_handler(s, v)
    vim.lsp.handlers[s] = v
end

function set_diagnostics(lsp)
    set_handler('textDocument/publishDiagnostics', lsp.with(lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        underline = false
    }))
end

function set_mappings(set_keymap)
    set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', {})
    set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', {})
    set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', {})
    set_keymap('n', '<leader>u', '<cmd>lua vim.lsp.buf.rename()<cr>', {})
    set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>', {})
    set_keymap('n', '[e', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', {})
    set_keymap('n', ']e', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', {})
end

function set_completion(cmp)
    cmp.setup({
        mapping = {
            ['<c-k>'] = cmp.mapping.confirm({ select = true })
        },
        sources = {
            { name = 'nvim_lsp' },
            { name = 'buffer' }
        },
        formatting = {
            format = require('lspkind').cmp_format({
                with_text = true,
                maxwidth = 50
            })
        }
    })
end

function configure(lsp, servers)
    set_diagnostics(vim.lsp)
    set_mappings(vim.api.nvim_set_keymap)
    set_completion(require('cmp'))
    for _, server in ipairs(servers) do
        require('pippi/lsp/' .. server)(lsp)
    end
end

return function()
    configure(require('lspconfig'), {
        'ccls',
        'eslint',
        'gopls',
        'intelephense',
        'jsonls',
        'pylsp',
        'rls',
        'tsserver',
        'vimls',
        'vuels'
    })
end
