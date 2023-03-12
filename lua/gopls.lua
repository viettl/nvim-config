-- require LSP configuration from the plugin so we can attch GoPLS to it
lspconfig = require "lspconfig"
util =  require "lspconfig/util"

lspconfig.gopls.setup {
	cmd = {"gopls", "serve"},
	filetypes = {"go", "gomod"},
	root_dit = util.root_pattern{"go.work", "go.mod", ".git"},
	settings = {
		gopls = {
			analyses = {
				unusedparams = true;
			}
		}
			
	}
	

}
