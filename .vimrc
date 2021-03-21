

set nocompatible              " be iMproved, required
filetype off                  " required

set encoding=UTF-8


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'jiangmiao/auto-pairs'
Plugin 'frazrepo/vim-rainbow'
Plugin 'mileszs/ack.vim'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin '907th/vim-auto-save'
Plugin 'ryanoasis/vim-devicons'
Plugin 'bling/vim-bufferline'
Plugin 'Chiel92/vim-autoformat'
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-startify'

Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'morhetz/gruvbox' 
Plug 'hzchirs/vim-material'
" Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color' 
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'dense-analysis/ale'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'liuchengxu/vim-which-key'
Plug 'voldikss/vim-floaterm'
Plug 'junegunn/goyo.vim'
call plug#end()

filetype plugin indent on



""""""""""""""""""""""""""""""""""""""""""""""""""""

set number relativenumber
syntax on 
set tabstop=4 
set shiftwidth=4
set cursorline
set autoindent
set nohlsearch 
set smartindent
"set hls is
set expandtab
set laststatus=2
"let g:rainbow_active = 1
set foldcolumn=1 
set cmdheight=1
set modifiable
let mapleader = " "

set hidden


""""""""""""""""""""""""""""""""""""""""""""""""""""
"grubox Theme
"set background=dark    " Setting dark mode
"autocmd vimenter * colorscheme gruvbox
"colorscheme gruvbox
set background=dark termguicolors cursorline
"let g:gruvbox_contrast_dark = 'hard'


""""""""""""""""""""""""""""""""""""""""""""""""""""
"flutter
let g:hot_reload_on_save=1
let g:flutter_show_log_on_run=0
""""""""""""""""""""""""""""""""""""""""""""""""""""
"onehalf theme
"colorscheme onehalfdark
"let g:airline_theme='onehalfdark'
"" lightline
" let g:lightline.colorscheme='onehalfdark'

""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:python3_host_prog="/usr/bin/python3"
""""""""""""""""""""""""""""""""""""""""""""""""""""
"Material Theme 
"" Dark
"set background=dark
"colorscheme vim-material

" Palenight
"let g:material_style='palenight'
"set background=dark
"colorscheme vim-material

" Oceanic
"let g:material_style='oceanic'
"set background=dark
"colorscheme vim-material

" Light
"set background=light
"colorscheme vim-material
""""""""""""""""""""""""""""""""""""""""""""""""""""

if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#DADADA", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

set background=dark 
colorscheme onedark 
""""""""""""""""""""""""""""""""""""""""""""""""""""

"improve colors 
set t_Co=256
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors

endif

let t:is_transparent = 0
function! Toggle_transparent()
    if t:is_transparent == 0
        hi! Normal guibg=NONE ctermbg=NONE
		hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE 
        let t:is_transparent = 1
    else
        set background=dark termguicolors cursorline
        let t:is_tranparent = 0
    endif
endfunction
map <F10> : call Toggle_transparent()<CR>


"hi! Normal guibg=NONE ctermbg=NONE
"hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE 


""""""""""""""""""""""""""""""""""""""""""""""""""""
"keybindings
" map ; :Files<CR>
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
" map <C-o> :NERDTreeToggle<CR>
map TT :tabnew<CR>
map TR :tabclose<CR>

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>


nnoremap Q <nop> 
nnoremap <F1> <nop> 
inoremap jj <ESC>

nnoremap <TAB> :bn<CR> 
nnoremap <S-TAB> :bp<CR> 
nnoremap cq :bd<CR> 
nnoremap QQ :BufOnly<CR> 



""""""""""""""""""""""""""""""""""""""""""""""""""""
"nerdTree
"
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endi
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeDirArrows = 1
let NERDTreeMinimalUI = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""

"nerd comment
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_tab_nr = 0


let g:bufferline_show_bufnr = 0
""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:auto_save = 1  " enable AutoSave on Vim startup

""""""""""""""""""""""""""""""""""""""""""""""""""""
"compile c++ file  
function! CompileCppFile()
    ! g++ -std=c++1z -pthread *.cpp -o %.out 
    ! ./%.out 
    ! rm -f %.out
endfunction

function! CompileCFile()
    ! gcc -Wall  *.c -o %.out 
    ! ./%.out 
    ! rm -f %.out
endfunction

map <F5> : call CompileCppFile()<CR>
map <F4> : call CompileCFile()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd! FileType c,cpp,java,php call CSyntaxAfter()
""""""""""""""""""""""""""""""""""""""""""""""""""""
" startify

let g:startify_bookmarks = [ {'c': '~/.vimrc'}, {'z':'~/.zshrc'}, {'i':'~/.config/nvim/init.vim'} ,{'a': '~/alacritty.yml'} ,{'u':'~/.config/i3/config'}]
let g:startify_padding_left =20 

let g:startify_custom_header =
            \ startify#pad(split(system(' figlet -f larry3d Ex4ample  '), '\n'))

""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""
"Maven Clean compile and run 
function! MavenRun()
    ! mvn clean compile exec:java
endfunction

map <F6> : call MavenRun()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""


"key bindings 
"Ctrl+w T    move the additional split into a new tab
"gf  to jump file under cursor   Ctrl+^ go back 











