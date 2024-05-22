return {
  {
    "echasnovski/mini.nvim",
    lazy = false,
    config = function()
      require("mini.ai").setup()
      require("mini.indentscope").setup()
      require("mini.pairs").setup()
      require("mini.surround").setup({
        mappings = {
          add = "<leader>sa",
          delete = "<leader>sd",
          find = "<leader>sf",
          find_left = "<leader>sF",
          highlight = "<leader>sh",
          replace = "<leader>sr",
          update_n_lines = "<leader>sn",

          suffix_last = "l",
          suffix_next = "n",
        },
      })
      require("mini.files").setup({
        content = {
          filter = function(entry)
            local skipDirs = { ".git" }
            local skipFiles = { ".DS_Store" }

            if entry.fs_type == "directory" then
              for _, dir in ipairs(skipDirs) do
                if entry.name == dir then
                  return false
                end
              end
            end

            if entry.fs_type == "file" then
              for _, file in ipairs(skipFiles) do
                if entry.name == file then
                  return false
                end
              end
            end

            return true
          end,
        },
        windows = {
          preview = true,
          width_focus = 30,
          width_preview = 30,
        },
      })
    end,
    keys = function()
      local mini_files = require("mini.files")

      local mini_files_toggle = function()
        if not mini_files.close() then
          mini_files.open()
        end
      end

      return {
        {
          "<leader>'",
          function()
            mini_files_toggle()
          end,
          desc = "Toggle file browser",
        },
      }
    end,
  },
}
