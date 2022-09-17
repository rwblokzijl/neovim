require('util.string')


require('rwb.colorscheme') -- general vim settings
require('rwb.general') -- general vim settings

require('rwb.statusline')
require('rwb.nvimtree')

require('rwb.complete') -- Autocompletion configuration
require('rwb.dap') -- Autocompletion configuration
require('rwb.luasnip')
require('rwb.treesitter')

require('rwb.telescope')

-- require('Comment').setup()
require("nvim-surround").setup()

require('rwb.gitsigns')
