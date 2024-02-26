-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/bloodyfool/.cache/nvim/0.original/packer_hererocks/2.1.1692716794/share/lua/5.1/?.lua;/home/bloodyfool/.cache/nvim/0.original/packer_hererocks/2.1.1692716794/share/lua/5.1/?/init.lua;/home/bloodyfool/.cache/nvim/0.original/packer_hererocks/2.1.1692716794/lib/luarocks/rocks-5.1/?.lua;/home/bloodyfool/.cache/nvim/0.original/packer_hererocks/2.1.1692716794/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/bloodyfool/.cache/nvim/0.original/packer_hererocks/2.1.1692716794/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ReplaceWithRegister = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/ReplaceWithRegister",
    url = "https://github.com/vim-scripts/ReplaceWithRegister"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["bullets.vim"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/bullets.vim",
    url = "https://github.com/dkarter/bullets.vim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/cmp-calc",
    url = "https://github.com/hrsh7th/cmp-calc"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-commit"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/cmp-commit",
    url = "https://github.com/Dosx001/cmp-commit"
  },
  ["cmp-conventionalcommits"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/cmp-conventionalcommits",
    url = "https://github.com/davidsierradz/cmp-conventionalcommits"
  },
  ["cmp-dictionary"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/cmp-dictionary",
    url = "https://github.com/uga-rosa/cmp-dictionary"
  },
  ["cmp-git"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/cmp-git",
    url = "https://github.com/petertriho/cmp-git"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-spell"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/cmp-spell",
    url = "https://github.com/f3fora/cmp-spell"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["dial.nvim"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/dial.nvim",
    url = "https://github.com/monaqa/dial.nvim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["far.vim"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/far.vim",
    url = "https://github.com/brooth/far.vim"
  },
  ["foldsigns.nvim"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/foldsigns.nvim",
    url = "https://github.com/lewis6991/foldsigns.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["goto-preview"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/goto-preview",
    url = "https://github.com/rmagatti/goto-preview"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  ["gv.vim"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/gv.vim",
    url = "https://github.com/junegunn/gv.vim"
  },
  ["haskell-vim"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/haskell-vim",
    url = "https://github.com/neovimhaskell/haskell-vim"
  },
  indentLine = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/indentLine",
    url = "https://github.com/Yggdroot/indentLine"
  },
  ["leetcode.vim"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/leetcode.vim",
    url = "https://github.com/ianding1/leetcode.vim"
  },
  ["lsp_lines.nvim"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/lsp_lines.nvim",
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine-lsp-progress.nvim"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/lualine-lsp-progress.nvim",
    url = "https://github.com/WhoIsSethDaniel/lualine-lsp-progress.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  neotest = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/neotest",
    url = "https://github.com/nvim-neotest/neotest"
  },
  neural = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/neural",
    url = "https://github.com/dense-analysis/neural"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-jump-mode"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/nvim-jump-mode",
    url = "https://github.com/rwblokzijl/nvim-jump-mode"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-surround"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-rainbow2"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/nvim-ts-rainbow2",
    url = "https://github.com/HiPhish/nvim-ts-rainbow2"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["significant.nvim"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/significant.nvim",
    url = "https://github.com/ElPiloto/significant.nvim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["text-case.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rtextcase\frequire\0" },
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/text-case.nvim",
    url = "https://github.com/johmsalas/text-case.nvim"
  },
  ["vim-asterisk"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/vim-asterisk",
    url = "https://github.com/haya14busa/vim-asterisk"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/vim-easy-align",
    url = "https://github.com/junegunn/vim-easy-align"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-grepper"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/vim-grepper",
    url = "https://github.com/mhinz/vim-grepper"
  },
  ["vim-highlightedyank"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/vim-highlightedyank",
    url = "https://github.com/machakann/vim-highlightedyank"
  },
  ["vim-indent-object"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/vim-indent-object",
    url = "https://github.com/michaeljsmith/vim-indent-object"
  },
  ["vim-ninja-feet"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/vim-ninja-feet",
    url = "https://github.com/tommcdo/vim-ninja-feet"
  },
  ["vim-projectionist"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/vim-projectionist",
    url = "https://github.com/tpope/vim-projectionist"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-sensible"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/vim-sensible",
    url = "https://github.com/tpope/vim-sensible"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  ["vim-sort-motion"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/vim-sort-motion",
    url = "https://github.com/christoomey/vim-sort-motion"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  ["vim-table-mode"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/vim-table-mode",
    url = "https://github.com/dhruvasagar/vim-table-mode"
  },
  ["vim-terraform"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/vim-terraform",
    url = "https://github.com/hashivim/vim-terraform"
  },
  ["vim-terraform-completion"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/vim-terraform-completion",
    url = "https://github.com/juliosueiras/vim-terraform-completion"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/vim-test",
    url = "https://github.com/vim-test/vim-test"
  },
  ["vim-textobj-comment"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/vim-textobj-comment",
    url = "https://github.com/glts/vim-textobj-comment"
  },
  ["vim-textobj-entire"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/vim-textobj-entire",
    url = "https://github.com/kana/vim-textobj-entire"
  },
  ["vim-textobj-line"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/vim-textobj-line",
    url = "https://github.com/kana/vim-textobj-line"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/vim-textobj-user",
    url = "https://github.com/kana/vim-textobj-user"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vuetify-vim"] = {
    loaded = true,
    path = "/home/bloodyfool/.local/share/nvim/0.original/site/pack/packer/start/vuetify-vim",
    url = "https://github.com/albanm/vuetify-vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: text-case.nvim
time([[Config for text-case.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rtextcase\frequire\0", "config", "text-case.nvim")
time([[Config for text-case.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
