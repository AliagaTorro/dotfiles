local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed
        }
    end
end

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
        lualine_b = {
            {'branch',
                separator = { right = '' },
            }
        },
        lualine_c = {
            {'diff', source = diff_source}, 
            {'diagnostics',
                sections = { 'error', 'warn', 'info', 'hint' },
                symbols = {error = '', warn = '', info = '', hint = ''},
                colored = true,           -- Displays diagnostics status in color if set to true.
                update_in_insert = false, -- Update diagnostics in insert mode.
                always_visible = false,   -- Show diagnostics even if there are none.
            },
            '%=',
            {'filename',
                file_status = false,
                path = 0,
            },
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
