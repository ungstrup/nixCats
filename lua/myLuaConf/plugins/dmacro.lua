return {
    {
        "dmacro.vim",
        event = "DeferredUIEnter",
        config = function()
        vim.keymap.set({ "i", "n" }, '<C-m>', '<Plug>(dmacro-play-macro)')
        end,
    },
}
