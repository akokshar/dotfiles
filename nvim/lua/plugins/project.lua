return {
	"ahmedkhalf/project.nvim",
  lazy = false,
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
  keys = {
    {
      "<leader>o",
      function()
        require("telescope").extensions.projects.projects()
      end,
      mode = "n",
      desc = "Open recent ...",
    },
  },
	config = function()
		require("project_nvim").setup({
			detection_methods = { "lsp", "pattern" },
			patterns = { ".git", "Makefile", "package.json" },
		})
		require("telescope").load_extension("projects")
	end,
}
