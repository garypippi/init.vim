function setup()
    vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics,
        { virtual_text = false, underline = false }
    )
end

return {
    setup = setup,
    jsonls = require('lsp/jsonls'),
    vimls = require('lsp/vimls'),
    tsserver = require('lsp/tsserver'),
    intelephense = require('lsp/intelephense'),
    vuels = require('lsp/vuels'),
    ccls = require('lsp/ccls'),
    rls = require('lsp/rls'),
    gopls = require('lsp/gopls'),
    pylsp = require('lsp/pylsp')
}
