" ESSENTIAL CONFIG ===========================================================->

" ====== General Config ======

" evita usar configuração padrão do Editor Vi
" força usar configuração do Vim como padrão
set nocompatible

set title                         " muda o título do terminal
set ruler                         " Mostra barra de status com posição do cursor
set cursorline                    " show line in the actual position
set showmatch                     " Mostra character correspondente (), [], {}, etc...
set number                        " Exibe a numeração das linhas
set backspace=indent,eol,start    " Permite 'backspace' no modo de inserção
set history=1000                  " Limita o histórico de comandos até 1000 linhas
set gcr=a:blinkon0                " Disable cursor blink
set visualbell                    " No sounds
set autoread                      " Reload files changed outside vim
set showmode                      " Show current mode down the bottom
set showcmd                       " Show incomplete cmds down the bottom
set autowrite                     " Gravação automática a cada alteração
set showcmd                       " Mostra o comando sendo executado
set clipboard=unnamedplus         " copy clipboard
set ignorecase                    "faz o vim ignorar maiúsculas e minúsculas nas buscas
" set statusline=%<%f\ %h%w%m%r%y%=L:%l/%L\ (%p%%)\ C:%c%V\ B:%o\ F:%{foldlevel('.')}

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" Desativa SWAP
set noswapfile
set nobackup
set nowb

" muda o mapeamento da '\' para ','
let mapleader=","

" ====== Indentation ======

" autocmd FileType html setlocal shiftwidth=2 abstop=2
" autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4

" Indentação Automática
set smartindent
set autoindent                    " Auto indentação
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
" retab                           " Converte os TABs já existentes
" set et                          " Troca tabs poe espaços

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" ====== PESQUISA ======
set incsearch                     " Find the next match as we type the search
set hlsearch                      " Highlight searches by default
set ignorecase                    " Ignore case when searching...
set smartcase                     " ...unless we type a capital

set number
syntax on
filetype plugin indent on

set number
set tabstop=2
set shiftwidth=2
set hls
set smartindent
" set list listchars=tab:\ \ ,trail:
" set noswapfile

" ====== Folds ======

set foldmethod=indent             "fold based on indent
set foldnestmax=3                 "deepest fold is 3 levels
set nofoldenable                  "don't fold by default

" ====== Completion ======

set wildmode=list:longest
set wildmenu                      "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~       "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" Desabilita gerar linhas de comentários automaticamente
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" ====== Scrolling ======

set scrolloff=8                   "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ====== Auto Corretor Vim ======

" Ativa corretor

" Ativa o corretor para pt_BR
nnoremap <leader>pt :set spell spelllang=pt<CR>
" Ativa o corretor para en_US
nnoremap <leader>en :set spell spelllang=en<CR>
" Ativa o corretor para pt e en juntos
nnoremap <leader>pe :set spell spelllang=pt,en<CR>

" Comandos
" ]s        vai para a próxima palavra;
" [s        vai para a palavra anterior;
" ]z=       mostra a lista de sugestões para a palavra;
" zg        adiciona a palavra sob o cursor no dicionário, assim ela não será mais marcada como errada;
" zug       desfaz a última palavra adicionada;
" zw        remove a palavra sob o cursor do dicionário, assim ela será marcada como errada;
" zuw       desfaz a última palavra removida.

" Cores para o corretor
hi SpellCap ctermfg=Gray ctermbg=Blue
hi SpellBad ctermfg=Gray ctermbg=DarkRed

" ==========================================================|| ESSENTIAL CONFIG



" ESSENTIAL MAPS ===========================================================->

" ====== Recarrega o vimrc ======

if &term == "win32" || "pcterm" || has("gui_win32")
  map ,v :e $HOME/_vimrc<CR>
  nmap <F5> :<C-u>source ~/_vimrc <BAR> :nohl <BAR> echo "Vimrc recarregado!"<CR>
else
  map ,v :e $HOME/.vimrc<CR>
  nmap <F5> :<C-u>source ~/.vimrc <BAR> :nohl <BAR> echo "Vimrc recarregado!"<CR>
endif

" ====== Salvando e Saindo ======

" Salva todas as janelas abertas
nmap <C-o> :wall <CR>

" Fecha janela
nmap <C-x> :q<CR>

" Fecha todas as janelas abertas
nmap <leader>x :qall<CR>

" Força sair, mesmo sem salvar
nmap <C-f> :q!<CR>

" ====== Seleção de Texto =======

" Limpa seleção de texto
nmap <C-c> :nohl<CR> :set nospell<CR>

" ====== Copiar e Colar ======

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Clipboard
" É necessário ter instalado o 'vim-gnome'
vnoremap <C-C> "+y
vnoremap <C-V> "+p
nmap <Leader>y "+y
nmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Move linhas
nnoremap <Down> :m .+1<CR>==
nnoremap <Up> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" ====== Desabilita Setas ======

" Desabilita as setas no mode de comando
nmap <up> <nop>
nmap <down> <nop>
nmap <left> <nop>
nmap <right> <nop>

" Desabilita as setas no mode de comando
vmap <up> <nop>
vmap <down> <nop>
vmap <left> <nop>
vmap <right> <nop>

" Desabilita as setas no mode de inserção
" imap <up> <nop>
" imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>

" ====== TABS ======

" TAB - modo de commando
noremap <Tab> >>
noremap <S-Tab> <<

" TAB - modo de inserção
inoremap <S-Tab> <BS>

" TAB - modo visual
vnoremap <Tab> >gV
vnoremap <S-Tab> <gV

" ====== JEKYLL ======

" gera '{{  }}' com o cursor no meio
imap <leader>[ {{  <left>

" gera '{%= }' o cursor no meio
imap <leader>= {%= %<left><left>

" gera '{%  %}' com o cursor no meio
imap <leader>% {%  %<left><left>

" seleciona+recorta a palavra em baixo do cursor e a coloca dentro do '{{  }}'
map <leader>] #NvEdi{{  <left><ESC>p:nohl<CR>a

" recorta a palavra selecionada e a coloca dentro do '{{  }}'
map <leader>[ di{{  <left><ESC>pa

" recorta a palavra selecionada e a coloca dentro do '{%= %}'
map <leader>= di{%=  %<left><left><left>pa

" recorta a palavra selecionada e a coloca dentro do '{%  %}'
map <leader>% di{%  %<left><left>pa

" ==========================================================|| ESSENTIAL MAPS



" MOUSE CONFIG" ==============================================================->

"set mouse=a
"map <ScrollWheelUp> <C-Y>
"map <ScrollWheelDown> <C-E>

" ===============================================================|| MOUSE CONFIG



" WINDOW CONFIG ==============================================================->

" ====== Rolagem Automática na Página com 'zz' ======

"zz automático quando desce j
nnoremap j zzj

"zz automático quando sobe k
nnoremap k zzk

"zz automático quando pula {
nnoremap { zz{

"zz automático quando pula }
nnoremap } zz}

"zz automático quando pula (
nnoremap ( zz(

"zz automático quando pula )
nnoremap ) zz)

"zz automático quando da ENTER em modo de INSERÇÃO
inoremap <CR> <CR><ESC>zzi

" ====== Redimensionar / Mover Telas ======

" Redimensionar telas
nnoremap <C-Up> <C-w>+
nnoremap <C-Down> <C-w>-
nnoremap <C-Left> <C-w><
nnoremap <C-Right>  <C-w>>

" Mover Telas
nnoremap <S-Up> <C-w>K
nnoremap <S-Down> <C-w>J
nnoremap <S-Left> <C-w>H
nnoremap <S-Right> <C-w>L

" Dividir Telas
nmap <Leader>o :sp<CR>
nmap <Leader>e :vsp<CR>

" Navegação entre telas
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" ==============================================================|| WINDOW CONFIG



" PLUGINS CONFIG =============================================================->

" ====== Executa os Plugins ao Iniciar o Vim ======
" execute pathogen#infect()
" :call pathogen#helptags()

" ====== PLUGIN : VIM-AIRLINE-THEMES ======

" let g:airline_theme='durant'

" ====== PLUGIN : AIR-LINE ======

" ativa o vim-airline
let g:airline#extensions#tabline#enabled = 1

" font + icons
let g:airline_powerline_fonts=1

" define color para o terminal
set t_Co=256

" ícones na lista de navegação
let g:webdevicons_enable = 1

" Always show statusline
set laststatus=2


" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 1"

" ====== PLUGIN : NERDTHREE ======

" barra lateral para navegação entre arquivos
map <C-\> :NERDTreeToggle<CR>

"DTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" ====== PLUGIN : VIM INSTANT MARKDOWN ======

" ativação manual
let g:instant_markdown_autostart = 0

" ====== PLUGIN : COMMAND-T ======

" localizador de arquivos e pastas
nmap <Leader>t <ESC>:CommandT<cr>
nmap <Leader>b <Plug>(CommandTBuffer)
"nmap <Leader>j <Plug>(CommandTJump)

" ====== PLUGIN : VIM--CLOSETAG ======

" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

" ====== PLUGIN : EMMET Autocomplete command ======

" atalhos para gerar html
imap <C-Space> <C-y>,
imap <C-@> <C-y>,

" ====== PLUGIN : SNIPMATE ======

" ativa o contexto de ruby jutamente com rails
let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,rails'


" ====== PLUGIN : LIGHTLINE-SETUP ======
" =============================================================|| PLUGINS CONFIG



" VUNDLE =====================================================================->

set nocompatible              " be iMproved, required
filetype off                  " required

" ====== Begin Plugins ======
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"
Plugin 'altercation/vim-colors-solarized'

" Vim Fugitive - Permite comandos do GIT dentro do Vim
Plugin 'tpope/vim-fugitive'

" Smart Tab - Mantem a posição e a indentação do TAB
Plugin 'dpc/vim-smarttabs'

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Command T - Navegar entre arquivos
Plugin 'git://git.wincent.com/command-t.git'

" Nerdtree - Barra lateral de navegação entre pastas
Plugin 'scrooloose/nerdtree'

" Air Line - Barra de status e título
" Trabalha junto com o Powerline aplicando no vim
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Vim Instant Markdown - Pré visualização de arquivos markdown
Plugin 'suan/vim-instant-markdown'

" Emmet - Snippets HTML
Plugin 'mattn/emmet-vim'

" Vim Markdown - Reconhece a sintaxe Markdown
Plugin 'plasticboy/vim-markdown'

" Auto Pairs - Fecha pares automaticamente: (), [], {}, ...
Plugin 'jiangmiao/auto-pairs'

" SnipMate - Snippets diversos semelhante TextMate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'       " Optional

" Vim ColeTag - Fecha automaticamente as tags
Plugin 'git@github.com:alvan/vim-closetag.git'

" Vim DevIcons - Icons
Plugin 'ryanoasis/vim-devicons'

" ====== End Plugins ======
call vundle#end()            " required
filetype plugin indent on    " required

" =====================================================================|| VUNDLE



" APARÊNCIA =================================================================->

" Theme
"set background=dark
"  let transparent=256
"  hi Normal          ctermfg=252 ctermbg=none
" hi Normal ctermbg=none

" ====== Solarized ======

syntax enable
" Solarized Dark
set background=dark
" Solarized Light
" set background=light

" Essas configurações devem ser inseridas antes do 'colorscheme'
" g:solarized_termcolors= 16 | 256
" g:solarized_termtrans = 0 | 1
" g:solarized_degrade = 0 | 1
" g:solarized_bold = 1 | 0
" g:solarized_underline = 1 | 0
" g:solarized_italic = 1 | 0
" g:solarized_contrast = “normal”| “high” or “low”
" g:solarized_visibility= “normal”| “high” or “low”

" Ignora as cores do terminal,aplica as cores do tema solarized
" let g:solarized_termcolors=256
let g:solarized_termtrans = 1
let g:solarized_contrast = "high"
let g:solarized_visibility = "high"

colorscheme solarized

" ==================================================================|| APARÊNCIA
