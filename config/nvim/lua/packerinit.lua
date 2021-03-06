local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd[["packadd packer.nvim"]]
local present,packer = pcall(require, "packer")
return packer.init {
      
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single"}
    end
  },
  git = {
    clone_timeout = 600 -- TimeOut, in seconds for git clones
  }

}

