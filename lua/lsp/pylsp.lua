function setup()
    require('lspconfig').pylsp.setup({})
end

return {
    setup = setup
}
