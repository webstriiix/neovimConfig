---
-- LSP configuration
---
vim.opt.signcolumn = 'yes'

local lspconfig = require('lspconfig')
local capabilities = require("cmp_nvim_lsp").default_capabilities()


-- java jdk setting
local jdtls_settings = {
    java = {
        configuration = {
            runtimes = {
                {
                    name = "JavaSE-17",
                    path = "/usr/lib/jvm/java-17-openjdk", -- adjust to your actual path
                    default = true,
                },
                {
                    name = "JavaSE-23",
                    path = "/usr/lib/jvm/java-23-openjdk",
                },
            },
        },
    },
}

-- Add cmp_nvim_lsp capabilities settings to lspconfig
lspconfig.util.default_config.capabilities = vim.tbl_deep_extend(
    'force',
    lspconfig.util.default_config.capabilities,
    capabilities
)

-- Define on_attach function
local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr }

    -- Key mappings
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    vim.keymap.set('n', 'e', '<cmd>lua vim.diagnostic.open_float(0, {scope="line"})<cr>', opts)
    vim.keymap.set("n", "<Tab>", ":NvimTreeToggle<CR>", { desc = "Toggle file tree" })
    -- List document (current file) symbols (methods, classes, etc.)
    vim.keymap.set("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, { desc = "Document Symbols" })

    -- List all classes, methods, etc. in the workspace (project)
    vim.keymap.set("n", "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols,
        { desc = "Workspace Symbols" })
end

-- Executes the callback function every time a
-- language server is attached to a buffer.
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', 'e', '<cmd>lua vim.diagnostic.open_float(0, {scope="line"})<cr>', opts)
    end,
})

-- Language server setups
require('lspconfig').gleam.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

require('lspconfig').rust_analyzer.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

require("lspconfig").vtsls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- IMPORTANT: Remove or comment out this jdtls setup since nvim-java handles it
-- require("lspconfig").jdtls.setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
--   settings = jdtls_settings,
-- })

-- Setting Clang
lspconfig.clangd.setup({
    cmd = { 'clangd', '--background-index', '--clang-tidy', '--log=verbose' },
    init_options = {
        fallbackFlags = { '-std=c++17' },
    },
    capabilities = capabilities,
    on_attach = on_attach,
})

require('lspconfig').lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

---
-- Autocompletion setup
---
local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            -- You need Neovim v0.10 to use vim.snippet
            vim.snippet.expand(args.body)
        end,
    },
    mapping = {
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' }, -- LSP completion
        { name = 'buffer' },   -- Buffer words
        { name = 'path' },     -- File paths
    })
})

