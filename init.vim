filetype off                  " required

let g:coc_global_extensions = [
\ 'coc-ultisnips',
\ 'coc-snippets',
\ 'coc-highlight',
\ 'coc-zi',
\ 'coc-json',
\ 'coc-git',
\ 'coc-yaml',
\ 'coc-tsserver',
\ 'coc-python',
\ 'coc-html',
\ 'coc-css',
\ 'coc-vetur',
\ 'coc-flutter',
\ ]

call plug#begin('~/.config/vim/plugged')

""""""""""""""""""""""""""""""""""""""""""""""""
"      ____   __               _               "
"     / __ \ / /__  __ ____ _ (_)____   _____  "
"    / /_/ // // / / // __ `// // __ \ / ___/  "
"   / ____// // /_/ // /_/ // // / / /(__  )   "
"  /_/    /_/ \__,_/ \__, //_//_/ /_//____/    "
"                   /____/                     "
""""""""""""""""""""""""""""""""""""""""""""""""

" let Vundle manage Vundle, required "
" Plugin 'VundleVim/Vundle.vim'

" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}

" Make plugin commands repeatable "
Plug 'tpope/vim-repeat'

Plug 'mhinz/vim-grepper'

" More actions "
Plug 'tpope/vim-surround'              " (s)       To surround
Plug 'christoomey/vim-sort-motion'     " (gs)      To sort
Plug 'vim-scripts/ReplaceWithRegister' " (gr)      Replace with buffer
Plug 'tommcdo/vim-ninja-feet'          " (gr)      Replace with buffer
Plug 'junegunn/vim-easy-align'         " (ga)      To align


" More text objects "
Plug 'vim-scripts/argtextobj.vim'         " (a)       Argument
Plug 'bkad/CamelCaseMotion'               " (,w)      CamelCaseWords
Plug 'michaeljsmith/vim-indent-object'    " (i)       Indent blocks

Plug 'kana/vim-textobj-user'              " Enables the ones below
Plug 'glts/vim-textobj-comment'           " (c)       Comments
Plug 'akiyan/vim-textobj-php'             " (P)       PHP tag
Plug 'beloglazov/vim-textobj-quotes'      " (q)       Any type of quote (even from outside the quotes
Plug 'kana/vim-textobj-line'              " (l)       Line
Plug 'kana/vim-textobj-entire'            " (e)       Entire file

" Movement aids "
Plug 'unblevable/quick-scope'           " Highlight unique characters for word in active line
Plug 'easymotion/vim-easymotion'        " Figure out later

" Programming "
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() } }
Plug 'majutsushi/tagbar'
Plug 'terryma/vim-multiple-cursors'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'

Plug 'posva/vim-vue'
Plug 'leafOfTree/vim-vue-plugin'

Plug 'vim-scripts/a.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'vim-test/vim-test'
Plug 'xolox/vim-misc'
Plug 'Raimondi/delimitMate'
Plug 'kien/rainbow_parentheses.vim'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'mechatroner/minimal_gdb'

Plug 'thosakwe/vim-flutter'
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'

Plug 'hashivim/vim-terraform'

" OpenHAB
Plug 'cyberkov/openhab-vim'

" Android "
Plug 'hsanson/vim-android'

" ----- Syntax plugins ------------------------------------------------"
Plug 'jez/vim-c0'
Plug 'jez/vim-ispc'
Plug 'kchmck/vim-coffee-script'

"Python

" lists
Plug 'dkarter/bullets.vim'

" folding
Plug 'Konfekt/FastFold'
Plug 'tmhedberg/SimpylFold'

" Airline "
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" HTML "
Plug 'mattn/emmet-vim'

" Java "
"Plugin 'dansomething/vim-eclim'
Plug 'Shougo/unite.vim'

" Scala "
Plug 'derekwyatt/vim-scala'
Plug 'jceb/vim-hier'

" Markdown "
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
" Align CSV files at commas, align Markdown tables, and more "
Plug 'godlygeek/tabular'
" Plugin 'nelstrom/vim-markdown-folding'
" Plugin 'plasticboy/vim-markdown'
" Plugin 'drmingdrmer/vim-syntax-markdown'
Plug 'dhruvasagar/vim-table-mode'

" Latex "
Plug 'lervag/vimtex'

" files"
Plug 'scrooloose/nerdtree'
" Plug 'jistr/vim-nerdtree-tabs'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

" Git "
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

"
Plug 'tpope/vim-unimpaired'

" Formatting"
" Plug 'vim-syntastic/syntastic'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-commentary'
 Plug 'suy/vim-context-commentstring'

" autocompletion"
Plug 'vim-scripts/loremipsum'
"Plugin 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Plug 'xolox/vim-easytags'

" To do list "
Plug 'vitalk/vim-simple-todo'

" Ricing "
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
" Plugin 'Valloric/YouCompleteMe'
"
"My own stuff (remember to port)"
Plug 'tmhedberg/matchit'
Plug 'sickill/vim-pasta'
" Plug 'ervandew/supertab'
Plug 'vim-scripts/ZoomWin'

" ---- Extras/Advanced plugins ---------------------------------------- "
" Highlight and strip trailing whitespace "
Plug 'ntpeters/vim-better-whitespace'
" Automaticall insert the closing HTML tag "
"Plugin 'HTML-AutoCloseTag'
" All the other syntax plugins I use "
Plug 'ekalinin/Dockerfile.vim'
Plug 'digitaltoad/vim-jade'
Plug 'tpope/vim-liquid'
Plug 'cakebaker/scss-syntax.vim'
" All of your Plugins must be added before the following line "

" call vundle#end()            " required
call plug#end()
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" let g:fzf_preview_window = 'right:60%'


let g:lsc_auto_map = v:true


" emmet settings
let g:user_emmet_leader_key=','

let mapleader=","

hi clear SignColumn

" hi clear SpellBad
hi SpellBad cterm=underline

" NERDTree
" nnoremap gn :NERDTreeTabsToggle<CR>
nnoremap gn :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "left"
let NERDTreeWinSize = 39
"autocmd vimenter * NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let NERDTreeMinimalUI=1
let NERDTreeShowLineNumbers=1
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
"let g:NERDTreeShowIgnoredStatus = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "●",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Snippets
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" let g:UltiSnipsSnippetDirectories=["~/.vim/bundle/vim-snippets/UltiSnips"]


" Same command as:
" imap <C-l> <Plug>(coc-snippets-expand) " Use <C-l> for trigger snippet expand.
" Except expands all folds first, if you find a better solution of not having
" the snippet fold after insert, replace it.

nnoremap <Leader>R
            \ :let @s='\<'.expand('<cword>').'\>'<CR>
            \ :Grepper -cword -noprompt -nohighlight<CR>
            \ :cfdo %s/<C-r>s//g \| update
            \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

vnoremap <Leader>F
            \ :<bs><bs><bs><bs><bs>let @s=getline("'<")[getpos("'<")[2]-1:getpos("'>")[2]-1]<CR>
            " \ :let @q=substitute(@s, "'", "\\\\'", "")<CR>
            \ :Grepper -noprompt -nohighlight -query '<C-r>q'

vnoremap <Leader>R
            \ :<bs><bs><bs><bs><bs>let @s=getline("'<")[getpos("'<")[2]-1:getpos("'>")[2]-1]<CR>
            \ :Grepper -noprompt -nohighlight -query '<C-r>q'
            \ :cfdo %s/<C-r>s//g \| update
            \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

nnoremap <Leader>F
            \ :let @s='\<'.expand('<cword>').'\>'<CR>
            \ :Grepper -cword -noprompt -nohighlight<CR>

set switchbuf+=usetab,newtab

imap <C-l> <C-o>:set foldlevel=20<cr><Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_cpp_include_dirs = [ 'inc' ]
" " let g:syntastic_cpp_remove_include_errors=1
" "let g:syntastic_cpp_checkers = [ "g++" ]
" let g:ycm_register_as_syntastic_checker = 0

"let g:syntastic_cpp_config_file = '.syntastic_cpp_config'

" let g:syntastic_error_symbol = '✘'
" let g:syntastic_warning_symbol = "▲"

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_python_checkers = ['pylint', 'mypy']
" " let g:syntastic_python_flake8_post_args='--ignore=E501'

augroup mySyntastic
    au!
    au FileType tex let b:syntastic_mode = "passive"
augroup END

"vim-airline"
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.space = "\ua0"

let g:vimtex_compiler_latexmk = {'callback' : 0}
let g:tex_flavor = 'latex'

" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

function! ReturnTagFileUnderCursor()
    try
        let tag = expand('<cword>')
        let tagString = split(execute("tselect ".tag), "\n")[1]
        let tagString = matchstr(tagString, '[^/\\]*$')
        execute "tab drop" tagString
        execute "tag" tag
        return tagString
    catch /^Vim\%((\a\+)\)\=:E426/
        echohl ERROR
        echo "Tag not found!"
        echohl NORMAL
        return ""
    endtry
endfunction

nnoremap gu :call ReturnTagFileUnderCursor()<CR>
nnoremap gi <C-o><C-o>

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
" nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)


" ----- airblade/vim-gitgutter settings -----
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1


" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
    au!
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    au FileType tex let b:delimitMate_quotes = ""
    au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
    au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

"---

au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

" turn the current line into ascii art with wrapping
nnoremap <Leader>aa :normal 0"bD<CR>
            \:let @b=shellescape(@b, 1)<CR>
            \:call append(line("."), "")<CR>
            \:let @c='#'<CR>
            \:normal 80"cP<CR>
            \:r !figlet -c -f slant -w 78 <C-r>b \| sed 's/^/\# /'<CR>
            \:normal j80"cP<CR>
" " turn the current line into ascii art without wrapping
nnoremap <Leader>ai :normal 0"bD<CR>
            \:let @b=shellescape(@b, 1)<CR>
            \:call append(line("."), "")<CR>
            \:let @c='#'<CR>
            \:normal 80"cP<CR>
            \:r !figlet -f slant -w 1000 <C-r>b \| sed 's/^/\# /'<CR>
            \:normal j80"cP<CR>

"#sh: command substitution: line 1: `getline('.')'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        ______                           __
"                       / ____/__  ____  ___  _________ _/ /
"                      / / __/ _ \/ __ \/ _ \/ ___/ __ `/ /
"                     / /_/ /  __/ / / /  __/ /  / /_/ / /
"                     \____/\___/_/ /_/\___/_/   \__,_/_/
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Some basics:
    " Spaces by default
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab

    " Look and feel
    syntax on
    set encoding=UTF-8
    set number
    set relativenumber
    set ruler
    set showcmd
    set mouse=""

    colorscheme gruvbox
    set background=dark
    set t_Co=256
    set laststatus=2
    "hi Normal guibg=NONE ctermbg=NONE

    " Vislualising code
    set incsearch
    set hlsearch
    nnoremap <ESC><ESC> :nohlsearch<CR>:hi clear SpellBad<CR>
    set cursorline
    set list
    set showbreak=↪\
    set listchars=nbsp:☠,tab:▸\ ,trail:•,precedes:←,extends:→
    highlight SpecialKey ctermfg=240

    set textwidth=80 "default TW"
    set colorcolumn=+1 "TW+1"
    "function! s:SetColorColumn()
    "    if &textwidth == 0
    "        setlocal colorcolumn=81
    "    else
    "        setlocal colorcolumn=+1
    "    endif
    "endfunction

    "augroup colorcolumn
    "    autocmd!
    "    autocmd OptionSet textwidth call s:SetColorColumn()
    "    autocmd BufEnter * call s:SetColorColumn()
    "augroup end

    " Other
    set backspace=indent,eol,start
    set copyindent
    set preserveindent

" close only window on :q
    let bclose_multiple = 0
    cnoreabbrev bc Bclose

let g:WebDevIconsUnicodeGlyphDoubleWidth = 1

set completeopt-=preview

" COC settings
"
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap io <Plug>(coc-classobj-i)
omap io <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>



" FZF
" let $FZF_DEFAULT_COMMAND = 'rg --no-ignore-vcs --files --hidden --glob "!node_modules/*" --glob "!.git/*"'
let $FZF_DEFAULT_COMMAND = 'rg --no-ignore-vcs --files
            \ --hidden
            \ --glob "!*node_modules/*"
            \ --glob "!*.pytest_cache/*"
            \ --glob "!*.mypy_cache/*"
            \ --glob "!.git/*"
            \ '
nnoremap <c-p> :Files<cr>
nnoremap gp :Tags<cr>

" nnoremap <leader>' :CtrlPTag<cr>
" let g:ctrlp_show_hidden = 1
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow
set splitright

" Automatically deletes all tralling whitespace on save.
function RemoveTrailingWhiteSpace()
    norm!m`
    %s/\s\+$//e
    norm!``
endfunction

autocmd BufWritePre * call RemoveTrailingWhiteSpace()

" Add all subfolders to search path
set path+=**

" Might not need
set shell=sh

set hidden
set confirm
set nobackup
set nowritebackup

" Controlls

    " Copy and cut
    vnoremap <C-c> "+y
    vnoremap <C-d> "+d
    vnoremap <C-x> "+d

    " paste with and without formatting
    inoremap <c-v> <esc>:set paste<cr>a<c-r>=getreg('+')<cr><esc>:set nopaste<cr>mi`[=`]`ia
    inoremap <c-b> <esc>:set paste<cr>a<c-r>=getreg('+')<cr><esc>:set nopaste<cr>a

    "
    " imap <c-.> <C-t>
    " imap <c-,> <C-d>

    nnoremap gmt <C-W>T
    " close current buffer
    " nnoremap <leader>q :bp<cr>:bd #<cr>

"     " switch between .h and .cpp
    nnoremap <silent> ~ :AV<cr>
"     nnoremap gaa :A<cr>
"     nnoremap gat :AT<cr>
"     nnoremap gas :AS<cr>
"     nnoremap gav :AV<cr>

    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)

    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)


    " Tabs
    nnoremap <TAB> :tabn<cr>
    nnoremap <S-TAB> :tabp<cr>

    nnoremap <F13>i <C-i>
    nnoremap <F14>i g;
    nnoremap <F14>o g,

    " Ctrl sends a different character instead of just the ctrl, this makes crtl
    " and tab together impossible since tab=ctrl+i
    "nnoremap <C-TAB> :-tabmove<cr>
    "nnoremap <C-S-TAB> :+tabmove<cr>
    "

    nnoremap gt :tabnew<cr>
    cnoreabbrev qq tabclose

    "Turn off arrow keys
    noremap <Up> <NOP>
    noremap <Down> <NOP>
    noremap <Left> <NOP>
    noremap <Right> <NOP>

    " make W not Wall
    :command -nargs=* W :w "<args>"

    " Shortcutting split navigation, saving a keypress:
    map <C-h> :wincmd h<CR>
    map <C-j> :wincmd j<CR>
    map <C-k> :wincmd k<CR>
    map <C-l> :wincmd l<CR>

    " Folding
    " syn match MyEmptyLines "\(^}\s*\n\)\+" fold
    " syn sync fromstart
    set foldmethod=syntax
    nnoremap <Space> za
    " inoremap <C-j> :set

    " set foldopen=all
    " set foldopen-=block
    " set foldopen-=hor
    " set foldopen-=insert
    " set foldopen-=jump
    " set foldopen-=mark
    " set foldopen-=percent
    " set foldopen-=quickfix
    " set foldopen-=search
    " set foldopen-=tag
    " set foldopen-=undo


    set wildmode=longest:full,full

    augroup vimrc_todo
        au!
        au Syntax * syn match MyTodo /\v<(FIXME|NOTE|TODO|OPTIMIZE|XXX):/
            \ containedin=.*Comment,vimCommentTitle
    augroup END
    hi def link MyTodo Todo

    " nnoremap K :call WrapLineBoii()<CR>
    nnoremap K gqq

    function! WrapLineBoii()
        if col('$') > 80
            execute "normal! 82|F bf s\n"
        else
            norm j
        endif
    endfunction

    " guard for distributions lacking the 'persistent_undo' feature.
    if has('persistent_undo')
        " define a path to store persistent undo files.
        let target_path = expand('~/.config/vim-persisted-undo/')
        " create the directory and any parent directories
        " if the location does not exist.
        if !isdirectory(target_path)
            call system('mkdir -p ' . target_path)
        endif
        " point Vim to the defined undo directory.
        let &undodir = target_path
        " finally, enable undo persistence.
        set undofile
    endif

    map - $

    function! MakeSilentCommand()
        execute "Make! from_vim_with_love \"%\""
    endfunction

    function! MakeCommand()
        execute "w"
        execute "Make from_vim_with_love \"%\""
    endfunction

    function! MakeCommandAndShow()
        execute "w"
        execute "Make! from_vim_with_love \"%\""
        execute "Copen"
        execute "normal! "
    endfunction

    function! RunCommand()
        execute "w"
        execute "Make from_vim_with_love \"%\" run"
    endfunction

    function! RunCommandAndShow()
        execute "w"
        execute "Make from_vim_with_love \"%\" run"
        execute "Copen"
        execute "normal! "
    endfunction

    function! TestCommand()
        execute "w"
        execute "Make from_vim_with_love \"%\" test"
    endfunction

    " Global Make command
    inoremap <F5> <Esc>:call MakeCommand()<CR>a
    nnoremap <F5> :call MakeCommand()<CR>

    " Global run command
    inoremap <F6> <Esc>:call RunCommand()<CR>a
    nnoremap <F6> :call RunCommand()<CR>

    " Global make and show output command
    inoremap <F7> <Esc>:call MakeCommandAndShow()<CR>a
    nnoremap <F7> :call MakeCommandAndShow()<CR>

    " Global run and show output command
    inoremap <F8> <Esc>:call RunCommandAndShow()<CR>a
    nnoremap <F8> :call RunCommandAndShow()<CR>

    inoremap <F9> <Esc>:TestLast<CR>a
    nnoremap <F9> :TestLast<CR>

    inoremap <F10> <Esc>:TestNearest<CR>a
    nnoremap <F10> :TestNearest<CR>

    inoremap <F11> <Esc>:TestFile<CR>a
    nnoremap <F11> :TestFile<CR>

    inoremap <F12> <Esc>:TestSuite<CR>a
    nnoremap <F12> :TestSuite<CR>

    function PipenvTransformation(cmd) abort
        if !empty(findfile("Pipfile", getcwd().';'))
            return 'pipenv run ' . a:cmd . ' -W ignore::DeprecationWarning:invoke.loader'
        else
            return a:cmd
        endif
    endfunction

    let g:test#custom_transformations = {'pipenv': function('PipenvTransformation')}

    let g:test#transformation = 'pipenv'

    let test#strategy = 'dispatch'
    let test#python#runner = 'pytest'

    " nnoremap <F4> :call ToggleMakeOnSave()<CR>

" This breaks other folding: ...
" let javaScript_fold=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"      ______ _  __         ______                    "
"     / ____/(_)/ /___     /_  __/__  __ ____   ___   "
"    / /_   / // // _ \     / /  / / / // __ \ / _ \  "
"   / __/  / // //  __/    / /  / /_/ // /_/ //  __/  "
"  /_/    /_//_/ \___/    /_/   \__, // .___/ \___/   "
"                              /____//_/              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VUE "
    autocmd FileType vue,javascript setlocal ts=2 sts=2 sw=2 expandtab

" dart "
    autocmd FileType dart setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType dart inoremap <F4> <esc>:FlutterSplit<Enter>a
    autocmd FileType dart nnoremap <F4> :FlutterSplit<Enter>

    autocmd FileType dart inoremap <F5> <esc>:FlutterHotRestart<Enter>a
    autocmd FileType dart nnoremap <F5> :FlutterHotRestart<Enter>

    autocmd FileType dart inoremap <F6> <esc>:FlutterEmulatorsLaunch Pixel_2_API_29<Enter>a
    autocmd FileType dart nnoremap <F6> :FlutterEmulatorsLaunch Pixel_2_API_29<Enter>

    autocmd FileType dart inoremap <F7> <esc>:FlutterRun<Enter>a
    autocmd FileType dart nnoremap <F7> :FlutterRun<Enter>

" json "
    autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab

" yaml "
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" HTML "
    autocmd FileType html,htmldjango setlocal ts=2 sts=2 sw=2 expandtab

" Scala "
    au! BufNewFile,BufFilePre,BufRead *.scala set filetype=scala
    autocmd FileType scala setlocal foldnestmax=1
    autocmd FileType scala setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType scala setlocal wildignore+=*/target/*
    autocmd FileType sbt.scala let l:syntastic_ignore_files = ['\m\c\.h$', '\m\.sbt$']
    autocmd FileType sbt.scala let l:syntastic_scala_checkers = ['fsc']

" Go "
    autocmd FileType go setlocal foldnestmax=1

" Terraform "
    autocmd FileType terraform setlocal foldnestmax=1

" Makefiles "
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab

" Cuda "
    autocmd FileType cuda setlocal ts=8 sts=8 sw=8 noexpandtab

    autocmd FileType cuda setlocal foldnestmax=1

" C "
    autocmd FileType c,h setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType c,h setlocal foldnestmax=1

" CPP "
    autocmd FileType cpp,h,hpp setlocal ts=4 sts=4 sw=4 noexpandtab

    autocmd FileType cpp setlocal foldnestmax=1
    autocmd FileType h,hpp setlocal foldnestmax=2
    autocmd FileType h,hpp setlocal foldlevel=1

" Hakell "
    autocmd FileType haskell setlocal nowrap

" Python "
    " au! BufNewFile,BufFilePre,BufRead *.py set filetype=python
    autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType python setlocal foldmethod=indent
    autocmd FileType python setlocal foldnestmax=2
    autocmd FileType python setlocal foldlevel=1
    autocmd FileType python setlocal textwidth=120
    autocmd FileType python setlocal nowrap
    " autocmd FileType python compiler pyunit
    " autocmd FileType python setlocal makeprg=pipenv\ run\ python\ -m\ unittest

" HTML django
    autocmd FileType htmldjango vmap t S"<esc>:set paste<cr>lysa"}ysi}%a<space>trans<space><esc>:set nopaste<cr>ll
    autocmd FileType htmldjango nmap t  miiC<esc>lv1et`ix
    autocmd FileType htmldjango nmap T  miiC<esc>lv1Et`ix
    autocmd FileType htmldjango nmap 2t miiC<esc>lv2et`ix
    autocmd FileType htmldjango nmap 2T miiC<esc>lv2Et`ix
    autocmd FileType htmldjango nmap 3t miiC<esc>lv3et`ix
    autocmd FileType htmldjango nmap 3T miiC<esc>lv3Et`ix
    autocmd FileType htmldjango nmap 4t miiC<esc>lv4et`ix
    autocmd FileType htmldjango nmap 4T miiC<esc>lv4Et`ix

" Java "
    let g:syntastic_java_javac_config_file_enabled = 1

    autocmd FileType java setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType java setlocal foldnestmax=2
    autocmd FileType java setlocal foldlevel=1

    " Compile "
    " autocmd FileType java inoremap <F5> <Esc>:w<CR>:Make<Enter>i
    " autocmd FileType java nnoremap <F5> :w<CR>:Make<Enter>

    " autocmd FileType java inoremap <F6> <Esc>:w<CR>:Make<space>run<Enter>i
    " autocmd FileType java nnoremap <F6> :w<CR>:Make<space>run<Enter>

" LaTeX specific "
    autocmd FileType tex setlocal ts=4 sts=4 sw=4 noexpandtab

    " Open corresponding.pdf
    " autocmd FileType tex map <F6> :!(evince <c-r>%<backspace><backspace><backspace>pdf & nohup) >/dev/null 2>&1<CR><CR>

    "compile
    " autocmd FileType tex inoremap <F5> <Esc>:w<CR>:!xelatex<space><c-r>%<Enter>i
    " autocmd FileType tex nnoremap <F5> :w<CR>:!xelatex<space><c-r>%<Enter>
    " autocmd FileType tex inoremap <F5> <Esc>:w<CR>:Make<Enter><Enter>i
    " autocmd FileType tex nnoremap <F5> :w<CR>:Make<Enter><Enter>
    " autocmd FileType tex inoremap <F6> <Esc>:w<CR>:Make<Enter><Enter>i
    " autocmd FileType tex nnoremap <F6> :w<CR>:Make<space>run<Enter><Enter>
    " autocmd FileType yaml inoremap <F5> <Esc>:w<CR>:Make<space>run<Enter>i
    " autocmd FileType yaml nnoremap <F5> :w<CR>:Make<Enter>

" Markdown "
    function! s:isAtStartOfLine(mapping)
        let text_before_cursor = getline('.')[0 : col('.')-1]
        let mapping_pattern = '\V' . escape(a:mapping, '\')
        let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
        return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
    endfunction

    autocmd FileType markdown.pandoc inoreabbrev <expr> <bar><bar>
                \ <SID>isAtStartOfLine('\|\|') ?
                \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
    autocmd FileType markdown.pandoc inoreabbrev <expr> __
                \ <SID>isAtStartOfLine('__') ?
                \ '<c-o>:silent! TableModeDisable<cr>' : '__'

    autocmd FileType markdown inoreabbrev <expr> <bar><bar>
                \ <SID>isAtStartOfLine('\|\|') ?
                \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
    autocmd FileType markdown inoreabbrev <expr> __
                \ <SID>isAtStartOfLine('__') ?
                \ '<c-o>:silent! TableModeDisable<cr>' : '__'

    augroup pandoc_syntax
        au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
        au! BufNewFile,BufFilePre,BufRead *.pmd set filetype=markdown.beamer
    augroup END

    function! SetMakeOnSave()
        augroup MakeOnSaveAutoGroup
            autocmd!
            autocmd BufWritePost * call MakeSilentCommand()
        augroup END
    endfunction

    function! UnsetMakeOnSave()
        augroup MakeOnSaveAutoGroup
            autocmd!
        augroup END
    endfunction

    function! ToggleMakeOnSave()
        if !exists('#MakeOnSaveAutoGroup#BufWritePost')
            call SetMakeOnSave()
        else
            call UnsetMakeOnSave()
        endif
    endfunction

    autocmd CursorMoved,CursorMovedI <buffer> if getline('.')[0] ==# '|' | if &textwidth != 0 | setlocal textwidth=0 | endif | else | if &textwidth != 80 | setlocal textwidth=80 | endif | endif


    autocmd FileType markdown setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType markdown setlocal textwidth=80
    autocmd FileType markdown setlocal spell
    autocmd FileType markdown setlocal spelllang=en
    autocmd FileType markdown setlocal nowrap

    autocmd FileType markdown.pandoc setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType markdown.pandoc setlocal textwidth=80
    autocmd FileType markdown.pandoc setlocal spell
    autocmd FileType markdown.pandoc setlocal spelllang=en
    autocmd FileType markdown.pandoc setlocal nowrap
    autocmd FileType markdown.pandoc nnoremap <buffer> <ESC><ESC> :nohlsearch<CR>

    " Markdown only binds
    autocmd FileType markdown nmap g$ lbysiw$e2l
    autocmd FileType markdown nmap gi$ lbysiw$e2l
    " autocmd FileType markdown nmap ga$ lBysiW$El
    autocmd FileType markdown nmap 2g$ ysil$ysil$$
    autocmd FileType markdown nmap g2$ ysil$ysil$$

    autocmd FileType markdown nmap g* ysiW*El
    autocmd FileType markdown nmap 2g* lBysiW*lysiW*El
    autocmd FileType markdown nmap g2* lBysiW*lysiW*El
    autocmd FileType markdown nmap 3g* lBysiW*lysiW*lysiW*El
    autocmd FileType markdown nmap g3* lBysiW*lysiW*lysiW*El

    autocmd FileType markdown nmap gi* ysiw*e2l
    autocmd FileType markdown nmap 2gi* lbysiw*lysiw*e3l
    autocmd FileType markdown nmap g2i* lbysiw*lysiw*e3l
    autocmd FileType markdown nmap 3gi* lbysiw*lysiw*lysiw*e4l
    autocmd FileType markdown nmap g3i* lbysiw*lysiw*lysiw*e4l

    " autocmd FileType markdown nmap ga* ysiW*El
    " autocmd FileType markdown nmap 2ga* lBysiW*lysiW*El
    " autocmd FileType markdown nmap 3ga* lBysiW*lysiW*lysiW*El

    " Toggle Make! on write
    autocmd FileType markdown.pandoc nnoremap <F4> :call ToggleMakeOnSave()<CR>

" Treat .rss files as XML
    autocmd BufNewFile,BufRead *.rss setfiletype xml


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"     ____               _           __    _____                 _ _____       "
"    / __ \_________    (_)__  _____/ /_  / ___/____  ___  _____(_) __(_)____  "
"   / /_/ / ___/ __ \  / / _ \/ ___/ __/  \__ \/ __ \/ _ \/ ___/ / /_/ / ___/  "
"  / ____/ /  / /_/ / / /  __/ /__/ /_   ___/ / /_/ /  __/ /__/ / __/ / /__    "
" /_/   /_/   \____/_/ /\___/\___/\__/  /____/ .___/\___/\___/_/_/ /_/\___/    "
"                 /___/                     /_/                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""" Work project """""""

    " Whitespace rules
    autocmd BufNewFile,BufRead */devel/kveditr/* setlocal ts=4 sts=4 sw=4 expandtab

    "make
    autocmd BufNewFile,BufRead */devel/kveditr/* inoremap <F5> <Esc>:w<CR>:Make<space>-C<space>~/devel/kveditr<Enter>i
    autocmd BufNewFile,BufRead */devel/kveditr/* nnoremap <F5> :w<CR>:Make<space>-C<space>~/devel/kveditr<Enter>

    "run
    autocmd BufNewFile,BufRead */devel/kveditr/* inoremap <F6> <Esc>:!(gnome-terminal<space>-e<space>~/devel/kveditr/kveditr)<space>><space>/dev/null<Enter>a
    autocmd BufNewFile,BufRead */devel/kveditr/* nnoremap <F6> :!(gnome-terminal<space>-e<space>~/devel/kveditr/kveditr)<space>><space>/dev/null<Enter><Enter>

    " Make, kill and run
    " autocmd BufNewFile,BufRead */devel/kveditr/* inoremap <F7> <Esc>:w<CR>:Make<space>-C<space>~/devel/kveditr<space>&&<space>(killall<space>kveditr<space>\|\|<space>true)<space>&&<space>((gnome-terminal<space>-e<space>~/devel/kveditr/kveditr<space>&)<space>><space>/dev/null)<Enter><Enter>a
    " autocmd BufNewFile,BufRead */devel/kveditr/* nnoremap <F7> :w<CR>:Make<space>-C<space>~/devel/kveditr<space>&&<space>(killall<space>kveditr<space>\|\|<space>true)<space>&&<space>((gnome-terminal<space>-e<space>~/devel/kveditr/kveditr<space>&)<space>><space>/dev/null)<Enter><Enter>

    " kill the program
    autocmd BufNewFile,BufRead */devel/kveditr/* inoremap <F8> <Esc>:!killall<space>kveditr<Enter><Enter>a
    autocmd BufNewFile,BufRead */devel/kveditr/* nnoremap <F8> :!killall<space>kveditr<Enter><Enter>


"    autocmd BufNewFile,BufRead */devel/kveditr/* let b:syntastic_cpp_cflags = ' -I inc'

