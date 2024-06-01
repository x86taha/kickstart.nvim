vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local utilities = vim.api.nvim_create_augroup('utilities', { clear = true })
vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = '*',
  group = utilities,
  desc = 'last edit position',
  callback = function()
    if vim.fn.line '\'"' and vim.fn.line '\'"' <= vim.fn.line '$' then
      vim.cmd [[normal! g`"]]
    end
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  group = utilities,
  desc = 'disable autocommenting on newline',
  callback = function()
    vim.opt.formatoptions:remove 'c'
    vim.opt.formatoptions:remove 'r'
    vim.opt.formatoptions:remove 'o'
  end,
})

vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufNewFile' }, {
  pattern = '*',
  group = utilities,
  desc = 'disable diagnostics on start',
  callback = function()
    vim.diagnostic.disable()
  end,
})

vim.api.nvim_set_hl(0, 'InactiveWindow', { bg = '#0D1B22' })
vim.api.nvim_create_autocmd({ 'WinLeave' }, {
  pattern = '*',
  group = utilities,
  desc = 'dim window',
  callback = function()
    -- wo.number = false
    vim.wo.relativenumber = false
    vim.wo.winhighlight = 'NormalNC:InactiveWindow'
  end,
})
vim.api.nvim_create_autocmd({ 'WinEnter' }, {
  pattern = '*',
  group = utilities,
  desc = 'light up window',
  callback = function()
    -- wo.number = true
    vim.wo.relativenumber = true
    vim.wo.winhighlight = 'Normal:Normal'
  end,
})
