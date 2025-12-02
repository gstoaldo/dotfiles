return {
  {
    "nvim-mini/mini.nvim",
    version = false,
    enabled = false,
    config = function()
      require("mini.pick").setup()
    end,
  },
}
