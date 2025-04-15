return {
{
    "mini.nvim",
    for_cat = 'general.always',
    event = "DeferredUIEnter",
    after = function(plugin)
      require('mini.surround').setup()
      require('mini.pairs').setup()
      require('mini.comment').setup()
    end,
  },
}
