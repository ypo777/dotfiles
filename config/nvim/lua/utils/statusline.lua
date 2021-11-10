local present1, gl = pcall(require, "galaxyline")
local present2, condition = pcall(require, "galaxyline.condition")

local colors = {
        darker_black = "#1b1f27",
        black = "#1e222a", --  nvim bg
        black2 = "#252931",
        one_bg = "#282c34", -- real bg of onedark
        one_bg2 = "#353b45",
        one_bg3 = "#30343c",
        grey = "#42464e",
        grey_fg = "#565c64",
        grey_fg2 = "#6f737b",
        light_grey = "#6f737b",
        white = "#eff0eb",
        red = "#ff5c57",
        yellow = "#f3f99d",
        green = "#5af78e",
        nord_blue = "#57c7ff",
        blue = "#61afef",
        teal = "#519ABA",
        cyan = "#9aedfe",
        purple = "#ff6ac1",
        orange = "#ff9f43",
        brown = "#b2643c",
        line = "#3a404c",
        pink = "#FF5370",
        statusline_bg = "#22262e",
        lightbg = "#2d3139",
        lightbg2 = "#262a32",
        gitcolor ="#F54D27",
        dark_purple = "#c882e7",
        vibrant_green  = "#7eca9c"
}

if not (present1 or present2) then
  return
end

local gls = gl.section
local mode_color = function()
  local mode_colors = {
    n = colors.vibrant_green,
    i = colors.red,
    c = colors.teal,
    V = colors.dark_purple,
    [''] = colors.dark_purple,
    v = colors.dark_purple,
    R = colors.red,
  }

  local color = mode_colors[vim.fn.mode()]

  if color == nil then
    color = colors.red
  end

  return color
end
gl.short_line_list = {" "}

gls.left[1] = {
    FirstElement = {
        provider = function()
            return " "
        end,
        highlight = {colors.grey_fg, colors.statusline_bg}
    }
}
gls.left[2] = {
  ViMode = {
        provider = function()
            local alias = {
                n = "NORMAL",
                i = "INSERT",
                c = "COMMAND",
                V = "VISUAL",
                [""] = "VISUAL",
                v = "VISUAL",
                R = "REPLACE"
            }
            vim.api.nvim_command('hi GalaxyViMode guifg=' ..colors.one_bg)
            vim.api.nvim_command('hi GalaxyViMode gui=bold guibg=' ..mode_color())


            local current_Mode = alias[vim.fn.mode()]

            if current_Mode == nil then
                return "  Terminal "
            else
                return "  " .. current_Mode .. " "
            end
          end,
          separator = " ",
          separator_highlight = {colors.statusline_bg,colors.statusline_bg}
    }
}
gls.left[3] = {
    FileIcon = {
        provider = "FileIcon",
        condition = condition.buffer_not_empty,
        highlight = {colors.white, colors.lightbg}
    }
}

gls.left[4] = {
    FileName = {
        provider = {"FileName"},
        condition = condition.buffer_not_empty,
        highlight = {colors.white, colors.lightbg},
        separator = " ",
        separator_highlight = {colors.lightbg, colors.lightbg2}
    }
}

gls.left[5] = {
    current_dir = {
        provider = function()
            local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
            return "  " .. dir_name .. " "
        end,
        highlight = {colors.grey_fg2, colors.lightbg2},
        separator = " ",
        separator_highlight = {colors.lightbg2, colors.statusline_bg}
    }
}

local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 30 then
        return true
    end
    return false
end
gls.left[6] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = checkwidth,
        icon = "  ",
        highlight = {colors.white, colors.statusline_bg}
    }
}

gls.left[7] = {
    DiffModified = {
        provider = "DiffModified",
        condition = checkwidth,
        icon = "   ",
        highlight = {colors.grey_fg2, colors.statusline_bg}
    }
}

gls.left[8] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = checkwidth,
        icon = "  ",
        highlight = {colors.grey_fg2, colors.statusline_bg}
    }
}

gls.left[9] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "  ",
        highlight = {colors.red, colors.statusline_bg}
    }
}

gls.left[10] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = "  ",
        highlight = {colors.yellow, colors.statusline_bg}
    }
}

gls.right[1] = {
    lsp_status = {
        provider = function()
            local clients = vim.lsp.get_active_clients()
            if next(clients) ~= nil then
                local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                        return " " .. "  " .. " LSP "
                    end
                end
                return ""
            else
                return ""
            end
        end,
        highlight = {colors.white, colors.statusline_bg}
    }
}

gls.right[2] = {
    GitIcon = {
        provider = function()
            return " "
        end,
        condition = require("galaxyline.condition").check_git_workspace,
        highlight = {colors.gitcolor, colors.statusline_bg},
        separator = " ",
        separator_highlight = {colors.statusline_bg, colors.statusline_bg}
    }
}

gls.right[3] = {
    GitBranch = {
        provider = "GitBranch",
        condition = require("galaxyline.condition").check_git_workspace,
        highlight = {colors.gitcolor, colors.statusline_bg}
    }
}
gls.right[4] = {
    viMode_icon = {
        provider = function()
            return "  "
        end,
        highlight = {colors.statusline_bg, colors.vibrant_green},
        separator = " ▋",
        separator_highlight = {colors.vibrant_green,colors.statusline_bg}

    }
}
gls.right[5] = {
    line_percentage = {
        provider = function()
            local current_line = vim.fn.line(".")
            local total_line = vim.fn.line("$")

            if current_line == 1 then
                return "  Top "
            elseif current_line == vim.fn.line("$") then
                return "  Bot "
            end
            local result, _ = math.modf((current_line / total_line) * 100)
            return "  " .. result .. "% "
        end,
        highlight = {colors.green, colors.lightbg}
    }
}
