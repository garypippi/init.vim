call plug#begin('~/.config/nvim/plugged')

" LSP configurations
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

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

lua vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false, underline = false })
lua require'lspconfig'.vimls.setup{}
lua require'lspconfig'.jsonls.setup{ settings = { json = { schemas = { { fileMatch = {'tsconfig.json'}, url = 'http://json.schemastore.org/tsconfig' } } } } }
lua require'lspconfig'.tsserver.setup{}
lua require'lspconfig'.intelephense.setup{}
lua require'lspconfig'.vuels.setup{}
lua require'lspconfig'.ccls.setup{}
lua require'lspconfig'.rls.setup{}

" auto complete

inoremap <silent><expr> <c-space> compe#complete()
inoremap <silent><expr> <c-k> compe#confirm('<cr>')
inoremap <silent><expr> <c-e> compe#close('<c-e>')

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.allow_prefix_unmatch = v:false
let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.spell = v:true
let g:compe.source.tags = v:true
let g:compe.source.snippets_nvim = v:true

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
let g:vue_disable_pre_processors = 1

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
