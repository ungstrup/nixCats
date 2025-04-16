return {
    {
        "dmacro.vim",
        config = function()
            vim.keymap.set({ "i", "n" }, '<C-y>', '<Plug>(dmacro-play-macro)')
        end,
    },
}
