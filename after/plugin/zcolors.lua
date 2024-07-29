function ColorMe(color)
    -- color = color or "tokyonight-moon"
    color = color or "dracula"
    -- color = color or "kanagawa-wave"
    -- color = color or "everforest"
    -- vim.opt.background="light"
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMe()
