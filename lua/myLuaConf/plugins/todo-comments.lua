-- Highlight todo, notes, etc in comments
return {
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = "DeferredUIEnter",
    after = function(_)
      require("todo-comments").setup()
    end,
  },
}
