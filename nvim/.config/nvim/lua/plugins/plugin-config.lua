-- Telescope configuration
local telescope = require('telescope')

telescope.setup {
  extensions = {
    file_browser = {}
  }
}

telescope.load_extension 'file_browser'
