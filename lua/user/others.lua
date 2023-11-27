require("lualine").setup {
    options = {
        -- component_separators = { left = '', right = '/'},
        section_separators = '',
        -- component_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
        component_separators = '',
        -- section_separators = { left = '', right = '' },

        globalstatus = true,
    },
    sections = {
      lualine_a = {
        {
          'mode',
          separator = { left = '', right = '' },
          -- fmt = function(str) return ' ' end,
          -- padding = { left = 0, right = 0 },
        },
      },
      lualine_c = {
        {
          'filename',
          file_status = false, -- displays file status (readonly status, modified status)
          path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
        },
      },
      lualine_b = {
        'diagnostics',
      },
      lualine_x = { 'filetype' },
      lualine_y = { 'branch', 'diff' },
      lualine_z = { 'location'},
  }
}

require("nvim-treesitter.configs").setup {
  ensure_installed = { "javascript", "typescript", "python" },
  sync_install = false,
  indent = {
    enable = true,
    disable = { 'python', 'c'} -- these and some other langs don't work well
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.hypr = {
  install_info = {
    url = "https://github.com/luckasRanarison/tree-sitter-hypr",
    files = { "src/parser.c" },
    branch = "master",
  },
  filetype = "hypr",
}

require('aerial').setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  -- highlight_on_hover = true,
  nav = {
    autojump = true,
  }
})

require('fine-cmdline').setup({
  cmdline = {
    prompt = ':'
  },
})

require("diffview").setup({
  view = {
    default = {
      layout = "diff2_horizontal",
    },
  }
})

require("catppuccin").setup({
  flavour = "macchiato", -- latte, frappe, macchiato, mocha
})

require("transparent").setup({
  extra_groups = {
    "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
    "TelescopeNormal",
  },
})
