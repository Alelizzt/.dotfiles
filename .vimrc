"
"    ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"    ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"    ██║   ██║██║██╔████╔██║██████╔╝██║     
"    ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"     ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"      ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"
set number
set mouse=a
set numberwidth=1
set clipboard=unnamedplus
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=4

set shiftwidth=4
set expandtab
set autoindent

set relativenumber
set laststatus=2
filetype on
set nu

call plug#begin('~/.dotfiles/.config/vim/plugged')

if has('mac')
      Plug 'junegunn/vim-xmark'
endif


if empty(glob('~/.dotfiles/.config/vim/autoload/plug.vim'))
  silent !curl -fLo ~/.dotfiles/.config/vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Habilitar raton
if has("mouse")
    set mouse=a
    set mousehide
    set mousemodel=popup
    if !has('nvim')
        set ttymouse=xterm2
    endif
endif

" Soporte lenguajes
Plug 'ap/vim-css-color'
Plug 'sheerun/vim-polyglot'
Plug 'othree/html5.vim'
Plug 'othree/javascript-libraries-syntax.vim'

"Temas
"Plug 'morhetz/gruvbox'
Plug 'crusoexia/vim-monokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'

"Autocompletado
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
"cosas de html
Plug 'mattn/emmet-vim'
"cerrar corchetes automaticamente
Plug 'jiangmiao/auto-pairs'
"linter o corrector de codigos
Plug 'dense-analysis/ale'
"Iconos
Plug 'ryanoasis/vim-devicons'
"cosas Git
Plug 'airblade/vim-gitgutter'
"test
Plug 'vim-syntastic/syntastic'

call plug#end()


"colorscheme gruvbox
"let g:gruvbox_contrast_dark="hard"
colorscheme monokai


let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='powerlineish'

let mapleader=" "
let NERDTreeQuitOnOpen=1
let g:NERDTreeIgnore = [
        \ 'node_modules',
        \ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
        \ '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$' ]


" emmet
let g:user_emmet_leader_key = '~'

"Configuracion autocompletado
" Deoplete
let deoplete_readme=expand('~/.vim/plugged/deoplete.nvim/README.md')
if filereadable(deoplete_readme)
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_auto_delimiter = 1
    let g:deoplete#force_overwrite_completefunc = 1

    " SuperTab like snippets behavior.
    imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \: pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \: "\<TAB>"

    " Some convenient mappings
    imap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
    imap <expr><C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
    imap <expr><Esc> pumvisible() ? "\<C-y>\<Esc>" : "\<Esc>"

    " deoplete-ternjs
    let g:deoplete#sources#ternjs#docs = 1

    " Enable heavy omni completion.
    if !exists('g:deoplete#sources#omni#input_patterns')
        let g:deoplete#sources#omni#input_patterns = {}
    endif
    let g:deoplete#sources#omni#input_patterns.c='[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
    let g:deoplete#sources#omni#input_patterns.cpp='[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
    let g:deoplete#sources#omni#input_patterns.xml='<[^>]*'
    let g:deoplete#sources#omni#input_patterns.html='<[^>]*'
    let g:deoplete#sources#omni#input_patterns.markdown='<[^>]*'
    let g:deoplete#sources#omni#input_patterns.css='^\s\+\w+\|\w+[):;]?\s\+\|[@!]'
    let g:deoplete#sources#omni#input_patterns.less='^\s\+\w+\|\w+[):;]?\s\+\|[@!]'
    let g:deoplete#sources#omni#input_patterns.javascript='[^. \t]\.\%(\h\w*\)\?'
    let g:deoplete#sources#omni#input_patterns.typescript='[^. \t]\.\%(\h\w*\)\?'
    let g:deoplete#sources#omni#input_patterns.json='[^. \t]\.\%(\h\w*\)\?'
    let g:deoplete#sources#omni#input_patterns.python='[^. *\t]\.\h\w*\|\h\w*::'
    let g:deoplete#sources#omni#input_patterns.ruby='[^. *\t]\.\w*\|\h\w*::'
    let g:deoplete#sources#omni#input_patterns.php='[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
    let g:deoplete#sources#omni#input_patterns.python3='[^. *\t]\.\h\w*\|\h\w*::'
    let g:deoplete#sources#omni#input_patterns.go='\h\w*\%.'
    let g:deoplete#sources#omni#input_patterns.perl='\h\w*->\h\w*\|\h\w*::'
    let g:deoplete#sources#omni#input_patterns.java='\%(\h\w*\|)\)\.'
endif

" ale config
let g:ale_enabled = 1
let g:ale_fix_on_save = 1
let g:jsx_ext_required = 0
let g:ale_lint_on_enter = 0
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 1
let g:ale_fixers = {
    \  'javascript': ['eslint', 'prettier'],
    \  'typescript': ['tslint', 'prettier'],
    \  'css': ['prettier'],
    \  'less': ['prettier'],
    \  'scss': ['prettier'],
    \  'json': ['prettier'],
    \  'graphql': ['prettier'],
    \  'markdown': ['prettier'],
    \  'vue': ['prettier'],
    \}
let g:ale_linters = {
    \  'javascript': ['stylelint', 'eslint'],
    \  'typescript': ['tslint'],
    \  'css': ['stylelint', 'eslint'],
    \}
let g:ale_set_signs = 1
let g:ale_sign_error='✗'
let g:ale_sign_warning ='⚠'

" Configuracion syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Mapeando teclas
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt : NERDTreeFind<CR>
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
