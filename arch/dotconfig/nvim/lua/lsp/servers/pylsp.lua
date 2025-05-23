return {
	configurationSources = { "flake8" },
	settings = {
		pylsp = {
			plugins = {
				flake8 = {
					enabled = true,
					maxLineLength = 999,
					maxComplexity = 15
				},
				pycodestyle = {
					enabled = false,
				},
				pyflakes = {
					enabled = false
				},
				mccabe = {
					enabled = false
				},
				pylint = {
					enabled = false
				},
				rope_autoimport = {
					enabled = true
				},
				jedi_completion = {
					enabled = true,
					fuzzy = true,
					include_class_objects = true,
					include_function_objects = true,
					eager = true,
					cache_for = { "pandas", "numpy", "tensorflow", "matplotlib", "cv2", "django" }
				},
			},

		}
	}
}
