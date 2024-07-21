return {
  {
    "echasnovski/mini.nvim",
    lazy = false,
    config = function()
      require("mini.ai").setup()
      require("mini.indentscope").setup()
      require("mini.pairs").setup()
      require("mini.cursorword").setup()
      require("mini.jump").setup()
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

      return {
        {
          "<leader>fm",
          function()
            mini_files.open(vim.api.nvim_buf_get_name(0), true)
          end,
          desc = "Open mini.files (Directory of Current File)",
        },
        {
          "<leader>fM",
          function()
            mini_files.open(vim.uv.cwd(), true)
          end,
          desc = "Open mini.files (cwd)",
        },
      }
    end,
  },
}
