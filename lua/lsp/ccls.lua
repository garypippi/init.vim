function setup()
    require('lspconfig').ccls.setup({})
end

return {
    setup = setup
}
