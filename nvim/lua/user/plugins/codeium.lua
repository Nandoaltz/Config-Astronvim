return {
  'Exafunction/windsurf.vim',
  event = 'BufEnter',
  config = function()
    vim.g.windsurf_enabled = false
  end,
}
