call plug#begin('~/.config/nvim/plugged')

" LSP configurations
Plug 'neovim/nvim-lspconfig'
Plug 'garypippi/completion-nvim'

" snippets
Plug 'norcalli/snippets.nvim'
Plug 'garypippi/sniphpets.nvim'

" ale
Plug 'w0rp/ale'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'APZelos/blamer.nvim'

" db
Plug 'tpope/vim-dadbod'

" indentlines
Plug 'Yggdroot/indentLine'

" trailing whitespace
Plug 'bronson/vim-trailing-whitespace'

" Filer
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern-git-status.vim'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" php
Plug 'stephpy/vim-php-cs-fixer'

" markdown
Plug 'plasticboy/vim-markdown'

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
Plug 'itchyny/lightline.vim'

" jsx
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" arduino
Plug 'sudar/vim-arduino-syntax'

" qml
Plug 'peterhoeg/vim-qml'

call plug#end()

" LSP
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<cr>
nnoremap <silent> <leader>u <cmd>lua vim.lsp.buf.rename()<cr>
nnoremap <silent> <leader>e <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>
nnoremap <silent> [e <cmd>lua vim.lsp.diagnostic.goto_prev()<cr>
nnoremap <silent> ]e <cmd>lua vim.lsp.diagnostic.goto_next()<cr>

lua << EOF

local opts = { noremap = true, silent = true }
local buf_set_keymap = function (...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local on_attach = function (client, bufnr)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    buf_set_keymap('n', '<leader>u', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>', opts)
    buf_set_keymap('n', '[e', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', opts)
    buf_set_keymap('n', ']e', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', opts)
    require'completion'.on_attach(client)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false, underline = false })

local json = {
    schemas = {
        { fileMatch = {'tsconfig.json'}, url = 'http://json.schemastore.org/tsconfig' },
        { fileMatch = {'.eslintrc.json'}, url = 'http://json.schemastore.org/eslintrc' }
    }
}

require'lspconfig'.vimls.setup { on_attach = on_attach }
require'lspconfig'.jsonls.setup { settings = { json = json }, on_attach = on_attach }
require'lspconfig'.tsserver.setup{ on_attach = on_attach }
require'lspconfig'.intelephense.setup{ on_attach = on_attach }
require'lspconfig'.vuels.setup{ on_attach = on_attach }
require'lspconfig'.ccls.setup{ on_attach = on_attach }
require'lspconfig'.rls.setup{ on_attach = on_attach }
require'lspconfig'.gopls.setup{ on_attach = on_attach }

EOF

set completeopt=menu,menuone,noinsert,noselect
set shortmess+=c

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

" git
set updatetime=400
let g:gitgutter_map_keys = 0
let g:gitgutter_signs = 0
let g:blamer_delay = 400
nnoremap <silent> <leader>hh :GitGutterLineHighlightsToggle<cr>
nnoremap <silent> <leader>hh :GitGutterLineHighlightsToggle<cr>
nnoremap <silent> <leader>hp :GitGutterPreviewHunk<cr>
nnoremap <silent> <leader>hs :GitGutterStageHunk<cr>
nnoremap <silent> <leader>hu :GitGutterUndoHunk<cr>
nnoremap <silent> [h :GitGutterPrevHunk<cr>
nnoremap <silent> ]h :GitGutterNextHunk<cr>
nnoremap <silent> <leader>b :BlamerToggle<cr>

" test
nnoremap <silent> <leader>tf :TestFile<cr>
nnoremap <silent> <leader>tn :TestNearest<cr>
nnoremap <silent> <leader>tt :TestSuite<cr>
nnoremap <silent> <leader>tl :TestLast<cr>
nnoremap <silent> <leader>tv :TestVisit<cr>

" telescope
nnoremap <silent> <leader>ff <cmd>Telescope find_files<cr>
nnoremap <silent> <leader>fb <cmd>Telescope buffers<cr>
nnoremap <silent> <leader>kc <cmd>Telescope git_commits<cr>
nnoremap <silent> <leader>kv <cmd>Telescope git_bcommits<cr>
nnoremap <silent> <leader>kb <cmd>Telescope git_branches<cr>
nnoremap <silent> <leader>ks <cmd>Telescope git_status<cr>

lua << EOF
    local actions = require('telescope.actions')
    require('telescope').setup({
        defaults = {
            mappings = {
                i = {
                    ["<c-j>"] = actions.move_selection_next,
                    ["<c-k>"] = actions.move_selection_previous
                }
            }
        }
    })
EOF

" snippets
lua << EOF
    local indent = require('snippets.utils').match_indentation
    local sniphpets = require('sniphpets')
    require('snippets').snippets = {
        php = {
            ['public property'] = indent(sniphpets.get_property('public')),
            ['private property'] = indent(sniphpets.get_property('private')),
            ['protected property'] = indent(sniphpets.get_property('protected')),
            ['public function'] = indent(sniphpets.get_function('public')),
            ['public static function'] = indent(sniphpets.get_function('public static')),
            ['private function'] = indent(sniphpets.get_function('private')),
            ['private static function'] = indent(sniphpets.get_function('private static')),
            ['protected function'] = indent(sniphpets.get_function('protected')),
            ['protected static function'] = indent(sniphpets.get_function('protected static'))
        }
    }
EOF

let g:completion_confirm_key = ""
imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"

" php
nnoremap <silent> <leader>pcd :call PhpCsFixerFixDirectory()<cr>
nnoremap <silent> <leader>pcf :call PhpCsFixerFixFile()<cr>

" indentlines
let g:indentLine_enabled = 0

" markdown
let g:vim_markdown_folding_disabled = 1

" lightline
function! BlamerEnabled()
    return g:blamer_enabled ? 'Blame!' : ''
endfunction

function! GitgutterEnabled()
    return g:gitgutter_highlight_lines ? 'Gitgutter' : ''
endfunction

let g:lightline = {
\   'active': {'left': [['mode', 'paste'],['gitbranch','readonly','filename','modified','blamer','gitgutter']]},
\   'component_function': {
\       'gitbranch': 'FugitiveHead',
\       'blamer': 'BlamerEnabled',
\       'gitgutter': 'GitgutterEnabled'
\   }
\}

" vue
au FileType vue syntax sync fromstart
let g:vue_pre_processors = ['typescript']

" filer
nnoremap <silent> <leader>r :Fern .<cr>
nnoremap <silent> - :Fern . -reveal=%:p<cr>
let g:fern#renderer = 'nerdfont'


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
