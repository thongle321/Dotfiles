-- Auto-completion of bracket/paren/quote pairs
return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    map_cr = false,
    check_ts = true,                   -- enable treesitter
    ts_config = {
      lua = { "string" },              -- don't add pairs in lua string treesitter nodes
      javascript = { "template_string" }, -- don't add pairs in javascript template_string
    },
    disable_filetypes = {"TelescopePrompt", "spectr_panel"},
  },
}
