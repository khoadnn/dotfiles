-- generate ctags in the background
vim.keymap.set("n", "<leader>tg", function()
    if vim.fn.executable("ctags") < 1 then
        print "no ctags installation found"
        return
    end
    local job = vim.fn.jobstart { "ctags", "--tag-relative=never", "-G", "-R", "." }
    print("generate tags..., id: " .. job)
end)
