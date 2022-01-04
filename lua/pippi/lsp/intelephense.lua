return function(lsp)
    lsp.intelephense.setup({
        on_attach = function (client, bufnr)
            vim.api.nvim_buf_set_option(bufnr, 'autoindent', true)
        end
    })
end
