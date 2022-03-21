""""""""""""""""""""
" values taken from defaults.vim
""""""""""""""""""""
" This must be first, because it changes other options as a side effect.
set nocompatible

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" Show @@@ in the last line if it is truncated.
set display=truncate

" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it
" confusing.
set nrformats-=octal

" Don't use Ex mode, use Q for formatting.
" Revert with ":unmap Q".
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>


" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " Revert with ":filetype off".
  filetype plugin indent on

  " Put these in an autocmd group, so that you can revert them with:
  " ":augroup vimStartup | au! | augroup END"
  augroup vimStartup
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

  augroup END

endif " has("autocmd")

""""""""""""""""""""
" keybinds / behavior
""""""""""""""""""""

" <F5> = execute current file
" :F5 a b c = execute current file with args
nnoremap <F5> :!"%:p"<Enter>
command! -nargs=* F5 :!"%:p" <args>

" disable arrow keys!!!
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>

" ; = : this is disabled because it makes using f/t/F/T searching annoying

"nnoremap ; :
"vnoremap ; :

" space = search, ctrl+space = r-search
map <space> /
map <C-space> ?

""""""""""""""""""""
" misc options
""""""""""""""""""""

" expand history
set history=500

" enable mouse because i'm a weakling
set mouse=a

" enable syntax highlighting
syntax on
let c_comment_strings=1

" enable command autocomplete menu on tab
set wildmenu

" search settings
set hlsearch
set incsearch
set wrapscan

" no bell noises
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" change tab behavior
set tabstop=4
set shiftwidth=4
set softtabstop=4

" add line numbers
set number

" set line wrapping
set wrap

" scroll around the cursor, not at the very edge of the screen
set scrolloff=6

" timeout settings
set incsearch
set ttimeout            " time out for key codes
set ttimeoutlen=100     " wait up to 100ms after Esc for special key


