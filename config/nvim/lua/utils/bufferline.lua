local present, bufferline = pcall(require, "bufferline")
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

bufferline.setup{
    options = {
        offsets = {{filetype = "NvimTree", text = "", padding = 1}},
        buffer_close_icon = "",
        modified_icon = "",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 20,
        show_tab_indicators = true,
        enforce_regular_tabs = false,
        view = "multiwindow",
        show_buffer_close_icons = true,
        separator_style = "thin",
        always_show_bufferline = true,
        diagnostics = "nvim_lsp",
    },
    highlights = {
        fill = {
            guifg = colors.grey_fg,
            guibg = colors.black2
        },
        background = {
            guifg = colors.grey_fg,
            guibg = colors.black2
        },
        -- buffers
        buffer_visible = {
            guifg = colors.light_grey,
            guibg = colors.black2
        },
        buffer_selected = {
            guifg = colors.white,
            guibg = colors.black,
            gui = "bold"
        },
        -- tabs
        tab = {
            guifg = colors.light_grey,
            guibg = colors.one_bg3
        },
        tab_selected = {
            guifg = colors.black2,
            guibg = colors.nord_blue
        },
        tab_close = {
            guifg = colors.red,
            guibg = colors.black
        },
        indicator_selected = {
            guifg = colors.black,
            guibg = colors.black
        },
        -- separators
        separator = {
            guifg = colors.black2,
            guibg = colors.black2
        },
        separator_visible = {
            guifg = colors.black2,
            guibg = colors.black2
        },
        separator_selected = {
            guifg = colors.black2,
            guibg = colors.black2
        },
        -- modified
        modified = {
            guifg = colors.red,
            guibg = colors.black2
        },
        modified_visible = {
            guifg = colors.red,
            guibg = colors.black2
        },
        modified_selected = {
            guifg = colors.green,
            guibg = colors.black
        },
        -- close buttons

        close_button = {
            guifg = colors.light_grey,
            guibg = colors.black2
        },
        close_button_visible = {
            guifg = colors.light_grey,
            guibg = colors.black2
        },
        close_button_selected = {
            guifg = colors.red,
            guibg = colors.black
        }
    }
}

