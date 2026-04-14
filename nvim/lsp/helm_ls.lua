return {
	cmd = { "helm_ls", "serve", "--stdio" },
	filetypes = {
		"helm",
	},
	settings = {
    logLevel = "info",
    valuesFiles = {
      mainValuesFile = "values.yaml",
      lintOverlayValuesFile = "values.lint.yaml",
      additionalValuesFilesGlobPattern = "values*.yaml"
    },
    helmLint = {
      enabled = true,
      ignoredMessages = {},
    },
    yamlls = {
      enabled = true,
      enabledForFilesGlob = "*.{yaml,yml}",
      diagnosticsLimit = 50,
      showDiagnosticsDirectly = false,
      path = "yaml-language-server",
      initTimeoutSeconds = 3,
      config = {
        schemas = {
          kubernetes = "templates/**",
        },
        completion = true,
        hover = true,
        -- any other config from https://github.com/redhat-developer/yaml-language-server#language-server-settings
      }
    }
	},
	root_markers = {
		".git",
		"Chart.yaml",
	},
}
