local nvimtree = require("nvim-tree")
local api = require("nvim-tree.api")
local colors = require("util.colors")

local nvim_tree_config = require("nvim-tree.config")
local tree_cb = nvim_tree_config.nvim_tree_callback
nvimtree.setup {
  disable_netrw = true,
  hijack_netrw = true,
  -- auto_close = true,
  -- open_on_tab = false,
  hijack_cursor = false,
  update_cwd = true,
  -- update_to_buf_dir = {
  --   enable = true,
  --   auto_open = true,
  -- },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = "left",
    -- auto_resize = true,
    mappings = {
      custom_only = true,
      list = {
        -- { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
        { key = "<C-e>",                          action = "edit_in_place" },
        { key = "O",                              action = "edit_no_picker" },
        -- { key = { "<C-]>", "<2-RightMouse>" },    action = "cd" },
        { key = "<C-v>",                          action = "vsplit" },
        { key = "<C-x>",                          action = "split" },
        { key = "<C-t>",                          action = "tabnew" },
        { key = "<",                              action = "prev_sibling" },
        { key = ">",                              action = "next_sibling" },
        { key = "P",                              action = "parent_node" },
        { key = "<BS>",                           action = "close_node" },
        -- { key = "<Tab>",                          action = "preview" },
        { key = "K",                              action = "first_sibling" },
        { key = "J",                              action = "last_sibling" },
        { key = "I",                              action = "toggle_git_ignored" },
        { key = "H",                              action = "toggle_dotfiles" },
        { key = "U",                              action = "toggle_custom" },
        { key = "R",                              action = "refresh" },
        { key = "a",                              action = "create" },
        { key = "d",                              action = "remove" },
        { key = "D",                              action = "trash" },
        { key = "r",                              action = "rename" },
        { key = "<C-r>",                          action = "full_rename" },
        { key = "x",                              action = "cut" },
        { key = "c",                              action = "copy" },
        { key = "p",                              action = "paste" },
        { key = "y",                              action = "copy_name" },
        { key = "Y",                              action = "copy_path" },
        { key = "gy",                             action = "copy_absolute_path" },
        { key = "[e",                             action = "prev_diag_item" },
        { key = "[c",                             action = "prev_git_item" },
        { key = "]e",                             action = "next_diag_item" },
        { key = "]c",                             action = "next_git_item" },
        { key = "-",                              action = "dir_up" },
        { key = "s",                              action = "system_open" },
        { key = "f",                              action = "live_filter" },
        { key = "F",                              action = "clear_live_filter" },
        { key = "q",                              action = "close" },
        { key = "W",                              action = "collapse_all" },
        { key = "E",                              action = "expand_all" },
        { key = "S",                              action = "search_node" },
        { key = ".",                              action = "run_file_command" },
        { key = "<C-k>",                          action = "toggle_file_info" },
        { key = "g?",                             action = "toggle_help" },
        { key = "m",                              action = "toggle_mark" },
        { key = "bmv",                            action = "bulk_move" },

        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "h", cb = tree_cb "close_node" },
        { key = "v", cb = tree_cb "vsplit" },
      },
    },
    number = false,
    relativenumber = false,
  },
  -- quit_on_open = 0,
  -- git_hl = 1,
  -- disable_window_picker = 0,
  -- root_folder_modifier = ":t",
  -- show_icons = {
  --   git = 1,
  --   folders = 1,
  --   files = 1,
  --   folder_arrows = 1,
  --   tree_width = 30,
  -- },

}

vim.keymap.set("n", "gn", api.tree.toggle)

function Color(hl_grp, color, bold)
  vim.api.nvim_set_hl(0, hl_grp, { link = colors.getColor(color, {bold=bold, rev=false}) })
end

-- :h nvim-tree-highlight
--    "highlight group",                   "Color",  "bold"
Color('NvimTreeFolderName',                'Blue',   true)

Color('NvimTreeSymlink',                   'Aqua',   true) --
Color('NvimTreeSymlink',                   'Aqua',   true) --
Color('NvimTreeFolderName',                'Blue',   true) --          (Directory)
Color('NvimTreeRootFolder',                'Blue',   true) --
Color('NvimTreeFolderIcon',                'Blue',   false) --
Color('NvimTreeFileIcon',                  'White',  false) --
Color('NvimTreeEmptyFolderName',           'Aqua',   false) --     (Directory)
Color('NvimTreeOpenedFolderName',          'Blue',   true) --    (Directory)
Color('NvimTreeExecFile',                  'Green',  true) --
Color('NvimTreeOpenedFile',                'Orange', false) --
Color('NvimTreeSpecialFile',               'Orange', false) --
Color('NvimTreeImageFile',                 'Purple', true) --

Color('NvimTreeGitDirty',                  'Orange', false) --
Color('NvimTreeGitStaged',                 'Yellow', false) --
Color('NvimTreeGitMerge',                  'Aqua',   false) --
Color('NvimTreeGitRenamed',                'Aqua',   false) --
Color('NvimTreeGitNew',                    'Yellow', false) --
Color('NvimTreeGitDeleted',                'Red',    false) --
Color('NvimTreeGitIgnored',                'Gray',   false) --      (Comment)

-- Color('NvimTreeIndentMarker',              'COLOR',  BOLD) --

-- Color('NvimTreeLspDiagnosticsError',       'COLOR',  BOLD) --         (DiagnosticError)
-- Color('NvimTreeLspDiagnosticsWarning',     'COLOR',  BOLD) --       (DiagnosticWarn)
-- Color('NvimTreeLspDiagnosticsInformation', 'COLOR',  BOLD) --   (DiagnosticInfo)
-- Color('NvimTreeLspDiagnosticsHint',        'COLOR',  BOLD) --          (DiagnosticHint)
-- Color('NvimTreeWindowPicker',              'COLOR',  BOLD) --

-- There are also links to normal bindings to style the tree itself.
-- Color('NvimTreeNormal',                    'COLOR',  BOLD) --
-- Color('NvimTreeEndOfBuffer',               'COLOR',  BOLD) --     (NonText)
-- Color('NvimTreeCursorLine',                'COLOR',  BOLD) --      (CursorLine)
-- Color('NvimTreeVertSplit',                 'COLOR',  BOLD) --       (VertSplit)     [deprecated, use NvimTreeWinSeparator]
-- Color('NvimTreeWinSeparator',              'COLOR',  BOLD) --    (VertSplit)
-- Color('NvimTreeCursorColumn',              'COLOR',  BOLD) --    (CursorColumn)

-- There are also links for file highlight with git properties linked to their
-- Git equivalent:
-- Color('NvimTreeFileDirty',                 'COLOR',  BOLD) --       (NvimTreeGitDirty)
-- Color('NvimTreeFileStaged',                'COLOR',  BOLD) --      (NvimTreeGitStaged)
-- Color('NvimTreeFileMerge',                 'COLOR',  BOLD) --       (NvimTreeGitMerge)
-- Color('NvimTreeFileRenamed',               'COLOR',  BOLD) --     (NvimTreeGitRenamed)
-- Color('NvimTreeFileNew',                   'COLOR',  BOLD) --         (NvimTreeGitNew)
-- Color('NvimTreeFileDeleted',               'COLOR',  BOLD) --     (NvimTreeGitDeleted)
-- Color('NvimTreeFileIgnored',               'COLOR',  BOLD) --     (NvimTreeGitIgnored)

-- There are 2 highlight groups for the live filter feature
-- Color('NvimTreeLiveFilterPrefix',          'COLOR',  BOLD) --
-- Color('NvimTreeLiveFilterValue',           'COLOR',  BOLD) --
-- Color of the bookmark icon
-- Color('NvimTreeBookmark',                  'COLOR',  BOLD) --
