local cmd = vim.cmd
local name = "onedark_higl"
vim.g.nvchad_theme = name
local theme = vim.g.nvchad_theme
local colors = require(theme)


-- for guifg , bg

local function fg(group, color)
    cmd("hi " .. group .. " guifg=" .. color)
end

local function bg(group, color)
    cmd("hi " .. group .. " guibg=" .. color)
end

local function fg_bg(group, fgcol, bgcol)
    cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

-- Blank Line
fg("IndentBlanklineChar", colors.white)

fg("LineNr",colors.white)
fg("cursorlinenr",colors.yellow)
bg("cursorlinenr",colors.grey)

-- Nvim Tree
fg("NvimTreeOpenedFolderName",colors.orange)
fg("NvimTreeIndentMarker",colors.green)
-------

