local remap = require("karulosu.keymap")
local nnoremap = remap.nnoremap
local inoremap = remap.inoremap

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local border = {
    { "╭", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╮", "FloatBorder" },
    { "│", "FloatBorder" },
    { "╯", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╰", "FloatBorder" },
    { "│", "FloatBorder" },
}

-- Setup nvim-cmp.
local cmp = require("cmp")
local source_mapping = {
    buffer = "[Buff]",
    -- luasnip = "[Snip]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    path = "[Path]",
}
local lspkind = require("lspkind")

-- require("luasnip/loaders/from_vscode").lazy_load() -- loading VSCode snippets

cmp.setup({
    snippet = {
        expand = function(args)
            -- For `vsnip` user.
            -- vim.fn["vsnip#anonymous"](args.body)

            -- For `luasnip` user.
            require("luasnip").lsp_expand(args.body)

            -- For `ultisnips` user.
            -- vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-y>'] = cmp.mapping.complete(),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end
        ),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
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
            mode = "symbol_text",
            menu = source_mapping,
        }),
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

local on_attach = function(client, bufnr)
    require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
    nnoremap("gd", function() vim.lsp.buf.definition() end)
    nnoremap("K", function() vim.lsp.buf.hover() end)
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
    inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = capabilities,
        on_attach = on_attach,
        handlers = {
            ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single"}),
            ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = "single", focusable = true, relative = "cursor"}),
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

-- require("lspconfig").pyright.setup(config())

require("lspconfig").cssls.setup(config())

require("lspconfig").emmet_ls.setup(config())

require("lspconfig").html.setup(config())

require("lspconfig").cssls.setup(config())

require("lspconfig").rust_analyzer.setup(config())

require("lspconfig").jsonls.setup(config())

require'lspconfig'.astro.setup(config())

require("lspconfig").eslint.setup(config())

require("lspconfig").yamlls.setup(config({
    require("yaml-companion").setup()
}))

require("lspconfig").omnisharp_mono.setup(config())

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


require("flutter-tools").setup{
    lsp = {
        capabilities = capabilities,
        on_attach = on_attach,
        handlers = {
            ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single"}),
            ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = "single", focusable = true, relative = "cursor"}),
        },

    },
}

local null_ls = require("null-ls")
require("null-ls").setup({
    sources = {
        null_ls.builtins.formatting.dart_format,
        null_ls.builtins.formatting.rustfmt,
        -- null_ls.builtins.code_actions.eslint,
        -- require("null-ls").builtins.formatting.stylua,
        -- require("null-ls").builtins.diagnostics.eslint,
        -- require("null-ls").builtins.completion.spell,
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

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = true,
    underline = true,
    update_in_insert = false,
    virtual_text = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})

local opts = {
    highlight_hovered_item = true,
    -- width = 35,
    show_guides = true,
}

require("symbols-outline").setup(opts)

