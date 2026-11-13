return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  },
  {
    'nickjvandyke/opencode.nvim',
    -- Defaults to "main", supporting OpenCode v2.
    -- Uncomment to pull the latest stable release, supporting OpenCode v1.
    -- version = "*",
    dependencies = { 'folke/snacks.nvim' },
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        -- Your configuration, if any; goto definition on the type for details
        server = {
          -- If no OpenCode service is running, start one by opening the TUI.
          -- snacks.terminal keeps the terminal out of the buffer list and
          -- avoids the extra `term://` buffer from the plugin's default.
          start = function()
            require('snacks.terminal').open('opencode', {
              win = { position = 'right', enter = false },
            })
          end,
        },
      }

      -- Recommended/example keymaps
      vim.keymap.set({ 'n', 'x' }, '<C-a>', function()
        require('opencode').ask '@this: '
      end, { desc = 'Ask OpenCode…' })
      vim.keymap.set({ 'n', 'x' }, '<C-x>', function()
        require('opencode').select()
      end, { desc = 'Select OpenCode…' })
      vim.keymap.set({ 'n', 'x' }, 'go', function()
        return require('opencode').operator '@this'
      end, { desc = 'Send range to OpenCode', expr = true })
      vim.keymap.set({ 'n' }, 'goo', function()
        return require('opencode').operator '@this' .. '_'
      end, { desc = 'Send line to OpenCode', expr = true })
    end,
  },
}
