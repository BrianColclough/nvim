local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
map('i', 'jk', '<Esc>', opts)

-- window movement
map('n', '<leader>h', '<C-w>h', opts)
map('n', '<leader>l', '<C-w>l', opts)
map('n', '<leader>k', '<C-w>k', opts)
map('n', '<leader>j', '<C-w>j', opts)

map('n', '<c-P>',
    "<cmd>lua require('fzf-lua').files()<CR>",
    { noremap = true, silent = true })

map('n', 
    "<leader>ff", 
    "<cmd>lua require('telescope.builtin').find_files()<cr>",
    { noremap = true, silent = true })
map('n', 
    "<leader>fg", 
    "<cmd>lua require('telescope.builtin').live_grep()<cr>",
    { noremap = true, silent = true })
map('n', 
    "<leader>fb", 
    "<cmd>lua require('telescope.builtin').buffers()<cr>",
    { noremap = true, silent = true })
map('n', 
    "<leader>fh", 
    "<cmd>lua require('telescope.builtin').help_tags()<cr>",
    { noremap = true, silent = true })
    
-- Keymap for autcomplete
vim.api.nvim_create_autocmd('User', {
  pattern = 'LspAttached',
  desc = 'LSP actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = {buffer = true}
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Displays hover information about the symbol under the cursor
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

    -- Jump to the definition
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

    -- Jump to declaration
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

    -- Lists all the implementations for the symbol under the cursor
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

    -- Jumps to the definition of the type symbol
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

    -- Lists all the references 
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

    -- Displays a function's signature information
    bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

    -- Renames all references to the symbol under the cursor
    bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

    -- Selects a code action available at the current cursor position
    bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')

    -- Show diagnostics in a floating window
    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

    -- Move to the previous diagnostic
    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

    -- Move to the next diagnostic
    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
  end
})
