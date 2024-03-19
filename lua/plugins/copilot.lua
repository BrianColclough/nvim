return {
   "github/copilot.vim",
   config = function()
      local map = vim.api.nvim_set_keymap
      vim.g.copilot_no_tab_map = true

      map("i", "<C-c>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
   end,
}
