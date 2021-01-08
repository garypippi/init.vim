call plug#begin('~/.config/nvim/plugged')

" LSP configurations
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

" ale
Plug 'w0rp/ale'

" indentlines
Plug 'Yggdroot/indentLine'

" trailing whitespace
Plug 'bronson/vim-trailing-whitespace'

" ranger
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

" markdown
Plug 'plasticboy/vim-markdown'

" php
Plug 'stephpy/vim-php-cs-fixer'

" javascript
Plug 'pangloss/vim-javascript'

" typescript
Plug 'leafgarland/typescript-vim'

" vue
Plug 'posva/vim-vue'
Plug 'Shougo/context_filetype.vim'

" styled components
Plug 'styled-components/vim-styled-components'

" sass
Plug 'cakebaker/scss-syntax.vim'

" twig
Plug 'nelsyeung/twig.vim'

" blade
Plug 'jwalton512/vim-blade'

" pug
Plug 'digitaltoad/vim-pug'

" comment out
Plug 'tyru/caw.vim'

" auto pair
Plug 'jiangmiao/auto-pairs'

" emmet
Plug 'mattn/emmet-vim'

" istanbul
Plug 'retorillo/istanbul.vim'

" testing speed of thought
Plug 'janko/vim-test'

" theme
Plug 'NLKNguyen/papercolor-theme'

" jsx
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" arduino
Plug 'sudar/vim-arduino-syntax'

" qml
Plug 'peterhoeg/vim-qml'

call plug#end()


" LSP
lua << EOF
    local on_attach = function (client, bufnr)
        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
        )
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>u', '<cmd>lua vim.lsp.buf.rename()<CR>', {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '[e', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', ']e', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', {noremap = true, silent = true})
        require('completion').on_attach(client)
    end
    require('lspconfig').vimls.setup({on_attach = on_attach})
    require('lspconfig').tsserver.setup({on_attach = on_attach})
    require('lspconfig').intelephense.setup({on_attach = on_attach})
    require('lspconfig').vuels.setup({on_attach = on_attach})
    require('lspconfig').ccls.setup({on_attach = on_attach})
EOF

" Auto complete
set completeopt=menuone,noinsert,noselect
set shortmess+=c

" Avoid conflict between auto pairs
let g:completion_confirm_key = ""
imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"

" ale
let g:ale_disable_lsp = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
    \'html': [],
    \'json': ['prettier'],
    \'javascript': ['eslint'],
    \'typescript': ['eslint'],
    \'vue': ['eslint']
\}

" indentlines
let g:indentLine_enabled = 0

" php
let g:php_cs_fixer_config_file = expand('<sfile>:p:h') . '/php-cs.php'
let g:php_cs_fixer_path = expand('<sfile>:p:h') . '/vendor/bin/php-cs-fixer'

"markdown
let g:vim_markdown_folding_disabled = 1


" vue
au FileType vue syntax sync fromstart

" ranger
let g:ranger_map_keys = 0
nnoremap <silent> <leader>r :RangerWorkingDirectory<cr>
nnoremap <silent> - :RangerCurrentDirectory<cr>

" theme
let g:PaperColor_Theme_Options = { 'theme': { 'default': { 'transparent_background': 1 } } }
set background=dark
colorscheme PaperColor

let g:vimsyn_embed='lPr'

set hidden
set noea
set noswapfile

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set number
highlight LineNr ctermfg=246
highlight NonText ctermfg=68
highlight LspDiagnosticsSignError ctermbg=9 ctermfg=15
highlight LspDiagnosticsSignHint ctermbg=142 ctermfg=15


set list
set listchars=tab:>-
