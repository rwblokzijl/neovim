return {
    "tpope/vim-projectionist",
    config = function()
        vim.g.projectionist_heuristics = {
            ["*main.tf"] = {
                alternate= "{}variables.tf"
            },
            ["*variables.tf"] = {
                alternate= "{}outputs.tf"
            },
            ["*outputs.tf"] = {
                alternate= "{}main.tf"
            },
        }
    end,
}

