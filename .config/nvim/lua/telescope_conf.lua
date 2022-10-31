require('telescope').setup{
    defaults = {
        promt_prefix = "> "
    },
mappings = {
  -- i = {
  --           ["<C-[>"] = require('telescope.actions').close,
  --               },
  n = {
            ["<C-[>"] = { "<esc>", type = "command" },
                },
                  }


}
require('telescope').load_extension('fzf')
