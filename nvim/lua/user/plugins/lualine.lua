return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local function lsp_name()
            local clients = vim.lsp.get_active_clients({ bufnr = 0 })
            if next(clients) == nil then
                return " "
            end
            local names = {}
            for _, client in pairs(clients) do
                table.insert(names, client.name)
            end
            return " " .. table.concat(names, ", ")
        end

        require("lualine").setup({
            options = {
                theme = "palenight",
                disabled_filetypes = {
                    statusline = { "NvimTree", "alpha" },
                    winbar = {},
                },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = { "filename" },
                lualine_x = { lsp_name, "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        })
    end,
}
