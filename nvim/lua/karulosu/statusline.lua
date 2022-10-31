-- local colors = {
--   bg = '#282828',
--   black = '#282828',
--   yellow = '#d8a657',
--   cyan = '#89b482',
--   oceanblue = '#45707a',
--   green = '#a9b665',
--   orange = '#e78a4e',
--   violet = '#d3869b',
--   magenta = '#c14a4a',
--   white = '#a89984',
--   fg = '#a89984',
--   skyblue = '#7daea3',
--   red = '#ea6962',
-- }
--
-- local gruvbox = {
--   normal = {
--     a = {bg = colors.green, fg = colors.black, gui = 'bold'},
--     b = {bg = colors.bg, fg = colors.white},
--     c = {bg = colors.bg, fg = colors.white}
--   },
--   insert = {
--     a = {bg = colors.red, fg = colors.black, gui = 'bold'},
--     b = {bg = colors.bg, fg = colors.white},
--     c = {bg = colors.bg, fg = colors.white}
--  },
--   visual = {
--     a = {bg = colors.skyblue, fg = colors.black, gui = 'bold'},
--     b = {bg = colors.bg, fg = colors.white},
--     c = {bg = colors.bg, fg = colors.white}
--   },
--   replace = {
--     a = {bg = colors.violet, fg = colors.black, gui = 'bold'},
--     b = {bg = colors.bg, fg = colors.white},
--     c = {bg = colors.bg, fg = colors.white}
--   },
--   command = {
--     a = {bg = colors.green, fg = colors.black, gui = 'bold'},
--     b = {bg = colors.bg, fg = colors.white},
--     c = {bg = colors.bg, fg = colors.white}
--   },
--   inactive = {
--     a = {bg = colors.yellow, fg = colors.black, gui = 'bold'},
--     b = {bg = colors.bg, fg = colors.white},
--     c = {bg = colors.bg, fg = colors.white}
--   },
-- }

require('lualine').setup {
  options = {
    -- theme = 'catppuccin',
    theme = 'tokyonight',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    icons_enabled = true,
    always_divide_middle = true,
    globalstatus = true,
  },

  sections = {
      lualine_a = {
          {'mode',
          icon = '',
          separator = { right = '' },
          right_padding = 2,
      }
  },
  lualine_b = {'branch', 'diff', 
  {'diagnostics',
          sections = { 'error', 'warn', 'info', 'hint' },
          symbols = {error = '', warn = '', info = '', hint = ''},
          colored = true,           -- Displays diagnostics status in color if set to true.
          update_in_insert = false, -- Update diagnostics in insert mode.
          always_visible = false,   -- Show diagnostics even if there are none.
        },

  },
  lualine_c = { '%=',
      {'filename',
      file_status = false,
      path = 0,
  }
  },
  lualine_x = {},
  lualine_y = {
      {separator = {left = ''}, 
      left_padding = 2, 
      'filetype', 
      'progress',
  }},
  lualine_z = {
      {'location',
        separator = {left = ''},
        left_padding = 2,
    }}
  },
  inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
  },
  tabline = {},
  extensions = {},
}
