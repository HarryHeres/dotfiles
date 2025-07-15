return {
	cmd = { 'pylsp' },
	filetypes = { 'python' },
	root_markers = {
		'pyproject.toml',
		'setup.py',
		'setup.cfg',
		'requirements.txt',
		'Pipfile',
		'.git',
	},
	configurationSources = { "pycodestyle" },
	settings = {
		pylsp = {
			plugins = {
				flake8 = {
					enabled = false,
					maxLineLength = 999,
					maxComplexity = 15
				},
				pycodestyle = {
					enabled = true,
					maxLineLength = 999
				},
				pyflakes = {
					enabled = true
				},
				mccabe = {
					enabled = true,
				},
				pylint = {
					enabled = false
				},
				rope_autoimport = {
					enabled = false
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
