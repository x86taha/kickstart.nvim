-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'tweekmonster/startuptime.vim',
    cmd = 'StartupTime',
  },

  {
    'rebelot/kanagawa.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'kanagawa'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    -- config = function()
    --   require'oil'.setup({})
    --   vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    -- end,
  },

  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  {
    'mbbill/undotree',
    -- lazy = true,
    cmd = 'UndoTree',
    keys = {
      { '<leader>ut', '<cmd>UndotreeToggle<cr>', desc = 'toggle undotree' },
      { '<leader>uf', '<cmd>UndotreeFocus<cr>', desc = 'focus undotree' },
    },
  },

  {
    'NvChad/nvim-colorizer.lua',
    -- lazy = true,
    ft = { 'css', 'html', 'js' },
    cmd = 'ColorizerToggle',
    -- init = function()
    -- end,
  },

  {
    'axkirillov/easypick.nvim',
    cmd = 'Easypick',
    opts = {
      pickers = {
        {
          name = 'dotfiles',
          command = 'yadm list -a | awk \'{print "/home/taha/"$0}\'',
          -- opts = require('telescope.themes').get_dropdown({})
        },
      },
    },
  },
}
