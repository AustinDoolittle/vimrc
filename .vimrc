set nocompatible
filetype off


" Vundle config
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" *INCEPTION BWAAAAAAH*
Plugin 'VundleVim/Vundle.vim'

" Fugitive git wrapper
" https://vimawesome.com/plugin/fugitive-vim
Plugin 'tpope/vim-fugitive'

" NerdTree file explorer
" https://vimawesome.com/plugin/fugitive-vim
Plugin 'scrooloose/nerdtree'

" NerdTree git plugin
" https://github.com/Xuyuanp/nerdtree-git-plugin
Plugin 'xuyuanp/nerdtree-git-plugin'

" Syntastic syntax highlighting
" https://vimawesome.com/plugin/syntastic
Plugin 'scrooloose/syntastic'

" surround.vim surround shortcuts
" https://vimawesome.com/plugin/surround-vim
Plugin 'tpope/vim-surround'

" ctrlp fuzzy finder
" https://vimawesome.com/plugin/ctrlp-vim-red
Plugin 'kien/ctrlp.vim'

" Solarized colors
" https://vimawesome.com/plugin/vim-colors-solarized-ours
Plugin 'altercation/vim-colors-solarized'

" Zenburn colors
" https://vimawesome.com/plugin/zenburn-enchanted
Plugin 'jnurmine/zenburn'

" Airline status bar
" https://vimawesome.com/plugin/vim-airline
Plugin 'bling/vim-airline'

" Airline themes
" https://vimawesome.com/plugin/vim-airline-themes
Plugin 'vim-airline/vim-airline-themes'

" tagbar tag viewer
" https://vimawesome.com/plugin/tagbar
Plugin 'majutsushi/tagbar'

" NerdCommenter commenting utility
" https://vimawesome.com/plugin/the-nerd-commenter
Plugin 'scrooloose/nerdcommenter'

" gitgutter git diff utility
" https://vimawesome.com/plugin/vim-gitgutter
Plugin 'airblade/vim-gitgutter'

" youcompleteme autocomplete engine
" https://vimawesome.com/plugin/youcompleteme
Plugin 'valloric/youcompleteme', {'do': 'install.py --clang-completer'}

" https://vimawesome.com/plugin/easymotion
Plugin 'easymotion/vim-easymotion'

" repeat plugin maps
" https://vimawesome.com/plugin/repeat-vim
Plugin 'tpope/vim-repeat'

" SimpylFold python folding
" https://vimawesome.com/plugin/simpylfold
Plugin 'tmhedberg/simpylfold'

" FastFold faster folding
" https://vimawesome.com/plugin/simpylfold
Plugin 'konfekt/fastfold'

call vundle#end()


""" Begin Function Declarations
function! CleanTrailingWhiteSpace()
	let save_pos=getpos(".")
	%s/\s\+\(\n\?\)$/\1/g
	call setpos(".", save_pos)
endfunction
""" End Function Declarations

""" Begin Vanilla Vim
" Make mac backspace normal
if has('macunix')
	set backspace=2
endif

" random junk
syntax on
set mouse=a
set number
set shiftwidth=4
set tabstop=4
set autoindent
set foldmethod=syntax
set fixeol

" clean up whitespace on write
autocmd BufWrite * silent! call CleanTrailingWhiteSpace()

" better split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

nnoremap <silent> <CR> o<ESC>
nnoremap <silent> <S-CR> O<ESC>
""" End Vanilla Vim

""" Begin NerdTree
" auto open NerdTree if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
noremap <silent> <C-N> :NERDTreeToggle<cr>
""" End NerdTree

""" Begin NerdCommenter
filetype plugin on
""" End NerdCommenter

""" Begin Syntastic
" recommended defaults
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
""" End Syntastic

""" Begin CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'r'

let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn|pyc)$',
	\ 'file': '\v\.(so|swp|zip)$',
	\ }
""" End CtrlP

""" Begin Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
""" End Airline

""" Begin Color Scheme
if has('gui_running')
	set background=dark
	colorscheme solarized
else
	colorscheme zenburn
endif
""" End Color Scheme

""" Begin YouCompleteMe
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
""" End YouCompleteMe

""" Begin EasyMotion
nmap s <Plug>(easymotion-overwin-f2)
nmap t <Plug>(easymotion-t2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
""" End EasyMotion

""" Begin SimpylFold
let g:SimpylFold_docstring_preview=1
nnoremap <Space> za
""" End SimpylFold
