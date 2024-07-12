function ColorMe(color)
    -- color = color or "tokyonight-moon"
    color = color or "ayu"
    -- vim.opt.background="light"
    -- color = color or "PaperColorSlim"
    vim.cmd.colorscheme(color)
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMe()
