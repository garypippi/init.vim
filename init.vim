call plug#begin('~/.config/nvim/plugged')

" coc.vim
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

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

""" coc.vim

" Format
vmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" Go-To
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" show documentation
nnoremap <silent> K :call <sid>show_documentation()<cr>
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

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

set list
set listchars=tab:>-
