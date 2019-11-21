let mapleader =","
set nocompatible

call plug#begin('~/.config/nvim/plugged')

" Basics
Plug 'junegunn/goyo.vim'

" Completion
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" tpope's essentials
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'

Plug 'Shougo/unite.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}
Plug 'PotatoesMaster/i3-vim-syntax'

" Colorscheme
Plug 'arcticicestudio/nord-vim'

" Colorize colors in buffer
Plug 'chrisbra/Colorizer'

" Snippets
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

" HTML
Plug 'mattn/emmet-vim' ", {'for': 'html', 'css', 'xhtml'}
Plug 'turbio/bracey.vim' ", {'for': 'html'}

" Sass
Plug 'AtsushiM/search-parent.vim'
Plug 'AtsushiM/sass-compile.vim'

" XML
Plug 'othree/xml.vim', {'for': 'xml'}
Plug 'jhradilek/vim-snippets', { 'as': 'DocbookSnippets', 'for': 'xml'}

" JSON
Plug 'elzr/vim-json', {'for' : 'json'}
Plug 'Quramy/vison', {'for' : 'json'}

" RMD (pandoc)
Plug 'vim-pandoc/vim-pandoc', {'for': 'Rmd,markdown,md'}
Plug 'vim-pandoc/vim-pandoc-syntax', {'for': 'Rmd,markdown,md'}

" R
Plug 'jalvesaq/Nvim-R', {'for': 'R'}
Plug 'gaalcaras/ncm-R', {'for': 'R'}

" Racket
Plug 'wlangstroth/vim-racket', {'for': 'racket'}

" *TeX
Plug 'lervag/vimtex', {'for': 'tex'}

call plug#end()

" Add current course to runtimepath
set rtp+=~/current_course

" Auto cd to $PWD
autocmd BufEnter * silent! lcd %:p:h

"colo pablo
colo nord

" Deoplete
let g:deoplete#enable_at_startup = 1

" Ultisnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnippetDirectories = ["UltiSnips"]

" Colorizer filetypes
let g:colorizer_auto_filetype='scss,css,html,xdefaults'

" Pandoc-vim settings
let g:pandoc#spell#enabled = 0
let g:pandoc#modules#disabled = ["folding"]

" Basics
set mouse=a go=a
set clipboard=unnamedplus
set termguicolors noshowmode nohls incsearch smartcase
set tags=./tags
set ttyfast lazyredraw
set cmdheight=2

syntax on
set encoding=utf-8
set number relativenumber

" Spacing and line breaks
set sw=4 ts=4 cc=80 tw=80 et

nnoremap <Space> @q
nnoremap c "_c
filetype plugin on
filetype plugin indent on

" Extra settings
" Enable autocompletion:
set wildmode=list:longest,full

" Goyo plugin makes text more readable when writing prose:
map <leader>f :Goyo \| set linebreak<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>o :setlocal spell! spelllang=en_us<CR>

" Nerd tree
map <C-n> :NERDTreeToggle <CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Check file in shellcheck:
map <leader>s :!clear && shellcheck %<CR>

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" Compile document
map <leader>c :w! \| Dispatch! compiler <c-r>%<CR>
map <leader>v :call CToggle()<cr><cr>

let g:quickfix_is_open = 0
function CToggle()
  if g:quickfix_is_open
    ccl
    let g:quickfix_is_open = 0
  else
    Copen
    let g:quickfix_is_open = 1
  endif
endfunction

" Open corresponding .pdf/.html or preview
map <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex,*.rmd !texclear %

" Ensure files are read as what I want:
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
vnoremap <C-c> "+y
map <C-p> "+P

" Automatically deletes all trailing whitespace on save.
fun! StripTrailingWhitespace()
  " Don't strip on these filetypes
  if &ft =~ 'md\|rmd\|vimwiki\|markdown\|rmarkdown'
    return
  endif
  %s/\s\+$//e
endfun
autocmd BufWritePre * call StripTrailingWhitespace()

" When shortcut files are updated, renew bash and ranger configs with new material:
autocmd BufWritePost ~/.config/bmdirs,~/.config/bmfiles !shortcuts

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost ~/.config/Xresources,~/.config/Xdefaults,~/.Xresources,~/.Xdefaults !xrdb %

" Recompile suckless tools
autocmd BufWritePost config.h,config.mk !sudo make install

" Section: Navigating with guides
inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l

" Sass
let g:sass_compile_auto = 1
let g:sass_compile_cdloop = 5
let g:sass_compile_cssdir = ['css', 'stylesheet']
let g:sass_compile_file = ['scss', 'sass']
let g:sass_compile_beforecmd = ''
let g:sass_compile_aftercmd = ''
autocmd FileType less,sass  setlocal sw=2 sts=2 ts=2 et
au! BufWritePost * SassCompile

" Autocompletion settings
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=yes

" vim:set et sw=2
