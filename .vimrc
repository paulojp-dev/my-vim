

" ESSENTIAL CONFIG ===========================================================->
" **** CONFIG ****
set cursorline										" show line in the actual position
set showmatch											" Mostra caracter correspondente (), [], {}, etc...
set ruler													" Mostra barra de status com posição do cursor
set nohls													" Não seleciona resultados da busca. set hls para exibir
set numberwidth=5									" Largura da barra com número das linhas
set scrolloff=5										" Número de linhas visíveis durante o scrolls
set laststatus=2									" Número de linhas para a barra de status
set clipboard=unnamedplus					" copy clipboard
set statusline=%<%f\ %h%w%m%r%y%=L:%l/%L\ (%p%%)\ C:%c%V\ B:%o\ F:%{foldlevel('.')}

set number
syntax on
filetype plugin indent on

set number
set tabstop=2
set shiftwidth=2
set hls
set smartindent
set list listchars=tab:\ \ ,trail:·					" show spaces"
set noswapfile

" ---- MAPS -----
" SALVANDO/SAINDO
" permite mapear a ','
let mapleader=","
" salva todas as janelas abertas
nmap <C-o> :wall <CR>
" fecha janela
nmap <C-x> :q<CR>
" fecha todas as janelas abertas
nmap <leader>x :qall<CR>
" força sair, mesmo sem salvar
nmap <C-f> :q!<CR>

" SELEÇÃO DE TEXTO
" limpa seleção de texto
nmap <C-c> :nohl<CR>

" COPY and PAST
vmap <C-C> "+y
vmap <C-V> "+p

" CARREGANDO NOVAS CONFIGURAÇÕES
" da um 'source' no arquivo atual
nmap <leader>rf :so %<CR>:nohl<CR>
" da um 'source' no vimrc
nmap <leader>rv :so $MYVIMRC<CR>:nohl<CR>

" FECHAMENTO DE PARES
" imap { {}<left>
" imap ( ()<left>
" imap [ []<left>

" DESABILITA SETAS
" noremap <Up>    :echo "NOP!"<cr>
" noremap <Down>  :echo "NOP!"<cr>
" noremap <Left>  :echo "NOP!"<cr>
" noremap <Right> :echo "NOP!"<cr>

" DESABILITA SETAS
" desabilita as setas no mode de comando
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
" desabilita as setas no mode de inserção
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" TABS
" tabs - modo de commando
noremap <Tab> >>
noremap <S-Tab> <<
" tabs - modo de inserção
inoremap <S-Tab> <BS>
" tabs - modo visual
vnoremap <Tab> >gV
vnoremap <S-Tab> <gV
" ==========================================================|| ESSENTIAL CONFIG


" CODE MAPS" ==============================================================->
" JEKYLL
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
" ===============================================================|| MOUSE CONFIG


" MOUSE CONFIG" ==============================================================->
"set mouse=a
"map <ScrollWheelUp> <C-Y>
"map <ScrollWheelDown> <C-E>
"" ===============================================================|| MOUSE CONFIG


" WINDOW CONFIG ==============================================================->
" ---- MAPS ----
" AUTOMÁTICO 'zz'
"zz automático quando desce j
nnoremap j zzj
"zz automatico quando sobe k
nnoremap k zzk
"zz automatico quando pula {
nnoremap { zz{
"zz automatico quando pula }
nnoremap } zz}
"zz automatico quando pula (
nnoremap ( zz(
"zz automatico quando pula )
nnoremap ) zz)
"zz automatico quando da ENTER em modo de INSERÇÃO
inoremap <CR> <CR><ESC>zzi

" REDIMENSIONAR TELAS
nnoremap <C-Up> <C-w>+
nnoremap <C-Down> <C-w>-
nnoremap <C-Left> <C-w><
nnoremap <C-Right>  <C-w>>

" MOVER TELAS
nnoremap <S-Up> <C-w>K
nnoremap <S-Down> <C-w>J
nnoremap <S-Left> <C-w>H
nnoremap <S-Right> <C-w>L

" NAVEGAÇÃO ENTRE TELAS
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>
" ==============================================================|| WINDOW CONFIG


" PLUGINS CONFIG =============================================================->
" EXECUTA PLUGINS
execute pathogen#infect()										
:call pathogen#helptags()

" PLUGIN : NERDTHREE
" https://github.com/scrooloose/nerdtree
" barra lateral para navegação entre arquivos
map <C-\> :NERDTreeToggle<CR>
"DTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
	exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
	exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" PLUGIN : VIM INSTANT MARKDOWN
" https://github.com/suan/vim-instant-markdown
" prévisualização de arquivos markdown
" ativação manual
let g:instant_markdown_autostart = 0

" PLUGIN : COMMAND-T
" https://github.com/wincent/Command-T
" localizador de arquivos e pastas
nmap <Leader>t <ESC>:CommandT<cr>
nmap <Leader>b <Plug>(CommandTBuffer)
nmap <Leader>j <Plug>(CommandTJump)
nmap <Leader>o :sp<CR>
nmap <Leader>e :vsp<CR>
vmap <Leader>y "+y"
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" PLUGIN : VIM--CLOSETAG
" https://github.com/alvan/vim-closetag
" fecha tags html automaticamente
" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

" PLUGIN : EMMET Autocomplete command
" https://github.com/mattn/emmet-vim
" atalhos para gerar html
imap <C-Space> <C-y>,
imap <C-@> <C-y>,

" PLUGIN : VIM-MARKDOWN
" https://github.com/plasticboy/vim-markdown
" ativa o reconhecimento da sintaxe + atalhos

" PLUGIN : AUTO-PAIRS
" https://github.com/jiangmiao/auto-pairs
" fecha pares automaticamente
" =============================================================|| PLUGINS CONFIG

" APARÊNCIA =================================================================->
" Theme
set background=dark
let transparent=256
" hi Normal          ctermfg=252 ctermbg=none
colorscheme transparent
" =============================================================|| APARÊNCIA