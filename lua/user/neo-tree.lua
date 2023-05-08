local status_ok, neo_tree = pcall(require, "neo-tree")
if not status_ok then
	vim.notify("Neotree not found")
	return
end
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

neo_tree.setup({
	close_if_last_window = true,
	enable_diagnostics = false,
	source_selector = {
		winbar = true,
		content_layout = "center",
		source = {
			filesystem = " File",
			buffers = "➜ Buffs",
			git_status = " Git",
			diagnostics = "",
		},
	},
	default_component_configs = {
		indent = {
			padding = 0,
		},
		icon = {
			folder_closed = "",
			folder_open = "",
			folder_empty = "",
		},
		git_status = {
			symbols = {
				added = "",
				deleted = "",
				modified = "",
				renamed = "",
				untracked = "",
				ignored = "",
				unstaged = "",
				staged = "",
				conflict = "",
			},
		},
	},
	window = {
		width = 30,
    mapping_options = {
      noremap=true
    },
    mappings = {
      ["<space>"] = { 
        "toggle_node", 
        nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use 
      },
      ["<2-LeftMouse>"] = "open",
      ["o"] = "open",
      ["<esc>"] = "revert_preview",
      ["P"] = { "toggle_preview", config = { use_float = true } },
      ["l"] = "focus_preview",
      ["S"] = "open_split",
      ["s"] = "open_vsplit",
      -- ["S"] = "split_with_window_picker",
      -- ["s"] = "vsplit_with_window_picker",
      ["t"] = "open_tabnew",
      -- ["<cr>"] = "open_drop",
      -- ["t"] = "open_tab_drop",
      ["w"] = "open_with_window_picker",
      --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
      ["C"] = "close_node",
      -- ['C'] = 'close_all_subnodes',
      -- ["z"] = "close_all_nodes",
      --["Z"] = "expand_all_nodes",
      ["a"] = { 
        "add",
        -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
        -- some commands may take optional config options, see `:h neo-tree-mappings` for details
        config = {
          show_path = "none" -- "none", "relative", "absolute"
        }
      },
      ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
      ["d"] = "delete",
      ["r"] = "rename",
      ["y"] = "copy_to_clipboard",
      ["x"] = "cut_to_clipboard",
      ["p"] = "paste_from_clipboard",
      ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
      -- ["c"] = {
      --  "copy",
      --  config = {
      --    show_path = "none" -- "none", "relative", "absolute"
      --  }
      --}
      ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
      ["q"] = "close_window",
      ["R"] = "refresh",
      ["?"] = "show_help",
      ["<"] = "prev_source",
      [">"] = "next_source",
    }
	},
	filesystem = {
		follow_current_file = true,
		hijack_netrw_behavior = "open_current",
		use_libuv_file_watcher = true,
		filtered_items = {
			visible = true,
			hide_dotfiles = false,
			hide_gitignored = true,
		},
	},
	event_handlers = {
		{
			event = "neo_tree_buffer_enter",
			handler = function(_)
				vim.opt_local.signcolumn = "auto"
			end,
		},
	},
})
