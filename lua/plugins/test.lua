return {
  {
    "nvim-neotest/neotest-jest",
    "andy-bell101/neotest-java",
  },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        "neotest-jest",
        "neotest-vitest",
        -- "neotest-java",
      },
    },
  },
}
