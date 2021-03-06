local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}
local map2 = vim.api.nvim_set_keymap

vim.g.mapleader = " " -- set leader as Space

--General
map('', '<leader>c', '"+y')
map('i', '<C-u>', '<C-g>u<C-u>')
map('i', '<C-w>', '<C-g>u<C-w>')
map('n', '<C-s>', '<cmd>source ~/.config/nvim/init.lua<CR>')
map('n', '<C-h>', '<cmd>source %<CR>')
map('n', '<leader>u','<cmd>source ~/.config/nvim/lua/plugins_config/highlights.lua<CR>')
map('n', '<leader>o', 'm`o<Esc>``') -- Add new line below the cursor wihout entering INSERT Mode

-- OPEN TERMINALS --
map("n", "<C-l>", ":vnew +terminal | setlocal nobuflisted <CR>", opt) -- term over right
map("n", "<C-x>", ":10new +terminal | setlocal nobuflisted <CR>", opt) --  term bottom
map("n", "<C-t>t", ":terminal <CR>", opt) -- term buffer
map("t", "jk", "<C-\\><C-n>", opt)

map("n", "<C-a>", ":%y+<CR>", opt) -- Copy the whole file content
map('n', '<leader>c', ':nohl<CR>' )
--Package
map('n', '<leader>l', '<cmd>PackerStatus<CR>')
map('n', '<leader>L', '<cmd>PackerSync<CR>')
map('n', '<leader>p', '<cmd>PackerInstall<CR>')
-- Comment
map("n", "<leader>/", ":CommentToggle<CR>", opt)
map("v", "<leader>/", ":CommentToggle<CR>", opt)

-- BufferLine
map("n", "<TAB>", ":BufferLineCycleNext<CR>", opt)
map("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<leader>e", "<cmd>BufferLinePick<CR>")
map('n', '<leader>p', "<cmd>BufferLineCloseRight<CR>")
map('n', '<leader>q', "<cmd>BufferLineCloseLeft<CR>")
map('n', '<leader>d', "<cmd>BufferLinePickClose<CR>")
map("n", "<S-x>", ":bd!<CR>", opt) -- close tab
map2('n', '<leader>c', ':nohl<CR>', {noremap = true, silent = true})

--NvimTree
map('n', '<C-n>', '<cmd>NvimTreeToggle<CR>')
map('n', '<leader>r','<cmd>NvimTreeRefresh<CR>')
map('n', '<leader>n', '<cmd>NvimTreeFindFile<CR>',opt)

-- Telescope
map("n", "<leader>ff","<cmd>Telescope find_files<CR>" )
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
map("n", "<leader>fh" ,"<cmd>Telescope help_tags<cr>")

--Auto-Complete & Lsp

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col(".") - 1
    if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
        return true
    else
        return false
    end
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn["compe#complete"]()
    end
end

_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
        return t "<Plug>(vsnip-jump-prev)"
    else
        return t "<S-Tab>"
    end
end

function _G.completions()
    local npairs
    if
        not pcall(
            function()
                npairs = require "nvim-autopairs"
            end
        )
     then
        return
    end

    if vim.fn.pumvisible() == 1 then
        if vim.fn.complete_info()["selected"] ~= -1 then
            return vim.fn["compe#confirm"]("<CR>")
        end
    end
    return npairs.check_break_line_char()
end

map("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
map("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
map("i", "<CR>", "v:lua.completions()", {expr = true})

