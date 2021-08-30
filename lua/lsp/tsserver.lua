function setup()
    require('lspconfig').tsserver.setup({})
end

return {
    setup = setup
}
