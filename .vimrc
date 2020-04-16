" clear last search pattern
let @/ = ""
" colorscheme
colorscheme tkiatd
" define variables
let mapleader=','
let template_dir= '~/dotfiles/.vim/template/'
let space_per_tab=2
" ========================================
"                                  iabbrev
" ========================================
" abbreviation
iabbrev emailend <bs><cr><cr>Best regards,<cr>Theerawat Kiatdarakun
" spelling correction
iabbrev adn and
iabbrev tehn then
iabbrev waht what
" ========================================
"                                 inoremap
" ========================================
" auto-closing ...
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap (<CR> (<CR>)<Esc>ko<tab>
inoremap [<CR> [<CR>]<Esc>ko<tab>
inoremap {<CR> {<CR>}<Esc>ko<tab>
" ========================================
"                                    netrw
" ========================================
let g:netrw_browse_split = 3 " open file in new tab
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro nornu' " enable line number
let g:netrw_liststyle = 3 " tree listing style"
" ========================================
"                                 nnoremap
" ========================================
" comment
:autocmd BufNewFile,BufRead *.py,*.sh,*.tmux.conf,*.zshrc nnoremap <buffer> <leader>c mqI# <esc>`qll
:autocmd BufNewFile,BufRead *.vim,*.vimrc nnoremap <buffer> <leader>c mqI" <esc>`qll
:autocmd BufNewFile,BufRead *.js,*.cpp nnoremap <buffer> <leader>c mqI// <esc>`qll
" uncomment
:autocmd BufNewFile,BufRead *.py,*.sh,*.tmux.conf,*.zshrc nnoremap <buffer> <leader>u mqI<del><del><esc>`qhh
:autocmd BufNewFile,BufRead *.vim,*.vimrc nnoremap <buffer> <leader>u mqI<del><del><esc>`qhh
:autocmd BufNewFile,BufRead *.js,*.cpp nnoremap <buffer> <leader>u mqI<del><del><esc>`qhh
" enclose word
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
" insert at the end of current line
nnoremap <leader>, mqA,<esc>`q
nnoremap <leader>; mqA;<esc>`q
" delete last character in current line
nnoremap <leader>a mq$x<esc>`q
" insert line
nnoremap <leader>o mqo<esc>`q
nnoremap <leader>O mqO<esc>`q
" open file
nnoremap <leader>oa :vsplit ~/.aliases<cr>
nnoremap <leader>oc :vsplit ~/.vim/colors/tkiatd.vim<cr>
nnoremap <leader>ov :vsplit $MYVIMRC<cr>
nnoremap <leader>oz :vsplit ~/.zshrc<cr>
" replace spaces with a tab until the first non-whitespace character
exe 'nnoremap <leader><tab> mq:%s/\(^ *\)\@<= \{'.space_per_tab.'\}/<tab>/g<cr>`q'
" toggle highlight
nnoremap <expr> <leader>hl (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"
" source file
nnoremap <leader>sv :source $MYVIMRC<cr>
" strip trailing whitespace
nnoremap <leader>ss mq:%s/\s\+$//<cr>`q
" template
nnoremap :shebang i#!/usr/bin/env<space>
exe 'nnoremap :html5 <ESC>:r '.template_dir.'html5.template<CR>kdd/body<CR>:nohl<CR>o<TAB>'
exe 'nnoremap :vue <ESC>:r '.template_dir.'vue.template<CR>kdd'
" ========================================
"                                      set
" ========================================
set autoindent " auto indent next line
set cursorline " highlight current line
set foldmethod=indent
set hlsearch " highlight searches
set ignorecase " ignore case when search
set incsearch " highlight while still typing search
set list " enable listchars
set listchars=eol:$,tab:\|·,trail:_
set nofoldenable " disable auto-folding at start
set number " show line number
set pumheight=10 " Pmenu max height
exe 'set shiftwidth='.space_per_tab
exe 'set tabstop='.space_per_tab
" ========================================
"                                 vnoremap
" ========================================
" map 2 tabs to 1 tab
vnoremap <leader><tab><tab> :s/\%V\t\t/\t/g<cr>:nohl<cr>
" comment
:autocmd BufNewFile,BufRead *.py,*.sh,*.tmux.conf,*.zshrc vnoremap <buffer> <leader>c :s/^\%V/# /g<cr>:nohl<cr>
:autocmd BufNewFile,BufRead *.vim,*.vimrc vnoremap <buffer> <leader>c :s/^\%V/" /g<cr>:nohl<cr>
:autocmd BufNewFile,BufRead *.js,*.cpp vnoremap <buffer> <leader>c :s/^\%V/\/\/ /g<cr>:nohl<cr>
" uncomment
:autocmd BufNewFile,BufRead *.py,*.sh,*.tmux.conf,*.zshrc vnoremap <buffer> <leader>u :s/^\%V# //g<cr>
:autocmd BufNewFile,BufRead *.vim,*.vimrc vnoremap <buffer> <leader>u :s/^\%V" //g<cr>
:autocmd BufNewFile,BufRead *.js,*.cpp vnoremap <buffer> <leader>u :s/^\%V\/\/ //g<cr>