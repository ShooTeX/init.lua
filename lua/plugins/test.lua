return {
  {
    "nvim-neotest/neotest-jest",
    "nvim-neotest/neotest-java",
  },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        "neotest-jest",
        "neotest-java",
      },
    },
  },
}
