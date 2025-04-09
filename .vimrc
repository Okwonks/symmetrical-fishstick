"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
"               
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║     
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"               
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax processing
syntax enable

" Turn syntax highlighting on.
syntax on
set re=0

" Show line numbers
set number 

" Use spaces instead of tabs
" Tabs are spaces
set expandtab

" Number of visual spaces per TAB   
set tabstop=2

" Number of spaces in tab when editing
set softtabstop=2

" Set shift width to 4 spaces.
set shiftwidth=2

" Lines of history to remember
set history=1000 

" Do not save backup files.
set nobackup

" split right
set splitright

" text width 
set textwidth=80

" UI config
" show comand at the bottom bar
set showcmd

" background line color
set background=dark

" Searching
" Search as character are being entered
set incsearch " highlight search matches
set hlsearch

" Mouse
" Enable mouse support
set mouse=a

autocmd FileType yaml,yml,javascript,jsx,ts,tsx setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType java setlocal ts=4 sts=4 sw=4 expandtab

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin()
  Plug 'dense-analysis/ale'
  Plug 'duane9/nvim-rg'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'preservim/nerdtree'
  Plug 'tomasiser/vim-code-dark'
  Plug 'wakatime/vim-wakatime'
  Plug 'joshdick/onedark.vim'
call plug#end()

" }}}

set termguicolors
filetype plugin indent on
colorscheme onedark

" MAPPINGS --------------------------------------------------------------- {{{

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <silent> ,<Space> :noh<CR>
nnoremap <silent> <C-f> :FZF<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>tn :tabnew<CR>
nnoremap <silent> <Leader>vs :vsplit<CR>
nnoremap <leader>fw :Lines<CR>

nnoremap <leader>ln o<esc>

" }}}

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\}
let g:ale_sign_error='❌'
let g:ale_sign_warning='⚠️'
let g:ale_fixers = {'javascript': ['prettier', 'eslint']}

" STATUS LINE ------------------------------------------------------------ {{{

" Mapping modes to display on status line
let g:currentmode={
 \ 'n' : 'NORMAL ',
 \ 'v' : 'VISUAL ',
 \ 'V' : 'V-LINE ',
 \ 'i' : 'INSERT ',
 \ 'R' : 'R ',
 \ 'Rv' : 'V-REPLACE ',
 \ 'c' : 'COMMAND ',
 \}

" Clear status line when vimrc is reloaded.
set statusline=
set noshowmode

set statusline+=%{(mode()=='n')?'\ \ NORMAL\ \':''}
set statusline+=%{(mode()=='i')?'\ \ INSERT\ \':''}
set statusline+=%{(mode()=='c')?'\ \ COMMAND\':''}
set statusline+=%{(mode()=='v')?'\ \ VISUAL\ \':(mode()=='V')?'\ \ VISUAL\ \':''}

" Status line left side.
set statusline+=\ %f\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c

" Show the status on the second to last line.
set laststatus=2

" }}}

" command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), fzf#vim#with_preview(), <bang>0)

augroup CustomFzfRg
  autocmd!
  autocmd VimEnter * command! -bang -nargs=* Rg call fzf#vim#grep(
        \ "rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>),
        \ fzf#vim#with_preview(),
        \ <bang>0)
augroup END
