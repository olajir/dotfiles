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

