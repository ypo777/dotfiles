local cmd = vim.cmd
local theme = "themes/" .. vim.g.theme
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
fg("IndentBlanklineChar", colors.grey_fg)

fg("LineNr",colors.grey)
fg("cursorlinenr",colors.yellow)
bg("cursorlinenr",colors.grey)

-- Nvim Tree
fg("NvimTreeFolderIcon", colors.blue)
fg("NvimTreeFolderName", colors.blue)
fg("NvimTreeOpenedFolderName", colors.blue)
fg("NvimTreeEmptyFolderName", colors.red)
fg("NvimTreeIndentMarker", colors.grey_fg)
fg("NvimTreeVertSplit", colors.darker_black)
bg("NvimTreeVertSplit", colors.darker_black)
fg("NvimTreeEndOfBuffer", colors.darker_black)

vim.cmd("hi NvimTreeRootFolder gui=underline guifg=" .. colors.purple)
bg("NvimTreeNormal", colors.darker_black)
fg_bg("NvimTreeStatuslineNc", colors.darker_black, colors.darker_black)
fg_bg("NvimTreeWindowPicker", colors.red, colors.black2)

-------
cmd("hi! StatusLineNC gui=underline guifg=" .. colors.line)


-- LspDiagnostics ---

-- error / warnings
fg("LspDiagnosticsSignError", colors.red)
fg("LspDiagnosticsVirtualTextError", colors.red)
fg("LspDiagnosticsSignWarning", colors.yellow)
fg("LspDiagnosticsVirtualTextWarning", colors.yellow)

-- info
fg("LspDiagnosticsSignInformation", colors.green)
fg("LspDiagnosticsVirtualTextInformation", colors.green)

-- hint
fg("LspDiagnosticsSignHint", colors.purple)
fg("LspDiagnosticsVirtualTextHint", colors.purple)

-- git signs ---
fg_bg("DiffAdd", colors.nord_blue, "none")
fg_bg("DiffChange", colors.grey_fg, "none")
fg_bg("DiffModified", colors.nord_blue, "none")
