" Starta pakethanteraren Vim-plug
call plug#begin('~/.vim/plugged')

" Installera LSP-motorn och auto-kompletteringen
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Git-integration för sidomenyn (visar + och - tecken live)
Plug 'airblade/vim-gitgutter'

" Integrerar uv / virtuella Python-miljöer direkt i Vim
Plug 'linux-cultist/venv-selector.nvim'


call plug#end()

" Slå på auto-kompletteringsmenyn så fort du börjar skriva
let g:asyncomplete_auto_popup = 1

" Genvägar för kodnavigering (Vim-style):
" Tryck 'gd' på en funktion för att hoppa till där den definierades (Go to Definition)
nmap gd <plug>(lsp-definition)
" Tryck 'K' (skift + k) på ett ord för att se dokumentationen live på skärmen
nmap K <plug>(lsp-hover)

" Säkerställ fullt stöd för svenska tecken och UTF-8
set encoding=utf-8
set fileencodings=utf-8,latin1

" Aktivera radnummer och syntaxfärgning (matchar ditt Alacritty-tema!)
set number
syntax on

" Konfigurera svensk stavningskontroll (men ha den avstängd vid start)
set spelllang=sv
set nospell

" Smidig Vim-genväg för att slå på/av stavning med tangenten F7
nmap <F7> :set spell!<CR>

" Tvinga Vim att alltid visa statusraden (även om bara ett fönster är öppet)
set laststatus=2

" Dölj det gamla standard-läget (-- INSERT --) eftersom Lightline visar det snyggare
set noshowmode

" Konfigurera Lightline-temat och färger
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ }
      \ }

