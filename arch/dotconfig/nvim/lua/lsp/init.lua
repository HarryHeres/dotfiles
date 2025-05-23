require('lsp.auto_format')
require('lsp.diagnostics')
require('lsp.')

local path = vim.fn.getcwd() .. '/lua/lsp/servers'
local pfile = io.popen('ls ' .. path)

if pfile ~= nil then

	for filename in pfile:lines() do
		local filetype = string.sub(filename, #filename - 2, #filename)
		if (filetype == 'lua') then
			local lsp_name = string.sub(filename, 0, -5)
			local config = require('lsp.servers.' .. lsp_name)

			vim.lsp.config(lsp_name, config)
			vim.lsp.enable(lsp_name)
		end
	end

	pfile:close()
end
