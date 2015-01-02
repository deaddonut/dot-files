" VIM configuration file
"
" Enable the pathogen plugin.
" The pathogen plugin enables installing other plugins as bundles.
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Disable vi compatibility.
set nocompatible

" No toolbar.
set guioptions-=T

" Use hidden buffers more liberally.
set hidden

" No beeps on errors, flash screen instead.
" (Visual bell.)
set vb t_vb=

" Status line.
"
set ruler
"
" Always show status line.
set laststatus=2 

" Leader.
let mapleader = ","

" Incremental searches.
set incsearch

" Set utf-8 encoding.
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" Enable filetype plugins.
filetype plugin on

" Indentation stuff.
set autoindent
set smartindent
filetype indent on

" General tab stuff.
"
set tabstop=4
set softtabstop=4
set shiftwidth=4
" Expand tabs to spaces.
set expandtab 

" Text width
set textwidth=80

" How to display tab and eol characters.
" '▸' == ctrl-v u25b8
set listchars=tab:▸\ ,eol:$

" Colour stuff.
set t_Co=256
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized

" GUI font.
" Consolas on Windows and Monaco everywhere else
if(has('gui_running'))
    if(has('gui_win32'))
        set guifont=Consolas:h11:cANSI
    endif
else
    set guifont=Monaco:h12
endif

" Enable syntax highlighting.
syntax on

" Show line numbers.
set number

" Match parens (%).
set showmatch

" Smart comments...
set comments=sl:/*,mb:\ *,elx:\ */

" Free-roaming cursor in command mode. Weird but useful.
set virtualedit=all

" Enable 'wild' command-line completion.
set wildmenu

" Underline lines that approach 80 characters in length and
" highlight lines longer than 80 characters.
" (Modify the pattern if this should be done for, say,
" only C or Java source files.)
au BufWinEnter *.c,*.cpp,*.h,*.hpp let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
au BufWinEnter *.c,*.cpp,*.h,*.hpp let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

" Remove trailing whitespace before saving.
au BufWritePre *.rb,*.py,*.java,*.c :%s/\s\+$//e

" Clear all matches when leaving a buffer.
au BufWinLeave * call clearmatches()

