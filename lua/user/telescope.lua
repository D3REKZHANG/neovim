local theme = require("telescope.themes")
local telescope = require('telescope')
telescope.setup {
  defaults = {
    path_display = {"truncate"},
    mappings = {
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      }
    }
  },
  pickers = {
    find_files = {
      -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
      find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
      theme="dropdown",
      previewer = false,
      layout_config = {
        center = {
          height = 0.3,
        }
      }
    },
    lsp_references = {
      theme="ivy",
    },
    colorscheme = {
      theme="dropdown",
    },
    buffers = {
      theme = "dropdown",
      previewer = false,
      path_display = {"tail"},
    }
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
    }
  }
}

telescope.load_extension("ui-select")

local builtin = require('telescope.builtin')
vim.keymap.set('n', 'gr', builtin.lsp_references, {})
