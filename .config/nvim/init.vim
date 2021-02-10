"init.vim file by Felixv4
"Todo: 
"better switching window shortcuts
"better switching workspaces etc shortcuts
"setup vimtastic with codechecker

""""""""""""""""""""""""""""""""""""""""" BASIC """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"scrolling
set mouse=a                     "enable mouse integration
set scrolloff=7                 "set scrolling offset
set number relativenumber       "set relative line numbers

"Indentation settings
set tabstop=4                   "numer of spaces one tab represents
set shiftwidth=4                "number of spaces
set softtabstop=4               "how many spaces to insert when pressing tab
set expandtab                   "only use spaces instead of tabs
set autoindent

"line settings
set textwidth=120               "text width is 120
set colorcolumn=120             "show seperator at 120 characters
set nowrap                      "display long lines as just one
set backspace=indent,eol,start  "set backspace as one would expect
set signcolumn=yes              "otherwise the page would shift when showing errors

"File settings
set hidden                      "allow switching buffers without saving
set nobackup                    "some language servers have problems with backups
set autowriteall                "save file on quitting, editing, going to different buffer...
set encoding=UTF-8              "set file encoding to UTF-8
set noswapfile                  "disable swap files
set clipboard+=unnamedplus      "copy to clipboard
filetype plugin on              "allows for specific filetype configs

"Window settings
set cmdheight=1                 "more height for controls
set updatetime=300              "better user experience

"Search Settings
set ignorecase                  "ignore case when searching
set smartcase                   "when searching for upper case, search with case enabled

""""""""""""""""""""""""""""""""""""""""" PLUGINS """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')

" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
"vim plugin
Plug 'lervag/vimtex'

"Color Scheme
Plug 'morhetz/gruvbox'

"Nerdtree
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

"Vim airline status bar and buffer bar
Plug 'vim-airline/vim-airline'

"Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Tagbar for Class overview
Plug 'preservim/tagbar'

"nerdtree dev icons
Plug 'vim-airline/vim-airline-themes'

call plug#end()


""""""""""""""""""""""""""""""""""""""""" VISUAL """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set gruvbox color scheme
let g:gruvbox_contrast_dark = 'medium'
colorscheme gruvbox

"enable sntax highlighting
syntax enable

"show matching parantheses
set showmatch

" highlight the line and column where the cursor is at
set cursorline

""""""""""""""""""""""""""""""""""""""""" KEYMAPS """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set space as leader key
nnoremap <SPACE> <Nop>
let mapleader=" "

"use gk gj g0 g$ to use display line, not physical line
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap $ g$

"clear search highlighting with leader,
nnoremap <silent> <leader>, :nohlsearch<CR>

"exit insert mode with jk or kj
inoremap <esc> <Nop>
inoremap jk <esc>
inoremap kj <esc>

"auto expanding { bracket on {enter
inoremap {<CR> {<CR>}<ESC>O

"Shorcuts for toggling nerd tree and tagbar
noremap <leader>n :NERDTreeToggle<CR>
noremap <leader>m :TagbarToggle<CR>

"Shortcuts for split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"edit nvim config file
nnoremap <leader>ve :e ~/.config/nvim/init.vim<CR>
"save and execute nvim config file
nnoremap <leader>vs :w<CR> :so %<CR>
"open tmux config file
nnoremap <leader>te :e ~/.tmux.conf<CR>

"unmap arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"change buffers with leader + buffer number
nnoremap <leader>1 :b 1<CR>
nnoremap <leader>2 :b 2<CR>
nnoremap <leader>3 :b 3<CR>
nnoremap <leader>4 :b 4<CR>
nnoremap <leader>5 :b 5<CR>
nnoremap <leader>6 :b 6<CR>
nnoremap <leader>7 :b 7<CR>
nnoremap <leader>8 :b 8<CR>
nnoremap <leader>9 :b 9<CR>

"Symbol renaming.
nmap <silent> <leader>rn <Plug>(coc-rename)
"jump to definition
nmap <silent> <leader>jd <Plug>(coc-definition)
"auto fix problems 
nmap <leader>af  <Plug>(coc-fix-current)
"select first item in completion list
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

"spell checking
nnoremap <silent> <leader>sg :setlocal spell spelllang=de spellsuggest=best<CR>
nnoremap <silent> <leader>se :setlocal spell spelllang=en_us<CR>

"JAVA SPECIFIC:"
"fix imports
nmap <silent> <leader>aa :CocAction<CR>
nmap <silent> <leader>y <Plug>(coc-action)

"LATEX SPECIFIC:
"tex preview
nnoremap <silent> <leader>tp :LLPStartPreview<CR>

""""""""""""""""""""""""""""""""""""""""" PLUGIN SETTINGS """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"COCSETTINGS:
autocmd CursorHold * silent call CocActionAsync('highlight')    "hilight symbol and ref. when cursor on


"NERD TREE SETTINGS:
let NERDTreeQuitOnOpen = 0      "quit Nerd Tree when a file was opened
let NERDTreeMinimalUI = 1       "dont show info message
let NERDTreeDirArrows = 1

"exclude specific files from nerdtree
"let NERDTreeIgnore = ['\.class$']

"Exit Vim if NERDTree is the only window left
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif


"AIRLINE SETTINGS:
let g:airline_theme='gruvbox'    "set airline theme
let g:airline_powerline_fonts = 1
let g:airline_extensions = ['tabline']

let g:airline#extensions#tabline#enabled = 1           " enable airline tabline                                                           
let g:airline#extensions#tabline#show_tab_type = 0     " disables the weird ornage arrow on the tabline
let g:airline#extensions#tabline#buffer_nr_show = 1    "show buffer number
let g:airline#extensions#tabline#formatter ='unique_tail' "dont show long file source

" We don't need to see things like -- INSERT -- anymore
set noshowmode

"To allow status bar to be seen even before splitting
set laststatus=2
"Reduces the space occupied by section z
let g:airline_section_z = "%3p%% %l:%c"

"LATEX SETTINGS:
"only refresh on buffer write
let g:livepreview_cursorhold_recompile = 0
au BufRead,BufNewFile *.txt,*.tex set wrap linebreak nolist textwidth=0 wrapmargin=0
