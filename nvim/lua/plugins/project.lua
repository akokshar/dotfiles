vim.pack.add({
  { src = "https://github.com/DrKJeff16/project.nvim" },
}, {
  load = true
})

require("project").setup({
  before_attach = nil, ---@type nil|fun(target_dir: string, method: string)
  on_attach = nil, ---@type nil|fun(target_dir: string, method: string)
  lsp = {
    enabled = true,
    ignore = {},
    use_pattern_matching = false,
    no_fallback = false,   -- WARNING: ENABLE AT YOUR OWN DISCRETION!!!!
  },
  manual_mode = false,
  patterns = {
    '.git',
    '.github',
    '_darcs',
    '.hg',
    '.bzr',
    '.svn',
    'Pipfile',
    'pyproject.toml',
    '.pre-commit-config.yaml',
    '.pre-commit-config.yml',
    '.csproj',
    '.sln',
    '.nvim.lua',
    '.neoconf.json',
    'neoconf.json',
  },
  different_owners = {
    allow = false,   -- Allow adding projects with a different owner to the project session
    notify = true,   -- Notify the user when a project with a different owner is found
  },
  enable_autochdir = false,
  show_hidden = false,
  exclude_dirs = {},
  silent_chdir = true,
  scope_chdir = 'global',
  datapath = vim.fn.stdpath('data'),
  historysize = 100,
  log = {
    enabled = false,
    max_size = 1.1,
    logpath = vim.fn.stdpath('state'),
  },
  snacks = {
    enabled = false,
    opts = {
      hidden = false,
      sort = 'newest', ---@type 'newest'|'oldest'
      title = 'Select Project',
      layout = 'select',
      -- icon = {},
      -- path_icons = {},
    },
  },
  fzf_lua = {
    enabled = true,
    sort = 'newest', ---@type 'newest'|'oldest'
  },
  picker = {
    enabled = false,
    hidden = false,   -- Show hidden files
    sort = 'newest', ---@type 'newest'|'oldest'
  },
  disable_on = {
    ft = {
      '',
      'NvimTree',
      'TelescopePrompt',
      'TelescopeResults',
      'alpha',
      'checkhealth',
      'lazy',
      'log',
      'ministarter',
      'neo-tree',
      'notify',
      'nvim-pack',
      'packer',
      'qf',
    },
    bt = { 'help', 'nofile', 'nowrite', 'terminal' },
  },
  -- telescope = {
  --   sort = 'newest', ---@type 'oldest'|'newest'
  --   prefer_file_browser = false,
  --   disable_file_picker = false,
  --   mappings = {
  --     n = {
  --       b = 'browse_project_files',
  --       d = 'delete_project',
  --       f = 'find_project_files',
  --       r = 'recent_project_files',
  --       s = 'search_in_project_files',
  --       w = 'change_working_directory',
  --     },
  --     i = {
  --       ['<C-b>'] = 'browse_project_files',
  --       ['<C-d>'] = 'delete_project',
  --       ['<C-f>'] = 'find_project_files',
  --       ['<C-r>'] = 'recent_project_files',
  --       ['<C-s>'] = 'search_in_project_files',
  --       ['<C-w>'] = 'change_working_directory',
  --     },
  --   },
  -- },
})
