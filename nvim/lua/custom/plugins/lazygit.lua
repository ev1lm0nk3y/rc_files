return {
    "kdheepak/lazygit.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    keys = {
        { "<leader>Lg", "<cmd>LazyGit<cr>",                  desc = "LazyGit" },
        { "<leader>Lc", "<cmd>LazyGitFilter<cr>",            desc = "See project commits" },
        { "<leader>Lf", "<cmd>LazyGitFilterCurrentFile<cr>", desc = "See file commits" },
        { "<leader>Lm", "<cmd>LazyGitCommit<cr>",            desc = "Commit changes" },
        { "<leader>Lb", "<cmd>LazyGitBlame<cr>",             desc = "Blame current line" },
        { "<leader>Ls", "<cmd>LazyGitStatus<cr>",            desc = "See project status" },
        { "<leader>LB", "<cmd>LazyGitBranch<cr>",            desc = "Create a new branch" },
    },
}
