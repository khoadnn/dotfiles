-- default config for all servers
vim.lsp.config("*", {
    on_attach = function(client, bufnr)
        -- enable inlay hint
        vim.lsp.inlay_hint.enable(true)

        -- mappings.
        -- see `:help vim.lsp.*` for documentation on any of the below functions
        -- lsp navigation keymaps
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr })
        vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr })
        vim.keymap.set("n", "<C-[>", vim.cmd.pop, { buffer = bufnr })

        -- lsp actions
        vim.keymap.set("n", "<Space>a", vim.lsp.buf.code_action, { buffer = bufnr })
        vim.keymap.set("v", "<Space>a", vim.lsp.buf.code_action, { buffer = bufnr })

        -- diagnostics keymaps
        vim.keymap.set("n", "<C-p>", function() vim.diagnostic.jump { count = -1, float = false } end)
        vim.keymap.set("n", "<C-n>", function() vim.diagnostic.jump { count = 1, float = false } end)

        -- diagnostics list
        vim.keymap.set("n", "<Space>xx", function()
            vim.diagnostic.setqflist { severity = vim.diagnostic.severity.ERROR }
        end)

        -- diagnostic signs
        vim.diagnostic.config { virtual_text = true, underline = true }

        -- completion
        vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = false })
    end,
    detached = true,
})

-- load config for servers
require("lsp.clangd")
require("lsp.gopls")
require("lsp.tsserver")
require("lsp.pylsp")

-- can be disabled by `:lua vim.lsp.enable("tsserver", false)` for example
vim.lsp.enable({ "clangd", "gopls", "tsserver", "pylsp" })
