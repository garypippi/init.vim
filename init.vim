call plug#begin('~/.config/nvim/plugged')

" LSP configurations
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

Plug 'onsails/lspkind-nvim'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

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
lua require'pippi.plug.fern':plug()

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
Plug 'EdenEast/nightfox.nvim'

" status line
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
lua require'pippi/lsp'()
lua require'pippi/telescope'()

" treesitter
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

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
let g:test#php#phpunit#executable = './vendor/bin/phpunit'
nnoremap <silent> <leader>tf :TestFile<cr>
nnoremap <silent> <leader>tn :TestNearest<cr>
nnoremap <silent> <leader>tt :TestSuite<cr>
nnoremap <silent> <leader>tl :TestLast<cr>
nnoremap <silent> <leader>tv :TestVisit<cr>

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
let g:vue_pre_processors = ['pug', 'typescript']

lua require'pippi.plug.fern':setup()

" theme
lua require'nightfox'.setup({ options = { transparent = true } })
colorscheme nightfox

let g:vimsyn_embed='lPr'

set hidden
set noea
set noswapfile

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set number

set list
set listchars=tab:>-
