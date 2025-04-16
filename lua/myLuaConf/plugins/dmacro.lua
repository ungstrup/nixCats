return {
    {
        "dmacro.vim",
        event = "DeferredUIEnter",
        config = function()
        vim.keymap.set({ "i", "n" }, '<C-y>', '<Plug>(dmacro-play-macro)')
        end,
    },
}
