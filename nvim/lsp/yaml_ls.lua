--local gitlab_schema_url = "https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"

return {
	cmd = { "yaml-language-server", "--stdio" },
  filetypes = {
    "yaml",
  },
	settings = {
		redhat = {
			telemetry = {
				enabled = false,
			},
		},
		yaml = {
			format = {
				enable = true,
				bracketSpacing = true,
			},
			hover = true,
			schemaStore = {
				enable = true,
				url = "https://www.schemastore.org/api/json/catalog.json",
			},
			--schemas = {
			--	["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
			--	[gitlab_schema_url] = ".gitlab-ci.yml",
			--	[gitlab_schema_url] = "/templates/*/template.yml",
			--	["kubernetes"] = "*/manifests/**/*.yaml",
			--},
		},
	},
	root_markers = { ".git" },
}
