local map = vim.keymap.set

map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- Navigation through diagnostics
map('n', '(d', function()
  vim.diagnostic.goto_prev { float = { border = 'rounded' } }
end, { desc = 'Goto prev' })

map('n', ')d', function()
  vim.diagnostic.goto_next { float = { border = 'rounded' } }
end, { desc = 'Goto next' })

map('n', '<BS>q', function()
  if not pcall(function()
    vim.cmd 'cclose'
  end) then
    pcall(function()
      vim.cmd 'lclose'
    end)
  end
end, { desc = 'Close Quickfix/Location list' })

map('n', ')c', function()
  if vim.wo.diff then
    return ']c'
  end
  vim.schedule(function()
    require('gitsigns').next_hunk()
  end)
  return '<Ignore>'
end, { desc = 'Jump to next hunk' })

map('n', '(c', function()
  if vim.wo.diff then
    return '[c'
  end
  vim.schedule(function()
    require('gitsigns').prev_hunk()
  end)
  return '<Ignore>'
end, { desc = 'Jump to prev hunk' })

-- Navigation through hunks
-- [")c"] = {
--   function()
--     if vim.wo.diff then
--       return "]c"
--     end
--     vim.schedule(function()
--       require("gitsigns").next_hunk()
--     end)
--     return "<Ignore>"
--   end,
--   "Jump to next hunk",
--   opts = { expr = true },
-- },

-- ["(c"] = {
--   function()
--     if vim.wo.diff then
--       return "[c"
--     end
--     vim.schedule(function()
--       require("gitsigns").prev_hunk()
--     end)
--     return "<Ignore>"
--   end,
--   "Jump to prev hunk",
--   opts = { expr = true },
-- },

map('n', ')<Space>', 'o<ESC>k', { desc = 'Add empty line below' })

map('n', '(<Space>', 'O<ESC>j', { desc = 'Add empty line above' })

map('n', ')l', function()
  if not pcall(function()
    vim.cmd 'lnext'
  end) then
    pcall(function()
      vim.cmd 'lrewind'
    end)
  end
end, { desc = 'LocationList next' })

map('n', '(l', function()
  if not pcall(function()
    vim.cmd 'lprev'
  end) then
    pcall(function()
      vim.cmd 'llast'
    end)
  end
end, { desc = 'LocationList prev' })

map('n', ')q', function()
  if not pcall(function()
    vim.cmd 'cnext'
  end) then
    pcall(function()
      vim.cmd 'crewind'
    end)
  end
end, { desc = 'Quickfix next' })

map('n', '(q', function()
  if not pcall(function()
    vim.cmd 'cprev'
  end) then
    pcall(function()
      vim.cmd 'clast'
    end)
  end
end, { desc = 'Quickfix prev' })

map('n', '<leader>aa', function()
  vim.cmd [[ argadd ]]
end, { desc = 'Arg Add' })

map('n', '<leader>ad', function()
  vim.cmd [[ argdelete ]]
end, { desc = 'Arg Delete' })

map('n', '<leader>an', function()
  if not pcall(function()
    vim.cmd 'next'
  end) then
    pcall(function()
      vim.cmd 'rewind'
    end)
  end
end, { desc = 'Goto next arg' })

map('n', '<leader>ap', function()
  if not pcall(function()
    vim.cmd 'previous'
  end) then
    pcall(function()
      vim.cmd 'last'
    end)
  end
end, { desc = 'Goto prev arg' })

map('n', '<leader>fv', function()
  require('telescope.builtin').find_files { search_dirs = { '/home/taha/.config/kickstart.nvim/' } }
end, { desc = 'Find neovim config files' })

map('n', '<leader>gv', function()
  require('telescope.builtin').live_grep { search_dirs = { '/home/taha/.config/kickstart.nvim/' } }
end, { desc = 'Grep neovim config' })

map('n', '<leader>fn', function()
  require('telescope.builtin').find_files { search_dirs = { '/home/taha/keep/note/' } }
end, { desc = 'Find notes' })

map('n', '<leader>gn', function()
  require('telescope.builtin').live_grep { search_dirs = { '/home/taha/keep/note/' } }
end, { desc = 'Grep notes' })

map('n', '<leader>fd', function()
  vim.cmd [[Easypick dotfiles]]
end, { desc = 'Find dotfiles' })

map('n', '<leader>gd', function()
  local search_dirs = {}
  local pipe = io.popen 'yadm list -a'
  for line in pipe:lines() do
    table.insert(search_dirs, line)
  end
  pipe:close()
  require('telescope.builtin').live_grep { cwd = '/home/taha/', search_dirs = search_dirs }
end, { desc = 'Grep dotfiles' })

-- map("n", "<leader>P", function()
--   require("nvim-tree.api").tree.toggle({ path = "./", focus = true })
-- end,
--   { desc = "Find & Focus File in Tree"})
--
-- map("n", "<leader>E", function()
--   require("nvim-tree.api").tree.toggle({ find_files = true, update_root = true, focus = true })
-- end,
--   { desc = "Find & Focus & Toggle File in Tree"})
