return {
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
        },
        config = function()
            require("mason-lspconfig").setup({
                -- Automatically install these LSP servers
                ensure_installed = {
                    -- Programming Languages
                    "lua_ls",
                    "gopls",
                    "pyright",
                    "html",
                    "cssls",
                    "bashls",

                    -- Infrastructure and Configuration
                    "yamlls",      -- YAML
                    "dockerls",    -- Dockerfile
                    "docker_compose_language_service",
                    "terraformls", -- Terraform
                    "ansiblels",   -- Ansible
                },
                automatic_installation = true,
            })
        end,
    },
}
