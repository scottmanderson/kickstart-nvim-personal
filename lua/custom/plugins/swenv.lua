return {
    "AckslD/swenv.nvim",
    config = function()
        require("swenv").setup({
            -- Should return a list of tables with a `name` and a `path` entry each.
            -- Gets the argument `venvs_path` set below.
            -- By default just lists the entries in `venvs_path`.
            get_venvs = function(venvs_path)
                return require('swenv.api').get_venvs(venvs_path)
            end,
            -- Path passed to `get_venvs`.
            venvs_path = vim.fn.expand('/Users/scott/Library/Caches/pypoetry/virtualenvs/'),
            -- Something to do after setting an environment, for example call vim.cmd.LspRestart
            post_set_venv = function()
                return vim.cmd.LspRestart
            end,
        })
    end,
    --swenv python environment selection
    vim.keymap.set("n", "<leader>pv", function()
        require("swenv.api").set_venv(".venv")
    end, { desc = "Python Virtual Environment .venv Select" }),
    vim.keymap.set("n", "<leader>pp", function()
        require("swenv.api").pick_venv()
    end, { desc = "Python virtual environment autopick" })
}
