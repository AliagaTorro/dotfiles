local remap = require("karulosu.keymap")
local nnoremap = remap.nnoremap
local inoremap = remap.inoremap

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Setup nvim-cmp.
local cmp = require("cmp")
local source_mapping = {
    buffer = "[Buff]",
    luasnip = "[Snip]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    path = "[Path]",
}
local lspkind = require("lspkind")

cmp.setup({
    snippet = {
        expand = function(args)
            -- For `luasnip` user.
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-y>'] = cmp.mapping.complete(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.confirm({ select = true }),
        -- ["<C-Space>"] = com.mapping.complete(),
        -- ["<CR>"] = cmp.mapping.cofirm {
        --     behavior = cmp.ConfirmBehavior.Replace,
        --     select = true,
        -- },
        ["<C-j>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.jumpable(1) then
                luasnip.jump(1)
            else

                fallback()
            end
        end
        ),
        ["<C-k>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end
        ),
    }),

    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text', -- show only symbol annotations
            menu = source_mapping,
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
        })
    },

    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = 'nvim_lsp_signature_help' },
        { name = "buffer", max_item_count = 3},
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    experimental = {
        ghost_text = false,
        native_menu = false,
    },
})

local snippets_paths = function()
    local plugins = { "friendly-snippets" }
    local paths = { "~/.config/nvim/lua/snippets/" }
    local path
    local root_path = vim.env.HOME .. "/.vim/plugged/" 
    for _, plug in ipairs(plugins) do
        path = root_path .. plug
        if vim.fn.isdirectory(path) ~= 0 then
            table.insert(paths, path)
        end
    end
    return paths
end

require("luasnip.loaders.from_vscode").lazy_load({
    paths = snippets_paths(),
    include = nil, -- Load all languages
    exclude = {},
})

---------  LSP   -----------

local on_attach = function(client, bufnr)
    require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
    nnoremap("gd", function() vim.lsp.buf.definition() end)
    nnoremap("H", function() vim.lsp.buf.hover() end)
    nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
    nnoremap("[d", function() vim.lsp.diagnostic.goto_next() end)
    nnoremap("]d", function() vim.lsp.diagnostic.goto_prev() end)
    nnoremap("<leader>vca", function() vim.lsp.buf.code_action() end)
    nnoremap("<leader>vrr", function() vim.lsp.buf.references() end)
    nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end)
    nnoremap("[d", function() vim.diagnostic.goto_prev() end)
    nnoremap("]d", function() vim.diagnostic.goto_next() end)
    nnoremap("<leader>q", ":TroubleToggle<CR>")
    nnoremap('gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
    nnoremap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        if vim.lsp.buf.format then
            vim.lsp.buf.format()
        elseif vim.lsp.buf.formatting then
            vim.lsp.buf.formatting()
        end
    end, { desc = 'Format current buffer with LSP' })

    nnoremap("<leader>f", '<Cmd>Format<CR>')
    nnoremap("<leader>so", '<Cmd>SymbolsOutline<CR>')
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = capabilities,
        on_attach = on_attach,
        handlers = {
            ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded"}),
            ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = "rounded", focusable = true, relative = "cursor"}),
            ["textDocument/show_line_diagnostics"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "rounded"}),
            ["textDocument/diagnostic"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "rounded"}),
            ["textDocument/diagnostics"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "rounded"})
        },
    }, _config or {})
end

require("mason").setup()

require("mason-lspconfig").setup()

require("lspconfig").tsserver.setup(config({
    init_options = {
    preferences = {
            disableSuggestions = true,
        }
    }
}))

require("lspconfig").ccls.setup(config())

require("lspconfig").jedi_language_server.setup(config())

require("lspconfig").pylsp.setup(config(
    {
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = { ignore = E501 },
            }
        }
    }
}
))
-- require("lspconfig").pyright.setup(config())

require("lspconfig").cssls.setup(config())

require("lspconfig").emmet_ls.setup(config())

require("lspconfig").html.setup(config())

require("lspconfig").cssls.setup(config())

require("lspconfig").rust_analyzer.setup(config())

require("lspconfig").jsonls.setup(config())

require'lspconfig'.astro.setup(config())

-- require("lspconfig").eslint.setup(config())

require'lspconfig'.phpactor.setup(config())

require'lspconfig'.intelephense.setup(config())

-- require("lspconfig").dartls.setup(config())

require("lspconfig").yamlls.setup(config({
    -- require("yaml-companion").setup()
}))

require("lspconfig").omnisharp_mono.setup(config())


require'lspconfig'.angularls.setup(config())


require("lspconfig").gopls.setup(config({
    cmd = { "gopls", "serve" },
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}))

-- require "lspconfig".efm.setup {
--     init_options = {documentFormatting = true},
--     settings = {
--         rootMarkers = {".git/"},
--         languages = {
--             lua = {
--                 {formatCommand = "lua-format -i", formatStdin = true}
--             }
--         }
--     }
-- }

require("flutter-tools").setup{
    lsp = {
        capabilities = capabilities,
        on_attach = on_attach,
    },
}

local null_ls = require("null-ls")
require("null-ls").setup({
    sources = {
        null_ls.builtins.formatting.dart_format,
        null_ls.builtins.formatting.rustfmt,
        -- null_ls.builtins.formatting.eslint,
        null_ls.builtins.formatting.prettier,
    },
})

vim.diagnostic.config({
    underline = true,
    signs = true,
    virtual_text = true,
    float = {
        show_header = true,
        source = 'if_many',
        border = 'rounded',
        focusable = false,
    },
    update_in_insert = false, -- default to false
    virtual_text = { spacing = 4, prefix = "●" },
    severity_sort = false, -- default to false
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local opts = {
    highlight_hovered_item = true,
    show_guides = true,
}

require("symbols-outline").setup(opts)

require('lspconfig.ui.windows').default_options.border = 'rounded'
