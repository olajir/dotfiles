" ============================================================================
" Plugins (vim-plug) — kör :PlugInstall efter ändringar
" ============================================================================
call plug#begin('~/.vim/plugged')

" LSP-motorn och auto-kompletteringen
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Git-integration för sidomenyn (visar + och - tecken live)
Plug 'airblade/vim-gitgutter'

" Statusrad
Plug 'itchyny/lightline.vim'

" Integrera Claude Code
Plug 'rishi-opensource/vim-claude-code'

call plug#end()

" ============================================================================
" Allmänt
" ============================================================================
" Säkerställ fullt stöd för svenska tecken och UTF-8
set encoding=utf-8
set fileencodings=utf-8,latin1

" Radnummer och syntaxfärgning (matchar Alacritty-temat)
set number
syntax on

" Svensk stavningskontroll, avstängd vid start — F7 slår på/av
set spelllang=sv
set nospell
nnoremap <F7> :set spell!<CR>

" ============================================================================
" LSP och komplettering
" ============================================================================
" Visa kompletteringsmenyn så fort du börjar skriva
let g:asyncomplete_auto_popup = 1

" gd = hoppa till definitionen, K = visa dokumentationen
nmap gd <plug>(lsp-definition)
nmap K <plug>(lsp-hover)

" ============================================================================
" Statusrad (Lightline)
" ============================================================================
" Visa alltid statusraden, och dölj -- INSERT -- eftersom Lightline visar läget
set laststatus=2
set noshowmode

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
