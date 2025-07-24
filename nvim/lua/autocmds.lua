-- quick exit some filetypes
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "help", "qf", "checkhealth", "fugitive", "fugitiveblame" },
    callback = function(e)
        vim.opt.cursorline = true
        vim.keymap.set("n", "q", vim.cmd.quit, { buffer = 0 })
    end
})

-- open the quickfix window whenever a quickfix command is executed
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
    pattern = "[^l]*",
    callback = function(e)
        vim.cmd.cwindow()
        vim.opt_local.cursorline = true
    end
})

-- highlight the yanked text during a TextYankPost event.
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function(e)
        vim.hl.on_yank({ higroup = "IncSearch", timeout = 150, silent = true })
    end
})
