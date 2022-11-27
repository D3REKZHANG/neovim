require("nvim-tree").setup{
    view = {width = "20%"},
    update_focused_file = { enable = true },
    renderer = {
      icons = {
        show = {
          folder = true,
          folder_arrow = true,
        },
        glyphs = {
          folder = {
            default ="",
            open = "ﱮ",
          },
          git = {
            unstaged = "",
            staged = "",
            unmerged = "",
            renamed = "➜",
            untracked = "★",
            deleted = "",
            ignored = "◌",
          },
        }
      },
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      debounce_delay = 50,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
}
