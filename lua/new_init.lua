require('util.string')

-- Config

require('rwb.packer')

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
require("retrail").setup()
require('colorizer').setup()

require('rwb.gitsigns')

require('rwb.keymaps').set_general_keymaps() -- LAST
