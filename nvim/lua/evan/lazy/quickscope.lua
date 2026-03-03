return {
    "unblevable/quick-scope",
    config = function()
        local group = vim.api.nvim_create_augroup("quickscope_colors", { clear = true })
        local function set_hl()
            local function fg(group)
                return (vim.api.nvim_get_hl(0, { name = group, link = false }) or {}).fg
            end
            vim.api.nvim_set_hl(0, "QuickScopePrimary",
                { fg = fg("Function"), underline = true, cterm = { underline = true } })
            vim.api.nvim_set_hl(0, "QuickScopeSecondary",
                { fg = fg("Define"), underline = true, cterm = { underline = true } })
        end
        vim.api.nvim_create_autocmd("ColorScheme", { group = group, callback = set_hl })
        set_hl()
    end
}
