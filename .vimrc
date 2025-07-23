" disable compatibility with vi which can cause unexpected issues
set nocompatible
set encoding=utf-8
set regexpengine=2
set noswapfile
set shiftwidth=2
set tabstop=2
set softtabstop=2
set updatetime=100
set expandtab
set shiftround
set showmatch
set splitbelow
set splitright
set laststatus=2
set ruler
set showcmd
set title
set visualbell
set ignorecase
set smartcase
set background=dark
set autoread
set autoindent
set incsearch
set hlsearch
set wildcharm=<C-z>
set wildoptions=pum,tagfile
set wildmenu
set history=10000
let &showbreak='+++ '
set lcs=tab:>\ ,trail:-,nbsp:+
set list
syntax on
filetype on

" generate ctags in the background
function! GenerateTags()
  if !executable('ctags')
    echohl WarningMsg | echom 'no ctags installation found' | echohl None
    return
  endif
  let l:job = job_start(['ctags', '--tag-relative=never', '-G', '-R', '.'],
      \ { 'in_io': 'null', 'out_io': 'null', 'err_io': 'null' })
  echom 'generating tagfile..., info: ' . l:job
endfunction
nnoremap <Leader>tg :call GenerateTags()<CR>

" open the quickfix window whenever a quickfix command is executed
autocmd QuickFixCmdPost [^l]* cwindow | setl cursorline
nnoremap <silent> <Leader><Enter> :noh<CR>

" quickly launch/dismiss netrw
nnoremap <silent> - <Cmd>Explore<CR>
au FileType netrw nn <silent> <buffer> <C-c> <Cmd>Rex<CR>

" list your plugins here
call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'rose-pine/vim', { 'as': 'rose-pine' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'machakann/vim-highlightedyank'
Plug 'ziglang/zig.vim'
call plug#end()

" find files
nnoremap <Leader>e :e %:h<C-z>
nnoremap <Leader>b :b <C-z>

" pattern grep
nnoremap <Leader>g :vimgrep //f **<S-Left><S-Left><Right>
vnoremap <Leader>g "0y:vimgrep /<C-r>=escape(@0,'/\')<CR>/f **<S-Left><Left><Left><Left>
nnoremap <Leader>G :vimgrep /<C-r><C-w>/f **
vnoremap // "0y/\V<C-r>=escape(@0,'/\')<CR><CR>

" program to use ripgrep for the :grep command if available
if executable('rg')
  set grepprg=rg\ --vimgrep\ --smart-case\ --no-heading\ --column
  set grepformat^=%f:%l:%c:%m
  nnoremap <Leader>g :grep! ''<Left>
  vnoremap <Leader>g "0y:grep! --case-sensitive '<C-r>0'<Left>
  nnoremap <Leader>G :grep! --case-sensitive '<C-r><C-w>'<CR>
  nnoremap <Leader>/ :grep! --hidden --no-ignore ''<Left>
endif

" find and replace
nnoremap <Leader>r :%s/<C-r><C-w>//gI<Left><Left><Left>
vnoremap <Leader>r "0y:%s/<C-r>=escape(@0,'/\')<CR>//gI<Left><Left><Left>

" yank marked text/paste to/from global register
nnoremap <Leader>Y "+Y
vnoremap <Leader>y "+y
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p

" language specific config
au FileType zig setl ts=4 sts=4 sw=4 fp=zig\ fmt\ --stdin et
au FileType c,cpp,java,python setl ts=4 sts=4 sw=4 et
au FileType javascript,typescript setl ts=2 sts=2 sw=2 et
au FileType json setl ts=2 sts=2 sw=2 fp=jq et

" plugin config
let g:fzf_vim = {}
let g:fzf_layout = { 'down': '41%' }
let g:fzf_vim.preview_window = ['right,41%,<70(up,41%)']
let g:highlightedyank_highlight_duration = 150
nnoremap <Leader>f <Cmd>Files<CR>
nnoremap <Leader>F :let @+=expand('<cword>') \| Files<CR>
nnoremap <Leader>b <Cmd>Buffers<CR>
let g:zig_fmt_autosave = 0

" use 24-bit color with no background
set termguicolors
silent! colorscheme rosepine_moon
hi Normal ctermbg=NONE guibg=NONE
hi NormalNC ctermbg=NONE guibg=NONE
