function setup()
    require('lspconfig').gopls.setup({})
end

return {
    setup = setup
}
