local db = require('dashboard')

local header = {
    '',
    '',
    '',
    '',
    '          ▀████▀▄▄              ▄█ ',
    '            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ',
    '    ▄        █          ▀▀▀▀▄  ▄▀  ',
    '   ▄▀ ▀▄      ▀▄              ▀▄▀  ',
    '  ▄▀    █     █▀   ▄█▀▄      ▄█    ',
    '  ▀▄     ▀▄  █     ▀██▀     ██▄█   ',
    '   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ',
    '    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ',
    '   █   █  █      ▄▄           ▄▀   ',
    '',
}

local footer = {
  '',
  '  yert',
}
 
db.setup({
  theme='doom',
  config = {
    header = header,
    center = {
      {
        icon = '  ',
        icon_hl = 'Title',
        desc = 'New File            ',
        action ='DashboardNewFile',
        key='SPC  n',
        key_hl='Number'
      },
      {
        icon = '  ',
        icon_hl = 'Title',
        desc = 'Open File           ',
        action =  'Telescope find_files',
        key='CTRL P',
        key_hl='Number'
      },
      {
        icon = '  ',
        icon_hl = 'Title',
        desc = 'Open Config         ',
        action = 'e $MYVIMRC',
        key = 'SPC  v',
        key_hl='Number'
      },
      {
        icon = '  ',
        icon_hl = 'Title',
        desc = 'Update Plugins            ',
        action = 'PlugUpdate',
      },
      {
        icon = '  ',
        icon_hl = 'Title',
        desc = 'Edit Colorscheme    ',
        action = 'Telescope colorscheme',
        key = 'SPC  9',
        key_hl='Number'
      },
    },
    footer = footer,
  }
})
