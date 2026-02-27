return {
  'santhosh-tekuri/wordiff.nvim',
  lazy = false,
  enabled = true,
  config = function()
    require('wordiff').setup(default_config)
  end,
  opts = {},
}
