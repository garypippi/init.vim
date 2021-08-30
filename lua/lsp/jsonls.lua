function setup()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    require('lspconfig').jsonls.setup({
        capabilities = capabilities,
        settings = {
            json = {
                schemas = {
                    { fileMatch = {'tsconfig.json'}, url = 'http://json.schemastore.org/tsconfig' },
                    { fileMatch = {'.eslintrc.json'}, url = 'http://json.schemastore.org/eslintrc' }
                }
            }
        }
    })
end

return {
    setup = setup
}
