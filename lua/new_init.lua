require('util.string')

-- Config

require('rwb.packer')

require('rwb.colorscheme') -- general vim settings
-- require('rwb.general') -- general vim settings

require('rwb.statusline')
require('rwb.nvimtree')

require('rwb.complete') -- Autocompletion configuration
require('rwb.ai') -- AI code assistant configuration
require('rwb.dap') -- Autocompletion configuration
require('rwb.luasnip').setup()
require('rwb.treesitter')
require('rwb.box')
require('rwb.vim-better-whitespace')
require('rwb.dial-nvim')

-- TO
-- require("various-textobjs").setup({ useDefaultKeymaps = true })

require('rwb.telescope')

-- require('Comment').setup()
require("nvim-surround").setup()
-- require("retrail").setup()
-- require('colorizer').setup()
-- require('autolist').setup({})


require('rwb.gitsigns').setup()

require("nvim-autopairs").setup {}

require('rwb.keymaps').set_general_keymaps() -- LAST
