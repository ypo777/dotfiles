return {
    {
    'nvim-treesitter/nvim-treesitter',
     build = ":TSUpdate",
     config = function()
         local treesitter = require('nvim-treesitter.configs')

         treesitter.setup({
             highlight = {
                 enable = true,
                 additional_vim_regex_highlighting = false,
             },
             indent = { enable = true },
             ensure_installed = {
                 'json',
                 'javascript',
                 'typescript',
                 'tsx',
                 'yaml',
                 'html',
                 'css',
                 'markdown',
                 'bash',
                 'lua',
                 'vim',
                 'dockerfile',
                 'gitignore',
             },
         })
     end
    },
    {
        "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {},
        config = function()
           require('ibl').setup({
                scope = { enabled = true },
            })
        end
    }
}
