local function faster_get_path(name)
  local path = vim.tbl_get(package.loaded, "nixCats", "pawsible", "allPlugins", "opt", name)
  if path then
    vim.cmd.packadd(name)
    return path
  end
  return nil -- nil will make it default to normal behavior
end

---packadd + after/plugin
---@type fun(names: string[]|string)
local load_w_after_plugin = require('lzextras').make_load_with_afters({ "plugin" }, faster_get_path)

-- NOTE: packadd doesnt load after directories.
-- hence, the above function that you can get from luaUtils that exists to make that easy.

return {
    {
        "friendly-snippets",
        for_cat = 'general.cmp',
        dep_of = { "blink.cmp" },
    },
    {
        "luasnip",
        for_cat = 'general.cmp',
        dep_of = { "blink.cmp" },
        after = function (plugin)
            local luasnip = require 'luasnip'
            require('luasnip.loaders.from_vscode').lazy_load()
            luasnip.config.setup {}

            local ls = require('luasnip')

            vim.keymap.set({ "i", "s" }, "<M-n>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end)
        end,
    },
    {
        "blink.cmp",
        for_cat = "general.cmp",
        event = "DeferredUIEnter",
        after = function (plugin)
            require("blink.cmp").setup({
                keymap = { preset = "super-tab" },
                cmdline = {
                    enabled = true,
                    completion = {
                        menu = {
                            auto_show = true,
                        },
                    },
                },
                completion = {
                    documentation = {
                        auto_show = true,
                    },
                },
                signature = {
                    enabled = true,
                    window = {
                        show_documentation = true,
                    },
                },
                snippets = {
                    preset = "luasnip",
                },
                sources = {
                    default = { "lsp", "path", "snippets", "buffer" },
                },
            })
        end,
    },
}
