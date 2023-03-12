local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  --------------------------------------------------
  --      ____   __               _               --
  --     / __ \ / /__  __ ____ _ (_)____   _____  --
  --    / /_/ // // / / // __ `// // __ \ / ___/  --
  --   / ____// // /_/ // /_/ // // / / /(__  )   --
  --  /_/    /_/ \__,_/ \__, //_//_/ /_//____/    --
  --                   /____/                     --
  --------------------------------------------------

  use 'rwblokzijl/nvim-jump-mode'
  use 'haya14busa/vim-asterisk' -- TODO: Setup

  use 'kylechui/nvim-surround'          -- (s)       To surround

  -- Make plugin commands repeatable
  use 'tpope/vim-repeat'

  -- Deps
  use 'nvim-lua/plenary.nvim'


  -- More actions
  -- use 'tpope/vim-surround'           -- (s)       To surround
  use 'christoomey/vim-sort-motion'     -- (gs)      To sort
  use 'vim-scripts/ReplaceWithRegister' -- (gr)      Replace with register
  use 'tommcdo/vim-ninja-feet'          -- (gr)      Replace with register
  use 'junegunn/vim-easy-align'         -- (ga)      To align
  use 'monaqa/dial.nvim'


    -- More text objects
  -- use 'nvim-treesitter/nvim-treesitter-textobjects' -- Set of treesitter based objects
  -- use 'chrisgrieser/nvim-various-textobjs'  -- Set of objects
  -- indentation          |  [ai][iI] | all         | surrounding lines with same or higher indentation                                 | see overview from vim-indent-object
  -- restOfIndentation    |  R        | all         | lines down with same or higher indentation                                        | see overview from vim-indent-object
  -- value                |  iv, av   | all         | value of key-value pair, or right side of a variable assignment (inside one line) | outer includes trailing commas or semicolons
  -- key                  |  ik, ak   | all         | key of key-value pair, or left side of a variable assignment                      | outer includes the = or :
  -- number               |  in, an   | all         | numbers, similar to <C-a>                                                         | inner: digits, outer: incl. minus and decimal
  -- diagnostic           |  !        | all         | LSP diagnostic (requires built-in LSP)                                            | -
  -- nearEoL              |  n        | all         | from cursor position to end of line, minus one character                          | -
  -- mdlink               |  il, al   | md, toml    | markdown link like [title](url)                                                   | inner is only the link title (between the [])
  -- mdFencedCodeBlock    |  iC, aC   | md          | markdown fenced code (enclosed by three backticks)                                | outer includes the enclosing backticks
  -- cssSelector          |  ic, ac   | css, scss   | class in CSS, like .my-class                                                      | outer includes trailing comma and space
  -- jsRegex              |  i/, a/   | js, ts      | JavaScript regex pattern                                                          | outer includes the slashes and any flags
  -- doubleSquareBrackets |  iD, aD   | lua, sh, md | text enclosed by [[]]                                                             | outer includes the four square brackets
  -- column               |  |        | all         | column down until indent or shorter line. Accepts {count} for multiple columns.   | -
  -- restOfParagraph      |  r        | all         | like }, but linewise                                                              | -
  -- subword              |  iS, aS   | all         | like iw, but treating -, _ or . as word delimiters and only part of camelcase.    | outer includes trailing _ or -
  -- entireBuffer         |  gG       | all         | entire buffer as one text object                                                  | -
  -- url                  |  L        | all         | link beginning with "http"                                                        | -
  -- shellPipe            |  iP/aP    | *sh         | command stdout is piped to                                                        | outer includes the front pipe character
  use 'wellle/targets.vim'                  -- A collection of text object with look ahead/behind
  -- use 'vim-scripts/argtextobj.vim'          -- (a)       Argument -- Replaced by targets.vim
  -- use 'bkad/CamelCaseMotion'                -- (,w)      CamelCaseWords
  use 'michaeljsmith/vim-indent-object'     -- (i)       Indent blocks

  use 'kana/vim-textobj-user'               -- Enables the ones below
  use 'glts/vim-textobj-comment'            -- (c)       Comments
  use 'kana/vim-textobj-line'               -- (l)       Line
  use 'kana/vim-textobj-entire'             -- (e)       Entire file
  -- use 'akiyan/vim-textobj-php'              -- (P)       PHP tag
  -- use 'beloglazov/vim-textobj-quotes'       -- (q)       Any type of quote (even from outside the quotes -- Replaced by targets.vim

    -- Language Server Stuff
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'ray-x/lsp_signature.nvim'
  use 'mfussenegger/nvim-dap'

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-cmdline'
  use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'uga-rosa/cmp-dictionary'
  use 'hrsh7th/cmp-calc'
  use 'f3fora/cmp-spell'
  use 'petertriho/cmp-git'
  use 'davidsierradz/cmp-conventionalcommits'
  use 'Dosx001/cmp-commit'

  use 'onsails/lspkind-nvim'
  use 'lewis6991/foldsigns.nvim'
  use 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
  use 'rmagatti/goto-preview'

  -- use 'WhoIsSethDaniel/lualine-lsp-progress.nvim'
  use 'arkav/lualine-lsp-progress'

  -- AI stuff
  use({
    'dense-analysis/neural',
    requires = {
      'MunifTanjim/nui.nvim',
      'ElPiloto/significant.nvim'
    }
  })

  -- Snips
  use 'L3MON4D3/LuaSnip'
  use 'honza/vim-snippets'
  use 'rafamadriz/friendly-snippets'
  use 'hashivim/vim-terraform'
  use 'albanm/vuetify-vim'
  use 'juliosueiras/vim-terraform-completion'

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'nvim-treesitter/playground'

  -- Testing
  use 'vim-test/vim-test'

  use { -- TODO: Setup
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim"
    }
  }
  -- use {
  --   "roobert/node-type.nvim",
  --   config = function()
  --     require("node-type").setup()
  --   end,
  -- }
  use({
    'ckolkey/ts-node-action',
    requires = { 'nvim-treesitter' },
    config = function()
      require("ts-node-action").setup({})
    end
  })


  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = { 'nvim-lua/plenary.nvim'}
  }

  -- UI Extentions
  -- use {'junegunn/fzf', ron= { -> fzf#install() } }
  -- use 'junegunn/fzf.vim'
  -- use 'terryma/vim-multiple-cursors'
  use 'mhinz/vim-grepper'
  -- use 'vim-scripts/a.vim'
  use 'tpope/vim-sensible'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-dispatch'
  use 'tpope/vim-projectionist'
  use 'machakann/vim-highlightedyank'
  use 'kien/rainbow_parentheses.vim'
  -- use 'NvChad/nvim-colorizer.lua'

  -- TODO: Compare these
  -- use 'RRethy/vim-illuminate'
  use   {
    'tzachar/local-highlight.nvim',
    config = function()
      require('local-highlight').setup()
    end
  }

  -- TODO: Revert to delimitMate if autopairs is annoying
  -- use 'Raimondi/delimitMate'
  use 'windwp/nvim-autopairs'

  -- Status line
  use 'nvim-lualine/lualine.nvim'
  -- use 'tiagovla/scope.nvim'
  -- use 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
  use 'akinsho/bufferline.nvim'

  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'

  -- Git
  use 'tpope/vim-fugitive'
  use 'junegunn/gv.vim'
  use 'lewis6991/gitsigns.nvim'

  --
  use 'tpope/vim-unimpaired'

  -- Comments
  use 'tpope/vim-commentary'
  -- use 'suy/vim-context-commentstring'
  -- use { -- TODO unconfirmed working
  --   'JoosepAlviste/nvim-ts-context-commentstring',
  --   run = function()
  --     require'nvim-treesitter.configs'.setup {
  --       context_commentstring = {
  --         enable = true
  --       }
  --     }
  --   end
  -- }
  -- use 'numToStr/Comment.nvim'

  -- use 'vitalk/vim-simple-todo'
  use 'ellisonleao/gruvbox.nvim'

  use 'dhruvasagar/vim-table-mode'

  -- Other

  use 'dkarter/bullets.vim'
  -- use 'gaoDean/autolist.nvim' -- TODO: seems better than bullets.nvim IFF it works (didnt last time i tried)
  -- use 'zakharykaplan/nvim-retrail'
  -- use 'ntpeters/vim-better-whitespace'

  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }


  -- Haksell
  use 'neovimhaskell/haskell-vim'

  -- TODO: 2022-08-21 now Delete later if i didn't miss them

  -- use 'Chiel92/vim-autoformat'
  -- Movement aids
  -- use 'unblevable/quick-scope'           -- Highlight unique characters for word in active line
  -- use 'easymotion/vim-easymotion'

  -- autocompletion
  -- use 'vim-scripts/loremipsum'

  -- Specific programmin language plugins
  -- use 'posva/vim-vue'
  -- use 'leafOfTree/vim-vue-plugin'

  -- use 'thosakwe/vim-flutter'
  -- use 'dart-lang/dart-vim-plugin'
  -- use 'natebosch/vim-lsc'
  -- use 'natebosch/vim-lsc-dart'

  -- use 'szw/vim-maximizer'
  -- use 'sbdchd/neoformat'
  -- use 'kassio/neoterm'

  -- OpenHAB
  -- use 'cyberkov/openhab-vim'

  -- Android
  -- use 'hsanson/vim-android'

  -- ----- Syntax plugins ------------------------------------------------
  -- use 'jez/vim-c0'
  -- use 'jez/vim-ispc'
  -- use 'kchmck/vim-coffee-script'

  --Python


  -- folding
  -- use 'Konfekt/FastFold'
  -- use 'tmhedberg/SimpylFold'

  -- HTML
  -- use 'mattn/emmet-vim'

  -- Java
  -- Plugin 'dansomething/vim-eclim'
  -- use 'Shougo/unite.vim'

  -- Scala
  -- use 'derekwyatt/vim-scala'
  -- use 'jceb/vim-hier'

  -- Markdown
  -- use 'vim-pandoc/vim-pandoc'
  -- use 'vim-pandoc/vim-pandoc-syntax'
  -- Align CSV files at commas, align Markdown tables, and more
  -- Plugin 'nelstrom/vim-markdown-folding'
  -- Plugin 'plasticboy/vim-markdown'
  -- Plugin 'drmingdrmer/vim-syntax-markdown'
  -- use 'godlygeek/tabular'
  -- use 'rhysd/vim-grammarous'

  -- Latex
  -- use 'lervag/vimtex'
  -- use 'jbyuki/nabla.nvim' -- TODO: setup

  -- files

  -- use 'scrooloose/nerdtree'
  -- use 'jistr/vim-nerdtree-tabs'
  -- use 'tiagofumo/vim-nerdtree-syntax-highlight'
  -- use 'Xuyuanp/nerdtree-git-plugin'

  -- use 'ryanoasis/vim-devicons'


  -- To do list

  -- Ricing
  -- use 'flazz/vim-colorschemes'
  -- use 'morhetz/gruvbox'
  -- use 'luisiacc/gruvbox-baby'

  --
  --My own stuff (remember to port)
  -- use 'tmhedberg/matchit'
  -- use 'sickill/vim-pasta'
  -- use 'ervandew/supertab'
  -- use 'vim-scripts/ZoomWin'

  -- ---- Extras/Advanced plugins ----------------------------------------
  -- Highlight and strip trailing whitespace
  -- use 'ntpeters/vim-better-whitespace'
  -- Automaticall insert the closing HTML tag
  --Plugin 'HTML-AutoCloseTag'
  -- All the other syntax plugins I use
  -- use 'ekalinin/Dockerfile.vim'
  -- use 'digitaltoad/vim-jade'
  -- use 'tpope/vim-liquid'
  -- use 'cakebaker/scss-syntax.vim'

  use 'dstein64/vim-startuptime'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

