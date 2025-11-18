

-- local harpoon = require("harpoon")
--
-- local function harpoon_list()
--   local list = harpoon:list().items
--   local strings = {}
--
--   for i, item in ipairs(list) do
--     table.insert(strings, string.format("%d:%s", i, item.value))
--   end
--
--   return table.concat(strings, "  |  ")
-- end

return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local harpoon_files = require 'harpoon_files'
      require('lualine').setup {
          sections = {
              lualine_c = {
                  { harpoon_files.lualine_component },
              },
          },
            -- sections = {
            --   lualine_a = { "mode" },
            --   lualine_b = { "branch" },
            --
            --   lualine_c = {
            --       { harpoon.list },
            --   },
            --
            --   lualine_x = { "encoding", "fileformat", "filetype" },
            --   lualine_y = { "progress" },
            --   lualine_z = { "location" },
            -- },
      }
    end
  },
}

