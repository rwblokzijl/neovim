"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  _
"                           _   __(_)___ ___  __________
"                          | | / / / __ `__ \/ ___/ ___/
"                         _| |/ / / / / / / / /  / /__
"                        (_)___/_/_/ /_/ /_/_/   \___/
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""
" Plugins
""""
    " Install vimplug if not already installed
    let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
    if empty(glob(data_dir . '/autoload/plug.vim'))
        silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

    call plug#begin('~/.config/vim/plugged')

    """""""""""""""""""""""""""""""""""""""""""""
    "      ____   __               _               "
    "     / __ \ / /__  __ ____ _ (_)____   _____  "
    "    / /_/ // // / / // __ `// // __ \ / ___/  "
    "   / ____// // /_/ // /_/ // // / / /(__  )   "
    "  /_/    /_/ \__,_/ \__, //_//_/ /_//____/    "
    "                   /____/                     "
    """"""""""""""""""""""""""""""""""""""""""""""""

    " let Vundle manage Vundle, required "
    " Plugin 'VundleVim/Vundle.vim'

    " Make plugin commands repeatable "
    Plug 'tpope/vim-repeat'

    " Deps
    Plug 'nvim-lua/plenary.nvim'

    " More actions "
    Plug 'tpope/vim-surround'              " (s)       To surround
    Plug 'christoomey/vim-sort-motion'     " (gs)      To sort
    Plug 'vim-scripts/ReplaceWithRegister' " (gr)      Replace with register
    Plug 'tommcdo/vim-ninja-feet'          " (gr)      Replace with register
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

    " Language Server Stuff "
    Plug 'onsails/lspkind-nvim'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-nvim-lua'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'saadparwaiz1/cmp_luasnip'

    Plug 'uga-rosa/cmp-dictionary'
    Plug 'hrsh7th/cmp-calc'
    Plug 'f3fora/cmp-spell'

    Plug 'petertriho/cmp-git'
    Plug 'davidsierradz/cmp-conventionalcommits'
    Plug 'Dosx001/cmp-commit'

    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'ray-x/lsp_signature.nvim'

    " Snips
    Plug 'L3MON4D3/LuaSnip'
    Plug 'honza/vim-snippets'
    Plug 'rafamadriz/friendly-snippets'
    Plug 'hashivim/vim-terraform'
    Plug 'juliosueiras/vim-terraform-completion'

    " treesitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'nvim-treesitter/nvim-treesitter-context'
    Plug 'nvim-treesitter/playground'

    " " Programming tools "
    Plug 'vim-test/vim-test'

    " Telescope
    Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }

    " UI Extentions "
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'mhinz/vim-grepper'
    Plug 'vim-scripts/a.vim'
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-projectionist'

    " Plug 'xolox/vim-misc'
    Plug 'Raimondi/delimitMate'
    Plug 'kien/rainbow_parentheses.vim'

    " Status line
    Plug 'nvim-lualine/lualine.nvim'
    " Plug 'tiagovla/scope.nvim'
    Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'kyazdani42/nvim-web-devicons'

    " Git "
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/gv.vim'
    Plug 'lewis6991/gitsigns.nvim'
    "
    Plug 'tpope/vim-unimpaired'

    " Comments
    Plug 'tpope/vim-commentary'
    " Plug 'suy/vim-context-commentstring'
    " Plug 'numToStr/Comment.nvim'

    Plug 'vitalk/vim-simple-todo'
    Plug 'ellisonleao/gruvbox.nvim'

    Plug 'dhruvasagar/vim-table-mode'

    " TODO: 2022-08-21 now Delete later if i didn't miss them

    " Plug 'Chiel92/vim-autoformat'
    " Movement aids "
    " Plug 'unblevable/quick-scope'           " Highlight unique characters for word in active line
    " Plug 'easymotion/vim-easymotion'

    " autocompletion"
    " Plug 'vim-scripts/loremipsum'

    " " Specific programmin language plugins
    " Plug 'posva/vim-vue'
    " Plug 'leafOfTree/vim-vue-plugin'

    " Plug 'thosakwe/vim-flutter'
    " Plug 'dart-lang/dart-vim-plugin'
    " Plug 'natebosch/vim-lsc'
    " Plug 'natebosch/vim-lsc-dart'

    " Plug 'szw/vim-maximizer'
    " Plug 'sbdchd/neoformat'
    " Plug 'kassio/neoterm'

    " " OpenHAB
    " Plug 'cyberkov/openhab-vim'

    " " Android "
    " Plug 'hsanson/vim-android'

    " " ----- Syntax plugins ------------------------------------------------"
    " Plug 'jez/vim-c0'
    " Plug 'jez/vim-ispc'
    " Plug 'kchmck/vim-coffee-script'

    "Python

    " lists
    " Plug 'dkarter/bullets.vim'

    " folding
    " Plug 'Konfekt/FastFold'
    " Plug 'tmhedberg/SimpylFold'

    " " HTML "
    " Plug 'mattn/emmet-vim'

    " " Java "
    " "Plugin 'dansomething/vim-eclim'
    " Plug 'Shougo/unite.vim'

    " " Scala "
    " Plug 'derekwyatt/vim-scala'
    " Plug 'jceb/vim-hier'

    " Markdown "
    " Plug 'vim-pandoc/vim-pandoc'
    " Plug 'vim-pandoc/vim-pandoc-syntax'
    " Align CSV files at commas, align Markdown tables, and more "
    " Plugin 'nelstrom/vim-markdown-folding'
    " Plugin 'plasticboy/vim-markdown'
    " Plugin 'drmingdrmer/vim-syntax-markdown'
    " Plug 'godlygeek/tabular'
    " Plug 'rhysd/vim-grammarous'

    " Latex "
    " Plug 'lervag/vimtex'

    " files"

    " Plug 'scrooloose/nerdtree'
    " " Plug 'jistr/vim-nerdtree-tabs'
    " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    " Plug 'Xuyuanp/nerdtree-git-plugin'

    " Plug 'ryanoasis/vim-devicons'


    " To do list "

    " Ricing "
    " Plug 'flazz/vim-colorschemes'
    " Plug 'morhetz/gruvbox'
    " Plug 'luisiacc/gruvbox-baby'

    "
    "My own stuff (remember to port)"
    " Plug 'tmhedberg/matchit'
    " Plug 'sickill/vim-pasta'
    " Plug 'ervandew/supertab'
    " Plug 'vim-scripts/ZoomWin'

    " ---- Extras/Advanced plugins ---------------------------------------- "
    " Highlight and strip trailing whitespace "
    " Plug 'ntpeters/vim-better-whitespace'
    " Automaticall insert the closing HTML tag "
    "Plugin 'HTML-AutoCloseTag'
    " All the other syntax plugins I use "
    " Plug 'ekalinin/Dockerfile.vim'
    " Plug 'digitaltoad/vim-jade'
    " Plug 'tpope/vim-liquid'
    " Plug 'cakebaker/scss-syntax.vim'

    Plug 'dstein64/vim-startuptime'

    " call vundle#end()            " required
    call plug#end()
    filetype plugin indent on    " required

""""
" Lua config
""""
    lua require('new_init') -- Call all the lua

""""
" Vimscipt plugin configs
""""
    " junegunn/fzf.vim "
        inoremap <expr> <c-x><c-f> fzf#vim#complete#path(
                    \ "find . -path '*/\.*' -prune -o -print \| sed '1d;s:^..::'",
                    \ fzf#wrap({'dir': expand('%:p:h')}))

    " kien/rainbow_parentheses.vim "
        au VimEnter * RainbowParenthesesToggle
        au Syntax * RainbowParenthesesLoadRound
        au Syntax * RainbowParenthesesLoadSquare
        au Syntax * RainbowParenthesesLoadBraces

    " Raimondi/delimitMate "
        let delimitMate_expand_cr = 1
        augroup mydelimitMate
            au!
            au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
            au FileType tex let b:delimitMate_quotes = ""
            au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
            au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
        augroup END
        "---

"""
" Keybinds "
""""

    nmap gcac gcic

    vnoremap  aL <Plug>(textobj-line-a)
    vnoremap  iL <Plug>(textobj-line-i)
    onoremap  aL <Plug>(textobj-line-a)
    onoremap  iL <Plug>(textobj-line-i)

    " Leader "
        let mapleader=","
        let g:user_emmet_leader_key=','
    " Grepper / replace "
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

""""
" General vim settings
""""
    " Folding
        set foldmethod=expr
        set foldexpr=nvim_treesitter#foldexpr()
        " syn match MyEmptyLines "\(^}\s*\n\)\+" fold
        " syn sync fromstart
        " set foldmethod=syntax
        nnoremap <Space> za
        " inoremap <C-j> :set
        "

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

    "spell
        hi SpellBad cterm=underline
        set switchbuf+=usetab,newtab " When selecting a buffer from the quickfix list use existing tab, otherwise create a new tab"

""""
" Uncatergorised "
""""
    let g:vimtex_compiler_latexmk = {'callback' : 0}
    let g:tex_flavor = 'latex'

" Figlet expand
    " turn the current line into ascii art with wrapping
    nnoremap <Leader>aa :normal 0"bD<CR>
                \:let @b=shellescape(@b, 1)<CR>
                \:call append(line("."), "")<CR>
                \:let @c=split(&commentstring, '%s')[0]<CR>
                \:let @d=shellescape(@c, 1)<CR>
                \:let @e="#"<CR>
                \:let @f=shellescape(@e, 1)<CR>
                \:normal 80"eP<CR>
                \:r !figlet -c -f slant -w 77 <C-r>b \| sed 's/^/<C-r>f /;s/\s\+$//'<CR>
                \:normal j80"eP<CR>
    " " turn the current line into ascii art without wrapping
    nnoremap <Leader>ai :normal 0"bD<CR>
                \:let @b=shellescape(@b, 1)<CR>
                \:call append(line("."), "")<CR>
                \:let @c=split(&commentstring, '%s')[0]<CR>
                \:normal 80"cP<CR>
                \:r !figlet -f slant -w 1000 <C-r>b \| sed 's/^/<C-r>c /;s/\s\+$//'<CR>
                \:normal j80"cP<CR>

" colors
    set termguicolors " I dont like it, too offensive to the eyes

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

    set t_Co=256
    set laststatus=2
    "hi Normal guibg=NONE ctermbg=NONE

    set diffopt+=vertical

    " Searching in code case sensitive
    set ignorecase
    set smartcase
    " With these mappings, if 'smartcase' is on and you press * while on the word "The", you will only find "The" (case sensitive), but if you press * while on the word "the", the search will not be case sensitive.
    nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>zzzv
    nnoremap # ?\<<C-R>=expand('<cword>')<CR>\><CR>zzzv

    " Vislualising code
    set incsearch
    set hlsearch
    nnoremap <ESC><ESC> :nohlsearch<CR>:hi clear SpellBad<CR>:LuaSnipUnlinkCurrent<CR>
    set cursorline
    set list
    set showbreak=↪\
    set listchars=nbsp:☠,tab:▸\ ,trail:•,precedes:←,extends:→
    highlight SpecialKey ctermfg=240

    " set textwidth=80 "default TW"
    " set colorcolumn=+1 "TW+1"
    set colorcolumn=80 "TW+1"
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

" General behavior configs
    set path+=** " Add all subfolders to search path
    set shell=sh " Might not need
    set hidden
    set confirm
    set nobackup
    set nowritebackup
    set nowrap

    set completeopt=menu,menuone,noinsert,noselect,preview
    set cmdheight=2 " Give more space for displaying messages.
    set updatetime=300 " Longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
    set shortmess+=c " Don't pass messages to |ins-completion-menu|.

    hi clear SignColumn
    set signcolumn=yes
    set scrolloff=8
    set sidescrolloff=16


" close only window on :q
    let bclose_multiple = 0
    cnoreabbrev bc Bclose

" web-devicons
    let g:WebDevIconsUnicodeGlyphDoubleWidth = 1

" FZF
    let $FZF_DEFAULT_COMMAND = 'rg --no-ignore-vcs --files
                \ --hidden
                \ --glob "!**/node_modules/*"
                \ --glob "!**/.terraform/*"
                \ --glob "!**/.pytest_cache/*"
                \ --glob "!**/.mypy_cache/*"
                \ --glob "!**/.git/*"
                \ '
    nnoremap <c-]> :Files<cr>
    nnoremap <c-;> :Files<cr>
    nnoremap <c-f> :Files<cr>

" center the cursor after some commands
    nnoremap Y y$
    nnoremap n nzzzv
    nnoremap N Nzzzv
    " nnoremap * *zzzv # already remapped higher up
    " nnoremap # #zzzv # already remapped higher up
    " nnoremap J mzJ`z //more annoying than useful
    " nnoremap <C-j> :cnext<CR>zzzv

" push to undo stack after every sentence
    inoremap , ,<c-g>u
    inoremap . .<c-g>u
    inoremap ! !<c-g>u
    inoremap ? ?<c-g>u

" Move selections around without losing said selection
    " Run help :help map-table
    "                               *map-table*
    "          Mode  | Norm | Ins | Cmd | Vis | Sel | Opr | Term | Lang | ~
    " Command        +------+-----+-----+-----+-----+-----+------+------+ ~
    " [nore]map      | yes  |  -  |  -  | yes | yes | yes |  -   |  -   |
    " n[nore]map     | yes  |  -  |  -  |  -  |  -  |  -  |  -   |  -   |
    " [nore]map!     |  -   | yes | yes |  -  |  -  |  -  |  -   |  -   |
    " i[nore]map     |  -   | yes |  -  |  -  |  -  |  -  |  -   |  -   |
    " c[nore]map     |  -   |  -  | yes |  -  |  -  |  -  |  -   |  -   |
    " v[nore]map     |  -   |  -  |  -  | yes | yes |  -  |  -   |  -   |
    " x[nore]map     |  -   |  -  |  -  | yes |  -  |  -  |  -   |  -   |
    " s[nore]map     |  -   |  -  |  -  |  -  | yes |  -  |  -   |  -   |
    " o[nore]map     |  -   |  -  |  -  |  -  |  -  | yes |  -   |  -   |
    " t[nore]map     |  -   |  -  |  -  |  -  |  -  |  -  | yes  |  -   |
    " l[nore]map     |  -   | yes | yes |  -  |  -  |  -  |  -   | yes  |
    vnoremap < <gv
    vnoremap > >gv

    xnoremap <C-j> :m '>+1<CR>gv=gv
    xnoremap <C-k> :m '<-2<CR>gv=gv
    xnoremap <C-s-j> :m '>+1<CR>gv
    xnoremap <C-s-k> :m '<-2<CR>gv
    xnoremap <C-h> <gv
    xnoremap <C-l> >gv
    xnoremap <C-s-h> <gv
    xnoremap <C-s-l> >gv
    " inoremap <C-j> <esc>:m .+1<CR>==a
    " inoremap <C-k> <esc>:m .-2<CR>==a
    " nnoremap <C-j> <esc>:m .+1<CR>==
    " nnoremap <C-k> <esc>:m .-2<CR>==

" I dont know what this does, but it seems useful
    "" Whitespaces and indentation
    " function! Preserve(command)
    "     " Preparation: save last search, and cursor position.
    "     let _s=@/
    "     let l = line(".")
    "     let c = col(".")
    "     " Do the business:
    "     execute a:command
    "     " Clean up: restore previous search history, and cursor position
    "     let @/=_s
    "     call cursor(l, c)
    " endfunction
    " nnoremap <silent>_$ :call Preserve("%s/\\s\\+$//e")<CR>
    " nnoremap <silent>_= :call Preserve("normal gg=G")<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
    set splitbelow
    set splitright

" Automatically deletes all tralling whitespace on save.
    function RemoveTrailingWhiteSpace()
        norm!m`
        norm!``
        %s/\s\+$//e
    endfunction

    autocmd BufWritePre * call RemoveTrailingWhiteSpace()

" Controls
    " clipboard mappings and configuration
        " Copy and cut to system clipboard
        nnoremap <C-y> "+y
        nnoremap <C-S-y> "+y$
        nnoremap <C-y><C-y> "+yy
        vnoremap <C-y> "+y

        nnoremap <C-p> "+p
        nnoremap <C-S-p> "+P
        vnoremap <C-p> "+p
        vnoremap <C-S-p> "+P

        nnoremap <C-c> "+c
        nnoremap <C-S-c> "+C
        nnoremap <C-c><C-c> "+cc
        vnoremap <C-c> "+c

        nnoremap <C-d> "+d
        nnoremap <C-S-d> "+D
        nnoremap <C-d><C-d> "+dd
        vnoremap <C-d> "+d

        vnoremap <C-v> "+p
        vnoremap <C-S-v> "+P
        " paste with and without formatting
        inoremap <C-v>   <esc>:set paste<cr>a<c-r>=getreg('+')<cr><esc>:set nopaste<cr>mi`[=`]`ia
        inoremap <C-S-v> <esc>:set paste<cr>a<c-r>=getreg('+')<cr><esc>:set nopaste<cr>a
        " inoremap <C-b>   <esc>:set paste<cr>a<c-r>=getreg('+')<cr><esc>:set nopaste<cr>a

        " nnoremap <C-x> "+d
        " nnoremap <C-S-x> "+D
        " nnoremap <C-x><C-x> "+dd

    " idk "
        nnoremap gmt <C-W>T
        " close current buffer
        " nnoremap <leader>q :bp<cr>:bd #<cr>

    " tpope/vim-projectionist "
        " switch between alternat files
        nnoremap <silent> ~ :AV<cr>
        " nnoremap gaa :A<cr>
        " nnoremap gat :AT<cr>
        " nnoremap gas :AS<cr>
        " nnoremap gav :AV<cr>

    " junegunn/vim-easy-align "
        " Start interactive EasyAlign in visual mode (e.g. vipga)
        xmap ga <Plug>(EasyAlign)

        " Start interactive EasyAlign for a motion/text object (e.g. gaip)
        nmap ga <Plug>(EasyAlign)

        au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

    " Tabs control

        nnoremap <TAB> :tabn<cr>:BufferLineSortByTabs<cr>
        nnoremap <S-TAB> :tabp<cr>:BufferLineSortByTabs<cr>
        nnoremap <C-S-TAB> :-tabmove<cr>:BufferLineSortByTabs<cr>
        nnoremap <C-TAB> :+tabmove<cr>:BufferLineSortByTabs<cr>

        nnoremap gt :tabnew<cr>:BufferLineSortByTabs<cr>
        nnoremap gT :-1tabnew<cr>:BufferLineSortByTabs<cr>

        nnoremap 1gt 1gt:BufferLineSortByTabs<cr>
        nnoremap 2gt 2gt:BufferLineSortByTabs<cr>
        nnoremap 3gt 3gt:BufferLineSortByTabs<cr>
        nnoremap 4gt 4gt:BufferLineSortByTabs<cr>
        nnoremap 5gt 5gt:BufferLineSortByTabs<cr>
        nnoremap 6gt 6gt:BufferLineSortByTabs<cr>
        nnoremap 7gt 7gt:BufferLineSortByTabs<cr>
        nnoremap 8gt 8gt:BufferLineSortByTabs<cr>
        nnoremap 9gt 9gt:BufferLineSortByTabs<cr>
        nnoremap 10gt 10gt:BufferLineSortByTabs<cr>
        nnoremap 11gt 11gt:BufferLineSortByTabs<cr>
        nnoremap 0gt :tabfirst<cr>:BufferLineSortByTabs<cr>

        cnoreabbrev qq tabclose

    "Turn off arrow keys
        noremap <Up> <NOP>
        noremap <Down> <NOP>
        noremap <Left> <NOP>
        noremap <Right> <NOP>

    " make W write one file, not everything (typo is too quick)
        :command -nargs=* W :w "<args>"
        :command -nargs=* Q :q "<args>"

    " Shortcutting split navigation:
        nnoremap gh :wincmd h<CR>
        nnoremap gj :wincmd j<CR>
        nnoremap gk :wincmd k<CR>
        nnoremap gl :wincmd l<CR>

        " nnoremap <c-h> :wincmd h<CR>
        " nnoremap <c-j> :wincmd j<CR>
        " nnoremap <c-k> :wincmd k<CR>
        " nnoremap <c-l> :wincmd l<CR>

    " set wildmode=longest:full,full

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

    " TODO: actually use this
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
    "
    "let g:languagetool_jar = '/usr/share/java/languagetool/languagetool-commandline.jar'

""""
" File type
""""
    " VUE "
        autocmd FileType vue setlocal ts=2 sts=2 sw=2 expandtab
        autocmd FileType vue setlocal foldnestmax=2

    " Java Script "
        autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
        autocmd FileType javascript setlocal foldnestmax=1

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

    " yaml.ansible "
        au BufRead,BufNewFile */gcp-ansible/**/*.yml set filetype=yaml.ansible
        au BufRead,BufNewFile */gcp-ansible/**/*.yaml set filetype=yaml.ansible

    " HTML "
        au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=htmldjango
        autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
        autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
        autocmd FileType htmldjango setlocal ts=2 sts=2 sw=2 expandtab

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
        autocmd BufNewFile,BufRead *.tf setfiletype terraform
        autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync()
        autocmd BufWritePre terraform lua vim.lsp.buf.formatting_sync()
        autocmd FileType terraform setlocal ts=2 sts=2 sw=2 expandtab
        autocmd FileType terraform setlocal foldnestmax=1

    " Makefiles "
        autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab

    " Lua "
        autocmd FileType lua setlocal ts=2 sts=2 sw=2 expandtab
        autocmd FileType lua setlocal foldnestmax=1

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
        " autocmd FileType python setlocal foldmethod=indent
        autocmd FileType python setlocal foldnestmax=2
        autocmd FileType python setlocal foldlevel=1
        autocmd FileType python setlocal textwidth=120
        autocmd FileType python setlocal colorcolumn=120
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

        " autocmd CursorMoved,CursorMovedI <buffer> if getline('.')[0] ==# '|' | if &textwidth != 0 | setlocal textwidth=0 | endif | else | if &textwidth != 80 | setlocal textwidth=80 | endif | endif

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
        " autocmd FileType markdown.pandoc nmap <F7> :GrammarousCheck<CR>
        " autocmd FileType markdown.pandoc nmap <F8> <Plug>(grammarous-open-info-window)
        " autocmd FileType markdown.pandoc nmap <F9> <Plug>(grammarous-move-to-previous-error)
        " autocmd FileType markdown.pandoc nmap <F10> <Plug>(grammarous-fixit)
        " autocmd FileType markdown.pandoc nmap <F11> <Plug>(grammarous-move-to-next-error)
        " autocmd FileType markdown.pandoc nmap <F12> <Plug>(grammarous-disable-rule)

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

    " XML
        autocmd BufNewFile,BufRead *.rss setfiletype xml " Treat .rss files as XML

    " VIM "
        autocmd FileType vim setlocal foldmethod=indent
        autocmd FileType vim setlocal foldnestmax=2

" colors "
    highlight! link CmpItemAbbr GruvboxWhite "The completion text"
    highlight! link CmpItemAbbrDeprecated GruvboxGray "The completion text if the completion is depricated"
    highlight! link CmpItemAbbrMatch GruvboxBlue "The matching characters"
    highlight! link CmpItemAbbrMatchFuzzy GruvboxBlueBold
    highlight! link CmpItemMenu GruvboxGray

    " CMPItemKinds
    highlight! link CmpItemKind GruvboxOrange "Default is orange, so its obvious when something is not configured"

    " White
    highlight! link CmpItemKindVariable GruvboxWhite

    " Gray
    highlight! link CmpItemKindText GruvboxGray

    " Blue
    highlight! link CmpItemKindProperty GruvboxBlue

    " Green
    highlight! link CmpItemKindFunction GruvboxGreen
    highlight! link CmpItemKindMethod GruvboxGreen
    highlight! link CmpItemKindField GruvboxGreen
    highlight! link CmpItemKindFile GruvboxGreen
    highlight! link CmpItemKindFolder GruvboxGreen

    " Red
    highlight! link CmpItemKindKeyword GruvboxRed
    highlight! link CmpItemKindOperator GruvboxRed

    " Yellow
    highlight! link CmpItemKindClass GruvboxYellow
    highlight! link CmpItemKindUnit GruvboxYellow
    " highlight! link CmpItemKindInterface GruvboxYellow

    " Purple
    highlight! link CmpItemKindConstant GruvboxPurple
    highlight! link CmpItemKindEnumMember GruvboxPurple
    highlight! link CmpItemKindSnippet GruvboxPurple

    highlight! link GitSignsCurrentLineBlame GruvboxBg4
