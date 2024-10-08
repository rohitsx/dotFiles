local M = {}

function M.setup() 
    local lspconfig = require('lspconfig')
    lspconfig.ts_ls.setup{}
end

return M
