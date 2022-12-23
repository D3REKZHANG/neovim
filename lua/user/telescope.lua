local theme = require("telescope.themes")
local telescope = require('telescope')
local trouble = require('trouble.providers.telescope')

telescope.setup {
  defaults = {
    path_display = {"truncate"},
    mappings = {
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<C-t>"] = trouble.open_with_trouble,
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
    live_grep = {
      -- additional_args = {"-m","1"},
      disable_coordinates = true,
      path_display = {"tail"},
      layout_strategy = "horizontal",
      layout_config = {
        height = vim.o.lines, -- maximally available lines
        width = vim.o.columns, -- maximally available columns
        -- prompt_position = "top",
        preview_width = 0.4,
        preview_height = 0.2,
        -- mirror=true,
      },
    },
    colorscheme = {
      theme="dropdown",
    },
    buffers = {
      sorting_strategy = 'ascending',
      path_display = {"smart"},
      layout_strategy = "horizontal",
      layout_config = {
        height = 0.8,
        width = 0.8,
        prompt_position = "top",
        preview_width = 0.5, -- 60% of available lines
      },
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
