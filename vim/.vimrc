" Load rational defaults.vim file introduced in vim 8.
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" set nocompatible

"Use vim-plug (junegunn/vim-plug) for package management

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'
" Plug 'gerw/vim-latex-suite'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'kien/ctrlp.vim'
Plug 'junegunn/vim-easy-align'
Plug 'freitass/todo.txt-vim'
" Plug 'vim-scripts/todo-txt.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'moll/vim-bbye'
Plug 'xolox/vim-misc'
" Plug 'xolox/vim-session'
Plug 'reedes/vim-pencil'
Plug 'romainl/Apprentice'
Plug 'reedes/vim-colors-pencil'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc-after'
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'lervag/vimtex'
Plug 'AlessandroYorba/Alduin'
Plug 'Konfekt/FastFold'
Plug 'chriskempson/base16-vim'
Plug 'whatyouhide/vim-gotham'
" Plug 'dhruvasagar/vim-table-mode'
" Plug 'tpope/vim-projectionist'
" Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'mhinz/vim-janah'
"Plug 'vim-scripts/ShowMarks'
Plug 'chriskempson/base16-vim'
Plug 'tomasr/molokai'
Plug 'NLKNguyen/papercolor-theme'
Plug 'rakr/vim-two-firewatch'
Plug 'wellle/targets.vim'
" Plug 'vim-scripts/Latex-Text-Formatter'
" Plug 'edkolev/tmuxline.vim'
Plug 'mhinz/vim-startify'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'joshdick/onedark.vim'
Plug 'jacoborus/tender.vim'
Plug 'arcticicestudio/nord-vim'

Plug 'vim-python/python-syntax'
Plug 'tmhedberg/SimpylFold'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'nvie/vim-flake8'
Plug 'w0rp/ale'

call plug#end()

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup		" do not keep a backup file, use versions instead

set noswapfile    " do not keep a swap file

" Store backup files (*~) just about anywhere but the working directory.
set backupdir=./.backup,~/.tmp,.,/tmp

set history=50		" keep 50 lines of command line history

set cmdheight=1   " Command bar height

set ruler		" show the cursor position all the time

set showcmd		" display incomplete commands

set incsearch		" do incremental searching

set hlsearch    " highlight search terms

set ignorecase          " Ignore case during searches
set smartcase

set gdefault    " Substitutes globally on a line by default (no need for \g)

set showmatch   " Show matching brackets when text indicator is over them

" Set <Leader> to ,
let mapleader = ","
" Mapping <leader> to - conflicts with vim-vinegar quick directory access
" let mapleader = "-"
" Set <LocalLeader> to \
let maplocalleader = "\\"

syntax enable   " syntax highlighting

set autoindent		" always set autoindenting on

set scrolloff=3 " Keep 3 lines between top/bottom of window and cursor


" Following are not compatible with lbr option
" set list
" set listchars=tab:▸\ ,eol:¬

" Make sure lines get broken eventually.
" set textwidth=78

" Enable spell checker
set spell spelllang=en_us
set spellfile=~/.vim/spell/en.utf-8.add

" Enable line numbering
set number
" set relativenumber 

" Enable permanent status line with more information
set laststatus=2
" set statusline=%f\ %h%m%r%y%=%-14.(%l,%c%V%)%o\ %P
"set statusline=%f\ %h%m%r%y%=%-14.(%l,%c%V%)\ %P

set showmode  " Show mode message in command line

set hidden    " Hide buffers when abandoned

set wildmenu  " Display command-line completion options
set wildmode=list:longest

set visualbell

set cursorline  " Highlight line containing cursor
" set cursorcolumn " Highlight column containing cursor


augroup pencil
  autocmd!
  " autocmd FileType text call pencil#init()
  autocmd FileType text call pencil#init({'wrap': 'soft'})
  autocmd FileType tex  call pencil#init({'wrap': 'soft'})
  autocmd FileType context  call pencil#init({'wrap': 'soft'})
  autocmd FileType todo call pencil#init({'wrap': 'soft'})
  " autocmd FileType pandoc call pencil#init({'wrap': 'soft'})
augroup End

" Default conceallevel for vim-pencil is 3
let g:pencil#conceallevel = 2

"" Customizations for airline
" Need fonts from powerline-fonts github repo
let g:airline_powerline_fonts = 1

let g:airline#extensions#whitespace#enabled = 0

" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_idx_mode = 1
" nmap <leader>1 <Plug>AirlineSelectTab1
" nmap <leader>2 <Plug>AirlineSelectTab2
" nmap <leader>3 <Plug>AirlineSelectTab3
" nmap <leader>4 <Plug>AirlineSelectTab4
" nmap <leader>5 <Plug>AirlineSelectTab5
" nmap <leader>6 <Plug>AirlineSelectTab6
" nmap <leader>7 <Plug>AirlineSelectTab7
" nmap <leader>8 <Plug>AirlineSelectTab8
" nmap <leader>9 <Plug>AirlineSelectTab9

let g:airline_section_x = '%{PencilMode()}'

" Mappings for easy-align
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Set tabbing behavior globally
" Never insert tab characters, insert spaces instead
set expandtab
"
" All tabs default to two spaces
" set tabstop=2
" set shiftwidth=2
" set softtabstop=2

" set lbr         " Break long lines without inserting \crlf

" Enable 24 bit color in the terminal
"" let t_8f="\e[38;2;%ld;%ld;%ldm"
"" let t_8b="\e[48;2;%ld;%ld;%ldm"
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
" set termguicolors

if (has("termguicolors"))
        set termguicolors
        let g:onedark_terminal_italics=1
        let g:gruvbox_italic=1
        let g:two_firewatch_italics=1
        let g:pencil_terminal_italics = 1
        let g:nord_italic = 1
        let g:nord_underline = 1
        let g:nord_italic_comments = 1
        let g:nord_uniform_status_lines = 1
        colo onedark
else
        colo base16-eighties
endif


" set t_Co=256
" colo base16-eighties
" set background=dark
" let g:solarized_termcolors=256
" set background=light

" Enable italic fonts in terminal vim (see
" https://www.reddit.com/r/vim/comments/24g8r8/italics_in_terminal_vim_and_tmux/)
set t_ZH=[3m
set t_ZR=[23m

" LaTeX-Suite settings
" let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode -file-line-error $*'

let g:startify_session_dir = '~/.vim/sessions'

" Control what things are concealed in TeX documents
" a = accents/ligatures
" d = delimiters
" g = Greek
" m = math symbols
" s superscripts/subscripts
" Much heralded Greek substitution is not working.  Needs further research.
" let g:tex_conceal='adm'
let g:tex_conceal='abdgms'

" Enable folding in VimTex plugin
let g:vimtex_fold_enabled=1

" Distable latexmk continuous operation in VimTex plugin
let g:vimtex_latexmk_continuous=0
let g:vimtex_compiler_latexmk = {'background' : 0, 'continuous' : 0}

" Setting to enable copy/paste to system clipboard on Mac?
set clipboard=unnamed

" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsForwardTrigger="<c-f>"
" let g:UltiSnipsBackwardTrigger="<c-b>"

let g:UltiSnipsEditSplit="vertical"

" Change default TeX flavor for TeX files to LaTeX
let g:tex_flavor="latex"

" Automatically open top-most fold
set foldlevel=1

" Show 4 columns worth of folding information
set foldcolumn=4

" Enable vim-pandoc integration with other plugins
let g:pandoc#after#modules#enabled = ["ultisnips"]
" let g:pandoc#after#modules#enabled = ["ultisnips", "vim-table-mode"]


" Plug 'octol/vim-cpp-enhanced-highlight' customizations
let g:cpp_class_scope_highlight=1
let g:cpp_member_variable_highlight=1
let g:cpp_class_decl_highlight=1
let g:cpp_experimental_template_highlight=1

" This may break line motion in TeX and Pandoc.  Issues with pencil plugin?
" nnoremap <silent> <expr> k (v:count ==0 ? 'gk' : 'k')
" nnoremap <silent> <expr> j (v:count ==0 ? 'gj' : 'j')

" Load the matchit plugin that comes with VIM
so $VIMRUNTIME/macros/matchit.vim

" FileType specific customizations
autocmd FileType cpp set expandtab | set shiftwidth=2 | set softtabstop=2 | set textwidth=80 | set fo+=tcj

nnoremap <leader>- ddp
nnoremap <leader>_ ddkP
nnoremap <leader><c-u> viWU
nnoremap <leader><space> :noh<cr>   " Clear out a search
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

iabbrev dts Damon Theodore Spayde
iabbrev edts spayde@hendrix.edu

nnoremap H 0
nnoremap L $

" Insert two spaces after closing punctuation when doing a 'join'
set joinspaces
set cpoptions+=J

" New splits (with focus) open to right or bottom
set splitright
set splitbelow

" function! TexExec(mode, paperformat)
function! LetterCompile(...)
        let l:mode = get(a:, 1, 'generic')
        " echom l:mode
        let l:paperformat = get (a:, 2, 'plainpaper')
        " echom l:paperformat
        let l:command = "texexec --engine=xetex --mode="
        let l:command .= l:paperformat
        let l:command .= ","
        let l:command .= l:mode
        let l:command .= " "
        let l:command .= bufname('%')
        echom l:command

        silent !clear
        execute "!" . l:command
endfunction

function! LetterOpen()
        let l:pdffile = substitute(bufname('%'), ".tex$", ".pdf", "")
        echom l:pdffile

        execute "!open " . l:pdffile
endfunction

function! PDFOpen()
        let l:pdffile = substitute(bufname('%'), '.md$\|.tex$', ".pdf", "")
        echom l:pdffile

        execute "!open " . l:pdffile
endfunction

command! -nargs=* LetterCompile call LetterCompile(<f-args>) 
command! -nargs=0 LetterOpen call LetterOpen()
command! -nargs=0 PDFOpen call PDFOpen()
 
" Stop prompting to save default editing session
let g:session_autosave = 'no'

" Added on 7/6/2018 to fix problems with UltiSnip not loading properly in
" terminal version of MacVim
" set pythondll=/opt/local/Library/Frameworks/Python.framework/Versions/2.7/Python
set pythonthreedll=/usr/local/Frameworks/Python.framework/Python
"/opt/local/Library/Frameworks/Python.framework/Versions/3.6/Python

""" Turn on all syntax highlighting options in 'vim-python/python-syntax'
let g:python_highlight_all = 1
""" Turn on docstring previews in folds 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview = 1

""" Remap space in Normal mode to za to toggle open/close fold
nnoremap <space> za
