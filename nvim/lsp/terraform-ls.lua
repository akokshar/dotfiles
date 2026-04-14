return {
	cmd = { "terraform-ls", "serve" },
	filetypes = {
		"terraform",
		"tf",
		"tfvars",
	},
	root_markers = {
		".terraform",
		".git",
	},
	init_options = {
		experimentalFeatures = {
			validateOnSave = true,
			prefillRequiredFields = true,
		},
		validation = {
			enableEnhancedValidation = true,
		},
		indexing = {
			ignoreDirectoryNames = { -- Don't index these directories (speeds up large repos)
				".git",
			},
		},
	},
}
