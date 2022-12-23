require("bufferline").setup{
    options = {
        offsets = {
          {
            filetype = "NvimTree",
            text="File Explorer",
            text_align = "left",
            separator = false,
          }
        },

        diagnostics = "nvim_lsp",
        separator_style = {"", ""},
        modified_icon = '●',
        show_close_icon = false,
        show_buffer_close_icons = false,
    },
  -- highlights = {
  --   offset_separator = {
  --     bg = '#'..string.format("%06x", vim.api.nvim_get_hl_by_name("Normal", true).background),
  --   }
  -- }
}
