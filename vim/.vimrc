" Load rational defaults.vim file introduced in vim 8.
unlet! skip_defaults_vim
if glob("expand($VIMRUNTIME)/defaults.vim")
  source $VIMRUNTIME/defaults.vim
endif

" Plugin Management (junegunn/vim-plug)  ---------------------------- {{{1

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Plugin List ------------------------------------------------------- {{{2
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-obsession'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/vim-easy-align'
Plug 'freitass/todo.txt-vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'moll/vim-bbye'
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
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'mhinz/vim-janah'
Plug 'chriskempson/base16-vim'
Plug 'tomasr/molokai'
Plug 'NLKNguyen/papercolor-theme'
Plug 'rakr/vim-two-firewatch'
Plug 'wellle/targets.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'joshdick/onedark.vim'
Plug 'jacoborus/tender.vim'
Plug 'arcticicestudio/nord-vim'

Plug 'vim-python/python-syntax'
Plug 'tmhedberg/SimpylFold'

Plug 'nathangrigg/vim-beancount'

" Plug '/usr/share/doc/fzf/examples/'
" plug '/usr/local/opt/fzf'

Plug 'junegunn/fzf' ", { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'nvie/vim-flake8'
" Plug 'w0rp/ale'

call plug#end()

" Basic editor settings ---------------------------- {{{1

" Editing behavior settings ------------------------ {{{2
"
set backspace=indent,eol,start | " Allow backspacing over everything in insert mode
set gdefault        | " Substitutes globally on a line by default (no need for \g)
set expandtab       | " insert spaces, not tabs, when Tab pressed
set autoindent      | " Use indent of previous line
let mapleader = ","       " Make ',' the global leader key
let maplocalleader = "\\" " Make '\' the local leader key
" Insert two spaces after closing punctuation when doing a 'join'
set joinspaces      | " insert two spaces after punctuation when joining lines
set cpoptions+=J    | " insert two spaces only after period when joining lines

" UI/UX settings ------------------------------------- {{{2
"
set history=50      | " keep 50 lines of command line history
set showmatch       | " Show matching brackets when text indicator is over them
set cmdheight=1     | " Command bar height
set ruler           | " show the cursor position all the time
set showcmd         | " display incomplete commands
set scrolloff=3     | " Keep 3 lines between top/bottom of window and cursor
set number          | " Number each line of the file
" set relativenumber | " Number each line relative to current
set laststatus=2    | " Make sure the status line is always on
set showmode        | " Show mode message in command line
set hidden          | " Hide buffers when abandoned
set visualbell      | " Use visual signal rather than beeping
set cursorline      | " Highlight line containing cursor
" set cursorcolumn  | " Highlight column containing cursor
set wildmenu        | " Display command-line completion options
set wildmode=list:longest | " Completion mode to use for matching
syntax enable         " syntax highlighting
set foldlevel=1     | " Automatically open top-most fold
set foldcolumn=4    | " Show 4 columns worth of folding information

set clipboard=unnamed | " Setting to enable copy/paste to system clipboard on Mac?
"
" set splitright     | " Focus in vertical splits goes to right pane
set splitbelow      | " Focus in horizontal splits goes to bottom pane

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
else
        colo onedark
endif
colo onedark

" Enable italic fonts in terminal vim (see
" https://www.reddit.com/r/vim/comments/24g8r8/italics_in_terminal_vim_and_tmux/)
set t_ZH=[3m
set t_ZR=[23m


" Search settings ------------------------------------ {{{2
"
set incsearch       | " do incremental searching
set hlsearch        | " highlight search terms
set ignorecase      | " Ignore case during searches
set smartcase       | " Case-sensitive search if search pattern contains upper case

" Backup/Swap settings ------------------------------------ {{{2
"
set backupdir=./.backup,~/.tmp,.,/tmp | " Store backup files (*~) just about anywhere but the working directory.
set nobackup        | " do not keep a backup file, use versions instead
set noswapfile      | " do not keep a swap file

" Spellchecker settings ------------------------------------ {{{2
set spell spelllang=en_us
set spellfile=~/.vim/spell/en.utf-8.add

" Plugin settings ---------------------------- {{{1

" vim-pencil settings ---------------------------- {{{2
function! TodoKeyWords()
  augroup todo_keywords
    " autocmd!
    autocmd BufEnter <buffer> setlocal iskeyword+=@-@
  augroup End
endfunction

augroup pencil
  autocmd!
  " autocmd FileType text call pencil#init()
  autocmd FileType text call pencil#init({'wrap': 'soft'})
  autocmd FileType tex  call pencil#init({'wrap': 'soft'})
  autocmd FileType context  call pencil#init({'wrap': 'soft'})
  autocmd FileType todo call pencil#init({'wrap': 'soft'}) | call TodoKeyWords()
  " autocmd FileType pandoc call pencil#init({'wrap': 'soft'})
augroup End

" Default conceallevel for vim-pencil is 3
let g:pencil#conceallevel = 2

" vim-airline settings ---------------------------- {{{2
"" Customizations for airline
" Need fonts from powerline-fonts github repo
let g:airline_powerline_fonts = 1

let g:airline#extensions#whitespace#enabled = 0

let g:airline#extensions#obsession#enabled = 1

let g:airline#extensions#vimtex#enabled = 1

let g:airline#extensions#virtualenv#enabled = 1

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

" let g:airline_section_x = '%{PencilMode()}'

" vim-easy-align settings ---------------------------- {{{2
" Mappings for easy-align
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Miscellaneous settings ---------------------------- {{{2

let g:UltiSnipsEditSplit="vertical"
"
" Enable vim-pandoc integration with other plugins
" let g:pandoc#after#modules#enabled = ["ultisnips"]
" let g:pandoc#after#modules#enabled = ["ultisnips", "vim-table-mode"]

if has("gui_macvim")
  " Added on 7/6/2018 to fix problems with UltiSnip not loading properly in
  " terminal version of MacVim
  " set pythondll=/opt/local/Library/Frameworks/Python.framework/Versions/2.7/Python
  set pythonthreedll=/usr/local/Frameworks/Python.framework/Python
  "/opt/local/Library/Frameworks/Python.framework/Versions/3.6/Python
endif


" This may break line motion in TeX and Pandoc.  Issues with pencil plugin?
" nnoremap <silent> <expr> k (v:count ==0 ? 'gk' : 'k')
" nnoremap <silent> <expr> j (v:count ==0 ? 'gj' : 'j')

" Load the matchit plugin that comes with VIM
source $VIMRUNTIME/macros/matchit.vim


" Filetype settings ---------------------------- {{{1

" TeX/LaTeX settings ---------------------------- {{{2
"

" Control what things are concealed in TeX documents
" a = accents/ligatures
" d = delimiters
" g = Greek
" m = math symbols
" s superscripts/subscripts
" Much heralded Greek substitution is not working.  Needs further research.
" let g:tex_conceal='adm'
" let g:tex_conceal='abdgms'
let g:tex_conceal='abdgm'

" Enable folding in VimTex plugin
let g:vimtex_fold_enabled=1

" Enable latexmk continuous operation in VimTex plugin
let g:vimtex_compiler_latexmk = {'continuous' : 1}

" Use Zathura as the viewer
let g:vimtex_view_general_viewer = 'zathura'

" Change default TeX flavor for TeX files to LaTeX
let g:tex_flavor="latex"

" C++ settings ---------------------------------- {{{2

" Plug 'octol/vim-cpp-enhanced-highlight' customizations
let g:cpp_class_scope_highlight=1
let g:cpp_member_variable_highlight=1
let g:cpp_class_decl_highlight=1
let g:cpp_experimental_template_highlight=1

augroup filetype_cpp
  autocmd!
  autocmd FileType cpp set expandtab | set shiftwidth=2 | set softtabstop=2 | set textwidth=80 | set fo+=tcj
augroup END

" Vimscript file settings ---------------------------- {{{2
augroup filetype_vim
  autocmd!
  " Use markers to determine folds
  autocmd FileType vim setlocal foldmethod=marker
  " Substitute spaces for tabs and insert two spaces per tab
  autocmd FileType vim setlocal expandtab
  autocmd FileType vim setlocal tabstop=2
  autocmd FileType vim setlocal shiftwidth=2
augroup END

" Python file settings ---------------------------- {{{2
""" Turn on all syntax highlighting options in 'vim-python/python-syntax'
let g:python_highlight_all = 1
""" Turn on docstring previews in folds 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview = 1

" Pandoc file settings ---------------------------- {{{2
augroup pandoc_keywords
  autocmd!
  autocmd FileType pandoc setlocal iskeyword+=+
  autocmd FileType pandoc setlocal iskeyword+=$
  autocmd FileType pandoc setlocal iskeyword+=%
  autocmd FileType pandoc setlocal iskeyword+=&
  autocmd FileType pandoc setlocal iskeyword+=#
  autocmd FileType pandoc setlocal iskeyword+=-
  autocmd FileType pandoc setlocal iskeyword+='
  autocmd FileType pandoc setlocal iskeyword+=@-@
augroup END

" Personal settings ---------------------------- {{{1

" Mappings ------------------------------------- {{{2
nnoremap <leader>- ddp
nnoremap <leader>_ ddkP
nnoremap <leader><c-u> viWU
nnoremap <leader><space> :noh<cr>   | " Clear out a search
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
""" Remap space in Normal mode to za to toggle open/close fold
nnoremap <space> za

iabbrev dts Damon Theodore Spayde
iabbrev edts spayde@hendrix.edu

nnoremap H 0
nnoremap L $

" Functions ------------------------------------- {{{2

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

        execute "!zathura " . l:pdffile . " & "
endfunction

function! PDFOpen()
        let l:pdffile = substitute(bufname('%'), '.md$\|.tex$', ".pdf", "")
        echom l:pdffile

        execute "!zathura " . l:pdffile
endfunction

command! -nargs=* LetterCompile call LetterCompile(<f-args>) 
command! -nargs=0 LetterOpen call LetterOpen()
command! -nargs=0 PDFOpen call PDFOpen()
 
"
" Statusline  ---------------------------- {{{2
"
"set statusline=%f   " Path to filename
"set statusline+=%m
"set statusline+=%r
"set statusline+=%h
"set statusline+=%w
"set statusline+=%y
"set statusline+=%q
"set statusline+=%{fugitive#statusline()}
""function! GitStatus()
"  "let [a,m,r] = GitGutterHunkSummary()
"  "return printf('+%d ~%d -%d', a, m, r)
""endfunction
""set statusline+=%{GitStatus()}
"" set statusline+=%{GitGutterGetHunkSummary()}

"set statusline+=%=  " Switch to right-side of window
"set statusline+=Col:\ %3.c\ 
"set statusline+=Line:\ %4.l/%-4.L
"set statusline+=%4.P
